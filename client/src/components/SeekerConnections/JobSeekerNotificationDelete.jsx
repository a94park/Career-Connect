function JobSeekerNotificationDelete({
  applicationId,
  onDelete,
  setConnectedCount,
}) {
  const handleDelete = async () => {
    const token = localStorage.getItem("token");
    try {
      const response = await fetch(
        `http://localhost:5000/api/job_seeker/delete_application/${applicationId}`,
        {
          method: "DELETE",
          headers: {
            Authorization: `Bearer ${token}`,
          },
        }
      );

      if (!response.ok) {
        const errorData = await response.json();
        throw new Error(
          errorData.message || "Failed to delete the application"
        );
      }

      const data = await response.json();
      alert(data.message);
      onDelete(applicationId); // Notify parent to remove the notification from the list
      setConnectedCount((prevCount) => Math.max(0, prevCount - 1));
    } catch (error) {
      alert(`Error: ${error.message}`);
    }
  };

  return (
    <button className="btn btn-danger" onClick={handleDelete}>
      Delete
    </button>
  );
}

export default JobSeekerNotificationDelete;
