import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/widgets/components/layout/base_layout.dart';
import 'package:gluestack_ui_example/widgets/components/layout/custom_gs_layout.dart';

class HeadingExample extends StatelessWidget {
  const HeadingExample({super.key});

  @override
  Widget build(BuildContext context) {
    var code = '''
        GSHeading(
              text: 'This is an example for a Heading',
              style: GSStyle(textStyle: const TextStyle(letterSpacing: 2)),
          )
  ''';
    return CustomGSLayout(
      title: "Heading",
      style: GSStyle(
        dark: GSStyle(bg: $GSColors.black),
      ),
      body: Center(
        child: BaseLayout(
          code: code,
          component: const GSHeading(
            size: GSHeadingSizes.$xs,
            bold: true,
            text: 'This is an example for a Heading',
          ),
        ),
      ),
    );
  }
}
