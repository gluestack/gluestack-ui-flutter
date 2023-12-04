import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_form_control/gs_form_control_style.dart';
import 'package:gluestack_ui/src/widgets/gs_form_control/gs_form_provider.dart';

/*
Form Control Compatible Components:
    - GSInput //TODO: handle error text resize thingy
    - TextArea //TODO: use textform field and add isRequired support!
    - Checkbox //TODO: isRequired support, TBD?
    - Radio  //TODO: isRequired support, TBD?
    TO DO ->  (x) slider, (x) dropdown
    [(x) -> Not made yet, TBD]
*/
class GSFormControl extends StatelessWidget {
  final Widget child;
  final PopInvokedCallback? onPopInvoked;
  final VoidCallback? onChanged;
  final AutovalidateMode autovalidateMode;
  final bool? canPop;
  final GSSizes? size;
  final GSStyle? style;

  //H O P
  final bool? isDisabled;
  final bool? isInvalid;
  final bool? isReadOnly;
  final bool? isRequired;

  const GSFormControl({
    super.key,
    required this.child,
    this.onPopInvoked,
    this.onChanged,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.canPop,
    this.size,
    this.style,
    this.isDisabled = false,
    this.isInvalid = false,
    this.isReadOnly = false,
    this.isRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    GSStyle styler = resolveStyles(context,
        size: GSFormControlStyle.size[size],
        inlineStyle: style,
        // descendantStyles: GSFormControlStyle.fromControlDescendantStyles[widget.size],
        descendantStyleKeys: gsFromControlConfig.descendantStyle)!;

    return GSAncestor(
      decedentStyles: styler.descendantStyles,
      child: GSFormProvider(
        isDisabled: isDisabled,
        isInvalid: isInvalid,
        isReadOnly: isReadOnly,
        isRequired: isRequired,
        child: Form(
          key: key,
          canPop: canPop,
          onChanged: onChanged,
          onPopInvoked: onPopInvoked,
          autovalidateMode: autovalidateMode,
          child: child,
        ),
      ),
    );
  }
}
