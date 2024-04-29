import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_progress/gs_progressFilledTrack_style.dart';

class GSProgressFilledTrack extends StatelessWidget {
  final double parentWidth;
  final double value;
  final GSStyle? baseStyle;
  final Duration? animationDuration;
  const GSProgressFilledTrack(
      {super.key,
      required this.parentWidth,
      required this.value,
      this.baseStyle,
      this.animationDuration = const Duration(
        milliseconds: 300,
      )});

  @override
  Widget build(BuildContext context) {
    final ancestorStyles = GSAncestorProvider.of(context)
        ?.decedentStyles?[gsProgressFilledTrackConfig.ancestorStyle.first];
    final GSConfigStyle styler = resolveStyles(
      context: context,
      styles: [progressFilledTrackStyle, ancestorStyles],
      isFirst: true,
    );

    return AnimatedContainer(
      duration: animationDuration!,
      width: value,
      height: styler.height,
      decoration: BoxDecoration(
        color:
            baseStyle?.color ?? progressFilledTrackStyle.bg?.getColor(context),
        borderRadius: BorderRadius.circular(
            baseStyle?.borderRadius ?? styler.borderRadius ?? 0),
      ),
    );
  }
}
