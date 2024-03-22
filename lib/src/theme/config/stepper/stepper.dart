const Map<String, dynamic> stepperData = {
  "color": "\$violet800",
  'bg': '\$backgroundDark900',
  '_dark': {
    'color': '\$violet600',
    'bg': '\$backgroundLight800',
  },
  "_icon": {
    "color": "\$textLight900",
    "_dark": {"color": "\$textDark50"}
  },
  "_titleText": {
    "color": "\$textLight900",
    "_dark": {"color": "\$textDark50"}
  },
  "_subtitleText": {
    "color": "\$textLight900",
    "_dark": {"color": "\$textDark50"}
  },
  "_contentText": {
    "color": "\$textLight700",
    "_dark": {"color": "\$textDark50"}
  },
  "variants": {
    "size": {
      "sm": {
        "_titleText": {
          "fontSize": "\$sm",
          "fontFamily": "\$body",
          "fontWeight": "\$bold",
          "lineHeight": "\$sm"
        },
        "_subtitleText": {
          "fontSize": "\$2xs",
          "fontFamily": "\$body",
          "fontWeight": "\$normal",
          "lineHeight": "\$2xs"
        },
        "_contentText": {
          "fontSize": "\$sm",
          "fontFamily": "\$body",
          "fontWeight": "\$normal",
          "lineHeight": "\$sm"
        }
      },
      "md": {
        "_titleText": {
          "fontSize": "\$md",
          "fontFamily": "\$body",
          "fontWeight": "\$bold",
          "lineHeight": "\$md"
        },
        "_subtitleText": {
          "fontSize": "\$xs",
          "fontFamily": "\$body",
          "fontWeight": "\$normal",
          "lineHeight": "\$xs"
        },
        "_contentText": {
          "fontSize": "\$md",
          "fontFamily": "\$body",
          "fontWeight": "\$normal",
          "lineHeight": "\$md"
        }
      },
      "lg": {
        "_titleText": {
          "fontSize": "\$lg",
          "fontFamily": "\$body",
          "fontWeight": "\$bold",
          "lineHeight": "\$lg"
        },
        "_subtitleText": {
          "fontSize": "\$sm",
          "fontFamily": "\$body",
          "fontWeight": "\$normal",
          "lineHeight": "\$sm"
        },
        "_contentText": {
          "fontSize": "\$lg",
          "fontFamily": "\$body",
          "fontWeight": "\$normal",
          "lineHeight": "\$lg"
        }
      }
    },
  },
  "defaultProps": {
    "theme": "light",
    "size": "sm",
  }
};
