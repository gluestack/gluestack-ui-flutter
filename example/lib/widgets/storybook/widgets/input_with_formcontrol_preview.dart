import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class InputWithFormcontrolPreview extends StatelessWidget {
  const InputWithFormcontrolPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return materialWrapper(
      context,
      Storybook(
        initialStory: 'Input',
        stories: [
          Story(
            name: 'Input',
            builder: (context) => GSBox(
              style: GlueStyle(
                  width: 250,
                  height: 300,
                  borderRadius: 8,
                  borderColor: $GSColors.blueGray300,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15)),
              child: GSVStack(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const GSHeading(text: "Login"),
                  const SizedBox(
                    height: 20,
                  ),
                  const GSText(text: 'Email'),
                  GSInput(
                    style: GlueStyle(
                      width: 300,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const GSText(text: 'Password'),
                  GSInput(
                    obscureText: true,
                    style: GlueStyle(
                      width: 300,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GSButton(
                    style: GlueStyle(),
                    onPressed: () {},
                    child: const GSButtonText(text: "Save"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
