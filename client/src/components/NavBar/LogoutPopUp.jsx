import React, { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import "./LogoutPopUp.scss";

function LogoutPopUp() {
    const [isFadingOut, setIsFadingOut] = useState(false);
    const navigate = useNavigate();

    useEffect(() => {
        // Start fade-out animation after 2.5 seconds
        const fadeTimer = setTimeout(() => {
            setIsFadingOut(true);
        }, 2500);

        // Redirect after the full animation
        const redirectTimer = setTimeout(() => {
            navigate("/");
        }, 3000);

        return () => {
            clearTimeout(fadeTimer);
            clearTimeout(redirectTimer);
        };
    }, [navigate]);

    return (
        <div className={`logout-overlay ${isFadingOut ? 'fade-out' : ''}`}>
            <div className="logout-message">
                <h2>You have successfully logged out!</h2>
                <p>Redirecting to the home page...</p>
            </div>
        </div>
    );
}

export default LogoutPopUp;
