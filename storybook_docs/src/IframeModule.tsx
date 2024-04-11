import React, { useState } from "react";
import SyntaxHighlighter from "react-syntax-highlighter";
import { darcula } from "react-syntax-highlighter/dist/cjs/styles/hljs";
import { MdContentCopy } from "react-icons/md";
import { CopyToClipboard } from "react-copy-to-clipboard";

// interface IframeProps {
//   src: string;
//   title: string;
//   height: string;
//   code: string;
// }

// const IframeModule: React.FC<IframeProps> = ({ src, title, height, code }) => {
//   const [copied, setCopied] = useState(false);

//   const handleCopy = () => {
//     setCopied(true);
//     setTimeout(() => {
//       setCopied(false);
//     }, 2000);
//   };

//   const [isHovered, setIsHovered] = useState(false);

//   return (
//     <div
//       className="IframeModule"
//       style={{
//         border: "0.3px solid #404040",
//         borderRadius: "0 0 12px 12px ",
//         padding: "1px",
//         position: "relative",
//       }}
//     >
//       <iframe
//         src={src}
//         title={title}
//         width="100%"
//         height="400"
//         style={{ border: "none", padding: "none", marginBottom: "-20px" }}
//       ></iframe>
//       <div
//         style={{
//           position: "absolute",
//           top: "20px",
//           right: "20px",
//           cursor: "pointer",
//           color: isHovered ? "#fff" : "#333",
//         }}
//         onMouseEnter={() => setIsHovered(true)}
//         onMouseLeave={() => setIsHovered(false)}
//       >
//         <CopyToClipboard text={code} onCopy={handleCopy}>
//           <MdContentCopy size={24} />
//         </CopyToClipboard>
//       </div>
//       <SyntaxHighlighter
//         language="dart"
//         style={darcula}
//         customStyle={{
//           padding: "none",
//           borderRadius: "0 0 10px 10px",
//           marginBottom: "0px",
//         }}
//       >
//         {code}
//       </SyntaxHighlighter>
//       {copied && (
//         <div
//           style={{
//             position: "absolute",
//             top: "55px",
//             right: "10px",
//             backgroundColor: "rgba(255, 255, 255, 0.9)",
//             padding: "5px",
//             borderRadius: "5px",
//             boxShadow: "0 0 5px rgba(0, 0, 0, 0.3)",
//             zIndex: 1,
//           }}
//         >
//           Copied!
//         </div>
//       )}
//     </div>
//   );
// };

// export default IframeModule;

interface IframeProps {
  src: string;
  title: string;
  height: string;
  code: string;
}

const IframeModule: React.FC<IframeProps> = ({ src, title, height, code }) => {
  const [copied, setCopied] = useState(false);

  const handleCopy = () => {
    setCopied(true);
    setTimeout(() => {
      setCopied(false);
    }, 2000);
  };

  const [isHovered, setIsHovered] = useState(false);

  return (
    <div
      className="IframeModule"
      style={{
        border: "0.3px solid #404040",
        borderRadius: "0 0 12px 12px ",
        padding: "10px", // Add padding to create space for CopyToClipboard button
        position: "relative",
      }}
    >
      <iframe
        src={src}
        title={title}
        width="100%"
        height={height}
        style={{ border: "none", padding: "none", marginBottom: "-20px" }}
      ></iframe>
      <div
        style={{
          position: "absolute",
          top: "10px", // Adjust top position to align with padding
          right: "10px", // Adjust right position to align with padding
          cursor: "pointer",
          color: isHovered ? "#fff" : "#333",
        }}
        onMouseEnter={() => setIsHovered(true)}
        onMouseLeave={() => setIsHovered(false)}
      >
        <CopyToClipboard text={code} onCopy={handleCopy}>
          <MdContentCopy size={24} />
        </CopyToClipboard>
      </div>
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
      {copied && (
        <div
          style={{
            position: "absolute",
            top: "35px",
            right: "10px",
            backgroundColor: "rgba(255, 255, 255, 0.9)",
            padding: "5px",
            borderRadius: "5px",
            boxShadow: "0 0 5px rgba(0, 0, 0, 0.3)",
            zIndex: 1,
          }}
        >
          Copied!
        </div>
      )}
    </div>
  );
};

export default IframeModule;
