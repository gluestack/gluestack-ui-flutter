import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/style/style_resolver.dart';
import 'package:gluestack_flutter_pro/widgets/gs_ancestor/gs_ancestor.dart';
import 'package:gluestack_flutter_pro/widgets/gs_focusableActionDetector/gs_focusable_action_detector.dart';
import 'package:gluestack_flutter_pro/widgets/gs_link/gs_link_style.dart';
import 'package:url_launcher/url_launcher_string.dart';

class GSLink extends StatelessWidget {
  final String url;
  final GSStyle? style;
  final Widget text;
  const GSLink({super.key, required this.url, required this.text, this.style});

  @override
  Widget build(BuildContext context) {
    final styler = resolveStyles(context,
        descendantStyles: linkStyle.descendantStyles,
        descendantStyleKeys: gsLinkConfig.descendantStyle,
        inlineStyle: style)!;
   
    return GSAncestor(
      decedentStyles: styler.descendantStyles,
      child: GSFocusableActionDetector(
        child: InkWell(
          onTap: () async {
            if (await canLaunchUrlString(url)) {
              await launchUrlString(url);
            }
          },
          child: text,
        ),
      ),
    );
  }
}
