import abrahamplaceholder from "../../assets/pictures/abraham-placeholder.jpeg";
import "./DevelopersSection.scss";

function DevelopersSection() {
  const developers = [
    {
      name: "Abraham",
      role: "Fullstack Developer",
      image: abrahamplaceholder,
    },
    {
      name: "Barra",
      role: "Fullstack Developer",
      image: "../src/assets/pictures/funny-placeholder-image.jpg",
    },
    {
      name: "Dan",
      role: "Fullstack Developer",
      image: "/src/assets/pictures/dan-placeholder.webp",
    },
    {
      name: "Jerry",
      role: "Fullstack Developer",
      image: "../src/assets/pictures/jerry-placeholder.webp",
    },
    {
      name: "Sam",
      role: "Fullstack Developer",
      image: "../src/assets/pictures/sam-placeholder.jpeg",
    },
    {
      name: "Vlad",
      role: "Fullstack Developer",
      image: "../src/assets/pictures/vlad-placeholder.jpeg",
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
