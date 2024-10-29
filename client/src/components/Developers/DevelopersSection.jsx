import "./DevelopersSection.css";

function DevelopersSection() {
  const developers = [
    {
      name: "Abraham",
      role: "Frontend Developer",
      image: "../src/assets/abraham-placeholder.jpeg",
    },
    {
      name: "Barra",
      role: "Fullstack Developer",
      image: "../src/assets/funny-placeholder-image.jpg",
    },
    {
      name: "Dan",
      role: "Fullstack Developer",
      image: "../src/assets/dan-placeholder.webp",
    },
    {
      name: "Jerry",
      role: "Fullstack Developer",
      image: "../src/assets/jerry-placeholder.webp",
    },
    {
      name: "Sam",
      role: "Fullstack Developer",
      image: "../src/assets/sam-placeholder.jpeg",
    },
    {
      name: "Vlad",
      role: "Fullstack Developer",
      image: "../src/assets/vlad-placeholder.jpeg",
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
