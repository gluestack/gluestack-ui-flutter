Map<String, dynamic> customButtonText = {
  'color': '\$textDark700',
  'userSelect': 'none',
};

Map<String, dynamic> customButton = {
  'bg': '\$error300',
  '_dark': {
    'bg': '\$primary800',
    'borderColor': '\$primary700',
    ':hover': {
      'bg': '\$error300',
      'borderColor': '\$primary400',
    }
  }
};

Map<String, dynamic> customButton2 = {
  'variants': {
    'action': {
      'primary': {
        '_dark': {
          'bg': '\$primary900',
          'borderColor': '\$primary700',
          ':hover': {
            'bg': '\$error400',
            'borderColor': '\$primary400',
          },
          ':active': {
            'bg': '\$primary600',
            'borderColor': '\$primary300',
          },
          
        },
      },
      ':disabled': {
        'opacity': 0.4,
      },
    },
  },
};
