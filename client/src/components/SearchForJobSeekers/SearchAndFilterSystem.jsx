import { useState, useEffect } from "react";
import "./SearchAndFilterSystem.scss";

function SearchAndFilterSystem() {
  const [input, setInput] = useState("");
  const [salaryRange, setSalaryRange] = useState("");
  const [location, setLocation] = useState("");
  const [requiredSkills, setRequiredSkills] = useState("");
  const [results, setResults] = useState([]);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(null);
  const [currentIndex, setCurrentIndex] = useState(0); // Track current card
  const [slideDirection, setSlideDirection] = useState("");
  const [endOfResults, setEndOfResults] = useState(false); // Track if end of results reached

  const getTokenFromLocalStorage = () => {
    return localStorage.getItem("token");
  };

  const buildQueryParams = () => {
    const query = new URLSearchParams();
    if (input.trim()) query.append("job_title", input);
    if (salaryRange.trim()) query.append("salary_range", salaryRange);
    if (location.trim()) query.append("location", location);
    if (requiredSkills.trim()) query.append("required_skills", requiredSkills);
    return query.toString();
  };

  const fetchFilteredJobPostings = async () => {
    setLoading(true);
    setError(null);
    setEndOfResults(false); // Reset end of results flag on new search

    const token = getTokenFromLocalStorage();
    if (!token) {
      setError("Authorization token is missing");
      setLoading(false);
      return;
    }

    try {
      const queryString = buildQueryParams();
      const response = await fetch(
        `http://127.0.0.1:5000/api/filter?${queryString}`,
        {
          method: "GET",
          headers: { Authorization: `Bearer ${token}` },
        }
      );

      if (!response.ok) {
        const errorData = await response.json();
        throw new Error(errorData.message || "Failed to fetch job postings");
      }

      const json = await response.json();
      setResults(json);
    } catch (error) {
      setError(error.message);
      setResults([]);
    } finally {
      setLoading(false);
    }
  };
  useEffect(() => {
    fetchFilteredJobPostings(); // Trigger the fetch on component mount
  }, []);

  const handleApplication = async (job_posting_id, action) => {
    const token = getTokenFromLocalStorage();

    try {
      const response = await fetch("http://127.0.0.1:5000/api/apply", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${token}`,
        },
        body: JSON.stringify({ job_posting_id, action }),
      });

      if (!response.ok) {
        const errorData = await response.json();
        throw new Error(
          errorData.message || "Failed to update application status"
        );
      }

      const data = await response.json();
      console.log(data.message); // Notify user that the application was successful
    } catch (error) {
      console.log(`Error: ${error.message}`);
    }
  };

  const handleFilterSubmit = (e) => {
    e.preventDefault();
    fetchFilteredJobPostings();
  };

  const handleClearFilters = () => {
    setInput("");
    setSalaryRange("");
    setLocation("");
    setRequiredSkills("");
    setResults([]);
  };

  const handlePrevious = () => {
    if (currentIndex > 0) {
      setSlideDirection("slide-out-bottom");
      setTimeout(() => {
        setCurrentIndex((prevIndex) => prevIndex - 1);
        setSlideDirection("slide-in-bottom");
      }, 500);
    }
  };

  const handleNext = () => {
    if (currentIndex < results.length - 1) {
      setSlideDirection("slide-out-right"); // Set slide-out-right effect
      setTimeout(() => {
        setCurrentIndex((prevIndex) => prevIndex + 1);
        setSlideDirection("slide-in-left"); // Set slide-in-left effect after index update
      }, 500); // Duration should match CSS animation timing
    } else {
      setEndOfResults(true); // Notify if no more next posts
    }
  };

  const handleNextPass = () => {
    if (currentIndex < results.length - 1) {
      setSlideDirection("slide-out-left"); // Set slide-out-right effect
      setTimeout(() => {
        setCurrentIndex((prevIndex) => prevIndex + 1);
        setSlideDirection("slide-in-right"); // Set slide-in-left effect after index update
      }, 500); // Duration should match CSS animation timing
    } else {
      setEndOfResults(true); // Notify if no more next posts
    }
  };

  return (
    <div className="searchF-container">
      <form className="filter-form" onSubmit={handleFilterSubmit}>
        {/* Filter Inputs */}
        <div className="form-group">
          <label htmlFor="jobTitle" className="form-label">
            Job Title:
          </label>
          <input
            type="text"
            id="jobTitle"
            value={input}
            onChange={(e) => setInput(e.target.value)}
            placeholder="Search for job titles..."
            className="form-input"
          />
        </div>
        <div className="form-group">
          <label htmlFor="salaryRange" className="form-label">
            Salary:
          </label>
          <input
            type="text"
            id="salaryRange"
            value={salaryRange}
            onChange={(e) => setSalaryRange(e.target.value)}
            placeholder="Enter salary range (e.g., 50K - 70K)"
            className="form-input"
          />
        </div>
        <div className="form-group">
          <label htmlFor="location" className="form-label">
            Location:
          </label>
          <input
            type="text"
            id="location"
            value={location}
            onChange={(e) => setLocation(e.target.value)}
            placeholder="Enter location"
            className="form-input"
          />
        </div>
        <div className="form-group">
          <label htmlFor="requiredSkills" className="form-label">
            Required Skills:
          </label>
          <input
            type="text"
            id="requiredSkills"
            value={requiredSkills}
            onChange={(e) => setRequiredSkills(e.target.value)}
            placeholder="Enter required skills"
            className="form-input"
          />
        </div>

        <button type="submit" className="form-button">
          Search
        </button>
        <button
          type="button"
          className="clear-button"
          onClick={handleClearFilters}>
          Clear
        </button>
      </form>
      {/* Job Posting Cards */}
      {loading && <p>Loading...</p>}
      {error && <p className="error">{error}</p>}
      {!loading && results.length === 0 && <p>No job postings found.</p>}

      {results.length > 0 && !endOfResults ? (
        <div className={`result-card ${slideDirection}`}>
          <h3>{results[currentIndex].title}</h3>
          <p>
            <strong>Location:</strong> {results[currentIndex].location}
          </p>
          <p>
            <strong>Salary:</strong> {results[currentIndex].salary}
          </p>
          <p>
            <strong>Required Skills:</strong> {results[currentIndex].skills}
          </p>
          <p>
            <strong>Description:</strong> {results[currentIndex].description}
          </p>
          <p>
            <strong>Posted On:</strong>{" "}
            {new Date(results[currentIndex].created_at).toLocaleDateString()}
          </p>

          <div className="button-group">
            <button
              onClick={() => {
                handleApplication(
                  results[currentIndex].job_posting_id,
                  "reject"
                );
                handleNextPass();
              }}
              className="reject-button">
              Pass
            </button>

            <button onClick={handlePrevious} className="previous-button">
              Previous
            </button>
            <button
              onClick={() => {
                handleApplication(
                  results[currentIndex].job_posting_id,
                  "accept"
                );
                handleNext();
              }}
              className="accept-button">
              Apply
            </button>
          </div>
        </div>
      ) : (
        <p>
          No more job postings. Please check again later or adjust your filters.
        </p>
      )}
    </div>
  );
}

export default SearchAndFilterSystem;
