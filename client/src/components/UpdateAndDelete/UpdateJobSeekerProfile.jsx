import { useState } from "react";
import { FaPlus } from "react-icons/fa";
import "./UpdateJobSeekerProfile.scss";

function UpdateJobSeekerProfile() {
  const [firstName, setFirstName] = useState("");
  const [lastName, setLastName] = useState("");
  const [dob, setDob] = useState("");
  const [gender, setGender] = useState("");
  const [nationality, setNationality] = useState("");
  const [skills, setSkills] = useState([]);
  const [inputSkill, setInputSkill] = useState("");
  const [educationFields, setEducationFields] = useState([]);
  const [profilePic, setProfilePic] = useState(null);

  const handleAddSkill = (e) => {
    e.preventDefault();
    if (inputSkill && !skills.includes(inputSkill)) {
      setSkills([...skills, inputSkill]);
      setInputSkill("");
    }
  };

  const handleDeleteSkill = (skillToDelete) => {
    setSkills(skills.filter((skill) => skill !== skillToDelete));
  };

  const handleEducationChange = (index, e) => {
    const updatedFields = [...educationFields];
    updatedFields[index][e.target.name] = e.target.value;
    setEducationFields(updatedFields);
  };

  const handleAddEducationField = () => {
    setEducationFields([
      ...educationFields,
      { education: "", degreeDetails: "", institution: "" },
    ]);
  };

  const handlePictureChange = (e) => {
    const file = e.target.files[0];
    if (file) setProfilePic(file);
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    const convertImageToBase64 = (file) => {
      return new Promise((resolve, reject) => {
        const reader = new FileReader();
        reader.readAsDataURL(file);
        reader.onload = () => resolve(reader.result);
        reader.onerror = (error) => reject(error);
      });
    };

    let profile_pic = null; // Declare profile_pic here
    if (profilePic) {
      profile_pic = await convertImageToBase64(profilePic);
    }

    const education = educationFields
      .filter((field) => field.education) // Keep only fields with a non-empty education value
      .map((field) => {
        const { education, degreeDetails, institution } = field;
        return {
          education,
          degreeDetails,
          institution,
        };
      });

    const formData = {
      profile_pic,
      first_name: firstName,
      last_name: lastName,
      dob,
      gender,
      nationality,
      education, // JSON string of education array
      skills, // JSON string of skills array
    };

    try {
      const token = localStorage.getItem("token");
      if (!token) {
        alert("No token found. Please log in.");
        return;
      }
      const response = await fetch(
        "http://localhost:5000/api/update_job_seeker_profile",
        {
          method: "PUT",
          headers: {
            Authorization: `Bearer ${token}`,
            "Content-Type": "application/json",
          },
          body: JSON.stringify(formData),
        }
      );
      const data = await response.json();
      if (response.ok) {
        alert("Profile updated successfully!", data);
        setFirstName("");
        setLastName("");
        setDob("");
        setGender("");
        setNationality("");
        setProfilePic(null);
      } else {
        const errorData = await response.json();
        alert(`Error: ${errorData.message || "Profile update failed"}`);
      }
    } catch (error) {
      alert("Network error. Please try again.");
      console.error("Error updating profile:", error);
    }
  };

  return (
    <div className="update-profile-page">
      <form onSubmit={handleSubmit}>
        <h1>Update Your Profile</h1>

        <input type="file" accept="image/*" onChange={handlePictureChange} />

        <input
          type="text"
          placeholder="Nationality"
          value={nationality}
          onChange={(e) => setNationality(e.target.value)}
        />

        {educationFields.map((field, index) => (
          <div key={index} className="education-section">
            <label htmlFor={`education-${index}`}>Education Level:</label>
            <select
              id={`education-${index}`}
              name="education"
              value={field.education}
              onChange={(e) => handleEducationChange(index, e)}>
              <option value="">Select your education level</option>
              <option value="High School Diploma">High School Diploma</option>
              <option value="Skill Certification">Skill Certification</option>
              <option value="Bachelor's Degree">Bachelor's Degree</option>
              <option value="Master's Degree">Master's Degree</option>
              <option value="PhD">PhD</option>
            </select>

            {field.education && field.education !== "High School Diploma" && (
              <>
                <label htmlFor={`degree-details-${index}`}>
                  Degree/Certification Details:
                </label>
                <input
                  type="text"
                  id={`degree-details-${index}`}
                  name="degreeDetails"
                  value={field.degreeDetails}
                  placeholder="Degree details"
                  onChange={(e) => handleEducationChange(index, e)}
                />

                <label htmlFor={`institution-${index}`}>
                  Institution Name:
                </label>
                <input
                  type="text"
                  id={`institution-${index}`}
                  name="institution"
                  value={field.institution}
                  placeholder="Institution name"
                  onChange={(e) => handleEducationChange(index, e)}
                />
              </>
            )}
          </div>
        ))}

        <button
          type="button"
          className="add-education-btn"
          onClick={handleAddEducationField}>
          <FaPlus /> Add Education
        </button>

        <div className="skills-input">
          <input
            type="text"
            placeholder="Add a skill"
            value={inputSkill}
            onChange={(e) => setInputSkill(e.target.value)}
          />
          <button onClick={handleAddSkill}>Add Skill</button>
        </div>
        <div className="skills-list">
          {skills.map((skill, index) => (
            <span key={index} className="skill-item">
              {skill}
              <button onClick={() => handleDeleteSkill(skill)}>&times;</button>
            </span>
          ))}
        </div>

        <button type="submit">Update Profile</button>
      </form>
    </div>
  );
}

export default UpdateJobSeekerProfile;
