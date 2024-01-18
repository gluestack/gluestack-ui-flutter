import { addParameters } from "@storybook/client-api";
import { DocsContainer } from "@storybook/addon-docs/blocks";
import { config } from "@gluestack-ui/config";
import { Center, GluestackUIProvider } from "@gluestack-ui/themed";
import { useState } from "react";
export const parameters = {
  actions: { argTypesRegex: "^on[A-Z].*" },
  controls: {
    matchers: {
      color: /(background|color)$/i,
      date: /Date$/,
    },
  },
  docs: {
    // inlineStories: false,
  },
  options: {
    storySort: {
      method: "",
      order: [
        "Overview",
        ["Introduction"],
        "Getting Started",
        ["Installation"],
        "Theme Configuration",
        [
          "Theme",
          ["Default Tokens", "Default Components"],
          "Customizing Theme",
        ],
        "Components",
        [
          "Typography",
          ["Heading", "Text"],
          "Layout",
          ["Box", "Center", "Divider", "HStack", "VStack"],
          "Feedback",
          ["Progress", "Spinner", "Toast"],
          "Data Display",
          ["Badge"],
          "Forms",
          [
            "Button",
            "Checkbox",
            "Input",
            "Link",
            "Pressable",
            "Radio",
            "Switch",
            "Textarea",
          ],
          "Overlay",
          ["AlertDialog"],
          "Media And Icons",
          ["Avatar", "Icon", "Image"],
          "Others",
          ["Fab"],
        ],
      ],
    },
  },
};

import { useDarkMode } from "../src/hooks/useDarkMode";
import { Platform } from "react-native";

export const decorators = [
  (Story) => {
    let value = false;

    if (Platform.OS === "web") {
      // eslint-disable-next-line react-hooks/rules-of-hooks
      value = useDarkMode();
    }
    const [isDark] = useState(false);

    function getColorMode() {
      //@ts-ignore
      if (Platform.OS === "web") {
        return value ? "dark" : "light";
      } else {
        return isDark ? "dark" : "light";
      }
    }
    return (
      <GluestackUIProvider
        config={config}
        // colorMode={getColorMode()}
        // components={components}
      >
        <Center>
          <Story />
        </Center>
      </GluestackUIProvider>
    );
  },
];

addParameters({
  docs: {
    container: ({ children, context }) => {
      let value = false;

      if (Platform.OS === "web") {
        // eslint-disable-next-line react-hooks/rules-of-hooks
        value = useDarkMode();
      }
      const [isDark] = useState(false);

      function getColorMode() {
        //@ts-ignore
        if (Platform.OS === "web") {
          return value ? "dark" : "light";
        } else {
          return isDark ? "dark" : "light";
        }
      }

      return (
        <DocsContainer context={context}>
          <GluestackUIProvider config={config} colorMode={getColorMode()}>
            {children}
          </GluestackUIProvider>
        </DocsContainer>
      );
    },
  },
});
