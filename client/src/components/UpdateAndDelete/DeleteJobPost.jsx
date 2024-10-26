import React from 'react';

const DeleteJobPost = ({ jobId, onDeleteSuccess }) => {
  const handleDelete = async () => {
    const token = localStorage.getItem('token');
    if (window.confirm("Are you sure you want to delete this job post?")) {
      try {
        const response = await fetch(`http://localhost:5000/api/job_posting/${jobId}`, {
          method: 'DELETE',
          headers: {
            Authorization: `Bearer ${token}`,
            'Content-Type': 'application/json',
          },
        });
        if (response.ok) {
          alert('Job post deleted successfully!');
          onDeleteSuccess(jobId); // Trigger callback to update parent component
        } else {
          const errorData = await response.json();
          alert(`Error: ${errorData.message || "Failed to delete job post"}`);
        }
      } catch (error) {
        console.error('Error:', error);
        alert('Failed to delete job post.');
      }
    }
  };

  return (
    <button className="btn btn-danger" onClick={handleDelete}>
      Delete Job Post
    </button>
  );
};

export default DeleteJobPost;
