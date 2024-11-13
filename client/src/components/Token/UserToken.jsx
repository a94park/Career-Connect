import { useState, useEffect } from "react";

function UserToken() {
  // Get the initial token, user type, and profile data from local storage
  const getToken = () => localStorage.getItem("token");
  const getUserType = () => localStorage.getItem("userType");
  const getProfileData = () => {
    const profileData = localStorage.getItem("profileData");
    return profileData && profileData !== "undefined"
      ? JSON.parse(profileData)
      : null;
  };

  // Initialize state with values from local storage
  const [token, setTokenState] = useState(getToken());
  const [userType, setUserTypeState] = useState(getUserType());
  const [profileData, setProfileDataState] = useState(getProfileData());

  // Update local storage and state when the token, user type, or profile data changes
  const setToken = (userToken, type, profile) => {
    if (userToken) {
      localStorage.setItem("token", userToken); // Store token in local storage
      localStorage.setItem("userType", type); // Store user type in local storage
      localStorage.setItem("profileData", JSON.stringify(profile)); // Store profile data in local storage
    } else {
      localStorage.removeItem("token"); // Remove token from local storage if null
      localStorage.removeItem("userType"); // Remove user type from local storage if null
      localStorage.removeItem("profileData"); // Remove profile data from local storage if null
    }
    setTokenState(userToken); // Update the token state
    setUserTypeState(type); // Update the user type state
    setProfileDataState(profile); // Update the profile data state
  };

  // Optional: useEffect to synchronize state with local storage
  useEffect(() => {
    const currentToken = getToken();
    const currentUserType = getUserType();
    const currentProfileData = getProfileData();
    if (currentToken !== token) {
      setTokenState(currentToken);
    }
    if (currentUserType !== userType) {
      setUserTypeState(currentUserType);
    }
    if (currentProfileData !== profileData) {
      setProfileDataState(currentProfileData);
    }
  }, []); // Runs only once when the component mounts

  return {
    token,
    userType,
    profileData,
    setToken,
  };
}

export default UserToken;
