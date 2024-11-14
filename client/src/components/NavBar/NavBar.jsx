import { useState } from "react";
import { Link } from "react-router-dom";
import LogoutPopUp from "./LogoutPopUp";
import UserToken from "../Token/UserToken";
import "./NavBar.scss";

function NavBar({ isLoggedIn, handleLogout }) {
  const { token, userType, profileData } = UserToken();

  const [showLogoutPopUp, setShowLogoutPopUp] = useState(false); // Controls LogoutPopUp

  const handleLogoutAndNavigate = () => {
    handleLogout(); // Call the logout function
    setShowLogoutPopUp(true);
  };
  return (
    <>
      <nav>
        <ul>
          <li>
            <Link className="navbar-link" to="/">
              Home
            </Link>
          </li>
          <li>
            <Link className="navbar-link" to="/our-team">
              Our Team
            </Link>
          </li>
          {isLoggedIn ? (
            <>
              <li>
                <Link
                  className="navbar-link"
                  to={
                    userType === "employer"
                      ? "/employer-dashboard"
                      : "/job-seeker-dashboard"
                  }>
                  Dashboard
                </Link>
              </li>

              <li>
                <button
                  className="logout-button"
                  onClick={handleLogoutAndNavigate}>
                  Logout
                </button>
              </li>
            </>
          ) : (
            <>
              <li>
                <Link className="navbar-link" to="/register">
                  Register
                </Link>
              </li>
              <li>
                <Link className="navbar-link" to="/login">
                  Login
                </Link>
              </li>
            </>
          )}
        </ul>
      </nav>
      {showLogoutPopUp && (
        <LogoutPopUp onClose={() => setShowLogoutPopUp(false)} />
      )}
    </>
  );
}

export default NavBar;
