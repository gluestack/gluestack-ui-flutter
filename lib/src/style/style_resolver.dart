import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/token/screen_breakpoint.dart';
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

GSStyle? resolveStylesDeprecated(
  BuildContext context, {
  GSStyle? variantStyle,
  GSStyle? size,
  GSStyle? inlineStyle,
  Map<String, GSStyle?>? descendantStyles,
  List<String> descendantStyleKeys = const [],
}) {
  final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

  GSStyle? temp = variantStyle != null
      ? variantStyle.merge(inlineStyle,
          descendantStyleKeys: descendantStyleKeys)
      : inlineStyle;

  temp = GSStyle(descendantStyles: descendantStyles)
      .merge(temp, descendantStyleKeys: descendantStyleKeys);

  GSStyle? currentGSStyle = size != null
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

        GSStyle? nestedStyle = resolveStylesDeprecated(context,
            inlineStyle: value, descendantStyleKeys: descendantStyleKeys);

        currentGSStyle = currentGSStyle?.merge(nestedStyle,
            descendantStyleKeys: descendantStyleKeys);
      }
      if (key == 'md' && isMediumScreen(context)) {
        currentGSStyle = currentGSStyle?.merge(value,
            descendantStyleKeys: descendantStyleKeys);

        GSStyle? nestedStyle = resolveStylesDeprecated(context,
            inlineStyle: value, descendantStyleKeys: descendantStyleKeys);
        currentGSStyle = currentGSStyle?.merge(nestedStyle,
            descendantStyleKeys: descendantStyleKeys);
      }
      if (key == 'lg' && isLargeScreen(context)) {
        currentGSStyle = currentGSStyle?.merge(value,
            descendantStyleKeys: descendantStyleKeys);
        GSStyle? nestedStyle = resolveStylesDeprecated(context,
            inlineStyle: value, descendantStyleKeys: descendantStyleKeys);
        currentGSStyle = currentGSStyle?.merge(nestedStyle,
            descendantStyleKeys: descendantStyleKeys);
      }
      if (key == 'sm' && isSmallScreen(context)) {
        currentGSStyle = currentGSStyle?.merge(value,
            descendantStyleKeys: descendantStyleKeys);

        GSStyle? nestedStyle = resolveStylesDeprecated(context,
            inlineStyle: value, descendantStyleKeys: descendantStyleKeys);
        currentGSStyle = currentGSStyle?.merge(nestedStyle,
            descendantStyleKeys: descendantStyleKeys);
      }
      if (key == 'xs' && isBaseScreen(context)) {
        currentGSStyle = currentGSStyle?.merge(value,
            descendantStyleKeys: descendantStyleKeys);
        GSStyle? nestedStyle = resolveStylesDeprecated(context,
            inlineStyle: value, descendantStyleKeys: descendantStyleKeys);
        currentGSStyle = currentGSStyle?.merge(nestedStyle,
            descendantStyleKeys: descendantStyleKeys);
      }
      if (key == 'xxl' && isExtraLargeScreen(context)) {
        currentGSStyle = currentGSStyle?.merge(value,
            descendantStyleKeys: descendantStyleKeys);
        GSStyle? nestedStyle = resolveStylesDeprecated(context,
            inlineStyle: value, descendantStyleKeys: descendantStyleKeys);
        currentGSStyle = currentGSStyle?.merge(nestedStyle,
            descendantStyleKeys: descendantStyleKeys);
      }

      if (key == 'web' && kIsWeb) {
        currentGSStyle = currentGSStyle?.merge(value,
            descendantStyleKeys: descendantStyleKeys);
        GSStyle? nestedStyle =
            resolveStylesDeprecated(context, inlineStyle: value);
        currentGSStyle = currentGSStyle?.merge(nestedStyle,
            descendantStyleKeys: descendantStyleKeys);
      }
      if (key == 'ios' && defaultTargetPlatform == TargetPlatform.iOS) {
        currentGSStyle = currentGSStyle?.merge(value,
            descendantStyleKeys: descendantStyleKeys);
        GSStyle? nestedStyle =
            resolveStylesDeprecated(context, inlineStyle: value);
        currentGSStyle = currentGSStyle?.merge(nestedStyle,
            descendantStyleKeys: descendantStyleKeys);
      }
      if (key == 'android' && defaultTargetPlatform == TargetPlatform.android) {
        currentGSStyle = currentGSStyle?.merge(value,
            descendantStyleKeys: descendantStyleKeys);
        GSStyle? nestedStyle =
            resolveStylesDeprecated(context, inlineStyle: value);
        currentGSStyle = currentGSStyle?.merge(nestedStyle,
            descendantStyleKeys: descendantStyleKeys);
      }
    }
  });

  return currentGSStyle;
}

//Refactored style, replace the above with this

GSStyle resolveStyles(
    {required BuildContext context,
    List<GSStyle?> styles = const [],
    GSStyle? inlineStyle,
    bool isFirst = false}) {
  final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
  final isHovered = GSStyleBuilderProvider.hoverStatus(context);
  final isFocused = GSStyleBuilderProvider.focusedStatus(context);

  final isActive = GSStyleBuilderProvider.activeStatus(context);
  final isDisabled = GSStyleBuilderProvider.disabledStatus(context);
  GSStyle? currentGSStyle = GSStyle();
  for (var style in styles) {
    currentGSStyle = currentGSStyle?.merge(style);
  }

  // addded this so that all the default values will be unpacked like hover ,focus etc
  if (isFirst) {
    currentGSStyle?.contextStyles.forEach((key, value) {
      if (value != null) {
        if (key == 'dark' && isDarkTheme) {
          currentGSStyle = currentGSStyle?.merge(value);
          GSStyle? nestedStyle =
              resolveStyles(context: context, inlineStyle: value);
          currentGSStyle = currentGSStyle?.merge(nestedStyle);
        }
        if (key == 'md' && isMediumScreen(context)) {
          currentGSStyle = currentGSStyle?.merge(value);

          GSStyle? nestedStyle =
              resolveStyles(context: context, inlineStyle: value);
          currentGSStyle = currentGSStyle?.merge(nestedStyle);
        }
        if (key == 'lg' && isLargeScreen(context)) {
          currentGSStyle = currentGSStyle?.merge(value);
          GSStyle? nestedStyle =
              resolveStyles(context: context, inlineStyle: value);
          currentGSStyle = currentGSStyle?.merge(nestedStyle);
        }
        if (key == 'sm' && isSmallScreen(context)) {
          currentGSStyle = currentGSStyle?.merge(value);

          GSStyle? nestedStyle =
              resolveStyles(context: context, inlineStyle: value);
          currentGSStyle = currentGSStyle?.merge(nestedStyle);
        }
        if (key == 'xs' && isBaseScreen(context)) {
          currentGSStyle = currentGSStyle?.merge(value);
          GSStyle? nestedStyle =
              resolveStyles(context: context, inlineStyle: value);
          currentGSStyle = currentGSStyle?.merge(nestedStyle);
        }

        if (key == 'web' && kIsWeb) {
          currentGSStyle = currentGSStyle?.merge(value);
          GSStyle? nestedStyle =
              resolveStyles(context: context, inlineStyle: value);
          currentGSStyle = currentGSStyle?.merge(nestedStyle);
        }
        if (key == 'ios' && defaultTargetPlatform == TargetPlatform.iOS) {
          currentGSStyle = currentGSStyle?.merge(value);
          GSStyle? nestedStyle =
              resolveStyles(context: context, inlineStyle: value);
          currentGSStyle = currentGSStyle?.merge(nestedStyle);
        }
        if (key == 'android' &&
            defaultTargetPlatform == TargetPlatform.android) {
          currentGSStyle = currentGSStyle?.merge(value);
          GSStyle? nestedStyle =
              resolveStyles(context: context, inlineStyle: value);
          currentGSStyle = currentGSStyle?.merge(nestedStyle);
        }
        if (key == 'onHover' && isHovered) {
          currentGSStyle = currentGSStyle?.merge(value);
          GSStyle? nestedStyle =
              resolveStyles(context: context, inlineStyle: value);
          currentGSStyle = currentGSStyle?.merge(nestedStyle);
        }
        if (key == 'onFocus' && isFocused) {
          currentGSStyle = currentGSStyle?.merge(value);
          GSStyle? nestedStyle =
              resolveStyles(context: context, inlineStyle: value);
          currentGSStyle = currentGSStyle?.merge(nestedStyle);
        }
        if (key == 'onActive' && isActive) {
          currentGSStyle = currentGSStyle?.merge(value);
          GSStyle? nestedStyle =
              resolveStyles(context: context, inlineStyle: value);
          currentGSStyle = currentGSStyle?.merge(nestedStyle);
        }
        if (key == 'onDisabled' && isDisabled) {
          currentGSStyle = currentGSStyle?.merge(value);
          GSStyle? nestedStyle =
              resolveStyles(context: context, inlineStyle: value);
          currentGSStyle = currentGSStyle?.merge(nestedStyle);
        }
      }
    });
  }

  currentGSStyle = currentGSStyle?.merge(inlineStyle);
  inlineStyle?.contextStyles.forEach((key, value) {
    if (value != null) {
      if (key == 'dark' && isDarkTheme) {
        currentGSStyle = currentGSStyle?.merge(value);
        GSStyle? nestedStyle =
            resolveStyles(context: context, inlineStyle: value);
        currentGSStyle = currentGSStyle?.merge(nestedStyle);
      }
      if (key == 'md' && isMediumScreen(context)) {
        currentGSStyle = currentGSStyle?.merge(value);

        GSStyle? nestedStyle =
            resolveStyles(context: context, inlineStyle: value);
        currentGSStyle = currentGSStyle?.merge(nestedStyle);
      }
      if (key == 'lg' && isLargeScreen(context)) {
        currentGSStyle = currentGSStyle?.merge(value);
        GSStyle? nestedStyle =
            resolveStyles(context: context, inlineStyle: value);
        currentGSStyle = currentGSStyle?.merge(nestedStyle);
      }
      if (key == 'sm' && isSmallScreen(context)) {
        currentGSStyle = currentGSStyle?.merge(value);
        GSStyle? nestedStyle =
            resolveStyles(context: context, inlineStyle: value);
        currentGSStyle = currentGSStyle?.merge(nestedStyle);
      }
      if (key == 'xs' && isBaseScreen(context)) {
        currentGSStyle = currentGSStyle?.merge(value);
        GSStyle? nestedStyle =
            resolveStyles(context: context, inlineStyle: value);
        currentGSStyle = currentGSStyle?.merge(nestedStyle);
      }

      if (key == 'web' && kIsWeb) {
        currentGSStyle = currentGSStyle?.merge(value);
        GSStyle? nestedStyle =
            resolveStyles(context: context, inlineStyle: value);
        currentGSStyle = currentGSStyle?.merge(nestedStyle);
      }
      if (key == 'ios' && defaultTargetPlatform == TargetPlatform.iOS) {
        currentGSStyle = currentGSStyle?.merge(value);
        GSStyle? nestedStyle =
            resolveStyles(context: context, inlineStyle: value);
        currentGSStyle = currentGSStyle?.merge(nestedStyle);
      }
      if (key == 'android' && defaultTargetPlatform == TargetPlatform.android) {
        currentGSStyle = currentGSStyle?.merge(value);
        GSStyle? nestedStyle =
            resolveStyles(context: context, inlineStyle: value);
        currentGSStyle = currentGSStyle?.merge(nestedStyle);
      }
      if (key == 'onHover' && isHovered) {
        currentGSStyle = currentGSStyle?.merge(value);
        GSStyle? nestedStyle =
            resolveStyles(context: context, inlineStyle: value);
        currentGSStyle = currentGSStyle?.merge(nestedStyle);
      }

      if (key == 'onFocus' && isFocused) {
        currentGSStyle = currentGSStyle?.merge(value);
        GSStyle? nestedStyle =
            resolveStyles(context: context, inlineStyle: value);
        currentGSStyle = currentGSStyle?.merge(nestedStyle);
      }
      if (key == 'onActive' && isActive) {
        currentGSStyle = currentGSStyle?.merge(value);
        GSStyle? nestedStyle =
            resolveStyles(context: context, inlineStyle: value);
        currentGSStyle = currentGSStyle?.merge(nestedStyle);
      }
      if (key == 'onDisabled' && isDisabled) {
        currentGSStyle = currentGSStyle?.merge(value);
        GSStyle? nestedStyle =
            resolveStyles(context: context, inlineStyle: value);
        currentGSStyle = currentGSStyle?.merge(nestedStyle);
      }
    }
  });

  return currentGSStyle!;
}
