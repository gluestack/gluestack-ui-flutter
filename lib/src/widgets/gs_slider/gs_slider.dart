import 'package:flutter/material.dart';
import 'package:gluestack_ui/src/style/gs_config_style_internal.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_slider/gs_slider_filled_track_style.dart';
import 'package:gluestack_ui/src/widgets/gs_slider/gs_slider_style.dart';
import 'package:gluestack_ui/src/widgets/gs_slider/gs_slider_thumb_style.dart';
import 'package:gluestack_ui/src/widgets/gs_slider/gs_slider_track_style.dart';
import 'package:gluestack_ui/src/widgets/gs_style_builder/gs_style_builder.dart';

class GSSlider extends StatefulWidget {
  final bool isReversed;
  final bool isDisabled;
  double value;
  double max;
  double min;
  final GSSliderSizes? size;
  final GSOrientations? orientation;
  final GSStyle? style;
  final ValueChanged<double>? onChanged;
  GSSlider(
      {super.key,
      this.style,
      this.size,
      this.min = 0,
      this.max = 10,
      this.isReversed = false,
      this.isDisabled = false,
      this.orientation,
      required this.value,
      this.onChanged});

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

    return GSStyleBuilder(
        isDisabled: widget.isDisabled,
        child: Builder(builder: (context) {
          GSConfigStyle styler = resolveStyles(
            context: context,
            styles: [
              sliderStyle,
              sliderStyle.sizeMap(sliderSize),
              sliderStyle.compoundVariants?[
                  sliderOrientation.toString() + sliderSize.toString()]
            ],
            inlineStyle: widget.style,
          );

          GSConfigStyle thumbStyler = resolveStyles(
              context: context,
              styles: [sliderThumbStyle],
              inlineStyle: widget.style);
              print(thumbStyler.bg);

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
          if (widget.orientation == GSOrientations.horizontal) {
            quarterTurns = 0;
          } else {
           
            quarterTurns = widget.isReversed ? 1 : 3;
          }
          return GSAncestor(
            decedentStyles: styler.descendantStyles,
            child: Directionality(
              textDirection: widget.isReversed &&
                      widget.orientation == GSOrientations.horizontal
                  ? TextDirection.rtl
                  : TextDirection.ltr,
              child: RotatedBox(
                quarterTurns: quarterTurns,
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbColor: widget.isDisabled
                        ? thumbStyler.bg?.getColor(context).withOpacity(0.4)
                        : thumbStyler.bg?.getColor(context),
                    trackHeight: widget.orientation == GSOrientations.horizontal
                        ? styler.trackHeight
                        : styler.trackWidth ?? 10,
                    trackShape: const RoundedRectSliderTrackShape(),
                    thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: (styler.thumbHeight ?? 40) / 2),
                    overlayShape: RoundSliderOverlayShape(
                        overlayRadius: (styler.thumbHeight ?? 40) / 2),
                  ),
                  child: Slider(
                    activeColor: widget.isDisabled
                        ? filledTrackStyler.bg
                            ?.getColor(context)
                            .withOpacity(0.4)
                        : filledTrackStyler.bg?.getColor(context),
                    inactiveColor: widget.isDisabled
                        ? trackStyler.bg?.getColor(context).withOpacity(0.4)
                        : trackStyler.bg?.getColor(context),
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
        }));
  }
}
