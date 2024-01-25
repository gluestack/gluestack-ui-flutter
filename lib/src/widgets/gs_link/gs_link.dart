import 'package:flutter/widgets.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:url_launcher/url_launcher_string.dart';

class GSLink extends StatelessWidget {
  final String url;
  final GSStyle? style;
  final Widget text;
  final bool isExternal;
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
    final styler = resolveStyles(
      context: context,
      inlineStyle: style,
      isFirst: true,
    );

    return GSAncestor(
      decedentStyles: styler.descendantStyles,
      child: GSFocusableActionDetector(
        isHovered: isHovered,
        child: GSAccessibilityHandler(
          onPressed: () async {
            if (await canLaunchUrlString(url)) {
              await launchUrlString(url,
                  webOnlyWindowName: isExternal ? '_blank' : '_self');
            }
          },
          child: text,
        ),
      ),
    );
  }
}
