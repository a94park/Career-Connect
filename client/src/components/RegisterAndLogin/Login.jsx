import { useState } from "react";
import { useNavigate } from "react-router-dom";
import { FaEye, FaEyeSlash } from "react-icons/fa"; // Import eye icons
import UserToken from "../Token/UserToken";

import "../RegisterAndLogin/Login.scss";

function Login({ setIsLoggedIn, setProfileData, setToken }) {
  const [formData, setFormData] = useState({ username: "", password: "" });
  const [loginError, setLoginError] = useState("");
  const [loading, setLoading] = useState(false);
  const [showPassword, setShowPassword] = useState(false);
  // const { token, userType, profileData, setToken } = UserToken();

  const navigate = useNavigate();

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData((prevData) => ({ ...prevData, [name]: value }));
  };

  const togglePasswordVisibility = () => {
    setShowPassword((prev) => !prev);
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    setLoading(true);
    setLoginError("");

    try {
      const response = await fetch("http://localhost:5000/login", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(formData),
      });

      if (response.ok) {
        const { access_token: token, user_type: userType } =
          await response.json();
        setToken(token);
        setIsLoggedIn(true);
        navigate(
          userType === "job_seeker"
            ? "/job-seeker-dashboard"
            : "/employer-dashboard"
        );

        const profileResponse = await fetch("http://localhost:5000/dashboard", {
          headers: { Authorization: `Bearer ${token}` },
        });

        if (profileResponse.ok) {
          const profileData = await profileResponse.json();
          setToken(token);
          setProfileData(
            userType === "job_seeker"
              ? profileData.job_seeker_profile || {}
              : profileData.employer_profile || {}
          );
        } else {
          setLoginError("Failed to retrieve profile data.");
        }
      } else {
        setLoginError("Invalid username or password.");
      }
    } catch (error) {
      console.error("Login error:", error);
      setLoginError("An error occurred. Please try again.");
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="login-form-container d-flex justify-content-center align-items-center">
      <div className="login-form">
        <h2 className="text-center mb-4">Login</h2>
        <form onSubmit={handleSubmit}>
          <div className="mb-3">
            <input
              type="text"
              name="username"
              className="form-control"
              placeholder="Username"
              value={formData.username}
              onChange={handleChange}
              maxLength={30}
              required
              aria-label="Username" // Accessibility enhancement
            />
          </div>

          <div className="mb-3 password-container">
            <input
              type={showPassword ? "text" : "password"}
              name="password"
              className="form-control"
              placeholder="Password"
              value={formData.password}
              onChange={handleChange}
              maxLength={30}
              required
              aria-label="Password" // Accessibility enhancement
            />
            <span
              className="toggle-password"
              onClick={togglePasswordVisibility}
              role="button"
              aria-label="Toggle password visibility">
              {showPassword ? <FaEyeSlash /> : <FaEye />}
            </span>
          </div>

          <button
            type="submit"
            className="btn btn-primary w-100"
            disabled={loading}>
            {loading ? "Loading..." : "Login"}
          </button>
        </form>
        {loginError && <p className="text-danger">{loginError}</p>}
      </div>
    </div>
  );
}

export default Login;
