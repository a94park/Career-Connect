from flask import Flask, jsonify, request
from flask_jwt_extended import JWTManager, jwt_required, get_jwt_identity
from models.models import User, JobSeeker, Application, JobPosting, Employer  # Import your models
from app import app, db  # Import your Flask app and database
import base64

#route to get jobseeker and employer profile data
@app.route('/dashboard', methods=['GET'])
@jwt_required()  # Ensure that this route requires authentication
def get_user_data():
    user_id = get_jwt_identity()  # Retrieve user_id from JWT
    user = User.query.get(user_id)  # Fetch the user from the database

    if not user:
        return jsonify({"error": "User not found"}), 404

    # Helper function to convert BLOB to Base64 string
    def convert_image_to_base64(binary_data):
        if binary_data:
            return f"data:image/png;base64,{base64.b64encode(binary_data).decode('utf-8')}"
        return None
 
    # Fetch the job seeker profile if it exists
    job_seeker_profile = JobSeeker.query.filter_by(user_id=user_id).first()
    employer_profile = Employer.query.filter_by(user_id=user_id).first()
    connected_count = Application.query.filter(Application.employer_status.isnot(None)).count()
    # Convert job seeker profile image if available
    job_seeker_data = job_seeker_profile.to_json() if job_seeker_profile else None
    if job_seeker_data and job_seeker_profile.profile_pic:
        job_seeker_data['profile_pic'] = convert_image_to_base64(job_seeker_profile.profile_pic)

    # Convert employer profile image if available
    employer_data = employer_profile.to_json() if employer_profile else None
    if employer_data and employer_profile.company_logo:
        employer_data['company_logo'] = convert_image_to_base64(employer_profile.company_logo)

    # Create response data
    response_data = {
        "user_id": user_id,
        "full_name": user.full_name,
        "user_type": user.user_type,
        "connected_count": connected_count,
        "employer_profile": employer_data,  # Converted employer profile data
        "job_seeker_profile": job_seeker_data  # Converted job seeker profile data
    }

    return jsonify(response_data), 200

@app.route('/api/applications', methods=['GET'])
@jwt_required()
def get_applications():
    user_id = get_jwt_identity()
    job_seeker = JobSeeker.query.filter_by(user_id=user_id).first()

    if not job_seeker:
        return jsonify({"message": "Job seeker not found"}), 404
    
  # Query applications, join with JobPosting and Employer tables
    applications = (
        db.session.query(Application, JobPosting, Employer)
        .join(JobPosting, Application.job_posting_id == JobPosting.job_posting_id)
        .join(Employer, JobPosting.employer_id == Employer.employer_id)
        .filter(Application.job_seeker_id == job_seeker.job_seeker_id)
        .all()
    )
     # Check if no applications were found
    if not applications:
        return jsonify({"message": "No applications found"}), 404

  # Prepare the data to be returned
    result = []
    for application, job_posting, employer in applications:
        result.append({
            "application_id": application.application_id,
            "job_seeker_status": application.job_seeker_status,
            "employer_status": application.employer_status,
            "created_at": application.created_at.isoformat(),
            "job_title": job_posting.title,
            "description": job_posting.description,
            "company_name": employer.company_name
        })

    return jsonify(result), 200