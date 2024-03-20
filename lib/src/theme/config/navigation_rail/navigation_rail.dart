const Map<String, dynamic> navigationRailData = {
  'color': '\$purple300',
  'bg': '\$backgroundLight0',
  '_dark': {
    'bg': '\$backgroundLight800',
    'color': '\$purple300',
  },
  "_selectedIcon": {
    "color": "\$textLight900",
    "_dark": {
      "color": "\$textLight900",
    }
  },
  "_unselectedIcon": {
    "color": "\$textLight900",
    "_dark": {
      "color": "\$textDark50",
    }
  },
  "_selectedLabelText": {
    "color": "\$purple300",
    "_dark": {
      "color": "\$purple300",
    }
  },
  "_unselectedLabelText": {
    "color": "\$textLight900",
    "_dark": {
      "color": "\$textDark50",
    }
  },
  "variants": {
    "size": {
      "sm": {
        "_selectedLabelText": {
          "fontSize": "\$sm",
          "fontFamily": "\$body",
          "fontWeight": "\$normal",
          "lineHeight": "\$sm"
        },
        "_unselectedLabelText": {
          "fontSize": "\$sm",
          "fontFamily": "\$body",
          "fontWeight": "\$normal",
          "lineHeight": "\$sm"
        }
      },
      "md": {
        "_selectedLabelText": {
          "fontSize": "\$md",
          "fontFamily": "\$body",
          "fontWeight": "\$normal",
          "lineHeight": "\$md"
        },
        "_unselectedLabelText": {
          "fontSize": "\$md",
          "fontFamily": "\$body",
          "fontWeight": "\$normal",
          "lineHeight": "\$md"
        }
      },
      "lg": {
        "_selectedLabelText": {
          "fontSize": "\$lg",
          "fontFamily": "\$body",
          "fontWeight": "\$normal",
          "lineHeight": "\$lg"
        },
        "_unselectedLabelText": {
          "fontSize": "\$lg",
          "fontFamily": "\$body",
          "fontWeight": "\$normal",
          "lineHeight": "\$lg"
        }
      }
    },
    'placement': {
      'top': {
        'groupAlignment': '\$-1.0',
      },
      'bottom': {
        'groupAlignment': '\$0.0',
      },
      'center': {
        'groupAlignment': '\$1.0',
      },
    },
  },
  "defaultProps": {
    "theme": "light",
    "size": "sm",
  }
};
