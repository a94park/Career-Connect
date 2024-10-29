import React, { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import "./LogoutPopUp.scss";


// onClose allows the navbar to be able to be clicked after logging out.
function LogoutPopUp({onClose}) {
    const [isFadingOut, setIsFadingOut] = useState(false);
    const navigate = useNavigate();

    useEffect(() => {
        // Start fade-out animation after 2.5 seconds
        const fadeTimer = setTimeout(() => {
            setIsFadingOut(true);
        }, 1000);

        // Redirect after the full animation
        const redirectTimer = setTimeout(() => {
            navigate("/");
            onClose();
        }, 1500);

        return () => {
            clearTimeout(fadeTimer);
            clearTimeout(redirectTimer);
        };
    }, [navigate, onClose]);



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
