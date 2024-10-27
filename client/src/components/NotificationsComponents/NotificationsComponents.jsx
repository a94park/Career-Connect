import { useEffect, useState } from "react";
import "./NotificationsComponents.scss";

function NotificationsComponent() {
  const [notifications, setNotifications] = useState([]);
  const [loading, setLoading] = useState(true);
  const [showProfileModal, setShowProfileModal] = useState(false);
  const [selectedJobSeeker, setSelectedJobSeeker] = useState(null);

  const getTokenFromLocalStorage = () => localStorage.getItem("token");

  const fetchNotificationsWithDetails = async () => {
    const token = getTokenFromLocalStorage();
    try {
      const response = await fetch("http://localhost:5000/api/employer/notifications_details", {
        method: "GET",
        headers: {
          Authorization: `Bearer ${token}`,
          "Content-Type": "application/json",
        },
      });
      if (!response.ok) throw new Error("Failed to fetch notifications");

      const data = await response.json();
      setNotifications(data);
    } catch (error) {
      console.error("Error fetching notifications:", error);
    } finally {
      setLoading(false);
    }
  };

  const handleEmployerResponse = async (applicationId, status, notificationId) => {
    const token = getTokenFromLocalStorage();
    try {
      // Update the employer_status in the application
      const response = await fetch(
        `http://localhost:5000/api/employer/update_application`,
        {
          method: "PUT",
          headers: {
            Authorization: `Bearer ${token}`,
            "Content-Type": "application/json",
          },
          body: JSON.stringify({
            application_id: applicationId,
            employer_status: status,
          }),
        }
      );

      if (!response.ok) {
        const errorData = await response.json();
        throw new Error(errorData.message || "Failed to update employer status");
      }

      // Delete the corresponding notification
      const deleteResponse = await fetch(
        `http://localhost:5000/api/employer/notification/${notificationId}`,
        {
          method: "DELETE",
          headers: {
            Authorization: `Bearer ${token}`,
            "Content-Type": "application/json",
          },
        }
      );

      if (!deleteResponse.ok) {
        const deleteErrorData = await deleteResponse.json();
        throw new Error(deleteErrorData.message || "Failed to delete notification");
      }

      // Remove the notification from the displayed list
      setNotifications((prevNotifications) =>
        prevNotifications.filter(
          (notification) => notification.notification.notification_id !== notificationId
        )
      );
    } catch (error) {
      alert(`Error: ${error.message}`);
    }
  };

  useEffect(() => {
    fetchNotificationsWithDetails();
  }, []);

  const viewProfile = (jobSeekerDetails) => {
    setSelectedJobSeeker(jobSeekerDetails);
    setShowProfileModal(true);
  };

  const closeModal = () => {
    setShowProfileModal(false);
    setSelectedJobSeeker(null);
  };

  return (
    <div className="notifications-container">
      <h1>Notifications</h1>
      {loading ? (
        <h2>Loading Notifications...</h2>
      ) : notifications.length === 0 ? (
        <h2>There are no notifications.</h2>
      ) : (
        <ul className="list-group">
          {notifications.map(({ notification, job_posting, job_seeker }) => (
            <li key={notification.notification_id} className="list-group-item">
              <p className="job-posting-title">
                <strong>Job Posting:</strong> {job_posting.title}
              </p>
              <p className="job-description">
                <strong>Description:</strong> {job_posting.description}
              </p>
              <p className="job-seeker-name">
                <strong>Job Seeker:</strong> {job_seeker.first_name} {job_seeker.last_name}
              </p>
              <p className="skills-list">
                <strong>Skills:</strong> {job_seeker.skills.join(", ")}
              </p>
              <div className="button-group">
                <button
                  className="btn btn-success me-2"
                  onClick={() =>
                    handleEmployerResponse(
                      notification.application_id,
                      1,
                      notification.notification_id
                    )
                  }
                >
                  Accept
                </button>
                <button
                  className="btn btn-danger"
                  onClick={() =>
                    handleEmployerResponse(
                      notification.application_id,
                      2,
                      notification.notification_id
                    )
                  }
                >
                  Reject
                </button>
                <button
                  className="btn btn-info"
                  onClick={() => viewProfile(job_seeker)}
                >
                  View Profile
                </button>
              </div>
            </li>
          ))}
        </ul>
      )}
      {showProfileModal && selectedJobSeeker && (
        <div className="modal-overlay">
          <div className="modal-content">
            <button className="close-btn" onClick={closeModal}>X</button>
            <h3>
              {selectedJobSeeker.first_name} {selectedJobSeeker.last_name}'s Profile
            </h3>
            <p><strong>Date of Birth:</strong> {selectedJobSeeker.dob}</p>
            <p><strong>Gender:</strong> {selectedJobSeeker.gender}</p>
            <p><strong>Nationality:</strong> {selectedJobSeeker.nationality}</p>
            <p><strong>Skills:</strong> {selectedJobSeeker.skills.join(", ")}</p>
            {selectedJobSeeker.education?.map((edu, index) => (
              <div key={index}>
                <p><strong>Education:</strong> {edu.education}</p>
                {edu.degreeDetails && <p><strong>Degree Details:</strong> {edu.degreeDetails}</p>}
                {edu.institution && <p><strong>Institution:</strong> {edu.institution}</p>}
              </div>
            ))}
          </div>
        </div>
      )}
    </div>
  );
}

export default NotificationsComponent;
