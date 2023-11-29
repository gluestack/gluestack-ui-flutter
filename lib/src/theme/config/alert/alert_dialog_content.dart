const Map<String, dynamic> alertDialogContentData = {
  'bg': '\$backgroundLight50',
  'rounded': '\$lg',
  'overflow': 'hidden',
  ':initial': {
    'scale': 0.9,
    'opacity': 0,
  },
  ':animate': {
    'scale': 1,
    'opacity': 1,
  },
  ':exit': {
    'scale': 0.9,
    'opacity': 0,
  },
  ':transition': {
    'type': 'spring',
    'damping': 18,
    'stiffness': 250,
    'opacity': {
      'type': 'timing',
      'duration': 250,
    },
  },
  '_dark': {
    'bg': '\$backgroundDark900',
  },
  'props': {
    'softShadow': '3',
  },
};
