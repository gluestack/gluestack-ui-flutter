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

class GSFormControl extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final Widget child;
  final PopInvokedCallback? onPopInvoked;
  final VoidCallback? onChanged;
  final AutovalidateMode autovalidateMode;
  final bool? canPop;
  final GSFormControlSizes? size;
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
    required this.formKey,
  });

  @override
  State<GSFormControl> createState() => _GSFormControlState();
}

class _GSFormControlState extends State<GSFormControl> {
  bool validateForm() {
    if (widget.formKey.currentState != null &&
        widget.formKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  void resetForm() {
    widget.formKey.currentState?.reset();
  }

  @override
  Widget build(BuildContext context) {
    final size = widget.size?.toGSSize;
    GSConfigStyle styler = resolveStyles(
      context: context,
      styles: [formControlStyle.sizeMap(size)],
      inlineStyle: widget.style,
      isFirst: true,
    );
    return GSAncestor(
      decedentStyles: styler.descendantStyles,
      child: GSFormProvider(
        isDisabled: widget.isDisabled,
        isInvalid: widget.isInvalid,
        isReadOnly: widget.isReadOnly,
        isRequired: widget.isRequired,
        size: size,
        child: Form(
          key: widget.formKey,
          canPop: widget.canPop,
          onChanged: widget.onChanged,
          onPopInvoked: widget.onPopInvoked,
          autovalidateMode: widget.autovalidateMode,
          child: widget.child,
        ),
      ),
    );
  }
}
