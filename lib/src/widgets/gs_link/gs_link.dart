import 'package:flutter/widgets.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:url_launcher/url_launcher_string.dart';

/// A widget for creating clickable links within the application.
class GSLink extends StatelessWidget {
  /// The URL that the link points to. This can be a route within the app or an external website.
  final String url;

  /// Custom [GSStyle] to apply to the link, enabling detailed customization of its appearance.
  final GSStyle? style;

  /// The widget that displays the link's text or content. This can be any widget, but typically
  /// it is a text widget that users recognize as a clickable link.
  final Widget text;

  /// Determines whether the link is for an external website. When `true`, clicking the link
  /// will open the URL in a new browser tab or window. Defaults to `false`.
  final bool isExternal;

  /// Indicates whether the link is currently being hovered over. This can be used to change
  /// the appearance of the link on hover, providing visual feedback to the user. Defaults to `false`.
  final bool isHovered;
  const GSLink({
    super.key,
    required this.url,
    required this.text,
    this.style,
    this.isExternal = false,
    this.isHovered = false,
  });

  @override
  Widget build(BuildContext context) {
    // Resolve the final GSStyle.
    final styler = resolveStyles(
      context: context,
      inlineStyle: style,
      isFirst: true,
    );

    return GSAncestor(
      decedentStyles: styler.descendantStyles,
      child: GSFocusableActionDetector(
        // Use hover state to provide visual feedback, if applicable.
        isHovered: isHovered,
        child: GsGestureDetector(
          onPressed: () async {
            // Attempt to launch the URL. If it's an external link, open it in a new tab or window.
            if (await canLaunchUrlString(url)) {
              await launchUrlString(url,
                  webOnlyWindowName: isExternal ? '_blank' : '_self');
            }
          },
          child: text, // Display the link's content.
        ),
      ),
    );
  }
}
