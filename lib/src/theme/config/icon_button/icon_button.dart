const Map<String, dynamic> iconButtonData = {
  'color': '\$primary300',
  'props': {
    'size': 'md',
    "_icon": {"size": "sm"},
  },
  'variants': {
    'size': {
      'sm': {
        'h': '\$5',
        'w': '\$5',
        'props': {
          'size': 16,
        },
        "_icon": {
          "props": {"size": "xs"}
        },
      },
      'md': {
        'h': '\$7',
        'w': '\$7',
        'props': {
          'size': 18,
        },
        "_icon": {
          "props": {"size": "sm"}
        },
      },
      'lg': {
        'h': '\$8',
        'w': '\$8',
        'props': {
          'size': 20,
        },
        "_icon": {
          "props": {"size": "md"}
        },
      },
    },
  },
};
