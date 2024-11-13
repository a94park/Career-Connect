import { useState, useEffect } from "react";
import JobPosting from "../EmployerJobPost/JobPosting";
import EmployerCreateProfile from "../Profile/EmployerCreateProfile";
import EmployerProfileView from "../Profile/EmployerProfileView";
import EmployersSeekingForJobSeekers from "../EmployerSearchJobSeeker/EmployersSeekingForJobSeekers";
import DeleteEmployerProfile from "../UpdateAndDelete/DeleteEmployerProfile";
import UpdateEmployerProfile from "../UpdateAndDelete/UpdateEmployerProfile";
import NotificationsComponent from "../EmployerNotifications/NotificationsComponents";
import EmployerViewJobPost from "../EmployerJobPost/EmployerViewJobPost";

import "./Dashboard.scss";

function EmployerDashboard({ profileData, setProfileData, token }) {
  const [isLoading, setIsLoading] = useState(!profileData);
  // localStorage.getItem("token");

  useEffect(() => {
    if (!profileData && token) {
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
            setProfileData(data.employer_profile || {}); // Set profile data or empty object
          } else {
            console.error("Failed to fetch user data");
          }
        } catch (error) {
          console.error("An error occurred:", error);
        } finally {
          setIsLoading(false); // Stop loading
        }
      };

      fetchUserData();
    }
  }, [profileData, token, setProfileData]);

  const handleProfileUpdate = (updatedProfile) => {
    setProfileData(updatedProfile); // Update profile data in the dashboard
  };

  const [activeTab, setActiveTab] = useState("profile");
  const renderContent = () => {
    if (isLoading) {
      return <p>Loading user data...</p>; // Loading state
    }

    // Determine if the user has a complete profile
    const hasProfileData =
      profileData && profileData.company_name && profileData.about_company;

    switch (activeTab) {
      case "profile":
        return hasProfileData ? (
          <EmployerProfileView profileData={profileData} />
        ) : (
          <EmployerCreateProfile
            setProfileData={setProfileData}
            onProfileUpdate={handleProfileUpdate}
          />
        );
      case "search":
        return <EmployersSeekingForJobSeekers />;
      case "create job post":
        return (
          <div>
            <JobPosting />
            <EmployerViewJobPost />
          </div>
        );
      case "security":
        return (
          <div>
            <UpdateEmployerProfile />
            <DeleteEmployerProfile />
          </div>
        );
      case "notification":
        return (
          <div>
            <NotificationsComponent />
          </div>
        );

      default:
        return <EmployerProfileView profileData={profileData} />;
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
            Search for Job Seekers
          </li>
          <li
            onClick={() => setActiveTab("create job post")}
            className={activeTab === "create job post" ? "active" : ""}>
            Job Posts
          </li>
          <li
            onClick={() => setActiveTab("notification")}
            className={activeTab === "notification" ? "active" : ""}>
            Notifications
          </li>
          <li
            onClick={() => setActiveTab("security")}
            className={activeTab === "security" ? "active" : ""}>
            Settings
          </li>
        </ul>
      </aside>
      <main className="content-area">{renderContent()}</main>
    </div>
  );
}

export default EmployerDashboard;
