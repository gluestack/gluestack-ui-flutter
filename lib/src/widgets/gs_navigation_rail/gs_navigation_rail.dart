import 'dart:ui';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_navigation_rail/gs_navigation_rail_style.dart';
import 'package:gluestack_ui/src/widgets/gs_navigation_rail/gs_navigation_rail_unselected_textstyle.dart';
import 'gs_navigation_rail_selected_textstyle.dart';
import 'package:gluestack_ui/src/utils/extension.dart';

const double _kCircularIndicatorDiameter = 60;
const double _kIndicatorHeight = 32;
const Duration kNavigationThemeAnimationDuration = Duration(milliseconds: 200);
const double _kIndicatorWidth = 64;
const double _horizontalDestinationPadding = 8.0;
const double _verticalDestinationPaddingNoLabel = 24.0;
const double _verticalDestinationPaddingWithLabel = 16.0;
const Widget _verticalSpacer = SizedBox(height: 8.0);
const double _verticalIconLabelSpacing = 4.0;
const double _verticalDestinationSpacing = 12.0;
const double _verticalSpacing = 25;

enum GSNavigationRailLabelType {
  none,

  selected,

  all,
}

enum GSNavigationRailAlignment {
  start,
  center,
  end,
}

class GSNavigationRail extends StatefulWidget {
  const GSNavigationRail({
    super.key,
    this.backgroundColor,
    this.extended = false,
    this.leading,
    this.trailing,
    required this.destinations,
    required this.selectedIndex,
    this.onDestinationSelected,
    this.elevation,
    this.groupAlignment,
    this.labelType,
    this.unselectedLabelTextStyle,
    this.selectedLabelTextStyle,
    this.unselectedIconTheme,
    this.selectedIconTheme,
    this.minWidth,
    this.minExtendedWidth,
    this.useIndicator,
    this.indicatorColor,
    this.indicatorShape,
    this.style,
    this.size,
    this.indicatorWidth,
  })  : assert(destinations.length >= 2),
        assert(selectedIndex == null ||
            (0 <= selectedIndex && selectedIndex < destinations.length)),
        assert(elevation == null || elevation > 0),
        assert(minWidth == null || minWidth > 0),
        assert(minExtendedWidth == null || minExtendedWidth > 0),
        assert((minWidth == null || minExtendedWidth == null) ||
            minExtendedWidth >= minWidth),
        assert(!extended ||
            (labelType == null || labelType == GSNavigationRailLabelType.none));

  final Color? backgroundColor;
  final GSStyle? style;
  final GSNavigationRailSizes? size;
  final bool extended;
  final Widget? leading;
  final Widget? trailing;

  final List<GSNavigationRailDestination> destinations;

  final int? selectedIndex;

  final ValueChanged<int>? onDestinationSelected;

  final double? elevation;

  final double? groupAlignment;

  final GSNavigationRailLabelType? labelType;

  final TextStyle? unselectedLabelTextStyle;

  final TextStyle? selectedLabelTextStyle;

  final IconThemeData? unselectedIconTheme;

  final IconThemeData? selectedIconTheme;

  final double? minWidth;

  final double? minExtendedWidth;

  final bool? useIndicator;

  final Color? indicatorColor;

  final double? indicatorWidth;

  final ShapeBorder? indicatorShape;

  static Animation<double> extendedAnimation(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<
            _ExtendedGSNavigationRailAnimation>()!
        .animation;
  }

  @override
  State<GSNavigationRail> createState() => _GSNavigationRailState();
}

class _GSNavigationRailState extends State<GSNavigationRail>
    with TickerProviderStateMixin {
  late List<AnimationController> _destinationControllers;
  late List<Animation<double>> _destinationAnimations;
  late AnimationController _extendedController;
  late Animation<double> _extendedAnimation;

  @override
  void initState() {
    super.initState();
    _initControllers();
  }

  @override
  void dispose() {
    _disposeControllers();
    super.dispose();
  }

  @override
  void didUpdateWidget(GSNavigationRail oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.extended != oldWidget.extended) {
      if (widget.extended) {
        _extendedController.forward();
      } else {
        _extendedController.reverse();
      }
    }
    if (widget.destinations.length != oldWidget.destinations.length) {
      _resetState();
      return;
    }

    if (widget.selectedIndex != oldWidget.selectedIndex) {
      if (oldWidget.selectedIndex != null) {
        _destinationControllers[oldWidget.selectedIndex!].reverse();
      }
      if (widget.selectedIndex != null) {
        _destinationControllers[widget.selectedIndex!].forward();
      }
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    final textSize = widget.size ?? gsNavigationRailStyle.props?.size;

    GSConfigStyle styler = resolveStyles(
      context: context,
      styles: [
        gsNavigationRailStyle,
        gsNavigationRailStyle.sizeMap(textSize?.toGSSize),
      ],
      inlineStyle: widget.style,
      isFirst: true,
    );

    GSConfigStyle selectedLabelStyler = resolveStyles(
      context: context,
      styles: [
        gsNavigationRailSelectedLabelTextStyle,
        gsNavigationRailSelectedLabelTextStyle.sizeMap(textSize?.toGSSize),
      ],
      inlineStyle: widget.style,
      isFirst: true,
    );

    GSConfigStyle unselectedLabelStyler = resolveStyles(
      context: context,
      styles: [
        gsNavigationRailUnselectedLabelTextStyle,
        gsNavigationRailUnselectedLabelTextStyle.sizeMap(textSize?.toGSSize),
      ],
      inlineStyle: widget.style,
      isFirst: true,
    );

    final Color? backgroundColor =
        widget.backgroundColor ?? styler.bg?.getColor(context);
    Color? indicatorColor =
        widget.indicatorColor ?? styler.color?.getColor(context);

    final double minWidth = widget.minWidth ?? 100;
    final double minExtendedWidth = widget.minExtendedWidth ?? 30;
    final TextStyle? unselectedLabelTextStyle =
        widget.unselectedLabelTextStyle ?? unselectedLabelStyler.textStyle;

    final TextStyle? selectedLabelTextStyle =
        widget.selectedLabelTextStyle ?? selectedLabelStyler.textStyle;
    final IconThemeData unselectedIconTheme = widget.unselectedIconTheme ??
        IconThemeData(
          color: styler.iconColor?.getColor(context),
        );
    final IconThemeData selectedIconTheme = widget.selectedIconTheme ??
        IconThemeData(
          color: styler.iconColor?.getColor(context),
        );
    final double groupAlignment = widget.groupAlignment ?? 0.0;
    final GSNavigationRailLabelType labelType =
        widget.labelType ?? GSNavigationRailLabelType.none;
    final bool useIndicator = widget.useIndicator ?? true;

    final ShapeBorder? indicatorShape = widget.indicatorShape;

    final bool isRTLDirection = Directionality.of(context) == TextDirection.rtl;

    return _ExtendedGSNavigationRailAnimation(
      animation: _extendedAnimation,
      child: Semantics(
        explicitChildNodes: true,
        child: Container(
          color: backgroundColor,
          child: SafeArea(
            right: isRTLDirection,
            left: !isRTLDirection,
            child: Column(
              children: <Widget>[
                _verticalSpacer,
                if (widget.leading != null) ...<Widget>[
                  widget.leading!,
                  _verticalSpacer,
                ],
                Expanded(
                  child: Align(
                    alignment: Alignment(0, groupAlignment),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        for (int i = 0; i < widget.destinations.length; i += 1)
                          _GSRailDestination(
                            minWidth: minWidth,
                            minExtendedWidth: minExtendedWidth,
                            extendedTransitionAnimation: _extendedAnimation,
                            selected: widget.selectedIndex == i,
                            icon: widget.selectedIndex == i
                                ? widget.destinations[i].selectedIcon
                                : widget.destinations[i].icon,
                            label: widget.destinations[i].label,
                            destinationAnimation: _destinationAnimations[i],
                            labelType: labelType,
                            iconTheme: widget.selectedIndex == i
                                ? selectedIconTheme
                                : unselectedIconTheme,
                            labelTextStyle: widget.selectedIndex == i
                                ? selectedLabelTextStyle!
                                : unselectedLabelTextStyle!,
                            padding: widget.destinations[i].padding,
                            useIndicator: useIndicator,
                            indicatorColor:
                                useIndicator ? indicatorColor : null,
                            indicatorWidth: widget.indicatorWidth,
                            indicatorShape:
                                useIndicator ? indicatorShape : null,
                            onTap: () {
                              if (widget.onDestinationSelected != null) {
                                widget.onDestinationSelected!(i);
                              }
                            },
                            indexLabel: "",
                            disabled: widget.destinations[i].disabled,
                          ),
                        if (widget.trailing != null) widget.trailing!,
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
  }

  void _disposeControllers() {
    for (final AnimationController controller in _destinationControllers) {
      controller.dispose();
    }
    _extendedController.dispose();
  }

  void _initControllers() {
    _destinationControllers = List<AnimationController>.generate(
        widget.destinations.length, (int index) {
      return AnimationController(
        duration: kNavigationThemeAnimationDuration,
        vsync: this,
      )..addListener(_rebuild);
    });
    _destinationAnimations = _destinationControllers
        .map((AnimationController controller) => controller.view)
        .toList();
    if (widget.selectedIndex != null) {
      _destinationControllers[widget.selectedIndex!].value = 1.0;
    }
    _extendedController = AnimationController(
      duration: kNavigationThemeAnimationDuration,
      vsync: this,
      value: widget.extended ? 1.0 : 0.0,
    );
    _extendedAnimation = CurvedAnimation(
      parent: _extendedController,
      curve: Curves.easeInOut,
    );
    _extendedController.addListener(() {
      _rebuild();
    });
  }

  void _resetState() {
    _disposeControllers();
    _initControllers();
  }

  void _rebuild() {
    setState(() {});
  }
}

class _GSRailDestination extends StatelessWidget {
  _GSRailDestination({
    required this.minWidth,
    required this.minExtendedWidth,
    required this.icon,
    this.label,
    required this.destinationAnimation,
    required this.extendedTransitionAnimation,
    required this.labelType,
    required this.selected,
    required this.iconTheme,
    required this.labelTextStyle,
    required this.onTap,
    required this.indexLabel,
    this.padding,
    required this.useIndicator,
    this.indicatorColor,
    this.indicatorShape,
    this.disabled = false,
    this.indicatorWidth,
  }) : _positionAnimation = CurvedAnimation(
          parent: ReverseAnimation(destinationAnimation),
          curve: Curves.easeInOut,
          reverseCurve: Curves.easeInOut.flipped,
        );

  final double minWidth;
  final double minExtendedWidth;
  final Widget icon;
  final Widget? label;
  final Animation<double> destinationAnimation;
  final GSNavigationRailLabelType labelType;
  final bool selected;
  final Animation<double> extendedTransitionAnimation;
  final IconThemeData iconTheme;
  final TextStyle labelTextStyle;
  final VoidCallback onTap;
  final String indexLabel;
  final EdgeInsetsGeometry? padding;
  final bool useIndicator;
  final Color? indicatorColor;
  final double? indicatorWidth;
  final ShapeBorder? indicatorShape;
  final bool disabled;

  final Animation<double> _positionAnimation;

  @override
  Widget build(BuildContext context) {
    final TextDirection textDirection = Directionality.of(context);
    final EdgeInsets destinationPadding =
        (padding ?? EdgeInsets.zero).resolve(textDirection);
    Offset indicatorOffset;
    bool applyXOffset = false;

    final Widget themedIcon = IconTheme(
      data: iconTheme,
      child: icon,
    );
    final Widget styledLabel = DefaultTextStyle(
      style: labelTextStyle,
      child: label ?? const SizedBox(),
    );

    Widget content;

    final bool isLargeIconSize =
        iconTheme.size != null && iconTheme.size! > _kIndicatorHeight;
    final double indicatorVerticalOffset =
        isLargeIconSize ? (iconTheme.size! - _kIndicatorHeight) / 2 : 0;

    switch (labelType) {
      case GSNavigationRailLabelType.none:
        const Widget spacing = SizedBox(
          height: _verticalDestinationSpacing,
        );

        indicatorOffset = Offset(
          minWidth / 2 + destinationPadding.left,
          _verticalDestinationSpacing / 2 +
              destinationPadding.top +
              indicatorVerticalOffset,
        );
        final Widget iconPart = Column(
          children: <Widget>[
            spacing,
            Container(
              width: minWidth,
              height: _kIndicatorHeight,
              margin: const EdgeInsetsDirectional.symmetric(
                  horizontal: _verticalDestinationSpacing),
              child: Center(
                child: _AddIndicator(
                  addIndicator: useIndicator,
                  indicatorColor: indicatorColor,
                  indicatorShape: indicatorShape,
                  indicatorWidth: indicatorWidth,
                  isCircular: true,
                  indicatorAnimation: destinationAnimation,
                  child: themedIcon,
                ),
              ),
            ),
            spacing,
          ],
        );
        if (extendedTransitionAnimation.value == 0) {
          content = Padding(
            padding: padding ?? EdgeInsets.zero,
            child: Stack(
              children: <Widget>[
                iconPart,
                SizedBox.shrink(
                  child: Visibility.maintain(
                    visible: false,
                    child: label ?? const SizedBox(),
                  ),
                ),
              ],
            ),
          );
        } else {
          final Animation<double> labelFadeAnimation =
              extendedTransitionAnimation
                  .drive(CurveTween(curve: const Interval(0.0, 0.25)));
          applyXOffset = true;
          content = Padding(
            padding: padding ?? EdgeInsets.zero,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: lerpDouble(minWidth, minExtendedWidth,
                    extendedTransitionAnimation.value)!,
              ),
              child: ClipRect(
                child: Row(
                  children: <Widget>[
                    iconPart,
                    Align(
                      heightFactor: 1.0,
                      widthFactor: extendedTransitionAnimation.value,
                      alignment: AlignmentDirectional.centerStart,
                      child: FadeTransition(
                        alwaysIncludeSemantics: true,
                        opacity: labelFadeAnimation,
                        child: styledLabel,
                      ),
                    ),
                    SizedBox(
                        width: _horizontalDestinationPadding *
                            extendedTransitionAnimation.value),
                  ],
                ),
              ),
            ),
          );
        }
      case GSNavigationRailLabelType.selected:
        final double appearingAnimationValue = 1 - _positionAnimation.value;
        final double verticalPadding = lerpDouble(
            _verticalDestinationPaddingNoLabel,
            _verticalDestinationPaddingWithLabel,
            appearingAnimationValue)!;
        final Interval interval =
            selected ? const Interval(0.25, 0.75) : const Interval(0.75, 1.0);
        final Animation<double> labelFadeAnimation =
            destinationAnimation.drive(CurveTween(curve: interval));

        final Widget topSpacing = SizedBox(height: verticalPadding);
        const Widget labelSpacing = SizedBox(height: 0);
        const Widget bottomSpacing =
            SizedBox(height: _verticalDestinationSpacing);
        final double indicatorHorizontalPadding =
            (destinationPadding.left / 2) - (destinationPadding.right / 2);
        final double indicatorVerticalPadding = destinationPadding.top;
        indicatorOffset = Offset(
          minWidth / 2 + indicatorHorizontalPadding,
          indicatorVerticalPadding + indicatorVerticalOffset,
        );

        content = Container(
          constraints: BoxConstraints(
            minWidth: minWidth,
            minHeight: _verticalSpacing,
          ),
          padding: padding ??
              const EdgeInsets.symmetric(
                  horizontal: _horizontalDestinationPadding),
          child: ClipRect(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                topSpacing,
                _AddIndicator(
                  addIndicator: useIndicator,
                  indicatorColor: indicatorColor,
                  indicatorShape: indicatorShape,
                  isCircular: false,
                  indicatorAnimation: destinationAnimation,
                  indicatorWidth: indicatorWidth,
                  child: themedIcon,
                ),
                labelSpacing,
                Align(
                  alignment: Alignment.topCenter,
                  heightFactor: appearingAnimationValue,
                  widthFactor: 1.0,
                  child: FadeTransition(
                    alwaysIncludeSemantics: true,
                    opacity: labelFadeAnimation,
                    child: styledLabel,
                  ),
                ),
                bottomSpacing,
              ],
            ),
          ),
        );
      case GSNavigationRailLabelType.all:
        const Widget topSpacing =
            SizedBox(height: _verticalDestinationPaddingWithLabel);
        const Widget labelSpacing = SizedBox(height: _verticalIconLabelSpacing);
        const Widget bottomSpacing =
            SizedBox(height: _verticalDestinationSpacing);
        final double indicatorHorizontalPadding =
            (destinationPadding.left / 2) - (destinationPadding.right / 2);
        final double indicatorVerticalPadding = destinationPadding.top;
        indicatorOffset = Offset(
          minWidth / 2 + indicatorHorizontalPadding,
          indicatorVerticalPadding + indicatorVerticalOffset,
        );

        content = Container(
          constraints: BoxConstraints(
            minWidth: minWidth,
            minHeight: _verticalSpacing,
          ),
          padding: padding ??
              const EdgeInsets.symmetric(
                  horizontal: _horizontalDestinationPadding),
          child: Column(
            children: <Widget>[
              topSpacing,
              _AddIndicator(
                addIndicator: useIndicator,
                indicatorColor: indicatorColor,
                indicatorShape: indicatorShape,
                isCircular: false,
                indicatorAnimation: destinationAnimation,
                indicatorWidth: indicatorWidth,
                child: themedIcon,
              ),
              labelSpacing,
              styledLabel,
              bottomSpacing,
            ],
          ),
        );
    }

    return Semantics(
      container: true,
      selected: selected,
      child: Stack(
        children: <Widget>[
          _IndicatorInkWell(
            onTap: disabled ? null : onTap,
            borderRadius: BorderRadius.all(Radius.circular(minWidth / 2.0)),
            customBorder: indicatorShape,
            indicatorOffset: indicatorOffset,
            applyXOffset: applyXOffset,
            textDirection: textDirection,
            child: content,
          ),
          Semantics(
            label: indexLabel,
          ),
        ],
      ),
    );
  }
}

class _IndicatorInkWell extends StatefulWidget {
  const _IndicatorInkWell({
    this.child,
    this.onTap,
    this.customBorder,
    this.borderRadius,
    required this.indicatorOffset,
    required this.applyXOffset,
    required this.textDirection,
  });

  final Widget? child;
  final VoidCallback? onTap;
  final ShapeBorder? customBorder;
  final BorderRadius? borderRadius;
  final Offset indicatorOffset;
  final bool applyXOffset;
  final TextDirection textDirection;

  @override
  _IndicatorInkWellState createState() => _IndicatorInkWellState();
}

class _IndicatorInkWellState extends State<_IndicatorInkWell> {
  bool _isTapDown = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isTapDown = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          _isTapDown = false;
        });
        widget.onTap?.call();
      },
      onTapCancel: () {
        setState(() {
          _isTapDown = false;
        });
      },
      child: Stack(
        children: [
          widget.child ?? const SizedBox(),
          if (_isTapDown)
            Positioned(
              left: widget.indicatorOffset.dx,
              top: widget.indicatorOffset.dy,
              child: Container(
                width: _kCircularIndicatorDiameter,
                height: _kIndicatorHeight,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _AddIndicator extends StatelessWidget {
  const _AddIndicator({
    required this.addIndicator,
    required this.isCircular,
    required this.indicatorColor,
    required this.indicatorShape,
    required this.indicatorAnimation,
    required this.child,
    required this.indicatorWidth,
  });

  final bool addIndicator;
  final bool isCircular;
  final Color? indicatorColor;
  final ShapeBorder? indicatorShape;
  final double? indicatorWidth;
  final Animation<double> indicatorAnimation;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (!addIndicator) {
      return child;
    }
    late final Widget indicator;
    if (isCircular) {
      indicator = NavigationIndicator(
        animation: indicatorAnimation,
        height: _kCircularIndicatorDiameter,
        width: indicatorWidth ?? _kCircularIndicatorDiameter,
        borderRadius: BorderRadius.circular(_kCircularIndicatorDiameter / 2),
        color: indicatorColor,
      );
    } else {
      indicator = NavigationIndicator(
        animation: indicatorAnimation,
        width: indicatorWidth ?? _kCircularIndicatorDiameter,
        shape: indicatorShape,
        color: indicatorColor,
      );
    }

    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        indicator,
        child,
      ],
    );
  }
}

class GSNavigationRailDestination {
  const GSNavigationRailDestination({
    required this.icon,
    Widget? selectedIcon,
    this.indicatorColor,
    this.indicatorShape,
    this.label,
    this.padding,
    this.disabled = false,
  }) : selectedIcon = selectedIcon ?? icon;

  final Widget icon;
  final Widget selectedIcon;
  final Color? indicatorColor;
  final ShapeBorder? indicatorShape;
  final Widget? label;
  final EdgeInsetsGeometry? padding;
  final bool disabled;
}

class _ExtendedGSNavigationRailAnimation extends InheritedWidget {
  const _ExtendedGSNavigationRailAnimation({
    required this.animation,
    required super.child,
  });

  final Animation<double> animation;

  @override
  bool updateShouldNotify(_ExtendedGSNavigationRailAnimation old) =>
      animation != old.animation;
}

class NavigationIndicator extends StatelessWidget {
  const NavigationIndicator({
    super.key,
    required this.animation,
    this.color,
    this.width = _kIndicatorWidth,
    this.height = _kIndicatorHeight,
    this.borderRadius = const BorderRadius.all(Radius.circular(16)),
    this.shape,
  });

  final Animation<double> animation;
  final Color? color;
  final double width;
  final double height;
  final BorderRadius borderRadius;
  final ShapeBorder? shape;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) {
        final double scale = animation.isDismissed
            ? 0.0
            : Tween<double>(begin: .4, end: 1.0).transform(
                CurveTween(curve: Curves.easeInOutCubicEmphasized)
                    .transform(animation.value));

        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.diagonal3Values(
            scale,
            1.0,
            1.0,
          ),
          child: child,
        );
      },
      child: _StatusTransitionWidgetBuilder(
        animation: animation,
        builder: (BuildContext context, Widget? child) {
          return _SelectableAnimatedBuilder(
            isSelected: _isForwardOrCompleted(animation),
            duration: const Duration(milliseconds: 100),
            alwaysDoFullAnimation: true,
            builder: (BuildContext context, Animation<double> fadeAnimation) {
              return FadeTransition(
                opacity: fadeAnimation,
                child: Container(
                  width: width,
                  height: height,
                  decoration: ShapeDecoration(
                    shape: shape ??
                        RoundedRectangleBorder(borderRadius: borderRadius),
                    color: color,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

bool _isForwardOrCompleted(Animation<double> animation) {
  return animation.status == AnimationStatus.forward ||
      animation.status == AnimationStatus.completed;
}

class _StatusTransitionWidgetBuilder extends StatusTransitionWidget {
  /// Creates a widget that rebuilds when the given animation changes status.
  const _StatusTransitionWidgetBuilder({
    required super.animation,
    required this.builder,
    this.child,
  });

  final TransitionBuilder builder;

  final Widget? child;

  @override
  Widget build(BuildContext context) => builder(context, child);
}

class _SelectableAnimatedBuilder extends StatefulWidget {
  const _SelectableAnimatedBuilder({
    required this.isSelected,
    this.duration = const Duration(milliseconds: 200),
    this.alwaysDoFullAnimation = false,
    required this.builder,
  });

  final bool isSelected;
  final Duration duration;
  final bool alwaysDoFullAnimation;
  final Widget Function(BuildContext, Animation<double>) builder;

  @override
  _SelectableAnimatedBuilderState createState() =>
      _SelectableAnimatedBuilderState();
}

class _SelectableAnimatedBuilderState extends State<_SelectableAnimatedBuilder>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _controller.duration = widget.duration;
    _controller.value = widget.isSelected ? 1.0 : 0.0;
  }

  @override
  void didUpdateWidget(_SelectableAnimatedBuilder oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.duration != widget.duration) {
      _controller.duration = widget.duration;
    }
    if (oldWidget.isSelected != widget.isSelected) {
      if (widget.isSelected) {
        _controller.forward(from: widget.alwaysDoFullAnimation ? 0 : null);
      } else {
        _controller.reverse(from: widget.alwaysDoFullAnimation ? 1 : null);
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(
      context,
      _controller,
    );
  }
}
