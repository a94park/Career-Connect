import { useEffect, useState } from "react";

function SeekerPassed() {
  const [applications, setApplications] = useState([]);

  // Fetch applications from the server
  const fetchApplications = async () => {
    const token = localStorage.getItem("token");
    const response = await fetch("http://127.0.0.1:5000/api/applications", {
      method: "GET",
      headers: {
        Authorization: `Bearer ${token}`,
      },
    });

    if (response.ok) {
      const data = await response.json();
      setApplications(data);
    } else {
      console.log("Failed to fetch applications");
    }
  };

  useEffect(() => {
    fetchApplications();
  }, []);

  // Filter applications to show only rejected ones (job_seeker_status === 2)
  const applied = applications.filter((app) => app.job_seeker_status === 2);

  return (
    <div className="seeker-passed">
      {applied.length > 0 ? (
        applied.map((application) => (
          <div
            className="card notification-card mb-3 shadow"
            key={application.application_id}>
            <h3>
              <strong>{application.company_name}</strong>
            </h3>
            <p className="card-title">{application.job_title}</p>
            <p className="card-description-text">{application.description}</p>

            <small className="text-muted">
              Passed on: {new Date(application.created_at).toLocaleString()}
            </small>
          </div>
        ))
      ) : (
        <p className="no-applications">You have not passed on any offers.</p>
      )}
    </div>
  );
}

export default SeekerPassed;
