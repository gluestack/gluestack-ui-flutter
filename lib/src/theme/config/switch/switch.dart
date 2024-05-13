const Map<String, dynamic> switchData = {
  "props": {
    "trackColor": {"false": "\$background300", "true": "\$primary600"},
    "thumbColor": "\$background0",
    "activeThumbColor": "\$background0",
    "ios_backgroundColor": "\$background300"
  },
  "borderRadius": "\$full",
  "variants": {
    "size": {
      "sm": {
        "transform": [
          {"scale": 0.75}
        ]
      },
      "md": {},
      "lg": {
        "transform": [
          {"scale": 1.25}
        ]
      }
    }
  },
  "_web": {
    ":focus": {
      "outlineWidth": 0,
      "outlineColor": "\$primary700",
      "outlineStyle": "solid",
    }
  },
  "defaultProps": {"size": "md"},
  ":disabled": {
    "_web": {
      "cursor": "pointer",
      ":disabled": {"cursor": "not-allowed"}
    },
    "opacity": 0.4,
    "trackColor": {"false": "\$background300", "true": "\$primary600"},
    "ios_backgroundColor": "\$background300",
    ":hover": {
      "props": {
        "trackColor": {"false": "\$background300", "true": "\$primary600"}
      }
    }
  },
  ":invalid": {
    "borderColor": "\$error700",
    "borderRadius": 12,
    "borderWidth": 2
  },
  ":hover": {
    "props": {
      "trackColor": {"false": "\$background400", "true": "\$primary700"},
      "ios_backgroundColor": "\$background400"
    },
    ":invalid": {
      "props": {
        "trackColor": {"false": "\$background300", "true": "\$primary700"}
      }
    }
  },
  ":checked": {
    "props": {"thumbColor": "\$background0"}
  },
};
