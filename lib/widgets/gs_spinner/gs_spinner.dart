import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/style/style_resolver.dart';
import 'package:gluestack_flutter_pro/token/index.dart';
import 'package:gluestack_flutter_pro/widgets/gs_spinner/gs_spinner_style.dart';

class GSSpinner extends StatelessWidget {
  final GSSpinnerSize? size;
  final GSStyle? style;

  const GSSpinner({super.key, this.style, this.size});

  @override
  Widget build(BuildContext context) {
    GSStyle styler = resolveStyles(
      context,
      variantStyle: spinnerStyle,
      inlineStyle: style,
    )!;
    final spinnerColor = styler.color ?? spinnerStyle.props?.color;
    return SizedBox(
      width: styler.width,
      height: styler.height,
      child: CircularProgressIndicator(
        strokeWidth: $GSBorderWidth.$4,
        valueColor: AlwaysStoppedAnimation<Color>(spinnerColor!),
      ),
    );
  }
}
