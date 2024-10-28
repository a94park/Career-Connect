// src/components/ConfettiEffect/ConfettiEffect.jsx
import React, { useEffect } from "react";
import Confetti from "react-confetti";
import { useWindowSize } from "react-use";

const ConfettiEffect = ({ trigger }) => {
  const { width, height } = useWindowSize();

  return (
    trigger && (
      <Confetti
        width={width}
        height={height}
        recycle={false} // Only run once
        numberOfPieces={500} // Adjust as needed for intensity
      />
    )
  );
};

export default ConfettiEffect;
