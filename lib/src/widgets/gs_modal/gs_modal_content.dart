import 'package:gluestack_ui/src/style/gs_config_style_internal.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_modal/gs_modal_content_style.dart';

class GSModalContent extends StatelessWidget {
  final GSModalHeader? header;
  final GSModalBody? body;
  final GSModalFooter? footer;
  final GSStyle? style;
  const GSModalContent(
      {super.key, this.header, this.body, this.footer, this.style});

  @override
  Widget build(BuildContext context) {
    GSConfigStyle styler = resolveStyles(
      context: context,
      styles: [gsModalContentStyle],
      inlineStyle: style,
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(styler.borderRadius ?? 8),
        color: styler.bg?.getColor(context),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          header ?? const SizedBox(),
          body ?? const SizedBox(),
          footer ?? const SizedBox(),
        ],
      ),
    );
  }
}
