import { useState, useEffect } from "react";
import CreateProfilePage from "../Profile/CreateProfilePage";
import CreateProfileView from "../Profile/CreateProfileView";
import SearchAndFilterSystem from "../SearchForJobSeekers/SearchAndFilterSystem";
import UpdateJobSeekerProfile from "../UpdateAndDelete/UpdateJobSeekerProfile";
import DeleteJobSeekerProfile from "../UpdateAndDelete/DeleteJobSeekerProfile";
// import SeekerActivity from "../SeekerActivity/SeekerActivity";
// import JobSeekerNotifications from "../JobSeekerNotification/JobSeekerNotification";
import SeekerConnections from "../SeekerConnections/SeekerConnections";
import "./JobSeekerDashboard.scss";

function JobSeekerDashboard({ profileData, setProfileData }) {
  const [isLoading, setIsLoading] = useState(true);
  const [fullName, setFullName] = useState(localStorage.getItem("fullName") || "User");
  const [userType] = useState(localStorage.getItem("userType") || "job_seeker");
  const token = localStorage.getItem("accessToken");
  const [activeTab, setActiveTab] = useState("profile");
  const [connectedCount, setConnectedCount] = useState(5); // Example: 5 employers have connected
  useEffect(() => {
    // Fetch job seeker profile data immediately after login
    const fetchUserData = async () => {
      setIsLoading(true); // Start loading

      try {
        const response = await fetch("http://localhost:5000/dashboard", {
          method: "GET",
          headers: {
            Authorization: `Bearer ${token}`,
          },
        });

        if (response.ok) {
          const data = await response.json();
          const profile = data.job_seeker_profile || null;

          if (profile) {
            setProfileData(profile); // Store profile data in state
            setFullName(`${profile.first_name} ${profile.last_name}`); // Set full name from profile
          }
        } else {
          console.error("Failed to fetch job seeker data.");
        }
      } catch (error) {
        console.error(
          "An error occurred while fetching job seeker data:",
          error
        );
      } finally {
        setIsLoading(false); // Stop loading
      }
    };

    if (token) {
      fetchUserData(); // Fetch profile data if the user has a valid token

  useEffect(() => {
    if (!profileData && token) {
      fetchUserData(); // Fetch user data initially
    } else {
      setIsLoading(false); // If profileData exists, stop loading
    }
  }, [profileData, token]);

  // Handle the profile update
  const handleProfileUpdate = async (updatedProfile) => {
    setProfileData(updatedProfile); // Update the profile data in state
    await fetchUserData(); // Fetch updated user data
  };

  const renderContent = () => {
    if (isLoading) {
      return <p>Loading user data...</p>;
    }

    // Check for profile data validity
    const hasProfileData = profileData && 
      profileData.first_name && 
      profileData.last_name && 
      profileData.skills && 
      profileData.skills.length > 0;

    switch (activeTab) {
      case "profile":
        return hasProfileData ? (
          <CreateProfileView profileData={profileData} />
        ) : (
          <CreateProfilePage 
            setProfileData={setProfileData} 
            onProfileUpdate={handleProfileUpdate} // Pass the handler to child
          />
        );
      case "search":
        return <SearchAndFilterSystem />;
      case "connections":
        return <SeekerConnections />;

      case "security":
        return (
          <div>
            Security Settings
            <DeleteJobSeekerProfile />
            <UpdateJobSeekerProfile />
          </div>
        );

      default:
        return "profile";
    }
  };

  return (
    <div className="profile-settings-container">
      <aside className="sidebar">
        <ul className="sidebar-menu">
          <li onClick={() => setActiveTab("profile")} className={activeTab === "profile" ? "active" : ""}>
            Profile
          </li>
          <li onClick={() => setActiveTab("search")} className={activeTab === "search" ? "active" : ""}>
            Search
          </li>

          <li
            onClick={() => setActiveTab("connections")}
            className={activeTab === "connections" ? "active" : ""}
          >
            Connections
            {connectedCount > 0 && (
              <span className="counter">{connectedCount}</span>
            )}

          </li>
          <li onClick={() => setActiveTab("security")} className={activeTab === "security" ? "active" : ""}>
            Security
          </li>


        </ul>
      </aside>
      <main className="content-area">
        <div className="welcome-message">
          {isLoading ? (
            <p>Loading user data...</p>
          ) : (
            <>
              <h1>Welcome, {fullName}!</h1>
              <p>
                You are logged in as{" "}
                {userType === "job_seeker" ? "a Job Seeker" : "an Employer"}.
              </p>
            </>
          )}
        </div>
        {renderContent()}
      </main>
    </div>
  );
}

export default JobSeekerDashboard;