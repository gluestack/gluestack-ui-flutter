import 'package:flutter/widgets.dart';

import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/token/color.dart';
import 'package:gluestack_ui/src/widgets/gs_gesture_detector/public.dart';
import 'package:gluestack_ui/src/widgets/gs_style_builder/gs_style_builder.dart';
import 'package:gluestack_ui/src/widgets/gs_style_builder/gs_style_builder_provider.dart';
import 'package:gluestack_ui/src/widgets/gs_switch/gs_switch_style.dart';
import 'package:gluestack_ui/src/utils/extension.dart';

enum GSSwitchSizes {
  $sm,
  $md,
  $lg,
}

///
/// Gluestack Switch Widget.
///
class GSSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool>? onToggle;

  final GSStyle? style;
  final GSSwitchSizes? size;
  final bool? isDisabled;

  final double trackHeight;
  final double trackWidth;
  final double switchHeight;
  final double switchWidth;
  final Duration animationDuration;
  final BoxShape switchShape;

  const GSSwitch({
    super.key,
    this.onToggle,
    this.value = false,
    this.style,
    this.size,
    this.isDisabled = false,
    this.trackHeight = 16,
    this.trackWidth = 34,
    this.switchHeight = 21,
    this.switchWidth = 21,
    this.switchShape = BoxShape.circle,
    this.animationDuration = const Duration(milliseconds: 300),
  });

  @override
  GSCustomSwitchState createState() => GSCustomSwitchState();
}

class GSCustomSwitchState extends State<GSSwitch> {
  bool _value = false;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return GSStyleBuilder(
      isDisabled: widget.isDisabled!,
      shouldIgnorePointer: widget.isDisabled!,
      child: Builder(builder: (context) {
        GSStyle styler = resolveStyles(
          context: context,
          styles: [switchStyle, switchStyle.sizeMap(widget.size?.toGSSize)],
          inlineStyle: widget.style,
          isFirst: true,
        );
        return Transform.scale(
          scale: styler.scale ?? 1,
          child: Opacity(
            opacity: GSStyleBuilderProvider.of(context)?.isDisabled ?? false
                ? styler.onDisabled?.opacity ?? 0.5
                : 1,
            child: GsGestureDetector(
              onPressed: () {
                setState(() {
                  _value = !_value;
                  widget.onToggle?.call(_value);
                });
              },
              //Parent
              child: SizedBox(
                width: widget.trackWidth + 5,
                height: widget.trackHeight +
                    (widget.switchHeight - widget.trackHeight),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    //Track
                    Container(
                      width: widget.trackWidth,
                      height: widget.trackHeight,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(99),
                        color: _value
                            ? styler.checked?.trackColorTrue ??
                                styler.trackColorTrue ??
                                $GSColors.primary600
                            : styler.trackColorFalse ?? $GSColors.blueGray400,
                      ),
                    ),
                    AnimatedPositioned(
                      duration: widget.animationDuration,
                      curve: Curves.easeInOut,
                      left: _value
                          ? widget.trackWidth - widget.switchWidth + 5
                          : 0,
                      //switch icon
                      child: Container(
                        width: widget.switchWidth,
                        height: widget.switchHeight,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _value
                              ? styler.checked?.activeThumbColor ??
                                  styler.activeThumbColor ??
                                  $GSColors.primary400
                              : styler.thumbColor ?? $GSColors.blueGray400,
                          boxShadow: [
                            BoxShadow(
                              color: $GSColors.black.withOpacity(0.1),
                              blurRadius: 5,
                              spreadRadius: 1,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
