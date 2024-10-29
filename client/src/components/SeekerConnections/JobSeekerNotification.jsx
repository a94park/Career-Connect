import { useEffect, useState } from "react";
import JobSeekerNotificationDelete from "./JobSeekerNotificationDelete";
import ConfettiEffect from "../ConfettiEffect/ConfettiEffect";

function JobSeekerNotification() {
  const [notifications, setNotifications] = useState([]);
  const [showConfetti, setShowConfetti] = useState(false);

  useEffect(() => {
    const fetchNotifications = async () => {
      const token = localStorage.getItem("token");
      const response = await fetch(
        "http://localhost:5000/api/job_seeker/notifications",
        {
          method: "GET",
          headers: {
            Authorization: `Bearer ${token}`,
          },
        }
      );

      const data = await response.json();
      setNotifications(data);

      // Check for any "Accepted" statuses and trigger confetti if present
      if (data.some((notification) => notification.employer_status === 1)) {
        setShowConfetti(true);
      }
    };

    fetchNotifications();
  }, []);

  const handleDeleteNotification = (applicationId) => {
    setNotifications(
      notifications.filter(
        (notification) => notification.application_id !== applicationId
      )
    );
  };

  return (
    <div className="jobseeker-notifications">
      {/* Trigger confetti if there's an accepted notification */}
      <ConfettiEffect trigger={showConfetti} />

      {notifications.length > 0 ? (
        notifications.map((notification, index) => (
          <div key={index} className="card notification-card mb-3 shadow">
            <h3>
              <strong>{notification.employer.company_name} </strong>
            </h3>
            <p className="card-title"> {notification.job_posting_title}</p>
            <p className="card-description-text">
              {notification.job_posting_description}
            </p>
            {notification.employer_status !== null && (
              <p className="card-text">
                <strong>Status: </strong>
                {notification.employer_status === 1 ? "Accepted" : "Rejected"}
              </p>
            )}
            <p className="card-text">
              <small className="text-muted">
                Submitted on{" "}
                {new Date(notification.created_at).toLocaleDateString()}
              </small>
            </p>
            <JobSeekerNotificationDelete
              applicationId={notification.application_id}
              onDelete={handleDeleteNotification}
            />
          </div>
        ))
      ) : (
        <p className="text-center text-light">No notifications yet.</p>
      )}
    </div>
  );
}

export default JobSeekerNotification;
