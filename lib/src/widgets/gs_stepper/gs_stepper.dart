import 'package:flutter/foundation.dart';
import 'package:gluestack_ui/src/provider/provider.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_stepper/gs_stepper_style.dart';

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

  /// A step that is currently having an error. e.g. the user has submitted wrong
  /// input.
  error,
}

enum GSStepperType {
  /// A vertical layout of the steps with their content in-between the titles.
  vertical,

  /// A horizontal layout of the steps with their content below the titles.
  horizontal,
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

const TextStyle _kStepStyle = TextStyle(
  fontSize: 12.0,
  color: Color(0xFFFFFFFF),
);
const Color _kErrorLight = Color(0xFFFFCDD2);
const Color _kErrorDark = Color(0xFFD32F2F);
const Color _kCircleActiveLight = Color(0xFFFFFFFF);
const Color _kCircleActiveDark = Color(0xFF000000);
const Color _kDisabledLight = Color(0x61000000);
const Color _kDisabledDark = Color(0x61FFFFFF);
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

  /// Only [GSStepperType.horizontal], Optional widget that appears under the [title].
  /// By default, uses the `bodyLarge` theme.
  final Widget? label;
}

class GSStepper extends StatefulWidget {
  const GSStepper({
    super.key,
    this.style,
    required this.steps,
    this.controller,
    this.physics,
    this.type = GSStepperType.vertical,
    this.currentStep = 0,
    this.onStepTapped,
    this.onStepContinue,
    this.onStepCancel,
    this.controlsBuilder,
    this.margin,
    // this.connectorColor,
    this.connectorThickness,
    this.stepIconBuilder,
    this.size,
    this.circleColor,
    this.connectorLineColor,
    required this.keepAllContentOpen,
  }) : assert(0 <= currentStep && currentStep < steps.length);

  final GSStyle? style;
  final GSSizes? size;
  final Color? circleColor;
  final Color? connectorLineColor;
  final bool keepAllContentOpen;
  final List<GSStep> steps;
  final ScrollPhysics? physics;
  final ScrollController? controller;
  final GSStepperType type;
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

  bool _isDark() {
    return GSTheme.of(context).brightness == Brightness.dark;
  }

  bool _isLabel() {
    for (final GSStep step in widget.steps) {
      if (step.label != null) {
        return true;
      }
    }
    return false;
  }

  Widget _buildLine(bool visible, bool isActive, Color connectorLineColor) {
    return Container(
      width: visible ? widget.connectorThickness ?? 1.0 : 0.0,
      height: 16.0,
      color: connectorLineColor,
    );
  }

  Widget _buildCircleChild(int index, bool oldState) {
    final GSStepState state =
        oldState ? _oldStates[index]! : widget.steps[index].state;
    final bool isDarkActive = _isDark() && widget.steps[index].isActive;
    final Widget? icon = widget.stepIconBuilder?.call(index, state);
    if (icon != null) {
      return icon;
    }
    switch (state) {
      case GSStepState.indexed:
      case GSStepState.disabled:
        return Text(
          '${index + 1}',
          style: isDarkActive
              ? _kStepStyle.copyWith(color: const Color(0xDD000000))
              : _kStepStyle,
        );
      case GSStepState.editing:
        return GSIcon(
          style: GSStyle(
              iconColor:
                  isDarkActive ? _kCircleActiveDark : _kCircleActiveLight),
          icon: const IconData(
            0x270E,
          ),
        );

      case GSStepState.complete:
        return GSIcon(
            style: GSStyle(
                iconColor:
                    isDarkActive ? _kCircleActiveDark : _kCircleActiveLight),
            icon: const IconData(
              0xe5cb,
            ));

      case GSStepState.error:
        return const Text('!', style: _kStepStyle);
    }
  }

  Widget _buildCircle(int index, bool oldState, Color circleColor) {
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
          child: _buildCircleChild(index,
              oldState && widget.steps[index].state == GSStepState.error),
        ),
      ),
    );
  }

  Widget _buildTriangle(int index, bool oldState) {
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
              color: _isDark() ? _kErrorDark : _kErrorLight,
            ),
            child: Align(
              alignment: const Alignment(0.0, 0.8),
              child: _buildCircleChild(index,
                  oldState && widget.steps[index].state != GSStepState.error),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIcon(int index, Color circleColor) {
    if (widget.steps[index].state != _oldStates[index]) {
      return AnimatedCrossFade(
        firstChild: _buildCircle(index, true, circleColor),
        secondChild: _buildTriangle(index, true),
        firstCurve: const Interval(0.0, 0.6, curve: Curves.fastOutSlowIn),
        secondCurve: const Interval(0.4, 1.0, curve: Curves.fastOutSlowIn),
        sizeCurve: Curves.fastOutSlowIn,
        crossFadeState: widget.steps[index].state == GSStepState.error
            ? CrossFadeState.showSecond
            : CrossFadeState.showFirst,
        duration: kThemeAnimationDuration,
      );
    } else {
      if (widget.steps[index].state != GSStepState.error) {
        return _buildCircle(index, false, circleColor);
      } else {
        return _buildTriangle(index, false);
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

    // final Color cancelColor;
    // switch (GSTheme.of(context).brightness) {
    //   case Brightness.light:
    //     cancelColor = const Color(0x8A000000);
    //   case Brightness.dark:
    //     cancelColor = const Color(0xB3FFFFFF);
    // }

    // final GSThemeData themeData = GSTheme.of(context);

    // const OutlinedBorder buttonShape = RoundedRectangleBorder(
    //     borderRadius: BorderRadius.all(Radius.circular(2)));
    // const EdgeInsets buttonPadding = EdgeInsets.symmetric(horizontal: 16.0);

    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: ConstrainedBox(
        constraints: const BoxConstraints.tightFor(height: 38.0),
      ),
    );
  }

  TextStyle _titleStyle(int index, TextStyle? titleTextStyle) {
    switch (widget.steps[index].state) {
      case GSStepState.indexed:
      case GSStepState.editing:
      case GSStepState.complete:
        return titleTextStyle!;
      case GSStepState.disabled:
        return titleTextStyle!.copyWith(
          color: _isDark() ? _kDisabledDark : _kDisabledLight,
        );
      case GSStepState.error:
        return titleTextStyle!.copyWith(
          color: _isDark() ? _kErrorDark : _kErrorLight,
        );
    }
  }

  TextStyle _subtitleStyle(int index, TextStyle? subtitleTextStyle) {
    switch (widget.steps[index].state) {
      case GSStepState.indexed:
      case GSStepState.editing:
      case GSStepState.complete:
        return subtitleTextStyle!;
      case GSStepState.disabled:
        return subtitleTextStyle!.copyWith(
          color: _isDark() ? _kDisabledDark : _kDisabledLight,
        );
      case GSStepState.error:
        return subtitleTextStyle!.copyWith(
          color: _isDark() ? _kErrorDark : _kErrorLight,
        );
    }
  }

  TextStyle _contentStyle(int index, TextStyle? contentTextStyle) {
    switch (widget.steps[index].state) {
      case GSStepState.indexed:
      case GSStepState.editing:
      case GSStepState.complete:
        return contentTextStyle!;
      case GSStepState.disabled:
        return contentTextStyle!.copyWith(
          color: _isDark() ? _kDisabledDark : _kDisabledLight,
        );
      case GSStepState.error:
        return contentTextStyle!.copyWith(
          color: _isDark() ? _kErrorDark : _kErrorLight,
        );
    }
  }

  Widget _buildHeaderText(
      {required int index,
      TextStyle? titleTextStyle,
      TextStyle? subtitleTextStyle}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        AnimatedDefaultTextStyle(
          style: _titleStyle(index, titleTextStyle),
          duration: kThemeAnimationDuration,
          curve: Curves.fastOutSlowIn,
          child: widget.steps[index].title,
        ),
        if (widget.steps[index].subtitle != null)
          Container(
            margin: const EdgeInsets.only(top: 2.0),
            child: AnimatedDefaultTextStyle(
              style: _subtitleStyle(index, subtitleTextStyle),
              duration: kThemeAnimationDuration,
              curve: Curves.fastOutSlowIn,
              child: widget.steps[index].subtitle!,
            ),
          ),
      ],
    );
  }

  Widget _buildLabelText(int index) {
    if (widget.steps[index].label != null) {
      return AnimatedDefaultTextStyle(
        style: const TextStyle(color: _kDisabledDark
            // color: _isDark() ? _kDisabledDark : _kDisabledLight,
            ),
        duration: kThemeAnimationDuration,
        child: widget.steps[index].label!,
      );
    }
    return const SizedBox.shrink();
  }

  Widget _buildVerticalHeader({
    required int index,
    TextStyle? titleTextStyle,
    TextStyle? subtitleTextStyle,
    Color? circleColor,
    Color? connectorLineColor,
  }) {
    final bool isActive = widget.steps[index].isActive;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              _buildLine(!_isFirst(index), isActive, connectorLineColor!),
              _buildIcon(index, circleColor!),
              _buildLine(!_isLast(index), isActive, connectorLineColor),
            ],
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsetsDirectional.only(start: 12.0),
              child: _buildHeaderText(
                  index: index,
                  titleTextStyle: titleTextStyle,
                  subtitleTextStyle: subtitleTextStyle),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVerticalBody(
      int index, TextStyle? contentTextStyle, Color? connectorLineColor) {
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
        AnimatedCrossFade(
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
                    style: _contentStyle(index, contentTextStyle),
                    duration: kThemeAnimationDuration,
                    curve: Curves.fastOutSlowIn,
                    child: widget.steps[index].content),
                _buildVerticalControls(index),
              ],
            ),
          ),
          firstCurve: const Interval(0.0, 0.6, curve: Curves.fastOutSlowIn),
          secondCurve: const Interval(0.4, 1.0, curve: Curves.fastOutSlowIn),
          sizeCurve: Curves.fastOutSlowIn,
          crossFadeState: _isCurrent(index)
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          duration: kThemeAnimationDuration,
        ),
      ],
    );
  }

  Widget _buildHorizontal(
      {TextStyle? titleTextStyle,
      TextStyle? subtitleTextStyle,
      Color? circleColor,
      Color? connectorLineColor}) {
    final List<Widget> children = <Widget>[
      for (int i = 0; i < widget.steps.length; i += 1) ...<Widget>[
        GestureDetector(
          onTap: widget.steps[i].state != GSStepState.disabled
              ? () {
                  widget.onStepTapped?.call(i);
                }
              : null,
          // canRequestFocus: widget.steps[i].state != StepTestState.disabled,
          child: Row(
            children: <Widget>[
              SizedBox(
                height: _isLabel() ? 104.0 : 72.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    if (widget.steps[i].label != null)
                      const SizedBox(
                        height: 24.0,
                      ),
                    Center(child: _buildIcon(i, circleColor!)),
                    if (widget.steps[i].label != null)
                      SizedBox(
                        height: 24.0,
                        child: _buildLabelText(i),
                      ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsetsDirectional.only(start: 12.0),
                child: _buildHeaderText(
                  index: i,
                  titleTextStyle: titleTextStyle,
                  subtitleTextStyle: subtitleTextStyle,
                ),
              ),
            ],
          ),
        ),
        if (!_isLast(i))
          Expanded(
            child: Container(
                key: Key('line$i'),
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                height: widget.connectorThickness ?? 1.0,
                color: connectorLineColor),
          ),
      ],
    ];

    final List<Widget> stepPanels = <Widget>[];
    for (int i = 0; i < widget.steps.length; i += 1) {
      stepPanels.add(
        Visibility(
          maintainState: true,
          visible: i == widget.currentStep,
          child: widget.steps[i].content,
        ),
      );
    }

    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            children: children,
          ),
        ),
        Expanded(
          child: ListView(
            controller: widget.controller,
            physics: widget.physics,
            padding: const EdgeInsets.all(24.0),
            children: <Widget>[
              AnimatedSize(
                curve: Curves.fastOutSlowIn,
                duration: kThemeAnimationDuration,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: stepPanels),
              ),
              _buildVerticalControls(widget.currentStep),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final textSize = widget.size ?? gsStepperStyle.props?.size;

    GSStyle styler = resolveStyles(
      context: context,
      styles: [
        gsStepperStyle,
        gsStepperStyle.sizeMap(textSize),
      ],
      inlineStyle: widget.style,
      isFirst: true,
    );

    final circleColor = widget.circleColor ?? styler.color;
    final connectorLineColor = widget.connectorLineColor ?? styler.bg;

    switch (widget.type) {
      case GSStepperType.vertical:
        return ListView(
          controller: widget.controller,
          shrinkWrap: true,
          physics: widget.physics,
          children: <Widget>[
            for (int i = 0; i < widget.steps.length; i += 1)
              Column(
                key: _keys[i],
                children: <Widget>[
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
                    // canRequestFocus:
                    //     widget.steps[i].state != StepTestState.disabled,
                    child: _buildVerticalHeader(
                        titleTextStyle: styler.titleTextStyle,
                        subtitleTextStyle: styler.subtitleTextStyle,
                        index: i,
                        circleColor: circleColor,
                        connectorLineColor: connectorLineColor),
                  ),
                  _buildVerticalBody(
                      i, styler.contentTextStyle, connectorLineColor),
                ],
              ),
          ],
        );

      case GSStepperType.horizontal:
        return _buildHorizontal(
            titleTextStyle: styler.titleTextStyle,
            subtitleTextStyle: styler.subtitleTextStyle,
            circleColor: circleColor,
            connectorLineColor: connectorLineColor);
    }
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
