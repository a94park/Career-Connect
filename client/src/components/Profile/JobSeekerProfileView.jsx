import placeholderImage from "../../assets/pictures/placeholder.jpeg";

function CreateProfileView({ profileData }) {
  if (!profileData) {
    return <h2>No profile data available</h2>;
  }

  return (
    <div>
      <div className="profile-view">
        <h1>
          {profileData.first_name} {profileData.last_name}'s Profile
        </h1>
        <div className="profile-details">
          <img
            src={
              profileData.profile_pic
                ? profileData.profile_pic
                : placeholderImage
            }
            alt="Profile"
            className="profile-picture"
          />
          <div className="profile-text">
            <p>
              <strong>Date of Birth:</strong> {profileData.dob}
            </p>
            <p>
              <strong>Gender:</strong> {profileData.gender}
            </p>
            <p>
              <strong>Nationality:</strong> {profileData.nationality}
            </p>

            {profileData.education && profileData.education.length > 0 && (
              <>
                {profileData.education.map((education, index) => (
                  <div key={index} className="education-entry">
                    <p>
                      <strong>Education Level:</strong> {education.education}
                    </p>
                    {education.degreeDetails && (
                      <>
                        <p>
                          <strong>Degree:</strong> {education.degreeDetails}
                        </p>
                        <p>
                          <strong>Institution:</strong> {education.institution}
                        </p>
                      </>
                    )}
                  </div>
                ))}
              </>
            )}
            <p>
              <strong>Skills:</strong>{" "}
              {profileData.skills.slice(0, -1).join(", ") +
                (profileData.skills.length > 1 ? ", and " : "") +
                profileData.skills.slice(-1)}
            </p>
          </div>
        </div>
      </div>
    </div>
  );
}

export default CreateProfileView;
