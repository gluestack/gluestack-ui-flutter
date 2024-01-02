import 'package:flutter/material.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_ancestor/gs_ancestor.dart';
import 'package:gluestack_ui/src/widgets/gs_focusableActionDetector/gs_focusable_action_detector.dart';
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
    final styler = resolveStyles2(
      context: context,
      inlineStyle: style,
      isFirst: true,
    );

    return GSAncestor(
      decedentStyles: styler.descendantStyles,
      child: GSFocusableActionDetector(
        isHovered: isHovered,
        child: InkWell(
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          onTap: () async {
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
