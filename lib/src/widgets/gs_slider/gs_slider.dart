import 'package:flutter/material.dart';
import 'package:gluestack_ui/src/style/gs_config_style_internal.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_slider/gs_slider_filled_track_style.dart';
import 'package:gluestack_ui/src/widgets/gs_slider/gs_slider_style.dart';
import 'package:gluestack_ui/src/widgets/gs_slider/gs_slider_thumb_style.dart';
import 'package:gluestack_ui/src/widgets/gs_slider/gs_slider_track_style.dart';

class GSSlider extends StatefulWidget {
  final bool isReversed;
  final bool isDisabled;
  final IconData? sliderThumbIcon;
  double value;
  final double? trackHeight;
  final double? iconThumbRadius;
  final GSSliderSizes? size;
  final double? secondaryTrackValue;
  final double min;
  final double max;
  final int? divisions;
  final GSSliderOrientation? orientation;
  final String? label;
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? secondaryActiveColor;
  final Color? thumbColor;
  final MaterialStateProperty<Color?>? overlayColor;
  final MouseCursor? mouseCursor;
  final String Function(double)? semanticFormatterCallback;
  final FocusNode? focusNode;
  final bool autofocus;
  final SliderInteraction? allowedInteraction;
  final GSStyle? style;
  final ValueChanged<double>? onChanged;
  GSSlider(
      {super.key,
      this.style,
      this.trackHeight = 10,
      this.iconThumbRadius,
      this.sliderThumbIcon,
      this.size,
      this.isReversed = false,
      this.isDisabled = false,
      this.orientation,
      required this.value,
      this.secondaryTrackValue,
      this.min = 0,
      this.max = 10,
      this.divisions,
      this.label,
      this.activeColor,
      this.inactiveColor,
      this.secondaryActiveColor,
      this.thumbColor,
      this.overlayColor,
      this.mouseCursor,
      this.semanticFormatterCallback,
      this.focusNode,
      this.onChanged,
      this.autofocus = false,
      this.allowedInteraction});

  @override
  State<GSSlider> createState() => _GSSliderState();
}

class _GSSliderState extends State<GSSlider> {
  late double _sliderValue;
  @override
  void initState() {
    super.initState();
    _sliderValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    final sliderSize = widget.size?.toGSSize ?? sliderStyle.props?.size;
    final sliderOrientation =
        widget.orientation ?? sliderStyle.props?.orientation;

    GSConfigStyle styler = resolveStyles(
      context: context,
      styles: [
        sliderStyle,
        sliderStyle.sizeMap(sliderSize),
        sliderOrientation == GSOrientations.horizontal
            ? sliderStyle.variants?.orientation?.horizontal
            : sliderStyle.variants?.orientation?.vertical,
      ],
      inlineStyle: widget.style,
    );

    GSConfigStyle thumbStyler = resolveStyles(
      context: context,
      styles: [sliderThumbStyle],
      inlineStyle: widget.style,
    );

    GSConfigStyle trackStyler = resolveStyles(
      context: context,
      styles: [sliderTrackStyle],
      inlineStyle: widget.style,
    );

    GSConfigStyle filledTrackStyler = resolveStyles(
      context: context,
      styles: [sliderFilledTrackStyle],
      inlineStyle: widget.style,
    );
    int quarterTurns;
    if (widget.orientation == GSSliderOrientation.$horizontal) {
      quarterTurns = 0;
    } else {
      quarterTurns = widget.isReversed ? 1 : 3;
    }

    print(
        Variants.fromMap(data: sliderData['variants']).orientation?.horizontal);
    print(sliderStyle.variants?.orientation?.horizontal?.width);
    print(sliderStyle.variants?.size);
    print(styler.variants?.orientation?.horizontal?.width);
    print("-----");

    return GSAncestor(
      decedentStyles: styler.descendantStyles,
      child: Directionality(
        textDirection: widget.isReversed &&
                widget.orientation == GSSliderOrientation.$horizontal
            ? TextDirection.rtl
            : TextDirection.ltr,
        child: RotatedBox(
          quarterTurns: quarterTurns,
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              thumbColor: widget.isDisabled
                  ? thumbStyler.bg?.getColor(context).withOpacity(0.4)
                  : thumbStyler.bg?.getColor(context),
              trackHeight: widget.trackHeight,
              trackShape: const RoundedRectSliderTrackShape(),
              thumbShape: widget.sliderThumbIcon == null
                  ? const RoundSliderThumbShape(enabledThumbRadius: 20)
                  : CustomSliderThumb(
                      isDisabled: widget.isDisabled,
                      iconThumbRadius: widget.iconThumbRadius ?? 20,
                      sliderThumbIcon: widget.sliderThumbIcon),
              overlayShape: RoundSliderOverlayShape(overlayRadius: 20),
            ),
            child: Slider(
              activeColor: widget.isDisabled
                  ? widget.activeColor?.withOpacity(0.4) ??
                      filledTrackStyler.bg?.getColor(context).withOpacity(0.4)
                  : widget.activeColor ??
                      filledTrackStyler.bg?.getColor(context),
              inactiveColor: widget.isDisabled
                  ? widget.inactiveColor?.withOpacity(0.4) ??
                      trackStyler.bg?.getColor(context).withOpacity(0.4)
                  : widget.inactiveColor ?? trackStyler.bg?.getColor(context),
              allowedInteraction:
                  widget.allowedInteraction ?? SliderInteraction.tapAndSlide,
              value: _sliderValue,
              min: widget.min,
              max: widget.max,
              label: _sliderValue.round().toString(),
              onChanged: widget.isDisabled
                  ? null
                  : (double value) {
                      setState(() {
                        _sliderValue = value;
                      });
                      if (widget.onChanged != null) {
                        widget.onChanged!(value);
                      }
                    },
            ),
          ),
        ),
      ),
    );
  }
}

class CustomSliderThumb extends SliderComponentShape {
  final bool isDisabled;
  final IconData? sliderThumbIcon;
  final double iconThumbRadius;

  CustomSliderThumb({
    required this.isDisabled,
    required this.iconThumbRadius,
    required this.sliderThumbIcon,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size(iconThumbRadius, iconThumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    final Paint paint = Paint()
      ..color = isDisabled
          ? Colors.grey.withOpacity(0.4)
          : sliderTheme.thumbColor ?? Colors.blue
      ..style = PaintingStyle.fill;

    // Draw the thumb circle
    canvas.drawCircle(center, iconThumbRadius, paint);

    // Draw the icon in the center of the thumb
    if (sliderThumbIcon != null) {
      TextPainter iconPainter = TextPainter(
        text: TextSpan(
          text: String.fromCharCode(sliderThumbIcon!.codePoint),
          style: TextStyle(
            fontSize: iconThumbRadius,
            fontFamily: sliderThumbIcon!.fontFamily,
            color: isDisabled ? Colors.grey : Colors.white,
          ),
        ),
        textDirection: textDirection,
      );
      iconPainter.layout();
      iconPainter.paint(canvas,
          center - Offset(iconPainter.width / 2, iconPainter.height / 2));
    }
  }
}
