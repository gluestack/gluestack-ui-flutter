import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
//import 'package:gluestack_flutter_pro/style/base_style.dart';

GSStyle avatarStyle = GSStyle(
  borderRadius: 9999.0,
  bg: Color(0xff005db4),
  variants: Variants(
    size: GSSize(
      $xs: GSStyle(
        height: 24.0,
        width: 24.0,
        descendantStyles: {
          '_badge': GSStyle(
            height: 8.0,
            width: 8.0,
          ),
          '_text': GSStyle(
            textStyle: TextStyle(
              fontSize: 10.0,
            ),
            props: GSProps(
              size: GSSizes.$2xs,
            ),
          )
        },
        badge: GSStyle(
          height: 8.0,
          width: 8.0,
        ),
      ),
      $sm: GSStyle(
        height: 32.0,
        width: 32.0,
        descendantStyles: {
          '_badge': GSStyle(
            height: 8.0,
            width: 8.0,
          ),
          '_text': GSStyle(
            textStyle: TextStyle(
              fontSize: 12.0,
            ),
            props: GSProps(
              size: GSSizes.$xs,
            ),
          )
        },
        badge: GSStyle(
          height: 8.0,
          width: 8.0,
        ),
      ),
      $md: GSStyle(
        height: 48.0,
        width: 48.0,
        descendantStyles: {
          '_badge': GSStyle(
            height: 12.0,
            width: 12.0,
          ),
          '_text': GSStyle(
            textStyle: TextStyle(
              fontSize: 16.0,
            ),
            props: GSProps(
              size: GSSizes.$md,
            ),
          )
        },
        badge: GSStyle(
          height: 12.0,
          width: 12.0,
        ),
      ),
      $lg: GSStyle(
        height: 64.0,
        width: 64.0,
        descendantStyles: {
          '_badge': GSStyle(
            height: 16.0,
            width: 16.0,
          ),
          '_text': GSStyle(
            textStyle: TextStyle(
              fontSize: 20.0,
            ),
            props: GSProps(
              size: GSSizes.$xl,
            ),
          )
        },
        badge: GSStyle(
          height: 16.0,
          width: 16.0,
        ),
      ),
      $xl: GSStyle(
        height: 96.0,
        width: 96.0,
        descendantStyles: {
          '_badge': GSStyle(
            height: 24.0,
            width: 24.0,
          ),
          '_text': GSStyle(
            textStyle: TextStyle(
              fontSize: 30.0,
            ),
          )
        },
        badge: GSStyle(
          height: 24.0,
          width: 24.0,
        ),
      ),
      $2xl: GSStyle(
        height: 128.0,
        width: 128.0,
        descendantStyles: {
          '_badge': GSStyle(
            height: 32.0,
            width: 32.0,
          ),
          '_text': GSStyle(
            textStyle: TextStyle(
              fontSize: 48.0,
            ),
          )
        },
        badge: GSStyle(
          height: 32.0,
          width: 32.0,
        ),
      ),
    ),
  ),
  props: GSProps(
    size: GSSizes.$md,
  ),
  alignItems: GSAlignments.center,
  justifyContent: GSAlignments.center,
);
GSStyle avatarBadgeStyle = GSStyle(
  borderWidth: 2.0,
  borderColor: Color(0xffffffff),
  borderRadius: 9999.0,
  bg: Color(0xff348352),
  height: 20.0,
  width: 20.0,
);
GSStyle avatarFallBackStyle = GSStyle(
  color: Color(0xfffcfcfc),
  textStyle: TextStyle(
    color: Color(0xfffcfcfc),
    fontSize: 20.0,
    fontWeight: FontWeight.w600,
  ),
  props: GSProps(
    size: GSSizes.$xl,
  ),
  textTransform: GSTextTransform.uppercase,
  dark: GSStyle(
    textStyle: TextStyle(
      fontWeight: FontWeight.w600,
    ),
  ),
);
GSStyle avatarGroupStyle = GSStyle(
  gap: -40.0,
  flexDirection: GSFlexDirections.row,
);
GSStyle avatarImageStyle = GSStyle(
  borderRadius: 9999.0,
  height: 1.7976931348623157e+308,
  width: 1.7976931348623157e+308,
);
