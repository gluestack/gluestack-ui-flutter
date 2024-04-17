import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/widgets/components/layout/base_layout.dart';
import 'package:gluestack_ui_example/widgets/components/layout/custom_gs_layout.dart';

class LinkExample extends StatelessWidget {
  const LinkExample({super.key});

  @override
  Widget build(BuildContext context) {
    var code = '''
          GSLink(
              style: GSStyle(),
              url: 'https://gluestack.io/',
              text: const GSLinkText(text: 'Go to Gluestack'),
          )
  ''';
    return CustomGSLayout(
      title: "Link",
      style: GSStyle(
        dark: GSStyle(bg: $GSColors.black),
      ),
      body: Center(
        child: BaseLayout(
          code: code,
          component: GSLink(
            style: GSStyle(),
            url: 'https://gluestack.io/',
            text: const GSLinkText(text: 'Go to Gluestack'),
          ),
        ),
      ),
    );
  }
}
