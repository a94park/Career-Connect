import DevelopersSection from "./DevelopersSection.jsx";
import { useNavigate } from "react-router-dom";
import "./Team.scss";

function Team() {
  const navigate = useNavigate();

  return (
    <div className="team-container">
      <h1>About Us</h1>
      <p>
        Lorem ipsum dolor sit amet consectetur adipisicing elit. Soluta quae
        deserunt esse provident maxime nulla, repudiandae, iure sint doloremque
        cupiditate consectetur eum labore dolorem obcaecati vero aut modi alias
        corrupti. Lorem ipsum dolor sit amet consectetur adipisicing elit. Enim
        corrupti expedita, ratione eius soluta reiciendis laborum ex molestiae
        harum. Rem voluptate voluptatibus voluptates, eligendi placeat
        doloremque veniam nostrum ipsa fugit. Lorem ipsum dolor sit amet,
        consectetur adipisicing elit. Numquam voluptas excepturi neque itaque
        eum totam deleniti quaerat? Blanditiis, qui deserunt?Lorem ipsum, dolor
        sit amet consectetur adipisicing elit. Earum odit porro vel
        reprehenderit iste perferendis voluptatem quis quibusdam cumque,
        architecto nulla, incidunt nihil quas distinctio commodi ut, obcaecati
        harum veniam qui excepturi quidem veritatis. Officia quam ipsum
        quibusdam fugit deleniti reiciendis. Expedita necessitatibus eligendi
        itaque odio harum, veritatis eos earum repudiandae suscipit blanditiis
        id rem. Rem eaque hic sed mollitia, officia inventore iure dolorum qui
        similique enim. At ab repellat dignissimos unde sunt velit, error
        expedita recusandae, vero earum consequuntur eos tempore sequi, quaerat
        corporis eaque optio cum tempora in facere pariatur molestias.
        Consequatur quasi ullam necessitatibus! Inventore, qui amet.
      </p>
      <DevelopersSection></DevelopersSection>
      <button className="start-now-btn" onClick={() => navigate("/register")}>
        Start Now
      </button>
    </div>
  );
}

export default Team;
