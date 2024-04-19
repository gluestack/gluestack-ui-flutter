import 'package:gluestack_ui/src/style/gs_config_style_internal.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_style_builder/gs_style_builder.dart';
import 'package:gluestack_ui/src/widgets/gs_style_builder/gs_style_builder_provider.dart';
import 'package:gluestack_ui/src/widgets/gs_switch/gs_switch_style.dart';

/// A customizable switch widget designed for the Gluestack UI framework. [GSSwitch]
/// provides an interactive toggle with customizable styles, sizes, and states.
class GSSwitch extends StatefulWidget {
  /// Determines the current value of the switch, where `true` represents the "on" state
  /// and `false` represents the "off" state.
  final bool value;

  /// Callback function that is called when the switch is toggled. It passes the new value
  /// of the switch as a parameter.
  final ValueChanged<bool>? onToggle;

  /// Custom [GSConfigStyle] to apply to the switch, enabling detailed customization of its
  /// appearance, including colors and dimensions.
  final GSStyle? style;

  /// The size of the switch, affecting its overall dimensions. This can be set to one of
  /// the predefined [GSSwitchSizes] values.
  final GSSwitchSizes? size;

  /// Indicates whether the switch is disabled. A disabled switch does not respond to
  /// input and is typically rendered in a visually distinct manner to indicate its
  /// inactive state.
  final bool? isDisabled;

  /// The height of the track that the switch thumb slides along.
  final double trackHeight;

  /// The width of the switch track.
  final double trackWidth;

  /// The height of the switch thumb.
  final double switchHeight;

  /// The width of the switch thumb.
  final double switchWidth;

  /// The shape of the switch thumb. Defaults to [BoxShape.circle], rendering the thumb
  /// as a circle.
  final BoxShape switchShape;

  /// The duration of the animation that occurs when the switch is toggled.
  final Duration animationDuration;

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
        // Resolve styles
        GSConfigStyle styler = resolveStyles(
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
                            ? styler.checked?.trackColorTrue
                                    ?.getColor(context) ??
                                styler.trackColorTrue?.getColor(context) ??
                                $GSColors.primary600
                            : styler.trackColorFalse?.getColor(context) ??
                                $GSColors.blueGray400,
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
                              ? styler.checked?.activeThumbColor
                                      ?.getColor(context) ??
                                  styler.activeThumbColor?.getColor(context) ??
                                  $GSColors.primary400
                              : styler.thumbColor?.getColor(context) ??
                                  $GSColors.blueGray400,
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
