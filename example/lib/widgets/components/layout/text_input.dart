import 'package:gluestack_ui/gluestack_ui.dart';

class CustomInput extends StatefulWidget {
  final String title1;
  final String title2;
  final TextEditingController controller1;
  final TextEditingController controller2;
  final Function(String, String) onChanged;

  const CustomInput({
    super.key,
    required this.title1,
    required this.title2,
    required this.controller1,
    required this.controller2,
    required this.onChanged,
  });

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GSText(
          text: widget.title1,
        ),
        GSInput(
          size: GSInputSizes.$md,
          variant: GSInputVariants.outline,
          hintText: "Enter Step Title",
          controller: widget.controller1,
          onChanged: (value) {
            widget.onChanged(widget.controller1.text, widget.controller2.text);
          },
          style: GSStyle(
            width: 200,
          ),
        ),
        const SizedBox(height: 20),
        GSText(
          text: widget.title2,
        ),
        GSInput(
          size: GSInputSizes.$md,
          variant: GSInputVariants.outline,
          hintText: "Enter Step content",
          controller: widget.controller2,
          onChanged: (value) {
            widget.onChanged(widget.controller1.text, widget.controller2.text);
          },
          style: GSStyle(
            width: 200,
          ),
        ),
      ],
    );
  }
}
