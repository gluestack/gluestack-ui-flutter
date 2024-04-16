import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/widgets/components/layout/base_layout.dart';
import 'package:gluestack_ui_example/widgets/components/layout/custom_gs_layout.dart';

class SpinnerExample extends StatelessWidget {
  const SpinnerExample({super.key});

  @override
  Widget build(BuildContext context) {
    var code = '''
          GSSpinner(
              size: GSSpinnerSizes.large,
              style: GlueStyle(
                  color: \$GSColors.amber400,
                  bg: \$GSColors.amber200,
              ),
              // strokeWidth: 10,
          ),
  ''';
    return CustomGSLayout(
      title: "Spinner",
      style: GlueStyle(
        dark: GlueStyle(bg: $GSColors.black),
      ),
      body: Center(
        child: BaseLayout(
          code: code,
          component: GSSpinner(
            size: GSSpinnerSizes.large,
            style: GlueStyle(
              color: $GSColors.amber400,
              bg: $GSColors.amber200,
            ),
            // strokeWidth: 10,
          ),
        ),
      ),
    );
  }
}
