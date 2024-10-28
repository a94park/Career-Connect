import DevelopersSection from "../Developers/DevelopersSection.jsx";
import { useNavigate } from "react-router-dom";


function Team() {
  const navigate = useNavigate();

  return (
    <div className="team-container">
      <h1>About Us</h1>
      <p>
        At <span className="team-name">Career Connect</span>, we believe in
        bridging the gap between talented professionals and the opportunities
        they deserve. Founded with a vision to simplify the job search process,
        our platform is designed to connect job seekers with top employers
        across various industries. Whether you’re a fresh graduate looking for
        your first opportunity or a seasoned professional seeking your next big
        move,
        <span className="team-name"> Career Connect</span> is here to make the
        process easier, faster, and more effective.
      </p>
      {/* Additional content */}
      <DevelopersSection></DevelopersSection>




      <div className="start-now-btn-container">
        <button className="start-now-btn" onClick={() => navigate("/register")}>
          Start Now
        </button>
      </div>
    </div>
  );
}

export default Team;
