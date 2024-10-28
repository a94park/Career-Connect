// ConfettiEffect.jsx
import React, { useState } from 'react';
import Confetti from 'react-confetti';
import { useWindowSize } from 'react-use';

const ConfettiEffect = () => {
  const { width, height } = useWindowSize();
  const [isActive, setIsActive] = useState(false);

  const triggerConfetti = () => {
    setIsActive(true);
    setTimeout(() => {
      setIsActive(false);
    }, 5000); // Show confetti for 3 seconds
  };

  return (
    <>
      <button onClick={triggerConfetti} className="trigger-confetti-btn">
        Celebrate!
      </button>
      {isActive && <Confetti width={width} height={height} />}
    </>
  );
};

export default ConfettiEffect;
