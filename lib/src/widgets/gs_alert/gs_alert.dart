import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_alert/gs_alert_provider.dart';
import 'package:gluestack_ui/src/widgets/gs_alert/gs_alert_style.dart';

class GSAlert extends StatefulWidget {
  final GSStyle? style;
  final GSAlertText description;
  final GSAlertBoxVariants? variant;
  final GSAlertBoxActions? action;
  final GSAlertBoxIcon? icon;
  const GSAlert(
      {super.key,
      this.style,
      required this.description,
      this.variant,
      this.action,
      this.icon});

  @override
  State<GSAlert> createState() => _GSAlertState();
}

class _GSAlertState extends State<GSAlert> {
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final alertBoxAction =
          widget.action?.toGSAction ?? alertStyle.props?.action;
      final alertBoxVariant =
          widget.variant?.toGSVariant ?? alertStyle.props?.variant;

      GSConfigStyle styler = resolveStyles(
        context: context,
        styles: [
          alertStyle,
          alertStyle.actionMap(alertBoxAction),
          alertStyle.variantMap(alertBoxVariant),
        ],
        inlineStyle: widget.style,
      );

      return GSAncestor(
        decedentStyles: styler.descendantStyles,
        child: GSAlertBoxProvider(
          fontSize: styler.textStyle?.fontSize,
          iconSize: styler.iconSize,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: styler.padding,
                decoration: BoxDecoration(
                  color: styler.bg?.getColor(context),
                  border: Border.all(
                      style: alertBoxVariant == GSVariants.outline
                          ? BorderStyle.solid
                          : BorderStyle.none,
                      color: styler.borderColor?.getColor(context) ??
                          styler.outlineColor?.getColor(context) ??
                          const Color(0x00000000) //transparent
                      ),
                  borderRadius: BorderRadius.circular(styler.borderRadius!),
                ),
                child: Row(
                  children: [
                    if (widget.icon != null) ...[
                      const SizedBox(width: 2),
                      widget.icon as Widget,
                    ],
                    const SizedBox(width: 8.0),
                    widget.description,
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
