import React from "react";
import SyntaxHighlighter from "react-syntax-highlighter";
import { darcula } from "react-syntax-highlighter/dist/cjs/styles/hljs";

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
        padding: "2px",
        //height: height,
        // marginBottom: "-10px",
      }}
    >
      <iframe
        src={src}
        title={title}
        width="100%"
        height="400"
        style={{ border: "none", padding: "none", marginBottom: "-20px" }} // Adjust margin to remove the gap
      ></iframe>
      <SyntaxHighlighter
        language="dart"
        style={darcula}
        customStyle={{
          padding: "none",
          borderRadius: "0 0 10px 10px",
          marginBottom: "0px",
        }}
      >
        {code}
      </SyntaxHighlighter>
    </div>
  );
};

export default IframeModule;
