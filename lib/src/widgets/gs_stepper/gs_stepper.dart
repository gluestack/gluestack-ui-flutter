import 'package:gluestack_ui/src/provider/provider.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_stepper/gs_stepper_style.dart';

import 'gs_stepper_subtitle_text_style.dart';
import 'gs_stepper_content_text_style.dart';
import 'gs_stepper_title_text_style.dart';

const Duration kThemeAnimationDuration = Duration(milliseconds: 200);

enum GSStepState {
  /// A step that displays its index in its circle.
  indexed,

  /// A step that displays a pencil icon in its circle.
  editing,

  /// A step that displays a tick icon in its circle.
  complete,

  /// A step that is disabled and does not to react to taps.
  disabled,

  /// A step that is inactive .
  inactive,

  /// A step that is currently having an error. e.g. the user has submitted wrong input.
  error,
}

@immutable
class ControlsStepperDetails {
  const ControlsStepperDetails({
    required this.currentStep,
    required this.stepIndex,
    this.onStepCancel,
    this.onStepContinue,
  });

  /// Index that is active for the  [GSStepper] widget.
  final int currentStep;

  final int stepIndex;

  /// The callback called when the 'continue' button is tapped.
  ///
  /// If null, the 'continue' button will be disabled.
  final VoidCallback? onStepContinue;

  /// The callback called when the 'cancel' button is tapped.
  ///
  /// If null, the 'cancel' button will be disabled.
  final VoidCallback? onStepCancel;

  bool get isActive => currentStep == stepIndex;
}

typedef ControlsStepperWidgetBuilder = Widget Function(
    BuildContext context, ControlsStepperDetails details);

typedef StepIconBuilder = Widget? Function(
    int stepIndex, GSStepState gsStepState);

const double _kStepSize = 24.0;
const double _kTriangleHeight = _kStepSize * 0.866025;

@immutable
class GSStep {
  const GSStep({
    required this.title,
    this.subtitle,
    required this.content,
    this.state = GSStepState.indexed,
    this.isActive = false,
    this.label,
  });

  final Widget title;

  final Widget? subtitle;

  final Widget content;

  /// The state of the step which determines the styling of its components
  /// and whether steps are interactive.
  final GSStepState state;

  /// Whether or not the step is active. The flag only influences styling.
  final bool isActive;

  final Widget? label;
}

class GSStepper extends StatefulWidget {
  const GSStepper({
    super.key,
    this.style,
    required this.steps,
    this.controller,
    this.physics,
    this.currentStep = 0,
    this.onStepTapped,
    this.onStepContinue,
    this.onStepCancel,
    this.controlsBuilder,
    this.margin,
    this.connectorThickness,
    this.stepIconBuilder,
    this.size,
    this.circleColor,
    this.connectorLineColor,
    this.keepAllContentAlive = false,
  }) : assert(0 <= currentStep && currentStep < steps.length);

  final GSStyle? style;
  final GSStepperSizes? size;
  final Color? circleColor;
  final Color? connectorLineColor;
  final bool? keepAllContentAlive;
  final List<GSStep> steps;
  final ScrollPhysics? physics;
  final ScrollController? controller;
  final int currentStep;
  final ValueChanged<int>? onStepTapped;
  final VoidCallback? onStepContinue;
  final VoidCallback? onStepCancel;
  final ControlsStepperWidgetBuilder? controlsBuilder;

  /// Custom margin on vertical GSStepper.
  final EdgeInsetsGeometry? margin;

  /// The thickness of the connecting lines.
  final double? connectorThickness;

  /// Callback for creating custom icons for the [steps].
  ///
  /// When overriding icon for [StepTestState.error], please return
  /// a widget whose width and height are 14 pixels or less to avoid overflow.
  ///
  /// If null, the default icons will be used for respective [StepTestState].
  final StepIconBuilder? stepIconBuilder;

  @override
  State<GSStepper> createState() => _GSStepperState();
}

class _GSStepperState extends State<GSStepper> with TickerProviderStateMixin {
  late List<GlobalKey> _keys;
  final Map<int, GSStepState> _oldStates = <int, GSStepState>{};

  @override
  void initState() {
    super.initState();
    _keys = List<GlobalKey>.generate(
      widget.steps.length,
      (int i) => GlobalKey(),
    );

    for (int i = 0; i < widget.steps.length; i += 1) {
      _oldStates[i] = widget.steps[i].state;
    }
  }

  @override
  void didUpdateWidget(GSStepper oldWidget) {
    super.didUpdateWidget(oldWidget);
    assert(widget.steps.length == oldWidget.steps.length);

    for (int i = 0; i < oldWidget.steps.length; i += 1) {
      _oldStates[i] = oldWidget.steps[i].state;
    }
  }

  bool _isFirst(int index) {
    return index == 0;
  }

  bool _isLast(int index) {
    return widget.steps.length - 1 == index;
  }

  bool _isCurrent(int index) {
    return widget.currentStep == index;
  }

  Color generateInactiveColor(Color color) {
    return color.withOpacity(0.5);
  }

  Widget _buildLine(bool visible, bool isActive, Color connectorLineColor) {
    return Container(
      width: visible ? widget.connectorThickness ?? 1.0 : 0.0,
      height: 10.0,
      color: connectorLineColor,
    );
  }

  Widget _buildCircleChild(
      {required int index, required bool oldState, required Color iconColor}) {
    final GSStepState state =
        oldState ? _oldStates[index]! : widget.steps[index].state;
    final Widget? icon = widget.stepIconBuilder?.call(index, state);
    if (icon != null) {
      return icon;
    }
    switch (state) {
      case GSStepState.indexed:
      case GSStepState.inactive:
      case GSStepState.disabled:
        return GSText(
          text: '${index + 1}',
          style: GSStyle(textStyle: TextStyle(color: iconColor)),
        );

      case GSStepState.editing:
        return GSIcon(
          style: GSStyle(color: iconColor),
          icon: const IconData(
            0x270E,
          ),
        );

      case GSStepState.complete:
        return GSIcon(
            style: GSStyle(color: iconColor),
            icon: const IconData(
              0xe5cb,
            ));

      case GSStepState.error:
        return GSText(
          text: '!',
          style: GSStyle(textStyle: TextStyle(color: iconColor)),
        );
    }
  }

  Widget _buildCircle(
      {required int index,
      required bool oldState,
      required Color circleColor,
      required Color iconColor}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      width: _kStepSize,
      height: _kStepSize,
      child: AnimatedContainer(
        curve: Curves.fastOutSlowIn,
        duration: kThemeAnimationDuration,
        decoration: BoxDecoration(
          color: circleColor,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: _buildCircleChild(
              index: index,
              oldState:
                  oldState && widget.steps[index].state == GSStepState.error,
              iconColor: iconColor),
        ),
      ),
    );
  }

  Widget _buildTriangle({
    required int index,
    required bool oldState,
    required Color iconColor,
    required Color errorColor,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      width: _kStepSize,
      height: _kStepSize,
      child: Center(
        child: SizedBox(
          width: _kStepSize,
          height: _kTriangleHeight,
          child: CustomPaint(
            painter: _TrianglePainter(
              color: errorColor,
            ),
            child: Align(
              alignment: const Alignment(0.0, 0.8),
              child: _buildCircleChild(
                  index: index,
                  oldState: oldState &&
                      widget.steps[index].state != GSStepState.error,
                  iconColor: iconColor),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIcon(
      {required int index,
      required Color circleColor,
      required Color inactiveCircleColor,
      required Color iconColor,
      required Color errorColor}) {
    if (widget.steps[index].state != _oldStates[index]) {
      return AnimatedCrossFade(
        firstChild: _buildCircle(
            index: index,
            oldState: true,
            circleColor: circleColor,
            iconColor: iconColor),
        secondChild: _buildTriangle(
            index: index,
            oldState: true,
            iconColor: iconColor,
            errorColor: errorColor),
        firstCurve: const Interval(0.0, 0.6, curve: Curves.fastOutSlowIn),
        secondCurve: const Interval(0.4, 1.0, curve: Curves.fastOutSlowIn),
        sizeCurve: Curves.fastOutSlowIn,
        crossFadeState: widget.steps[index].state == GSStepState.error
            ? CrossFadeState.showSecond
            : CrossFadeState.showFirst,
        duration: kThemeAnimationDuration,
      );
    } else {
      if (widget.steps[index].state == GSStepState.inactive ||
          widget.steps[index].state == GSStepState.disabled) {
        return _buildCircle(
            index: index,
            oldState: false,
            circleColor: inactiveCircleColor,
            iconColor: iconColor);
      }
      if (widget.steps[index].state != GSStepState.error) {
        return _buildCircle(
            index: index,
            oldState: false,
            circleColor: circleColor,
            iconColor: iconColor);
      } else {
        return _buildTriangle(
            index: index,
            oldState: false,
            iconColor: iconColor,
            errorColor: errorColor);
      }
    }
  }

  Widget _buildVerticalControls(int stepIndex) {
    if (widget.controlsBuilder != null) {
      return widget.controlsBuilder!(
        context,
        ControlsStepperDetails(
          currentStep: widget.currentStep,
          onStepContinue: widget.onStepContinue,
          onStepCancel: widget.onStepCancel,
          stepIndex: stepIndex,
        ),
      );
    }

    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: ConstrainedBox(
        constraints: const BoxConstraints.tightFor(height: 10.0),

        //Set line height
      ),
    );
  }

  TextStyle _titleStyle(
    int index,
    TextStyle? titleTextStyle,
    Color disabledTextColor,
    Color? errorTextColor,
  ) {
    switch (widget.steps[index].state) {
      case GSStepState.indexed:
        return titleTextStyle!;
      case GSStepState.editing:
        return titleTextStyle!;
      case GSStepState.complete:
        return titleTextStyle!;
      case GSStepState.disabled:
        return titleTextStyle?.copyWith(
              color: disabledTextColor,
            ) ??
            TextStyle(color: disabledTextColor);
      case GSStepState.error:
        return titleTextStyle!.copyWith(
          color: errorTextColor,
        );

      case GSStepState.inactive:
        return titleTextStyle?.copyWith(
              color: disabledTextColor,
            ) ??
            TextStyle(color: disabledTextColor);
    }
  }

  TextStyle _subtitleStyle(int index, TextStyle? subtitleTextStyle,
      Color? disabledTextColor, Color? errorTextColor) {
    switch (widget.steps[index].state) {
      case GSStepState.indexed:
      case GSStepState.editing:
      case GSStepState.complete:
        return subtitleTextStyle!;
      case GSStepState.disabled:
        return subtitleTextStyle!.copyWith(
          color: disabledTextColor,
        );

      case GSStepState.inactive:
        return subtitleTextStyle!.copyWith(
          color: disabledTextColor,
        );
      case GSStepState.error:
        return subtitleTextStyle!.copyWith(
          color: errorTextColor,
        );
    }
  }

  TextStyle _contentStyle(int index, TextStyle? contentTextStyle,
      Color? disabledTextColor, Color? errorTextColor) {
    switch (widget.steps[index].state) {
      case GSStepState.indexed:
      case GSStepState.editing:
      case GSStepState.complete:
        return contentTextStyle!;
      case GSStepState.disabled:
        return contentTextStyle!.copyWith(
          color: disabledTextColor,
        );

      case GSStepState.inactive:
        return contentTextStyle!.copyWith(
          color: disabledTextColor,
        );
      case GSStepState.error:
        return contentTextStyle!.copyWith(
          color: errorTextColor,
        );
    }
  }

  Widget _buildHeaderText({
    required int index,
    TextStyle? titleTextStyle,
    TextStyle? subtitleTextStyle,
    Color? disabledTextColor,
    Color? errorTextColor,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        AnimatedDefaultTextStyle(
          style: _titleStyle(
              index, titleTextStyle, disabledTextColor!, errorTextColor!),
          duration: kThemeAnimationDuration,
          curve: Curves.fastOutSlowIn,
          child: widget.steps[index].title,
        ),
        if (widget.steps[index].subtitle != null)
          Container(
            margin: const EdgeInsets.only(top: 2.0),
            child: AnimatedDefaultTextStyle(
              style: _subtitleStyle(
                  index, subtitleTextStyle, disabledTextColor, errorTextColor),
              duration: kThemeAnimationDuration,
              curve: Curves.fastOutSlowIn,
              child: widget.steps[index].subtitle!,
            ),
          ),
      ],
    );
  }

  Widget _buildVerticalBody(
      int index,
      TextStyle? contentTextStyle,
      Color? connectorLineColor,
      Color? disabledTextColor,
      Color? errorTextColor) {
    return Stack(
      children: <Widget>[
        PositionedDirectional(
          start: 24.0,
          top: 0.0,
          bottom: 0.0,
          child: SizedBox(
            width: 24.0,
            child: Center(
              child: SizedBox(
                width: widget.connectorThickness ?? 1.0,
                child: Container(color: connectorLineColor),
              ),
            ),
          ),
        ),
        widget.keepAllContentAlive ?? false
            ? Container(
                margin: widget.margin ??
                    const EdgeInsetsDirectional.only(
                      start: 60.0,
                      end: 24.0,
                      bottom: 24.0,
                    ),
                child: Column(
                  children: <Widget>[
                    AnimatedDefaultTextStyle(
                        style: _contentStyle(index, contentTextStyle,
                            disabledTextColor, errorTextColor),
                        duration: kThemeAnimationDuration,
                        curve: Curves.fastOutSlowIn,
                        child: widget.steps[index].content),
                    _buildVerticalControls(index),
                  ],
                ),
              )
            : AnimatedCrossFade(
                firstChild: Container(height: 0.0),
                secondChild: Container(
                  margin: widget.margin ??
                      const EdgeInsetsDirectional.only(
                        start: 60.0,
                        end: 24.0,
                        bottom: 24.0,
                      ),
                  child: Column(
                    children: <Widget>[
                      AnimatedDefaultTextStyle(
                          style: _contentStyle(index, contentTextStyle,
                              disabledTextColor, errorTextColor),
                          duration: kThemeAnimationDuration,
                          curve: Curves.fastOutSlowIn,
                          child: widget.steps[index].content),
                      _buildVerticalControls(index),
                    ],
                  ),
                ),
                firstCurve:
                    const Interval(0.0, 0.6, curve: Curves.fastOutSlowIn),
                secondCurve:
                    const Interval(0.4, 1.0, curve: Curves.fastOutSlowIn),
                sizeCurve: Curves.fastOutSlowIn,
                crossFadeState: _isCurrent(index)
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: kThemeAnimationDuration,
              ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final textSize = widget.size ?? gsStepperStyle.props?.size;
    final contentTextSize =
        widget.size ?? gsStepperContentTextStyle.props?.size;

    final subtitleTextSize =
        widget.size ?? gsStepperSubtitleTextStyle.props?.size;

    GSConfigStyle styler = resolveStyles(
      context: context,
      styles: [
        gsStepperStyle,
        gsStepperStyle.sizeMap(textSize?.toGSSize),
      ],
      inlineStyle: widget.style,
      isFirst: true,
    );

    // GSStyle styler = resolveStyles(
    //   context: context,
    //   styles: [
    //     gsStepperStyle,
    //     gsStepperStyle.sizeMap(textSize?.toGSSize),

    //     //  gsStepperStyle.sizeMap(textSize?.toGSSize!),
    //   ],
    //   inlineStyle: widget.style,
    //   isFirst: true,
    // );

    GSConfigStyle titleStyler = resolveStyles(
      context: context,
      styles: [
        gsStepperTitleTextStyle,
        gsStepperTitleTextStyle.sizeMap(textSize?.toGSSize),
      ],
      inlineStyle: widget.style,
      isFirst: true,
    );

    GSConfigStyle contentStyler = resolveStyles(
      context: context,
      styles: [
        gsStepperContentTextStyle,
        gsStepperContentTextStyle.sizeMap(contentTextSize?.toGSSize),
      ],
      inlineStyle: widget.style,
      isFirst: true,
    );

    GSConfigStyle subtitleStyler = resolveStyles(
      context: context,
      styles: [
        gsStepperSubtitleTextStyle,
        gsStepperSubtitleTextStyle.sizeMap(subtitleTextSize?.toGSSize),
      ],
      inlineStyle: widget.style,
      isFirst: true,
    );

    final circleColor = widget.circleColor ?? styler.color?.getColor(context);
    final iconColor = styler.iconColor?.getColor(context);
    final connectorLineColor =
        widget.connectorLineColor ?? styler.bg?.getColor(context);
    final inactiveCircleColor = generateInactiveColor(circleColor!);

    return GSAncestor(
      decedentStyles: styler.descendantStyles,
      child: ListView(
        controller: widget.controller,
        shrinkWrap: true,
        physics: widget.physics,
        children: <Widget>[
          for (int i = 0; i < widget.steps.length; i += 1)
            Column(
              key: _keys[i],
              children: <Widget>[
                // VerticalHeader
                GestureDetector(
                  onTap: widget.steps[i].state != GSStepState.disabled
                      ? () {
                          Scrollable.ensureVisible(
                            _keys[i].currentContext!,
                            curve: Curves.fastOutSlowIn,
                            duration: kThemeAnimationDuration,
                          );

                          widget.onStepTapped?.call(i);
                        }
                      : null,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Row(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            _buildLine(!_isFirst(i), widget.steps[i].isActive,
                                connectorLineColor!),
                            _buildIcon(
                                index: i,
                                circleColor: circleColor,
                                inactiveCircleColor: inactiveCircleColor,
                                iconColor: iconColor!,
                                errorColor:
                                    styler.onInvalid!.textStyle!.color!),
                            _buildLine(!_isLast(i), widget.steps[i].isActive,
                                connectorLineColor),
                          ],
                        ),
                        Expanded(
                          child: Container(
                            margin:
                                const EdgeInsetsDirectional.only(start: 12.0),
                            child: _buildHeaderText(
                              index: i,
                              titleTextStyle: titleStyler.textStyle,
                              subtitleTextStyle: subtitleStyler.textStyle,
                              disabledTextColor:
                                  styler.onDisabled?.textStyle?.color,
                              errorTextColor:
                                  styler.onInvalid?.textStyle?.color,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                //Vertical Body
                _buildVerticalBody(
                  i,
                  contentStyler.textStyle,
                  connectorLineColor,
                  styler.onDisabled?.textStyle?.color,
                  styler.onInvalid?.textStyle?.color,
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class _TrianglePainter extends CustomPainter {
  _TrianglePainter({
    required this.color,
  });

  final Color color;

  @override
  bool hitTest(Offset point) => true;

  @override
  bool shouldRepaint(_TrianglePainter oldPainter) {
    return oldPainter.color != color;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final double base = size.width;
    final double halfBase = size.width / 2.0;
    final double height = size.height;
    final List<Offset> points = <Offset>[
      Offset(0.0, height),
      Offset(base, height),
      Offset(halfBase, 0.0),
    ];

    canvas.drawPath(
      Path()..addPolygon(points, true),
      Paint()..color = color,
    );
  }
}
