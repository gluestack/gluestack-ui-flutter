const Map<String, dynamic> textData = {
  'color': '\$text700',
  'fontWeight': '\$normal',
  'fontFamily': '\$body',
  'fontStyle': 'normal',
  'letterSpacing': '\$md',
  'variants': {
    'isTruncated': {
      true: {
        'props': {
          'numberOfLines': 1,
          'ellipsizeMode': 'tail',
        },
      },
    },
    'bold': {
      true: {
        'fontWeight': '\$bold',
      },
    },
    'underline': {
      true: {
        'textDecorationLine': 'underline',
      },
    },
    'strikeThrough': {
      true: {
        'textDecorationLine': 'line-through',
      },
    },
    'sub': {
      true: {
        'fontSize': '\$xs',
      },
    },
    'italic': {
      true: {
        'fontStyle': 'italic',
      },
    },
    'highlight': {
      true: {
        'bg': '\$yellow500',
      },
    },
    'size': {
      '2xs': {
        'fontSize': '\$2xs',
      },
      'xs': {
        'fontSize': '\$xs',
      },
      'sm': {
        'fontSize': '\$sm',
      },
      'md': {
        'fontSize': '\$md',
      },
      'lg': {
        'fontSize': '\$lg',
      },
      'xl': {
        'fontSize': '\$xl',
      },
      '2xl': {
        'fontSize': '\$2xl',
      },
      '3xl': {
        'fontSize': '\$3xl',
      },
      '4xl': {
        'fontSize': '\$4xl',
      },
      '5xl': {
        'fontSize': '\$5xl',
      },
      '6xl': {
        'fontSize': '\$6xl',
      },
    },
  },
  'props': {
    'size': 'md',
  },
};
