import React from "react";

interface IframeProps {
  src: string;
  title: string;
  height: string;
  code: string;
}

const IframeModule: React.FC<IframeProps> = ({ src, title, height, code }) => {
  return (
    <div
      className="ButtonPreview"
      style={{
        border: "0.3px solid #404040",
        borderRadius: "12px",
        padding: "3px",
        height: height,
      }}
    >
      <iframe
        src={src}
        title={title}
        width="100%"
        height="400"
        style={{ border: "none", padding: "none" }}
      ></iframe>
      <pre>{code}</pre> {/* Displaying the code */}
    </div>
  );
};

export default IframeModule;
