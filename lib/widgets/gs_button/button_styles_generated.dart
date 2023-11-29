import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
//import 'package:gluestack_flutter_pro/style/base_style.dart';

GSStyle buttonStyle = GSStyle(
  borderRadius: 4.0,
  textStyle: TextStyle(
    color: Color(0xfffcfcfc),
    fontSize: 16.0,
  ),
  variants: Variants(
    variant: GSVariant(
      outline: GSStyle(
        bg: Color(0x00000000),
        dark: GSStyle(
          bg: Color(0x00000000),
          onHover: GSStyle(
            bg: Color(0xff262626),
          ),
          onActive: GSStyle(
            bg: Color(0x00000000),
          ),
        ),
        onHover: GSStyle(
          bg: Color(0xfff5f5f5),
          checked: GSStyle(
            bg: Color(0xfff5f5f5),
          ),
        ),
        onActive: GSStyle(
          bg: Color(0x00000000),
        ),
      ),
      solid: GSStyle(
        textStyle: TextStyle(
          color: Color(0xfffcfcfc),
        ),
        descendantStyles: {
          '_text': GSStyle(
            color: Color(0xfffcfcfc),
            textStyle: TextStyle(
              color: Color(0xfffcfcfc),
            ),
            onHover: GSStyle(
              color: Color(0xfffcfcfc),
            ),
            onActive: GSStyle(
              color: Color(0xfffcfcfc),
            ),
          ),
          '_spinner': GSStyle(
            props: GSProps(
              style: GSStyle(
                color: Color(0xfffcfcfc),
                textStyle: TextStyle(
                  color: Color(0xfffcfcfc),
                ),
              ),
              color: Color(0xfffcfcfc),
            ),
          ),
          '_icon': GSStyle(
            props: GSProps(
              style: GSStyle(
                color: Color(0xfffcfcfc),
                textStyle: TextStyle(
                  color: Color(0xfffcfcfc),
                ),
              ),
              color: Color(0xfffcfcfc),
            ),
          )
        },
      ),
      link: GSStyle(
        padding: EdgeInsets.zero,
      ),
    ),
    size: GSSize(
      $xs: GSStyle(
padding: EdgeInsets.fromLTRB(14.0, 0.0, 14.0, 0.0),
        height: 32.0,
        descendantStyles: {
          '_text': GSStyle(
            textStyle: TextStyle(
              fontSize: 12.0,
            ),
            props: GSProps(
              size: GSSizes.$xs,
            ),
          ),
          '_icon': GSStyle(
            textStyle: TextStyle(
              fontSize: 10.0,
            ),
            props: GSProps(
              size: GSSizes.$2xs,
            ),
          )
        },
        iconSize: 10.0,
      ),
      $sm: GSStyle(
padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
        height: 36.0,
        descendantStyles: {
          '_text': GSStyle(
            textStyle: TextStyle(
              fontSize: 14.0,
            ),
            props: GSProps(
              size: GSSizes.$sm,
            ),
          ),
          '_icon': GSStyle(
            textStyle: TextStyle(
              fontSize: 14.0,
            ),
            props: GSProps(
              size: GSSizes.$sm,
            ),
          )
        },
        iconSize: 14.0,
      ),
      $md: GSStyle(
padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
        height: 40.0,
        descendantStyles: {
          '_text': GSStyle(
            textStyle: TextStyle(
              fontSize: 16.0,
            ),
            props: GSProps(
              size: GSSizes.$md,
            ),
          ),
          '_icon': GSStyle(
            textStyle: TextStyle(
              fontSize: 16.0,
            ),
            props: GSProps(
              size: GSSizes.$md,
            ),
          )
        },
        iconSize: 16.0,
      ),
      $lg: GSStyle(
padding: EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 0.0),
        height: 44.0,
        descendantStyles: {
          '_text': GSStyle(
            textStyle: TextStyle(
              fontSize: 18.0,
            ),
            props: GSProps(
              size: GSSizes.$lg,
            ),
          ),
          '_icon': GSStyle(
            textStyle: TextStyle(
              fontSize: 16.0,
            ),
            props: GSProps(
              size: GSSizes.$md,
            ),
          )
        },
        iconSize: 16.0,
      ),
      $xl: GSStyle(
padding: EdgeInsets.fromLTRB(28.0, 0.0, 28.0, 0.0),
        height: 48.0,
        descendantStyles: {
          '_text': GSStyle(
            textStyle: TextStyle(
              fontSize: 20.0,
            ),
            props: GSProps(
              size: GSSizes.$xl,
            ),
          ),
          '_icon': GSStyle(
            textStyle: TextStyle(
              fontSize: 18.0,
            ),
            props: GSProps(
              size: GSSizes.$lg,
            ),
          )
        },
        iconSize: 18.0,
      ),
    ),
    action: GSAction(
      primary: GSStyle(
        borderColor: Color(0xff4aa9ff),
        bg: Color(0xff0077e6),
        textStyle: TextStyle(
          color: Color(0xff005db4),
        ),
        descendantStyles: {
          '_text': GSStyle(
            color: Color(0xff005db4),
            textStyle: TextStyle(
              color: Color(0xff005db4),
            ),
            onHover: GSStyle(
              color: Color(0xff005db4),
            ),
            onActive: GSStyle(
              color: Color(0xff004282),
            ),
          ),
          '_spinner': GSStyle(
            props: GSProps(
              style: GSStyle(
                color: Color(0xff005db4),
                textStyle: TextStyle(
                  color: Color(0xff005db4),
                ),
              ),
              color: Color(0xff005db4),
            ),
          ),
          '_icon': GSStyle(
            color: Color(0xff005db4),
            textStyle: TextStyle(
              color: Color(0xff005db4),
            ),
            onHover: GSStyle(
              color: Color(0xff005db4),
            ),
            onActive: GSStyle(
              color: Color(0xff004282),
            ),
          )
        },
        dark: GSStyle(
          borderColor: Color(0xff004282),
          bg: Color(0xff1a91ff),
          onHover: GSStyle(
            borderColor: Color(0xff1a91ff),
            bg: Color(0xff0077e6),
          ),
          onActive: GSStyle(
            borderColor: Color(0xff4aa9ff),
            bg: Color(0xff005db4),
          ),
        ),
        onHover: GSStyle(
          borderColor: Color(0xff1a91ff),
          bg: Color(0xff005db4),
          borderBottomColor: Color(0xff1a91ff),
          checked: GSStyle(
            borderColor: Color(0xff1a91ff),
            bg: Color(0xff005db4),
          ),
        ),
        onActive: GSStyle(
          borderColor: Color(0xff004282),
          bg: Color(0xff004282),
        ),
      ),
      secondary: GSStyle(
        borderColor: Color(0xffb0b0b0),
        bg: Color(0xff5f5f5f),
        textStyle: TextStyle(
          color: Color(0xff525252),
        ),
        descendantStyles: {
          '_text': GSStyle(
            color: Color(0xff525252),
            textStyle: TextStyle(
              color: Color(0xff525252),
            ),
            onHover: GSStyle(
              color: Color(0xff525252),
            ),
            onActive: GSStyle(
              color: Color(0xff404040),
            ),
          ),
          '_spinner': GSStyle(
            props: GSProps(
              style: GSStyle(
                color: Color(0xff525252),
                textStyle: TextStyle(
                  color: Color(0xff525252),
                ),
              ),
              color: Color(0xff525252),
            ),
          ),
          '_icon': GSStyle(
            color: Color(0xff525252),
            textStyle: TextStyle(
              color: Color(0xff525252),
            ),
            onHover: GSStyle(
              color: Color(0xff525252),
            ),
            onActive: GSStyle(
              color: Color(0xff404040),
            ),
          )
        },
        dark: GSStyle(
          borderColor: Color(0xff404040),
          bg: Color(0xff737373),
          onHover: GSStyle(
            borderColor: Color(0xff737373),
            bg: Color(0xff5f5f5f),
          ),
          onActive: GSStyle(
            borderColor: Color(0xffb0b0b0),
            bg: Color(0xff525252),
          ),
        ),
        onHover: GSStyle(
          borderColor: Color(0xff737373),
          bg: Color(0xff525252),
          borderBottomColor: Color(0xff737373),
          checked: GSStyle(
            borderColor: Color(0xff737373),
            bg: Color(0xff525252),
          ),
        ),
        onActive: GSStyle(
          borderColor: Color(0xff404040),
          bg: Color(0xff404040),
        ),
      ),
      positive: GSStyle(
        borderColor: Color(0xff66b584),
        bg: Color(0xff348352),
        textStyle: TextStyle(
          color: Color(0xff2a7948),
        ),
        descendantStyles: {
          '_text': GSStyle(
            color: Color(0xff2a7948),
            textStyle: TextStyle(
              color: Color(0xff2a7948),
            ),
            onHover: GSStyle(
              color: Color(0xff2a7948),
            ),
            onActive: GSStyle(
              color: Color(0xff206f3e),
            ),
          ),
          '_spinner': GSStyle(
            props: GSProps(
              style: GSStyle(
                color: Color(0xff2a7948),
                textStyle: TextStyle(
                  color: Color(0xff2a7948),
                ),
              ),
              color: Color(0xff2a7948),
            ),
          ),
          '_icon': GSStyle(
            color: Color(0xff2a7948),
            textStyle: TextStyle(
              color: Color(0xff2a7948),
            ),
            onHover: GSStyle(
              color: Color(0xff2a7948),
            ),
            onActive: GSStyle(
              color: Color(0xff206f3e),
            ),
          )
        },
        dark: GSStyle(
          borderColor: Color(0xff206f3e),
          bg: Color(0xff489766),
          onHover: GSStyle(
            borderColor: Color(0xff489766),
            bg: Color(0xff348352),
          ),
          onActive: GSStyle(
            borderColor: Color(0xff66b584),
            bg: Color(0xff2a7948),
          ),
        ),
        onHover: GSStyle(
          borderColor: Color(0xff489766),
          bg: Color(0xff2a7948),
          borderBottomColor: Color(0xff489766),
          checked: GSStyle(
            borderColor: Color(0xff489766),
            bg: Color(0xff2a7948),
          ),
        ),
        onActive: GSStyle(
          borderColor: Color(0xff206f3e),
          bg: Color(0xff206f3e),
        ),
      ),
      negative: GSStyle(
        borderColor: Color(0xfff87171),
        bg: Color(0xffe63535),
        textStyle: TextStyle(
          color: Color(0xffdc2626),
        ),
        descendantStyles: {
          '_text': GSStyle(
            color: Color(0xffdc2626),
            textStyle: TextStyle(
              color: Color(0xffdc2626),
            ),
            onHover: GSStyle(
              color: Color(0xffdc2626),
            ),
            onActive: GSStyle(
              color: Color(0xffb91c1c),
            ),
          ),
          '_spinner': GSStyle(
            props: GSProps(
              style: GSStyle(
                color: Color(0xffdc2626),
                textStyle: TextStyle(
                  color: Color(0xffdc2626),
                ),
              ),
              color: Color(0xffdc2626),
            ),
          ),
          '_icon': GSStyle(
            color: Color(0xffdc2626),
            textStyle: TextStyle(
              color: Color(0xffdc2626),
            ),
            onHover: GSStyle(
              color: Color(0xffdc2626),
            ),
            onActive: GSStyle(
              color: Color(0xffb91c1c),
            ),
          )
        },
        dark: GSStyle(
          borderColor: Color(0xffb91c1c),
          bg: Color(0xffef4444),
          onHover: GSStyle(
            borderColor: Color(0xffef4444),
            bg: Color(0xffe63535),
          ),
          onActive: GSStyle(
            borderColor: Color(0xfff87171),
            bg: Color(0xffdc2626),
          ),
        ),
        onHover: GSStyle(
          borderColor: Color(0xffef4444),
          bg: Color(0xffdc2626),
          borderBottomColor: Color(0xffef4444),
          checked: GSStyle(
            borderColor: Color(0xffef4444),
            bg: Color(0xffdc2626),
          ),
        ),
        onActive: GSStyle(
          borderColor: Color(0xffb91c1c),
          bg: Color(0xffb91c1c),
        ),
      ),
      defaultStyle: GSStyle(
        bg: Color(0x00000000),
        dark: GSStyle(
          bg: Color(0x00000000),
          onHover: GSStyle(
            bg: Color(0xff262626),
          ),
          onActive: GSStyle(
            bg: Color(0x00000000),
          ),
        ),
        onHover: GSStyle(
          bg: Color(0xfff5f5f5),
          checked: GSStyle(
            bg: Color(0xfff5f5f5),
          ),
        ),
        onActive: GSStyle(
          bg: Color(0x00000000),
        ),
      ),
    ),
  ),
  props: GSProps(
    action: GSActions.primary,
    variant: GSVariants.solid,
    size: GSSizes.$md,
  ),
  descendantStyles: {
    '_text': GSStyle(
      color: Color(0xfffcfcfc),
      fontWeight: FontWeight.w600,
      textStyle: TextStyle(
        color: Color(0xfffcfcfc),
        fontWeight: FontWeight.w600,
      ),
      dark: GSStyle(
        color: Color(0xfffcfcfc),
        textStyle: TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    '_spinner': GSStyle(
      props: GSProps(
        style: GSStyle(
          color: Color(0xfffcfcfc),
          textStyle: TextStyle(
            color: Color(0xfffcfcfc),
          ),
        ),
        color: Color(0xfffcfcfc),
      ),
    ),
    '_icon': GSStyle(
      color: Color(0xfffcfcfc),
      textStyle: TextStyle(
        color: Color(0xfffcfcfc),
      ),
      dark: GSStyle(
        color: Color(0xfffcfcfc),
      ),
    )
  },
  flexDirection: GSFlexDirections.row,
  alignItems: GSAlignments.center,
  justifyContent: GSAlignments.center,
  dark: GSStyle(
    textStyle: TextStyle(
      color: Color(0xfffcfcfc),
    ),
  ),
  onDisabled: GSStyle(
    opacity: 0.4,
  ),
);
GSStyle buttonTextStyle = GSStyle(
  color: Color(0xfffcfcfc),
  textStyle: TextStyle(
    color: Color(0xfffcfcfc),
  ),
);
GSStyle textStyle = GSStyle(
  color: Color(0xff525252),
  fontWeight: FontWeight.w400,
  textStyle: TextStyle(
    color: Color(0xff525252),
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.0,
  ),
  variants: Variants(
    size: GSSize(
      $xs: GSStyle(
        textStyle: TextStyle(
          fontSize: 12.0,
          height: 1.6666666666666667,
        ),
      ),
      $sm: GSStyle(
        textStyle: TextStyle(
          fontSize: 14.0,
          height: 1.4285714285714286,
        ),
      ),
      $md: GSStyle(
        textStyle: TextStyle(
          fontSize: 16.0,
          height: 1.375,
        ),
      ),
      $lg: GSStyle(
        textStyle: TextStyle(
          fontSize: 18.0,
          height: 1.5555555555555556,
        ),
      ),
      $xl: GSStyle(
        textStyle: TextStyle(
          fontSize: 20.0,
          height: 1.4,
        ),
      ),
      $2xs: GSStyle(
        textStyle: TextStyle(
          fontSize: 10.0,
          height: 1.6,
        ),
      ),
      $2xl: GSStyle(
        textStyle: TextStyle(
          fontSize: 24.0,
          height: 1.3333333333333333,
        ),
      ),
      $3xl: GSStyle(
        textStyle: TextStyle(
          fontSize: 30.0,
          height: 1.3333333333333333,
        ),
      ),
      $4xl: GSStyle(
        textStyle: TextStyle(
          fontSize: 36.0,
          height: 1.3333333333333333,
        ),
      ),
      $5xl: GSStyle(
        textStyle: TextStyle(
          fontSize: 48.0,
          height: 1.5,
        ),
      ),
      $6xl: GSStyle(
        textStyle: TextStyle(
          fontSize: 60.0,
          height: 1.5,
        ),
      ),
    ),
  ),
  props: GSProps(
    size: GSSizes.$md,
  ),
  dark: GSStyle(
    color: Color(0xffdbdbdb),
    textStyle: TextStyle(
      fontWeight: FontWeight.w400,
    ),
  ),
);
GSStyle buttonIconStyle = GSStyle(
  textStyle: TextStyle(
    fontSize: 16.0,
  ),
  props: GSProps(
    size: GSSizes.$md,
  ),
);
GSStyle buttonGroupStyle = GSStyle(
  textStyle: TextStyle(
    fontSize: 16.0,
  ),
  variants: Variants(
    space: GSSpace(
      $xs: GSStyle(
        gap: 4.0,
      ),
      $sm: GSStyle(
        gap: 8.0,
      ),
      $md: GSStyle(
        gap: 12.0,
      ),
      $lg: GSStyle(
        gap: 16.0,
      ),
      $xl: GSStyle(
        gap: 20.0,
      ),
      $2xl: GSStyle(
        gap: 24.0,
      ),
      $3xl: GSStyle(
        gap: 28.0,
      ),
      $4xl: GSStyle(
        gap: 32.0,
      ),
    ),
  ),
  props: GSProps(
    size: GSSizes.$md,
    space: GSSpaces.$sm,
  ),
);