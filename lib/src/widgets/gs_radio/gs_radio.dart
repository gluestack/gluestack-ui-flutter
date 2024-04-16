import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_form_control/gs_form_provider.dart';
import 'package:gluestack_ui/src/widgets/gs_radio/gs_radio_style.dart';
import 'package:gluestack_ui/src/utils/extension.dart';
import 'package:gluestack_ui/src/widgets/gs_style_builder/gs_style_builder.dart';

/*

what is achieved so far

   1) invaild state
   2) disable state
   3) hover state (default)
   4) support for inline style


what is pending

    1) managing hover state on custom inline style
    2) making radio icon circle hoverable
    3) passing props to children

*/

class GSRadio<T> extends StatelessWidget {
  final GSRadioSizes? size;
  final Widget icon;
  final Widget? label;
  final T value;
  final T groupValue;
  final bool? isDisabled;
  final bool? isInvalid;
  final GlueStyle? style;
  final void Function(T? value)? onChanged;

  const GSRadio(
      {super.key,
      required this.icon,
      required this.groupValue,
      required this.value,
      required this.onChanged,
      this.style,
      this.isDisabled,
      this.isInvalid,
      this.label,
      this.size});

  @override
  Widget build(BuildContext context) {
    final formProps = GSFormProvider.of(context);
    final radioSize = size?.toGSSize ??
        formProps?.size ??
        radioStyle.props?.size ??
        GSSizes.$md;
    bool? isRadioDisabled = isDisabled;
    bool? isRadioReadOnly = formProps?.isReadOnly ?? false;
    bool? isRadioInvalid = isInvalid;
    // final isRadioRequired = GSFormProvider.of(context)?.isRequired ?? false;

    isRadioDisabled == null
        ? isRadioDisabled = formProps?.isDisabled ?? false
        : null;
    isRadioInvalid == null
        ? isRadioInvalid = formProps?.isInvalid ?? false
        : null;

    final styler = resolveStyles(
        context: context,
        styles: [
          radioStyle,
        ],
        inlineStyle: style);

    return GSAncestor(
      decedentStyles: styler.descendantStyles,
      child: GSStyleBuilder(
        child: MouseRegion(
          cursor: isRadioDisabled
              ? SystemMouseCursors.forbidden
              : SystemMouseCursors.click,
          child: GsGestureDetector(
            onPressed: () {
              if (!isRadioDisabled! &&
                  value != groupValue &&
                  !isRadioReadOnly) {
                onChanged!.call(value);
              }
            },
            child: GSRadioProvider<T>(
                value: value,
                groupValue: groupValue,
                onChanged: null,
                size: radioSize,
                style: style,
                isInvalid: isRadioInvalid,
                isDisabled: isRadioDisabled,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [icon, if (label != null) label!],
                )),
          ),
        ),
      ),
    );
  }
}
