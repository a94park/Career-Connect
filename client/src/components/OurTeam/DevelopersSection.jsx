import abraham from "../../assets/pictures/abraham-placeholder.jpeg";
import barra from "../../assets/pictures/funny-placeholder-image.jpg";
import dan from "../../assets/pictures/dan-placeholder.webp";
import jerry from "../../assets/pictures/jerry-placeholder.webp";
import sam from "../../assets/pictures/sam-placeholder.jpeg";
import vlad from "../../assets/pictures/vlad-placeholder.jpeg";

import "./DevelopersSection.scss";

function DevelopersSection() {
  const developers = [
    {
      name: "Abraham",
      role: "Fullstack Developer",
      image: abraham,
    },
    {
      name: "Barra",
      role: "Fullstack Developer",
      image: barra,
    },
    {
      name: "Dan",
      role: "Fullstack Developer",
      image: dan,
    },
    {
      name: "Jerry",
      role: "Fullstack Developer",
      image: jerry,
    },
    {
      name: "Sam",
      role: "Fullstack Developer",
      image: sam,
    },
    {
      name: "Vlad",
      role: "Fullstack Developer",
      image: vlad,
    },
    // Add more developers as needed
  ];

  return (
    <div className="developers-section">
      {developers.map((developer, index) => (
        <div key={index} className="developer-card">
          <img src={developer.image} alt={`${developer.name} photo`} />
          <div className="developer-name">{developer.name}</div>
          <div className="developer-role">{developer.role}</div>
        </div>
      ))}
    </div>
  );
}

export default DevelopersSection;
