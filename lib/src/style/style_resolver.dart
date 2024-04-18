import 'package:flutter/foundation.dart';
import 'package:gluestack_ui/src/provider/provider.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/widgets/gs_style_builder/gs_style_builder_provider.dart';

bool isBaseScreen(BuildContext context) {
  final screenWidth = MediaQuery.sizeOf(context).width;
  return screenWidth < $GSScreenBreakpoint.small;
}

bool isSmallScreen(BuildContext context) {
  final screenWidth = MediaQuery.sizeOf(context).width;
  return screenWidth >= $GSScreenBreakpoint.small;
}

bool isMediumScreen(BuildContext context) {
  final screenWidth = MediaQuery.sizeOf(context).width;
  return screenWidth >= $GSScreenBreakpoint.medium;
}

bool isLargeScreen(BuildContext context) {
  final screenWidth = MediaQuery.sizeOf(context).width;
  return screenWidth >= $GSScreenBreakpoint.large;
}

bool isExtraLargeScreen(BuildContext context) {
  final screenWidth = MediaQuery.sizeOf(context).width;
  return screenWidth >= $GSScreenBreakpoint.extraLarge;
}

bool isScreenSmallerThan(double size, BuildContext context) {
  final screenWidth = MediaQuery.sizeOf(context).width;
  return screenWidth <= size;
}

bool isScreenLargerThan(double size, BuildContext context) {
  final screenWidth = MediaQuery.sizeOf(context).width;
  return screenWidth >= size;
}

GSConfigStyle? resolveStylesDeprecated(
  BuildContext context, {
  GSConfigStyle? variantStyle,
  GSConfigStyle? size,
  GSConfigStyle? inlineStyle,
  Map<String, GSConfigStyle?>? descendantStyles,
  List<String> descendantStyleKeys = const [],
}) {
  final isDarkTheme = GSTheme.of(context).themeId == 'dark_theme';

  GSConfigStyle? temp = variantStyle != null
      ? variantStyle.merge(inlineStyle,
          descendantStyleKeys: descendantStyleKeys)
      : inlineStyle;

  temp = GSConfigStyle(descendantStyles: descendantStyles)
      .merge(temp, descendantStyleKeys: descendantStyleKeys);

  GSConfigStyle? currentGSStyle = size != null
      ? size.merge(temp, descendantStyleKeys: descendantStyleKeys)
      : temp;

  if (inlineStyle == null) {
    if (isDarkTheme) {
      return currentGSStyle.merge(variantStyle?.dark,
          descendantStyleKeys: descendantStyleKeys);
    }
  }
  inlineStyle?.contextStyles.forEach((key, value) {
    if (value != null) {
      if (key == 'dark' && isDarkTheme) {
        currentGSStyle = currentGSStyle?.merge(value,
            descendantStyleKeys: descendantStyleKeys);

        GSConfigStyle? nestedStyle = resolveStylesDeprecated(context,
            inlineStyle: value, descendantStyleKeys: descendantStyleKeys);

        currentGSStyle = currentGSStyle?.merge(nestedStyle,
            descendantStyleKeys: descendantStyleKeys);
      }
      if (key == 'md' && isMediumScreen(context)) {
        currentGSStyle = currentGSStyle?.merge(value,
            descendantStyleKeys: descendantStyleKeys);

        GSConfigStyle? nestedStyle = resolveStylesDeprecated(context,
            inlineStyle: value, descendantStyleKeys: descendantStyleKeys);
        currentGSStyle = currentGSStyle?.merge(nestedStyle,
            descendantStyleKeys: descendantStyleKeys);
      }
      if (key == 'lg' && isLargeScreen(context)) {
        currentGSStyle = currentGSStyle?.merge(value,
            descendantStyleKeys: descendantStyleKeys);
        GSConfigStyle? nestedStyle = resolveStylesDeprecated(context,
            inlineStyle: value, descendantStyleKeys: descendantStyleKeys);
        currentGSStyle = currentGSStyle?.merge(nestedStyle,
            descendantStyleKeys: descendantStyleKeys);
      }
      if (key == 'sm' && isSmallScreen(context)) {
        currentGSStyle = currentGSStyle?.merge(value,
            descendantStyleKeys: descendantStyleKeys);

        GSConfigStyle? nestedStyle = resolveStylesDeprecated(context,
            inlineStyle: value, descendantStyleKeys: descendantStyleKeys);
        currentGSStyle = currentGSStyle?.merge(nestedStyle,
            descendantStyleKeys: descendantStyleKeys);
      }
      if (key == 'xs' && isBaseScreen(context)) {
        currentGSStyle = currentGSStyle?.merge(value,
            descendantStyleKeys: descendantStyleKeys);
        GSConfigStyle? nestedStyle = resolveStylesDeprecated(context,
            inlineStyle: value, descendantStyleKeys: descendantStyleKeys);
        currentGSStyle = currentGSStyle?.merge(nestedStyle,
            descendantStyleKeys: descendantStyleKeys);
      }
      if (key == 'xxl' && isExtraLargeScreen(context)) {
        currentGSStyle = currentGSStyle?.merge(value,
            descendantStyleKeys: descendantStyleKeys);
        GSConfigStyle? nestedStyle = resolveStylesDeprecated(context,
            inlineStyle: value, descendantStyleKeys: descendantStyleKeys);
        currentGSStyle = currentGSStyle?.merge(nestedStyle,
            descendantStyleKeys: descendantStyleKeys);
      }

      if (key == 'web' && kIsWeb) {
        currentGSStyle = currentGSStyle?.merge(value,
            descendantStyleKeys: descendantStyleKeys);
        GSConfigStyle? nestedStyle =
            resolveStylesDeprecated(context, inlineStyle: value);
        currentGSStyle = currentGSStyle?.merge(nestedStyle,
            descendantStyleKeys: descendantStyleKeys);
      }
      if (key == 'ios' && defaultTargetPlatform == TargetPlatform.iOS) {
        currentGSStyle = currentGSStyle?.merge(value,
            descendantStyleKeys: descendantStyleKeys);
        GSConfigStyle? nestedStyle =
            resolveStylesDeprecated(context, inlineStyle: value);
        currentGSStyle = currentGSStyle?.merge(nestedStyle,
            descendantStyleKeys: descendantStyleKeys);
      }
      if (key == 'android' && defaultTargetPlatform == TargetPlatform.android) {
        currentGSStyle = currentGSStyle?.merge(value,
            descendantStyleKeys: descendantStyleKeys);
        GSConfigStyle? nestedStyle =
            resolveStylesDeprecated(context, inlineStyle: value);
        currentGSStyle = currentGSStyle?.merge(nestedStyle,
            descendantStyleKeys: descendantStyleKeys);
      }
    }
  });

  return currentGSStyle;
}

//Refactored style, replace the above with this
GSConfigStyle resolveStyles(
    {required BuildContext context,
    List<GSConfigStyle?> styles = const [],
    GSStyle? inlineStyle,
    bool isFirst = false}) {
  final isDarkTheme = GSTheme.of(context).themeId == 'dark_theme';
  final isHovered = GSStyleBuilderProvider.hoverStatus(context);
  final isFocused = GSStyleBuilderProvider.focusedStatus(context);

  final isActive = GSStyleBuilderProvider.activeStatus(context);
  final isDisabled = GSStyleBuilderProvider.disabledStatus(context);
  GSConfigStyle? currentGSStyle = GSConfigStyle();
  for (var style in styles) {
    currentGSStyle = currentGSStyle?.merge(style);
  }

  // addded this so that all the default values will be unpacked like hover ,focus etc
  if (isFirst) {
    currentGSStyle?.contextStyles.forEach((key, value) {
      if (value != null) {
        if (key == 'dark' && isDarkTheme) {
          currentGSStyle = currentGSStyle?.merge(value);
          GSConfigStyle? nestedStyle = resolveStyles(
              context: context,
              inlineStyle: GSStyle.fromGSConfigStyle(value, context));
          currentGSStyle = currentGSStyle?.merge(nestedStyle);
        }
        if (key == 'md' && isMediumScreen(context)) {
          currentGSStyle = currentGSStyle?.merge(value);

          GSConfigStyle? nestedStyle = resolveStyles(
              context: context,
              inlineStyle: GSStyle.fromGSConfigStyle(value, context));
          currentGSStyle = currentGSStyle?.merge(nestedStyle);
        }
        if (key == 'lg' && isLargeScreen(context)) {
          currentGSStyle = currentGSStyle?.merge(value);
          GSConfigStyle? nestedStyle = resolveStyles(
              context: context,
              inlineStyle: GSStyle.fromGSConfigStyle(value, context));
          currentGSStyle = currentGSStyle?.merge(nestedStyle);
        }
        if (key == 'sm' && isSmallScreen(context)) {
          currentGSStyle = currentGSStyle?.merge(value);

          GSConfigStyle? nestedStyle = resolveStyles(
              context: context,
              inlineStyle: GSStyle.fromGSConfigStyle(value, context));
          currentGSStyle = currentGSStyle?.merge(nestedStyle);
        }
        if (key == 'xs' && isBaseScreen(context)) {
          currentGSStyle = currentGSStyle?.merge(value);
          GSConfigStyle? nestedStyle = resolveStyles(
              context: context,
              inlineStyle: GSStyle.fromGSConfigStyle(value, context));
          currentGSStyle = currentGSStyle?.merge(nestedStyle);
        }

        if (key == 'web' && kIsWeb) {
          currentGSStyle = currentGSStyle?.merge(value);
          GSConfigStyle? nestedStyle = resolveStyles(
              context: context,
              inlineStyle: GSStyle.fromGSConfigStyle(value, context));
          currentGSStyle = currentGSStyle?.merge(nestedStyle);
        }
        if (key == 'ios' && defaultTargetPlatform == TargetPlatform.iOS) {
          currentGSStyle = currentGSStyle?.merge(value);
          GSConfigStyle? nestedStyle = resolveStyles(
              context: context,
              inlineStyle: GSStyle.fromGSConfigStyle(value, context));
          currentGSStyle = currentGSStyle?.merge(nestedStyle);
        }
        if (key == 'android' &&
            defaultTargetPlatform == TargetPlatform.android) {
          currentGSStyle = currentGSStyle?.merge(value);
          GSConfigStyle? nestedStyle = resolveStyles(
              context: context,
              inlineStyle: GSStyle.fromGSConfigStyle(value, context));
          currentGSStyle = currentGSStyle?.merge(nestedStyle);
        }
        if (key == 'onHover' && isHovered) {
          currentGSStyle = currentGSStyle?.merge(value);
          GSConfigStyle? nestedStyle = resolveStyles(
              context: context,
              inlineStyle: GSStyle.fromGSConfigStyle(value, context));
          currentGSStyle = currentGSStyle?.merge(nestedStyle);
        }
        if (key == 'onFocus' && isFocused) {
          currentGSStyle = currentGSStyle?.merge(value);
          GSConfigStyle? nestedStyle = resolveStyles(
              context: context,
              inlineStyle: GSStyle.fromGSConfigStyle(value, context));
          currentGSStyle = currentGSStyle?.merge(nestedStyle);
        }
        if (key == 'onActive' && isActive) {
          currentGSStyle = currentGSStyle?.merge(value);
          GSConfigStyle? nestedStyle = resolveStyles(
              context: context,
              inlineStyle: GSStyle.fromGSConfigStyle(value, context));
          currentGSStyle = currentGSStyle?.merge(nestedStyle);
        }
        if (key == 'onDisabled' && isDisabled) {
          currentGSStyle = currentGSStyle?.merge(value);
          GSConfigStyle? nestedStyle = resolveStyles(
              context: context,
              inlineStyle: GSStyle.fromGSConfigStyle(value, context));
          currentGSStyle = currentGSStyle?.merge(nestedStyle);
        }
      }
    });
  }

  inlineStyle != null
      ? currentGSStyle =
          currentGSStyle?.merge(GSConfigStyle.fromGSStyle(inlineStyle))
      : null;
  inlineStyle?.contextStyles.forEach((key, value) {
    if (value != null) {
      if (key == 'dark' && isDarkTheme) {
        currentGSStyle =
            currentGSStyle?.merge(GSConfigStyle.fromGSStyle(value));
        GSConfigStyle? nestedStyle =
            resolveStyles(context: context, inlineStyle: value);
        currentGSStyle = currentGSStyle?.merge(nestedStyle);
      }
      if (key == 'md' && isMediumScreen(context)) {
        currentGSStyle =
            currentGSStyle?.merge(GSConfigStyle.fromGSStyle(value));

        GSConfigStyle? nestedStyle =
            resolveStyles(context: context, inlineStyle: value);
        currentGSStyle = currentGSStyle?.merge(nestedStyle);
      }
      if (key == 'lg' && isLargeScreen(context)) {
        currentGSStyle =
            currentGSStyle?.merge(GSConfigStyle.fromGSStyle(value));
        GSConfigStyle? nestedStyle =
            resolveStyles(context: context, inlineStyle: value);
        currentGSStyle = currentGSStyle?.merge(nestedStyle);
      }
      if (key == 'sm' && isSmallScreen(context)) {
        currentGSStyle =
            currentGSStyle?.merge(GSConfigStyle.fromGSStyle(value));
        GSConfigStyle? nestedStyle =
            resolveStyles(context: context, inlineStyle: value);
        currentGSStyle = currentGSStyle?.merge(nestedStyle);
      }
      if (key == 'xs' && isBaseScreen(context)) {
        currentGSStyle =
            currentGSStyle?.merge(GSConfigStyle.fromGSStyle(value));
        GSConfigStyle? nestedStyle =
            resolveStyles(context: context, inlineStyle: value);
        currentGSStyle = currentGSStyle?.merge(nestedStyle);
      }

      if (key == 'web' && kIsWeb) {
        currentGSStyle =
            currentGSStyle?.merge(GSConfigStyle.fromGSStyle(value));
        GSConfigStyle? nestedStyle =
            resolveStyles(context: context, inlineStyle: value);
        currentGSStyle = currentGSStyle?.merge(nestedStyle);
      }
      if (key == 'ios' && defaultTargetPlatform == TargetPlatform.iOS) {
        currentGSStyle =
            currentGSStyle?.merge(GSConfigStyle.fromGSStyle(value));
        GSConfigStyle? nestedStyle =
            resolveStyles(context: context, inlineStyle: value);
        currentGSStyle = currentGSStyle?.merge(nestedStyle);
      }
      if (key == 'android' && defaultTargetPlatform == TargetPlatform.android) {
        currentGSStyle =
            currentGSStyle?.merge(GSConfigStyle.fromGSStyle(value));
        GSConfigStyle? nestedStyle =
            resolveStyles(context: context, inlineStyle: value);
        currentGSStyle = currentGSStyle?.merge(nestedStyle);
      }
      if (key == 'onHover' && isHovered) {
        currentGSStyle =
            currentGSStyle?.merge(GSConfigStyle.fromGSStyle(value));
        GSConfigStyle? nestedStyle =
            resolveStyles(context: context, inlineStyle: value);
        currentGSStyle = currentGSStyle?.merge(nestedStyle);
      }

      if (key == 'onFocus' && isFocused) {
        currentGSStyle =
            currentGSStyle?.merge(GSConfigStyle.fromGSStyle(value));
        GSConfigStyle? nestedStyle =
            resolveStyles(context: context, inlineStyle: value);
        currentGSStyle = currentGSStyle?.merge(nestedStyle);
      }
      if (key == 'onActive' && isActive) {
        currentGSStyle =
            currentGSStyle?.merge(GSConfigStyle.fromGSStyle(value));
        GSConfigStyle? nestedStyle =
            resolveStyles(context: context, inlineStyle: value);
        currentGSStyle = currentGSStyle?.merge(nestedStyle);
      }
      if (key == 'onDisabled' && isDisabled) {
        currentGSStyle =
            currentGSStyle?.merge(GSConfigStyle.fromGSStyle(value));
        GSConfigStyle? nestedStyle =
            resolveStyles(context: context, inlineStyle: value);
        currentGSStyle = currentGSStyle?.merge(nestedStyle);
      }
    }
  });

  return currentGSStyle!;
}

//For Actions
GSActions? mapToGSActions(dynamic action) {
  String actionName = action.toString().split('.').last;
  for (var gsAction in GSActions.values) {
    if (gsAction.toString().split('.').last == actionName) {
      return gsAction;
    }
  }
  return null;
}

//For Variants
GSVariants? mapToGSVariants(dynamic variant) {
  String variantName = variant.toString().split('.').last;

  for (var gsVariants in GSVariants.values) {
    if (gsVariants.toString().split('.').last == variantName) {
      return gsVariants;
    }
  }
  return null;
}

//For Sizes
GSSizes? mapToGSSizes(dynamic size) {
  String sizeValue = size.toString().split('.').last;
  for (var gsSize in GSSizes.values) {
    if (gsSize.toString().split('.').last == sizeValue) {
      return gsSize;
    }
  }
  return null;
}

//For Space
GSSpaces? mapToGSSpaces(dynamic input) {
  String spaceValue = input.toString().split('.').last;
  for (var gsSpace in GSSpaces.values) {
    if (gsSpace.toString().split('.').last == spaceValue) {
      return gsSpace;
    }
  }
  return null;
}

//For Radius
GSBorderRadius? mapToGSRadius(dynamic size) {
  String radiusValues = size.toString().split('.').last;
  for (var gsBorderRadius in GSBorderRadius.values) {
    if (gsBorderRadius.toString().split('.').last == radiusValues) {
      return gsBorderRadius;
    }
  }
  return null;
}

//For Placement
GSPlacements? mapToGSPlacement(dynamic placement) {
  String inputValue = placement.toString().split('.').last;
  for (var gsPlacement in GSPlacements.values) {
    if (gsPlacement.toString().split('.').last == inputValue) {
      return gsPlacement;
    }
  }
  return null;
}
