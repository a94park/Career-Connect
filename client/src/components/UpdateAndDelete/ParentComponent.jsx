import { useState, useEffect } from "react";
import EmployerProfileView from "../Profile/EmployerProfileView";
import DeleteEmployerProfile from "./DeleteEmployerProfile";

function ParentComponent() {
  const [profileData, setProfileData] = useState(null);

  // Fetch profile data when component mounts
  useEffect(() => {
    const fetchProfileData = async () => {
      const token = localStorage.getItem("token");
      try {
        const response = await fetch("http://localhost:5000/api/employer_profile", {
          headers: {
            'Authorization': `Bearer ${token}`
          }
        });
        if (response.ok) {
          const data = await response.json();
          setProfileData(data);
        }
      } catch (error) {
        console.error("Error fetching profile:", error);
      }
    };

    fetchProfileData();
  }, []);

  // Function to handle deletion and clear profile data
  const handleDeleteProfile = () => {
    setProfileData(null); // Clears profile data on successful deletion
  };

  return (
    <div>
      <EmployerProfileView profileData={profileData} />
      <DeleteEmployerProfile onDeleteSuccess={handleDeleteProfile} />
    </div>
  );
}

export default ParentComponent;
