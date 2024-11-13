import { useState, useEffect } from "react";
import CreateProfilePage from "../Profile/JobSeekerCreateProfile";
import CreateProfileView from "../Profile/JobSeekerProfileView";
import SearchAndFilterSystem from "../SearchForJobSeekers/SearchAndFilterSystem";
import UpdateJobSeekerProfile from "../UpdateAndDelete/UpdateJobSeekerProfile";
import DeleteJobSeekerProfile from "../UpdateAndDelete/DeleteJobSeekerProfile";
import SeekerConnections from "../SeekerConnections/SeekerConnections";
import "./Dashboard.scss";

function JobSeekerDashboard({ profileData, setProfileData, token }) {
  const [isLoading, setIsLoading] = useState(true); // Start with loading state
  // const token = localStorage.getItem("token");
  const [connectedCount, setConnectedCount] = useState(0);

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
          setConnectedCount(data.connected_count);
          if (profile) {
            setProfileData(profile); // Store profile data in state
            `${profile.first_name} ${profile.last_name}`; // Set full name from profile
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
    } else {
      setIsLoading(false); // Stop loading if no token
    }
  }, [token, setProfileData]);

  const handleProfileUpdate = async (updatedProfile) => {
    setProfileData(updatedProfile); // Update the profile data in state
  };

  const [activeTab, setActiveTab] = useState("profile");

  const renderContent = () => {
    if (isLoading) {
      return <p>Loading user data...</p>; // Loading message while fetching data
    }

    const hasProfileData =
      profileData &&
      Object.keys(profileData).length > 0 &&
      profileData.skills &&
      profileData.skills.length > 0;

    switch (activeTab) {
      case "profile":
        return hasProfileData ? (
          <CreateProfileView profileData={profileData} />
        ) : (
          <CreateProfilePage
            setProfileData={setProfileData}
            onProfileUpdate={handleProfileUpdate}
          />
        );
      case "search":
        return <SearchAndFilterSystem />;
      case "connections":
        return (
          <SeekerConnections
            connectedCount={connectedCount}
            setConnectedCount={setConnectedCount}
          />
        );

      case "settings":
        return (
          <div>
            <UpdateJobSeekerProfile />
            <DeleteJobSeekerProfile />
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
          <li
            onClick={() => setActiveTab("profile")}
            className={activeTab === "profile" ? "active" : ""}>
            Profile
          </li>
          <li
            onClick={() => setActiveTab("search")}
            className={activeTab === "search" ? "active" : ""}>
            Search
          </li>
          <li
            onClick={() => setActiveTab("connections")}
            className={activeTab === "connections" ? "active" : ""}>
            Connections
            {connectedCount > 0 && (
              <span className="counter">{connectedCount}</span>
            )}
          </li>
          <li
            onClick={() => setActiveTab("settings")}
            className={activeTab === "settings" ? "active" : ""}>
            Settings
          </li>
        </ul>
      </aside>
      <main className="content-area">{renderContent()}</main>
    </div>
  );
}

export default JobSeekerDashboard;
