import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/utils/extension.dart';
import 'package:gluestack_ui/src/widgets/gs_modal_bottom_sheet/gs_modal_bottom_sheet_style.dart';

const double _defaultScrollControlDisabledMaxHeightRatio = 9.0 / 16.0;
const Duration _bottomSheetEnterDuration = Duration(milliseconds: 250);
const Duration _bottomSheetExitDuration = Duration(milliseconds: 200);
const Curve _modalBottomSheetCurve = Cubic(0.0, 0.0, 0.2, 1.0);
const double _minFlingVelocity = 700.0;
const double _closeProgressThreshold = 0.5;
const double kMinInteractiveDimension = 48.0;
typedef _SizeChangeCallback<Size> = void Function(Size size);

typedef BottomSheetDragStartHandler = void Function(DragStartDetails details);

/// A callback for when the user stops dragging the bottom sheet.
///
/// Used by [BottomSheet.onDragEnd].
typedef BottomSheetDragEndHandler = void Function(
  DragEndDetails details, {
  required bool isClosing,
});

class GSModalBottomSheet {
  static Future<T?> showModalBottomSheet<T>({
    required BuildContext context,
    required WidgetBuilder builder,
    GSConfigStyle? style,
    Color? backgroundColor,
    String? barrierLabel,
    BoxShape? shape,
    GSBorderRadius? borderRadius,
    List<BoxShadow>? boxShadow,
    Clip? clipBehavior,
    BoxConstraints? constraints,
    Color? barrierColor,
    bool isScrollControlled = false,
    double scrollControlDisabledMaxHeightRatio =
        _defaultScrollControlDisabledMaxHeightRatio,
    bool useRootNavigator = false,
    bool isDismissible = true,
    bool enableDrag = true,
    bool? showDragHandle,
    bool useSafeArea = false,
    RouteSettings? routeSettings,
    AnimationController? transitionAnimationController,
    Offset? anchorPoint,
  }) {
    assert(debugCheckHasMediaQuery(context));

    final NavigatorState navigator =
        Navigator.of(context, rootNavigator: useRootNavigator);

    return navigator.push(GSModalBottomSheetRoute<T>(
      builder: builder,
      capturedThemes:
          InheritedTheme.capture(from: context, to: navigator.context),
      isScrollControlled: isScrollControlled,
      scrollControlDisabledMaxHeightRatio: scrollControlDisabledMaxHeightRatio,
      barrierLabel: barrierLabel ?? " ",
      backgroundColor: backgroundColor,
      shape: shape,
      style: style != null ? GSStyle.fromGSConfigStyle(style, context) : null,
      borderRadius: borderRadius,
      boxShadow: boxShadow,
      clipBehavior: clipBehavior,
      constraints: constraints,
      isDismissible: isDismissible,
      modalBarrierColor: barrierColor ?? const Color(0x00000000),
      enableDrag: enableDrag,
      showDragHandle: showDragHandle,
      settings: routeSettings,
      transitionAnimationController: transitionAnimationController,
      anchorPoint: anchorPoint,
      useSafeArea: useSafeArea,
    ));
  }
}

class GSModalBottomSheetRoute<T> extends PopupRoute<T> {
  /// A modal bottom sheet route.
  GSModalBottomSheetRoute({
    required this.builder,
    this.style,
    this.boxShadow,
    this.capturedThemes,
    this.barrierLabel,
    this.barrierOnTapHint,
    this.backgroundColor,
    this.shape,
    this.borderRadius,
    this.clipBehavior,
    this.constraints,
    this.modalBarrierColor,
    this.isDismissible = true,
    this.enableDrag = true,
    this.showDragHandle,
    required this.isScrollControlled,
    this.scrollControlDisabledMaxHeightRatio =
        _defaultScrollControlDisabledMaxHeightRatio,
    super.settings,
    this.transitionAnimationController,
    this.anchorPoint,
    this.useSafeArea = false,
  });

  final WidgetBuilder builder;
  final CapturedThemes? capturedThemes;
  final GSStyle? style;
  final bool isScrollControlled;
  final double scrollControlDisabledMaxHeightRatio;
  final Color? backgroundColor;

  final BoxShape? shape;
  final GSBorderRadius? borderRadius;
  final List<BoxShadow>? boxShadow;
  final Clip? clipBehavior;
  final BoxConstraints? constraints;
  final Color? modalBarrierColor;
  final bool isDismissible;
  final bool enableDrag;
  final bool? showDragHandle;
  final AnimationController? transitionAnimationController;
  final Offset? anchorPoint;
  final bool useSafeArea;
  final String? barrierOnTapHint;
  final ValueNotifier<EdgeInsets> _clipDetailsNotifier =
      ValueNotifier<EdgeInsets>(EdgeInsets.zero);

  @override
  void dispose() {
    _clipDetailsNotifier.dispose();
    super.dispose();
  }

  bool _didChangeBarrierSemanticsClip(EdgeInsets newClipDetails) {
    if (_clipDetailsNotifier.value == newClipDetails) {
      return false;
    }
    _clipDetailsNotifier.value = newClipDetails;
    return true;
  }

  @override
  Duration get transitionDuration => _bottomSheetEnterDuration;

  @override
  Duration get reverseTransitionDuration => _bottomSheetExitDuration;

  @override
  bool get barrierDismissible => isDismissible;

  @override
  final String? barrierLabel;

  @override
  Color get barrierColor => modalBarrierColor!;

  AnimationController? _animationController;

  @override
  AnimationController createAnimationController() {
    assert(_animationController == null);
    if (transitionAnimationController != null) {
      _animationController = transitionAnimationController;
      willDisposeAnimationController = false;
    } else {
      _animationController = BottomSheet.createAnimationController(navigator!);
    }
    return _animationController!;
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    final Widget content = DisplayFeatureSubScreen(
      anchorPoint: anchorPoint,
      child: Builder(
        builder: (BuildContext context) {
          return _ModalBottomSheet<T>(
            route: this,
            style: style,
            backgroundColor: backgroundColor,
            shape: shape,
            borderRadius: borderRadius,
            clipBehavior: clipBehavior,
            constraints: constraints,
            isScrollControlled: isScrollControlled,
            scrollControlDisabledMaxHeightRatio:
                scrollControlDisabledMaxHeightRatio,
            enableDrag: enableDrag,
            showDragHandle: showDragHandle ?? (enableDrag && (false)),
          );
        },
      ),
    );

    final Widget bottomSheet = useSafeArea
        ? SafeArea(bottom: false, child: content)
        : MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: content,
          );

    return capturedThemes?.wrap(bottomSheet) ?? bottomSheet;
  }

  @override
  Widget buildModalBarrier() {
    if (barrierColor.alpha != 0 && !offstage) {
      assert(barrierColor != barrierColor.withOpacity(0.0));
      final Animation<Color?> color = animation!.drive(
        ColorTween(
          begin: barrierColor.withOpacity(0.0),
          end:
              barrierColor, // changedInternalState is called if barrierColor updates
        ).chain(CurveTween(
            curve:
                barrierCurve)), // changedInternalState is called if barrierCurve updates
      );
      return AnimatedModalBarrier(
        color: color,
        dismissible:
            barrierDismissible, // changedInternalState is called if barrierDismissible updates
        semanticsLabel:
            barrierLabel, // changedInternalState is called if barrierLabel updates
        barrierSemanticsDismissible: semanticsDismissible,
        clipDetailsNotifier: _clipDetailsNotifier,
        semanticsOnTapHint: barrierOnTapHint,
      );
    } else {
      return ModalBarrier(
        dismissible:
            barrierDismissible, // changedInternalState is called if barrierDismissible updates
        semanticsLabel:
            barrierLabel, // changedInternalState is called if barrierLabel updates
        barrierSemanticsDismissible: semanticsDismissible,
        clipDetailsNotifier: _clipDetailsNotifier,
        semanticsOnTapHint: barrierOnTapHint,
      );
    }
  }
}

class _BottomSheetSuspendedCurve extends ParametricCurve<double> {
  /// Creates a suspended curve.
  const _BottomSheetSuspendedCurve(
    this.startingPoint, {
    this.curve = Curves.easeOutCubic,
  });
  final double startingPoint;

  /// The curve to use when [startingPoint] is reached.
  ///
  /// This defaults to [Curves.easeOutCubic].
  final Curve curve;

  @override
  double transform(double t) {
    assert(t >= 0.0 && t <= 1.0);
    assert(startingPoint >= 0.0 && startingPoint <= 1.0);

    if (t < startingPoint) {
      return t;
    }

    if (t == 1.0) {
      return t;
    }

    final double curveProgress = (t - startingPoint) / (1 - startingPoint);
    final double transformed = curve.transform(curveProgress);
    return lerpDouble(startingPoint, 1, transformed)!;
  }

  @override
  String toString() {
    return '${describeIdentity(this)}($startingPoint, $curve)';
  }
}

class _BottomSheetLayoutWithSizeListener extends SingleChildRenderObjectWidget {
  const _BottomSheetLayoutWithSizeListener({
    required this.onChildSizeChanged,
    required this.animationValue,
    required this.isScrollControlled,
    required this.scrollControlDisabledMaxHeightRatio,
    super.child,
  });

  final _SizeChangeCallback<Size> onChildSizeChanged;
  final double animationValue;
  final bool isScrollControlled;
  final double scrollControlDisabledMaxHeightRatio;

  @override
  _RenderBottomSheetLayoutWithSizeListener createRenderObject(
      BuildContext context) {
    return _RenderBottomSheetLayoutWithSizeListener(
      onChildSizeChanged: onChildSizeChanged,
      animationValue: animationValue,
      isScrollControlled: isScrollControlled,
      scrollControlDisabledMaxHeightRatio: scrollControlDisabledMaxHeightRatio,
    );
  }

  @override
  void updateRenderObject(BuildContext context,
      _RenderBottomSheetLayoutWithSizeListener renderObject) {
    renderObject.onChildSizeChanged = onChildSizeChanged;
    renderObject.animationValue = animationValue;
    renderObject.isScrollControlled = isScrollControlled;
    renderObject.scrollControlDisabledMaxHeightRatio =
        scrollControlDisabledMaxHeightRatio;
  }
}

class _RenderBottomSheetLayoutWithSizeListener extends RenderShiftedBox {
  _RenderBottomSheetLayoutWithSizeListener({
    RenderBox? child,
    required _SizeChangeCallback<Size> onChildSizeChanged,
    required double animationValue,
    required bool isScrollControlled,
    required double scrollControlDisabledMaxHeightRatio,
  })  : _onChildSizeChanged = onChildSizeChanged,
        _animationValue = animationValue,
        _isScrollControlled = isScrollControlled,
        _scrollControlDisabledMaxHeightRatio =
            scrollControlDisabledMaxHeightRatio,
        super(child);

  Size _lastSize = Size.zero;

  _SizeChangeCallback<Size> get onChildSizeChanged => _onChildSizeChanged;
  _SizeChangeCallback<Size> _onChildSizeChanged;
  set onChildSizeChanged(_SizeChangeCallback<Size> newCallback) {
    if (_onChildSizeChanged == newCallback) {
      return;
    }

    _onChildSizeChanged = newCallback;
    markNeedsLayout();
  }

  double get animationValue => _animationValue;
  double _animationValue;
  set animationValue(double newValue) {
    if (_animationValue == newValue) {
      return;
    }

    _animationValue = newValue;
    markNeedsLayout();
  }

  bool get isScrollControlled => _isScrollControlled;
  bool _isScrollControlled;
  set isScrollControlled(bool newValue) {
    if (_isScrollControlled == newValue) {
      return;
    }

    _isScrollControlled = newValue;
    markNeedsLayout();
  }

  double get scrollControlDisabledMaxHeightRatio =>
      _scrollControlDisabledMaxHeightRatio;
  double _scrollControlDisabledMaxHeightRatio;
  set scrollControlDisabledMaxHeightRatio(double newValue) {
    if (_scrollControlDisabledMaxHeightRatio == newValue) {
      return;
    }

    _scrollControlDisabledMaxHeightRatio = newValue;
    markNeedsLayout();
  }

  Size _getSize(BoxConstraints constraints) {
    return constraints.constrain(constraints.biggest);
  }

  @override
  double computeMinIntrinsicWidth(double height) {
    final double width =
        _getSize(BoxConstraints.tightForFinite(height: height)).width;
    if (width.isFinite) {
      return width;
    }
    return 0.0;
  }

  @override
  double computeMaxIntrinsicWidth(double height) {
    final double width =
        _getSize(BoxConstraints.tightForFinite(height: height)).width;
    if (width.isFinite) {
      return width;
    }
    return 0.0;
  }

  @override
  double computeMinIntrinsicHeight(double width) {
    final double height =
        _getSize(BoxConstraints.tightForFinite(width: width)).height;
    if (height.isFinite) {
      return height;
    }
    return 0.0;
  }

  @override
  double computeMaxIntrinsicHeight(double width) {
    final double height =
        _getSize(BoxConstraints.tightForFinite(width: width)).height;
    if (height.isFinite) {
      return height;
    }
    return 0.0;
  }

  @override
  Size computeDryLayout(BoxConstraints constraints) {
    return _getSize(constraints);
  }

  BoxConstraints _getConstraintsForChild(BoxConstraints constraints) {
    return BoxConstraints(
      minWidth: constraints.maxWidth,
      maxWidth: constraints.maxWidth,
      maxHeight: isScrollControlled
          ? constraints.maxHeight
          : constraints.maxHeight * scrollControlDisabledMaxHeightRatio,
    );
  }

  Offset _getPositionForChild(Size size, Size childSize) {
    return Offset(0.0, size.height - childSize.height * animationValue);
  }

  @override
  void performLayout() {
    size = _getSize(constraints);
    if (child != null) {
      final BoxConstraints childConstraints =
          _getConstraintsForChild(constraints);
      assert(childConstraints.debugAssertIsValid(isAppliedConstraint: true));
      child!
          .layout(childConstraints, parentUsesSize: !childConstraints.isTight);
      final BoxParentData childParentData = child!.parentData! as BoxParentData;
      childParentData.offset = _getPositionForChild(size,
          childConstraints.isTight ? childConstraints.smallest : child!.size);
      final Size childSize =
          childConstraints.isTight ? childConstraints.smallest : child!.size;

      if (_lastSize != childSize) {
        _lastSize = childSize;
        _onChildSizeChanged.call(_lastSize);
      }
    }
  }
}

class _ModalBottomSheet<T> extends StatefulWidget {
  const _ModalBottomSheet({
    super.key,
    required this.route,
    this.backgroundColor,
    this.shape,
    this.clipBehavior,
    this.constraints,
    this.isScrollControlled = false,
    this.scrollControlDisabledMaxHeightRatio =
        _defaultScrollControlDisabledMaxHeightRatio,
    this.enableDrag = true,
    this.showDragHandle = false,
    this.borderRadius,
    this.style,
    this.boxShadow,
  });

  final GSModalBottomSheetRoute<T> route;
  final GSStyle? style;
  final bool isScrollControlled;
  final double scrollControlDisabledMaxHeightRatio;
  final Color? backgroundColor;
  final BoxShape? shape;
  final GSBorderRadius? borderRadius;
  final List<BoxShadow>? boxShadow;
  final Clip? clipBehavior;
  final BoxConstraints? constraints;
  final bool enableDrag;
  final bool showDragHandle;

  @override
  _ModalBottomSheetState<T> createState() => _ModalBottomSheetState<T>();
}

class _ModalBottomSheetState<T> extends State<_ModalBottomSheet<T>> {
  ParametricCurve<double> animationCurve = _modalBottomSheetCurve;

  EdgeInsets _getNewClipDetails(Size topLayerSize) {
    return EdgeInsets.fromLTRB(0, 0, 0, topLayerSize.height);
  }

  void handleDragStart(DragStartDetails details) {
    animationCurve = Curves.linear;
  }

  void handleDragEnd(DragEndDetails details, {bool? isClosing}) {
    // Allow the bottom sheet to animate smoothly from its current position.
    animationCurve = _BottomSheetSuspendedCurve(
      widget.route.animation!.value,
      curve: _modalBottomSheetCurve,
    );
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMediaQuery(context));

    return AnimatedBuilder(
      animation: widget.route.animation!,
      child: Stack(
        children: [
          Positioned.fill(
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                const Color(0x80000000).withOpacity(0.5),
                BlendMode.srcOver,
              ),
              child: Container(
                color: const Color(0x00000000),
              ),
            ),
          ),
          BottomSheet(
            animationController: widget.route._animationController,
            onClosing: () {
              if (widget.route.isCurrent) {
                Navigator.pop(context);
              }
            },
            builder: widget.route.builder,
            style: widget.style,
            backgroundColor: widget.backgroundColor,
            shape: widget.shape,
            borderRadius: widget.borderRadius,
            boxShadow: widget.boxShadow,
            clipBehavior: widget.clipBehavior,
            constraints: widget.constraints,
            enableDrag: widget.enableDrag,
            showDragHandle: widget.showDragHandle,
            onDragStart: handleDragStart,
            onDragEnd: handleDragEnd,
          ),
        ],
      ),
      builder: (BuildContext context, Widget? child) {
        final double animationValue = animationCurve.transform(
          widget.route.animation!.value,
        );
        return Semantics(
          scopesRoute: true,
          namesRoute: true,
          explicitChildNodes: true,
          child: ClipRect(
            child: _BottomSheetLayoutWithSizeListener(
              onChildSizeChanged: (Size size) {
                widget.route._didChangeBarrierSemanticsClip(
                  _getNewClipDetails(size),
                );
              },
              animationValue: animationValue,
              isScrollControlled: widget.isScrollControlled,
              scrollControlDisabledMaxHeightRatio:
                  widget.scrollControlDisabledMaxHeightRatio,
              child: child,
            ),
          ),
        );
      },
    );
  }
}

class BottomSheet extends StatefulWidget {
  const BottomSheet({
    super.key,
    this.animationController,
    this.enableDrag = true,
    this.showDragHandle,
    this.dragHandleColor,
    this.dragHandleSize,
    this.onDragStart,
    this.onDragEnd,
    this.backgroundColor,
    this.shadowColor,
    this.shape,
    this.clipBehavior,
    this.constraints,
    required this.onClosing,
    required this.builder,
    this.borderRadius,
    this.style,
    this.boxShadow,
  });

  final AnimationController? animationController;
  final GSStyle? style;
  final VoidCallback onClosing;
  final WidgetBuilder builder;
  final bool enableDrag;
  final bool? showDragHandle;
  final Color? dragHandleColor;
  final Size? dragHandleSize;
  final Color? backgroundColor;
  final GSBorderRadius? borderRadius;
  final List<BoxShadow>? boxShadow;
  final Color? shadowColor;
  final BoxShape? shape;
  final Clip? clipBehavior;
  final BottomSheetDragStartHandler? onDragStart;

  final BottomSheetDragEndHandler? onDragEnd;
  final BoxConstraints? constraints;

  @override
  State<BottomSheet> createState() => _BottomSheetState();

  static AnimationController createAnimationController(TickerProvider vsync) {
    return AnimationController(
      duration: _bottomSheetEnterDuration,
      reverseDuration: _bottomSheetExitDuration,
      debugLabel: 'BottomSheet',
      vsync: vsync,
    );
  }
}

class _BottomSheetState extends State<BottomSheet> {
  final GlobalKey _childKey = GlobalKey(debugLabel: 'BottomSheet child');

  double get _childHeight {
    final RenderBox renderBox =
        _childKey.currentContext!.findRenderObject()! as RenderBox;
    return renderBox.size.height;
  }

  bool get _dismissUnderway =>
      widget.animationController!.status == AnimationStatus.reverse;

  Set<GSBottomSheetState> dragHandleGSBottomSheetState = <GSBottomSheetState>{};

  void _handleDragStart(DragStartDetails details) {
    setState(() {
      dragHandleGSBottomSheetState.add(GSBottomSheetState.dragged);
    });
    widget.onDragStart?.call(details);
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    assert(
      (widget.enableDrag || (widget.showDragHandle ?? false)) &&
          widget.animationController != null,
      "'BottomSheet.animationController' cannot be null when 'BottomSheet.enableDrag' or 'BottomSheet.showDragHandle' is true. "
      "Use 'BottomSheet.createAnimationController' to create one, or provide another AnimationController.",
    );
    if (_dismissUnderway) {
      return;
    }
    widget.animationController!.value -= details.primaryDelta! / _childHeight;
  }

  void _handleDragEnd(DragEndDetails details) {
    assert(
      (widget.enableDrag || (widget.showDragHandle ?? false)) &&
          widget.animationController != null,
      "'BottomSheet.animationController' cannot be null when 'BottomSheet.enableDrag' or 'BottomSheet.showDragHandle' is true. "
      "Use 'BottomSheet.createAnimationController' to create one, or provide another AnimationController.",
    );
    if (_dismissUnderway) {
      return;
    }
    setState(() {
      dragHandleGSBottomSheetState.remove(GSBottomSheetState.dragged);
    });
    bool isClosing = false;
    if (details.velocity.pixelsPerSecond.dy > _minFlingVelocity) {
      final double flingVelocity =
          -details.velocity.pixelsPerSecond.dy / _childHeight;
      if (widget.animationController!.value > 0.0) {
        widget.animationController!.fling(velocity: flingVelocity);
      }
      if (flingVelocity < 0.0) {
        isClosing = true;
      }
    } else if (widget.animationController!.value < _closeProgressThreshold) {
      if (widget.animationController!.value > 0.0) {
        widget.animationController!.fling(velocity: -1.0);
      }
      isClosing = true;
    } else {
      widget.animationController!.forward();
    }

    widget.onDragEnd?.call(
      details,
      isClosing: isClosing,
    );

    if (isClosing) {
      widget.onClosing();
    }
  }

  bool extentChanged(DraggableScrollableNotification notification) {
    if (notification.extent == notification.minExtent &&
        notification.shouldCloseOnMinExtent) {
      widget.onClosing();
    }
    return false;
  }

  void _handleDragHandleHover(bool hovering) {
    if (hovering !=
        dragHandleGSBottomSheetState.contains(GSBottomSheetState.hovered)) {
      setState(() {
        if (hovering) {
          dragHandleGSBottomSheetState.add(GSBottomSheetState.hovered);
        } else {
          dragHandleGSBottomSheetState.remove(GSBottomSheetState.hovered);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    GSConfigStyle styler = resolveStyles(
      context: context,
      styles: [
        gsModalBottomSheetStyle,
      ],
      inlineStyle: widget.style,
      isFirst: true,
    );

    final BoxConstraints? constraints = widget.constraints;
    final Color? color = widget.backgroundColor ?? styler.bg?.getColor(context);
    final BoxShape shape = widget.shape ?? BoxShape.rectangle;

    final borderRadius =
        widget.borderRadius?.toGSBorderRadius ?? GSBorderRadius.$full;

    final Clip clipBehavior = widget.clipBehavior ?? Clip.none;
    final bool showDragHandle =
        widget.showDragHandle ?? (widget.enableDrag && (false));

    Widget? dragHandle;

    if (showDragHandle) {
      dragHandle = _DragHandle(
        onSemanticsTap: widget.onClosing,
        handleHover: _handleDragHandleHover,
        dragHandleColor: widget.dragHandleColor,
        dragHandleSize: widget.dragHandleSize,
      );

      if (!widget.enableDrag) {
        dragHandle = _BottomSheetDragHandlerGestureDetector(
          onVerticalDragStart: _handleDragStart,
          onVerticalDragUpdate: _handleDragUpdate,
          onVerticalDragEnd: _handleDragEnd,
          child: dragHandle,
        );
      }
    }

    Widget bottomSheet = Container(
      key: _childKey,
      clipBehavior: clipBehavior,
      decoration: BoxDecoration(
        color: color,
        shape: shape,
        borderRadius: shape != BoxShape.circle
            ? BorderRadius.only(
                topLeft: Radius.circular(
                    GSModalBottomSheetStyle.borderRadius[borderRadius] ??
                        styler.borderRadius ??
                        20),
                topRight: Radius.circular(
                    GSModalBottomSheetStyle.borderRadius[borderRadius] ??
                        styler.borderRadius ??
                        20),
              )
            : null,
        boxShadow: widget.boxShadow,
      ),
      child: widget.enableDrag
          ? _BottomSheetGestureDetector(
              onVerticalDragStart: _handleDragStart,
              onVerticalDragUpdate: _handleDragUpdate,
              onVerticalDragEnd: _handleDragEnd,
              child: NotificationListener<DraggableScrollableNotification>(
                onNotification: extentChanged,
                child: !showDragHandle
                    ? widget.builder(context)
                    : Stack(
                        alignment: Alignment.topCenter,
                        children: <Widget>[
                          dragHandle!,
                          Padding(
                            padding: const EdgeInsets.only(
                                top: kMinInteractiveDimension),
                            child: widget.builder(context),
                          ),
                        ],
                      ),
              ),
            )
          : NotificationListener<DraggableScrollableNotification>(
              onNotification: extentChanged,
              child: !showDragHandle
                  ? widget.builder(context)
                  : Stack(
                      alignment: Alignment.topCenter,
                      children: <Widget>[
                        dragHandle!,
                        Padding(
                          padding: const EdgeInsets.only(
                              top: kMinInteractiveDimension),
                          child: widget.builder(context),
                        ),
                      ],
                    ),
            ),
    );

    if (constraints != null) {
      bottomSheet = Align(
        alignment: Alignment.bottomCenter,
        heightFactor: 1.0,
        child: ConstrainedBox(
          constraints: constraints,
          child: bottomSheet,
        ),
      );
    }

    return bottomSheet;
  }
}

enum GSBottomSheetState {
  hovered,

  dragged,
}

class _DragHandle extends StatelessWidget {
  const _DragHandle({
    required this.onSemanticsTap,
    required this.handleHover,
    this.dragHandleColor,
    this.dragHandleSize,
  });

  final VoidCallback? onSemanticsTap;
  final ValueChanged<bool> handleHover;
  final Color? dragHandleColor;
  final Size? dragHandleSize;

  @override
  Widget build(BuildContext context) {
    final Size handleSize = dragHandleSize ?? const Size(10, 10);

    return MouseRegion(
      onEnter: (PointerEnterEvent event) => handleHover(true),
      onExit: (PointerExitEvent event) => handleHover(false),
      child: Semantics(
        container: true,
        onTap: onSemanticsTap,
        child: SizedBox(
          height: kMinInteractiveDimension,
          width: kMinInteractiveDimension,
          child: Center(
            child: Container(
              height: handleSize.height,
              width: handleSize.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(handleSize.height / 2),
                  color: dragHandleColor),
            ),
          ),
        ),
      ),
    );
  }
}

class _BottomSheetGestureDetector extends StatelessWidget {
  const _BottomSheetGestureDetector({
    required this.child,
    required this.onVerticalDragStart,
    required this.onVerticalDragUpdate,
    required this.onVerticalDragEnd,
  });

  final Widget child;
  final GestureDragStartCallback onVerticalDragStart;
  final GestureDragUpdateCallback onVerticalDragUpdate;
  final GestureDragEndCallback onVerticalDragEnd;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragStart: onVerticalDragStart,
      onVerticalDragUpdate: onVerticalDragUpdate,
      onVerticalDragEnd: onVerticalDragEnd,
      behavior: HitTestBehavior.translucent,
      child: child,
    );
  }
}

class _BottomSheetDragHandlerGestureDetector extends StatelessWidget {
  const _BottomSheetDragHandlerGestureDetector({
    required this.child,
    required this.onVerticalDragStart,
    required this.onVerticalDragUpdate,
    required this.onVerticalDragEnd,
  });

  final Widget child;
  final GestureDragStartCallback onVerticalDragStart;
  final GestureDragUpdateCallback onVerticalDragUpdate;
  final GestureDragEndCallback onVerticalDragEnd;

  @override
  Widget build(BuildContext context) {
    return RawGestureDetector(
      excludeFromSemantics: true,
      gestures: <Type, GestureRecognizerFactory<GestureRecognizer>>{
        VerticalDragGestureRecognizer:
            GestureRecognizerFactoryWithHandlers<VerticalDragGestureRecognizer>(
          () => VerticalDragGestureRecognizer(debugOwner: this),
          (VerticalDragGestureRecognizer instance) {
            instance
              ..onStart = onVerticalDragStart
              ..onUpdate = onVerticalDragUpdate
              ..onEnd = onVerticalDragEnd
              ..onlyAcceptDragOnThreshold = true;
          },
        ),
      },
      child: child,
    );
  }
}
