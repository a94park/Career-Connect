import { useState, useEffect } from "react";
import { Link } from "react-router-dom";
import "./NavBar.scss";
import LogoutPopUp from "./LogoutPopUp";

function NavBar({ isLoggedIn, handleLogout, userType }) {
  const [scrolled, setScrolled] = useState(false);
  const [showLogoutPopUp, setShowLogoutPopUp] = useState(false); // Controls LogoutPopUp

  useEffect(() => {
    const handleScroll = () => {
      const offset = window.scrollY;
      if (offset > 50) {
        // Adjust the scroll threshold as needed
        setScrolled(true);
      } else {
        setScrolled(false);
      }
    };

    window.addEventListener("scroll", handleScroll);

    return () => {
      window.removeEventListener("scroll", handleScroll);
    };
  }, []);

  const handleLogoutAndNavigate = () => {
    handleLogout(); // Call the logout function
    setShowLogoutPopUp(true);
  };

  return (
    <>
      <nav className={scrolled ? "navbar-scrolled" : ""}>
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
