import "./DeleteEmployerProfile.scss";

function DeleteEmployerProfile() {
  const SubmitDelete = async () => {
    const token = localStorage.getItem("token");

    // Create a custom confirmation dialog
    const confirmDelete = window.confirm(
      "Are you sure to delete your account? All your job postings and connections may be lost."
    );

    if (confirmDelete) {
      try {
        const response = await fetch(
          "http://localhost:5000/api/delete_employer_profile",
          {
            method: "DELETE",
            headers: {
              Authorization: `Bearer ${token}`,
            },
          }
        );
        if (response.ok) {
          alert("Profile deleted successfully!");
        } else {
          const errorData = await response.json();
          console.error("Delete failed:", errorData);
          alert(`Error: ${errorData.message || "Profile deletion failed"}`);
        }
      } catch (error) {
        console.error("Network error:", error);
      }
    }
  };

  return (
    <div className="delete-profile-container">
      <p>
        If you wish to delete your profile,
        <span className="delete-profile-link" onClick={SubmitDelete}>
          {" "}
          click here.
        </span>
      </p>
    </div>
  );
}

export default DeleteEmployerProfile;
