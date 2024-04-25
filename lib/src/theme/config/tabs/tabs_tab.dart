const Map<String, dynamic> tabsTabData = {
  "bg": "transparent",
  "_web": {"outlineWidth": 0},
  "variants": {
    "size": {
      "md": {
        "px": "\$4",
        "py": "\$2",
        "_text": {"fontSize": "\$md", "lineHeight": "\$md"}
      }
    }
  },
  "defaultProps": {"size": "md"},
  ":hover": {"bg": '\$backgroundDark500', "borderRadius": "\$full"},
  ":active": {"bg": '\$backgroundDark400', "borderRadius": "\$full"},
  ":focus": {"bg": '\$backgroundDark400', "borderRadius": "\$full"},
  ":disabled": {"opacity": 0.5},
  "_dark": {
    ":hover": {"bg": "\$backgroundLight500", "borderRadius": "\$full"},
    ":active": {"bg": "\$backgroundLight400", "borderRadius": "\$full"},
    ":focus": {"bg": "\$backgroundLight400", "borderRadius": "\$full"},
    ":disabled": {"opacity": 0.5}
  }
};
