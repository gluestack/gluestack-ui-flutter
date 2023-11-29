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
  props: GSProps(
    size: GSSizes.$md,
    space: GSSpaces.$sm,
  ),
);