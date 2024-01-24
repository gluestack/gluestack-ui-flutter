import 'package:flutter/widgets.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/token/public.dart';
import 'package:gluestack_ui/src/utils/extension.dart';
import 'package:gluestack_ui/src/widgets/gs_progress/gs_progress_style.dart';

enum GSProgressSizes {
  $xs,
  $sm,
  $md,
  $lg,
  $xl,
  $2xl,
}

class GSProgress extends StatefulWidget {
  final GSStyle? style;
  final GSProgressSizes? size;
  /// Ranges from 0 to 1
  final double? value;
  final String? semanticsLabel;
  final String? semanticsValue;
  const GSProgress({
    super.key,
    this.style,
    this.size,
    this.value = 0,
    this.semanticsLabel,
    this.semanticsValue,
  });

  @override
  State<GSProgress> createState() => _GSProgressState();
}

class _GSProgressState extends State<GSProgress> {
  static const fallBackValue = 200.0;
  double parentWidth = fallBackValue;
  final widgetKey = GlobalKey();

  void updateWidth() {
    parentWidth = widgetKey.currentContext!.size?.width ?? -0;
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => updateWidth());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final progressSize = widget.size?.toGSSize ?? progressStyle.props?.size;
    GSStyle styler = resolveStyles(
      context: context,
      styles: [progressStyle, progressStyle.sizeMap(progressSize)],
      inlineStyle: widget.style,
      isFirst: true,
    );

    final progressColor = styler.bg ?? progressStyle.bg;
    final valueColor = styler.progressValueColor ?? $GSColors.primary500;
    final borderRadius = styler.borderRadius ?? progressStyle.borderRadius;

    return Semantics(
      label: widget.semanticsLabel,
      value: widget.semanticsValue,
      child: SizedBox(
        width: styler.width ?? fallBackValue,
        child: Stack(
          children: [
            Container(
              key: widgetKey,
              decoration: BoxDecoration(
                color: progressColor,
                borderRadius: BorderRadius.circular(borderRadius!),
              ),
              height: styler.height,
              width: styler.width ?? fallBackValue,
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: styler.width != double.infinity && styler.width != null
                  ? styler.width! * widget.value!
                  : parentWidth * widget.value!,
              height: styler.height,
              decoration: BoxDecoration(
                color: valueColor,
                borderRadius: BorderRadius.circular(borderRadius),
              ),
            )
          ],
        ),
      ),
    );
  }
}
