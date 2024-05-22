const Map<String, dynamic> headingData = {
  "color": "\$text900",
  "letterSpacing": "\$sm",
  "fontWeight": "\$bold",
  "fontFamily": "\$heading",
  "marginVertical": 0,
  "variants": {
    "isTruncated": {
      "true": {
        "props": {"numberOfLines": 1, "ellipsizeMode": "tail"}
      }
    },
    "bold": {
      "true": {"fontWeight": "\$bold"}
    },
    "underline": {
      "true": {"textDecorationLine": "underline"}
    },
    "strikeThrough": {
      "true": {"textDecorationLine": "line-through"}
    },
    "size": {
      "5xl": {
        "props": {"as": "H1"},
        "fontSize": "\$6xl"
      },
      "4xl": {
        "props": {"as": "H1"},
        "fontSize": "\$5xl"
      },
      "3xl": {
        "props": {"as": "H1"},
        "fontSize": "\$4xl"
      },
      "2xl": {
        "props": {"as": "H2"},
        "fontSize": "\$3xl"
      },
      "xl": {
        "props": {"as": "H3"},
        "fontSize": "\$2xl"
      },
      "lg": {
        "props": {"as": "H4"},
        "fontSize": "\$xl"
      },
      "md": {
        "props": {"as": "H5"},
        "fontSize": "\$lg"
      },
      "sm": {
        "props": {"as": "H6"},
        "fontSize": "\$md"
      },
      "xs": {
        "props": {"as": "H6"},
        "fontSize": "\$sm"
      }
    },
    "sub": {
      "true": {"fontSize": "\$xs"}
    },
    "italic": {
      "true": {"fontStyle": "italic"}
    },
    "highlight": {
      "true": {"bg": "\$yellow500"}
    }
  },
  "defaultProps": {"size": "lg"}
};
