import { useState, useEffect } from "react";
import { BrowserRouter, Route, Routes } from "react-router-dom";
import "bootstrap/dist/css/bootstrap.min.css";
import UserToken from "./components/Token/UserToken";

import NavBar from "./components/NavBar/NavBar";
import Landing from "./components/Landing/Landing";
import Team from "./components/OurTeam/Team";
import Footer from "./components/Footer/Footer";

import Register from "./components/RegisterAndLogin/Register";
import Login from "./components/RegisterAndLogin/Login";
import JobSeekerDashboard from "./components/Dashboard/JobSeekerDashboard";
import EmployerDashboard from "./components/Dashboard/EmployerDashboard";

function App() {
  const [profileData, setProfileData] = useState(null);
  const { token, setToken } = UserToken(); // State for user token
  const [isLoggedIn, setIsLoggedIn] = useState(false);

  useEffect(() => {
    setIsLoggedIn(!!token); // Update state based on whether a token exists
  }, [token]);

  const handleLogout = () => {
    setToken(null); // Clear the token
    setIsLoggedIn(false);
  };
  return (
    <>
      <BrowserRouter>
        <NavBar
          isLoggedIn={isLoggedIn}
          profileData={profileData}
          handleLogout={handleLogout}
          token={token}
        />
        <Routes>
          <Route path="/" element={<Landing />} />
          <Route path="/our-team" element={<Team />} />
          <Route path="/register" element={<Register />} />
          <Route
            path="/login"
            element={
              <Login
                setIsLoggedIn={setIsLoggedIn}
                setProfileData={setProfileData}
                setToken={setToken}
              />
            }
          />
          <Route
            path="/job-seeker-dashboard"
            element={
              <JobSeekerDashboard
                profileData={profileData}
                setProfileData={setProfileData}
                token={token}
              />
            }
          />
          <Route
            path="/employer-dashboard"
            element={
              <EmployerDashboard
                profileData={profileData}
                setProfileData={setProfileData}
                token={token}
              />
            }
          />
        </Routes>
      </BrowserRouter>
      <Footer />
    </>
  );
}

export default App;
