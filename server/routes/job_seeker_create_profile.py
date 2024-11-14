from flask import Blueprint, request, jsonify
from werkzeug.utils import secure_filename
import os
import base64
from datetime import datetime
from flask_jwt_extended import get_jwt_identity, jwt_required, create_access_token
from models import db, JobSeeker, Application, Employer, JobPosting, Notification
from app import app
import json

job_seeker_create_profile_bp = Blueprint("job_seeker_create_profile_bp", __name__)


# Profile creation route
@app.route("/api/job_seeker/create_profile", methods=["POST"])
@jwt_required()
def create_profile():
    try:
        # Get JSON data from request
        data = request.get_json()
        print(f"data = {data}")  # Debugging print

        # Get user_id from JWT
        user_id = get_jwt_identity()
        print(f"user_id from JWT: {user_id}")  # Debugging print

        # Validate required fields
        required_fields = [
            "first_name",
            "last_name",
            "dob",
            "gender",
            "nationality",
            "education",
            "skills",
        ]
        for field in required_fields:
            if not data.get(field):
                print(f"Missing field: {field}")
                return jsonify({"error": f"Missing required field: {field}"}), 400

        # Extract fields from request data
        first_name = data.get("first_name")
        last_name = data.get("last_name")
        dob = datetime.strptime(data.get("dob"), "%Y-%m-%d").date()
        gender = data.get("gender")
        nationality = data.get("nationality")

        # Handle education and skills as JSON strings if they are lists
        education = data.get("education")
        if isinstance(education, list):
            education = json.dumps(education)

        skills = data.get("skills")
        if isinstance(skills, list):
            skills = json.dumps(skills)

        # Handle profile picture (optional)
        profile_pic = data.get("profile_pic")
        img_data = None
        if profile_pic and profile_pic.startswith("data:image/"):
            try:
                # Decode Base64 image to binary
                img_data = base64.b64decode(profile_pic.split(",")[1])
            except (IndexError, ValueError, base64.binascii.Error) as e:
                print(f"Error decoding image: {e}")
                return jsonify({"error": "Invalid profile picture data."}), 400

        # Create a new JobSeeker object
        new_job_seeker = JobSeeker(
            user_id=user_id,
            first_name=first_name,
            last_name=last_name,
            dob=dob,
            gender=gender,
            nationality=nationality,
            education=education,
            skills=skills,
            profile_pic=img_data,  # None if no image is provided or invalid
        )

        # Save new profile to the database
        db.session.add(new_job_seeker)
        db.session.commit()

        return (
            jsonify(
                {
                    "message": "Profile created successfully",
                    "profile": new_job_seeker.to_json(),
                }
            ),
            201,
        )

    except Exception as e:
        print(f"Error: {e}")
        return jsonify({"error": "An error occurred while creating the profile."}), 500


# Route for job seekers to view their own profile
@app.route("/api/job_seekers/me", methods=["GET"])
@jwt_required()
def get_my_profile():
    user_id = get_jwt_identity()
    job_seeker = JobSeeker.query.filter_by(user_id=user_id).first()
    if job_seeker:
        return jsonify(job_seeker.to_json()), 200
    return jsonify({"message": "Profile not found"}), 404


# Route for employers to view a specific job seeker profile
@app.route("/api/job_seekers/<int:job_seeker_id>", methods=["GET"])
@jwt_required()
def get_job_seeker_profile(job_seeker_id):
    job_seeker = JobSeeker.query.get(job_seeker_id)
    if job_seeker:
        return jsonify(job_seeker.to_json()), 200
    return jsonify({"message": "Profile not found"}), 404


@app.route("/api/update_job_seeker_profile", methods=["PUT"])
@jwt_required()
def update_job_seeker_profile():

    user_id = get_jwt_identity()
    job_seeker = JobSeeker.query.filter_by(user_id=user_id).first()

    if not job_seeker:
        return jsonify({"message": "Job seeker not found."}), 404

    data = request.get_json()

    first_name = data.get("first_name")
    last_name = data.get("last_name")
    dob = data.get("dob")
    gender = data.get("gender")
    nationality = data.get("nationality")
    education = data.get("education")
    skills = data.get("skills")

    profile_pic = data.get("profile_pic")
    img_data = None
    if profile_pic and profile_pic.startswith("data:image/"):
        try:
            # Decode Base64 image to binary
            img_data = base64.b64decode(profile_pic.split(",")[1])
        except (IndexError, ValueError, base64.binascii.Error) as e:
            print(f"Error decoding image: {e}")
            return jsonify({"error": "Invalid profile picture data."}), 400

    job_seeker.first_name = first_name if first_name else job_seeker.first_name
    job_seeker.last_name = last_name if last_name else job_seeker.last_name
    job_seeker.dob = dob if dob else job_seeker.dob
    job_seeker.gender = gender if gender else job_seeker.gender
    job_seeker.nationality = nationality if nationality else job_seeker.nationality
    job_seeker.education = json.dumps(education) if education else job_seeker.education
    job_seeker.skills = json.dumps(skills) if skills else job_seeker.skills
    job_seeker.profile_pic = img_data

    db.session.commit()
    return jsonify({"message": "Profile updated successfully."}), 200


@app.route("/api/delete_job_seeker_profile", methods=["DELETE"])
@jwt_required()
def delete_job_seeker():

    user_id = get_jwt_identity()

    job_seeker = JobSeeker.query.filter_by(user_id=user_id).first()

    if not job_seeker:
        return jsonify({"message": "Job seeker not found"})

    job_seeker_id = job_seeker.job_seeker_id

    Application.query.filter_by(job_seeker_id=job_seeker_id).delete()
    db.session.commit()

    db.session.delete(job_seeker)
    db.session.commit()
    return jsonify({"message": "Job seeker profile was deleted successfully"})


@app.route("/api/job_seeker/notifications", methods=["GET"])
@jwt_required()
def get_job_seeker_notifications():
    user_id = get_jwt_identity()

    # Find the job seeker associated with the current user
    job_seeker = JobSeeker.query.filter_by(user_id=user_id).first()

    if not job_seeker:
        return jsonify({"message": "Job seeker not found"}), 404

    # Get all applications where the job seeker has made a request (job_seeker_status is 1)
    applications = Application.query.filter_by(
        job_seeker_id=job_seeker.job_seeker_id, job_seeker_status=1
    ).all()

    if not applications:
        return jsonify({"message": "No notifications found"}), 404

    # Prepare a response including job posting and employer status info, filter out pending/null statuses
    notifications = []
    for app in applications:
        if app.employer_status in [
            1,
            2,
        ]:  # Only include Accepted (1) or Rejected (2) statuses
            job_posting = JobPosting.query.get(app.job_posting_id)
            employer = Employer.query.get(
                job_posting.employer_id
            )  # Fetch employer associated with the job posting

            print(notifications)
            notifications.append(
                {
                    "application_id": app.application_id,
                    "job_posting_title": job_posting.title,
                    "job_posting_description": job_posting.description,
                    "employer_status": app.employer_status,  # 1 = Accepted, 2 = Rejected
                    "created_at": app.created_at.isoformat(),
                    "employer": {
                        "company_name": employer.company_name,
"""                         "company_logo": employer.company_logo, """
                        "about_company": employer.about_company,
                        "email": employer.email,
                    },
                }
            )
    return jsonify(notifications), 200


@app.route(
    "/api/job_seeker/delete_application/<int:application_id>", methods=["DELETE"]
)
@jwt_required()
def delete_application(application_id):
    user_id = get_jwt_identity()
    print(f"{user_id}")
    # Find the job seeker associated with the current user
    job_seeker = JobSeeker.query.filter_by(user_id=user_id).first()
    print(f"{job_seeker}")

    if not job_seeker:
        return jsonify({"message": "Unauthorized or Job seeker not found"}), 404

    # Find the application to delete
    application = Application.query.filter_by(
        application_id=application_id, job_seeker_id=job_seeker.job_seeker_id
    ).first()

    if not application:
        return jsonify({"message": "Application not found or unauthorized"}), 404

    db.session.delete(application)
    db.session.commit()

    return jsonify({"message": "Application deleted successfully"}), 200


@app.route("/api/update_employer_profile", methods=["PUT"])
@jwt_required()
def update_employer():
    try:
        # Get the user ID from JWT
        user_id = get_jwt_identity()

        # Fetch the existing employer profile from the database
        employer = Employer.query.filter_by(user_id=user_id).first()

        if not employer:
            return jsonify({"message": "Employer not found."}), 404

        # Get JSON data from the request
        data = request.get_json()

        # Extract fields from request data
        company_name = data.get("company_name")
        about_company = data.get("about_company")
        preferential_treatment = data.get("preferential_treatment")
        company_benefits = data.get("company_benefits")
        email = data.get("email")

        # Handle company logo (keep existing if no new one is uploaded)
        company_logo = data.get("company_logo")
        img_data = None
        if company_logo and company_logo.startswith("data:image/"):
            try:
                img_data = base64.b64decode(company_logo.split(",")[1])
            except (IndexError, ValueError, base64.binascii.Error) as e:
                print(f"Error decoding image: {e}")
                return jsonify({"error": "Invalid profile picture data."}), 400

        # Update the employer object with the provided or existing data
        employer.company_name = company_name if company_name else employer.company_name
        employer.about_company = (
            about_company if about_company else employer.about_company
        )
        employer.preferential_treatment = (
            preferential_treatment
            if preferential_treatment
            else employer.preferential_treatment
        )
        employer.company_benefits = (
            company_benefits if company_benefits else employer.company_benefits
        )
        employer.email = email if email else employer.email
        employer.company_logo = img_data

        # Commit changes to the database
        db.session.commit()

        return jsonify({"message": "Employer profile updated successfully."}), 200

    except Exception as e:
        db.session.rollback()
        print(f"Error: {e}")
        return jsonify({"message": str(e)}), 500


@app.route("/api/delete_employer_profile", methods=["DELETE"])
@jwt_required()
def delete_employer():
    user_id = get_jwt_identity()
    employer = Employer.query.filter_by(user_id=user_id).first()
    if not employer:
        return jsonify({"message": "Employer was not found"})
    db.session.delete(employer)
    db.session.commit()
    return jsonify({"message": "Employer profile was deleted successfully"})
