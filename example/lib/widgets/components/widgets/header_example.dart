import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/widgets/components/layout/base_layout.dart';

class HeaderExample extends StatelessWidget {
  const HeaderExample({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = GSTheme.of(context);
    const code = """
        GSVStack(
            children: [
              const GSHeader(
                centerChild: true,
                child: GSText(
                  text: 'GS Header Sample',
                ),
              ),
              GSBox(
                style: GSStyle(
                    margin: const EdgeInsets.all(4),
                    height: 30,
                    width: double.infinity,
                    color: \$GSColors.amber400,
                    borderRadius: 12),
              ),
              GSBox(
                style: GSStyle(
                    margin: const EdgeInsets.all(4),
                    height: 30,
                    width: double.infinity,
                    color: \$GSColors.red400,
                    borderRadius: 12),
              ),
              GSBox(
                style: GSStyle(
                    margin: const EdgeInsets.all(4),
                    height: 30,
                    width: double.infinity,
                    color: \$GSColors.green400,
                    borderRadius: 12),
              ),
            ],
          ),
""";
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.menuColor,
        title: const GSText(
          text: "Header",
          size: GSSizes.$xl,
        ),
      ),
      body: BaseLayout(
        code: code,
        component: GSLayout(
          body: GSVStack(
            children: [
              const GSHeader(
                centerChild: true,
                child: GSText(
                  text: 'GS Header Sample',
                ),
              ),
              GSBox(
                style: GSStyle(
                    margin: const EdgeInsets.all(4),
                    height: 30,
                    width: double.infinity,
                    color: $GSColors.amber400,
                    borderRadius: 12),
              ),
              GSBox(
                style: GSStyle(
                    margin: const EdgeInsets.all(4),
                    height: 30,
                    width: double.infinity,
                    color: $GSColors.red400,
                    borderRadius: 12),
              ),
              GSBox(
                style: GSStyle(
                    margin: const EdgeInsets.all(4),
                    height: 30,
                    width: double.infinity,
                    color: $GSColors.green400,
                    borderRadius: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
