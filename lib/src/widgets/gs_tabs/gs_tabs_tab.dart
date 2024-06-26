import 'package:gluestack_ui/src/style/gs_config_style_internal.dart';

class GSTab extends StatelessWidget {
  final GSStyle? style;
  final Widget child;
  final Alignment? alignment;
  const GSTab({
    super.key,
    this.style,
    required this.child,
    this.alignment = Alignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}
