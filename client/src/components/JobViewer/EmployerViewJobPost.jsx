import { useState, useEffect } from "react";
import "./EmployerViewJobPost.scss";
import DeleteJobPost from "../UpdateAndDelete/DeleteJobPost"; // Import the DeleteJobPost component

const EmployerViewJobPost = () => {
  const [jobs, setJobs] = useState([]);
  const [error, setError] = useState(null);
  const token = localStorage.getItem("token");

  useEffect(() => {
    const fetchEmployerJobs = async () => {
      try {
        const response = await fetch("http://localhost:5000/api/employer/jobs", {
          method: "GET",
          headers: {
            Authorization: `Bearer ${token}`,
            "Content-Type": "application/json",
          },
        });

        if (!response.ok) {
          if (response.status === 401) {
            throw new Error("Unauthorized access - Please log in again");
          } else if (response.status === 404) {
            throw new Error("No job postings found for this employer");
          } else {
            throw new Error("Failed to fetch job postings");
          }
        }

        const data = await response.json();
        setJobs(data);
      } catch (err) {
        setError(err.message || "An error occurred while loading job postings");
        console.error(err);
      }
    };

    fetchEmployerJobs();
  }, [token]);

  const handleDeleteSuccess = (deletedJobId) => {
    // Update the jobs state to remove the deleted job
    setJobs(jobs.filter(job => job.job_posting_id !== deletedJobId));
  };

  if (error) {
    return <div className="error-message">{error}</div>;
  }

  return (
    <div className="employer-job-posts-container">
      <h1>My Job Postings</h1>
      {jobs.length > 0 ? (
        <ul className="job-list">
          {jobs.map((job) => (
            <li key={job.job_posting_id} className="job-list-item">
              <h2 className="job-title">{job.title}</h2>
              <p className="job-description">{job.description}</p>
              <div className="job-meta">
                <p className="job-location"><strong>Location:</strong> {job.location}</p>
                <p className="job-salary"><strong>Salary:</strong> {job.salary}</p>
                <p className="job-skills"><strong>Skills:</strong> {job.skills}</p>
              </div>
              <p className="job-posted">
                <strong>Posted on:</strong> {new Date(job.created_at).toLocaleDateString()}
              </p>
              {/* DeleteJobPost component with success handler */}
              <DeleteJobPost jobId={job.job_posting_id} onDeleteSuccess={handleDeleteSuccess} />
            </li>
          ))}
        </ul>
      ) : (
        <p className="no-jobs-message">You have not posted any jobs yet.</p>
      )}
    </div>
  );
};

export default EmployerViewJobPost;
