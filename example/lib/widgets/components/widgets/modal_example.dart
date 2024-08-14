import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/widgets/components/layout/base_layout.dart';
import 'package:gluestack_ui_example/widgets/components/layout/custom_gs_layout.dart';
import 'package:gluestack_ui_example/widgets/components/layout/drop_down.dart';

class ModalExample extends StatefulWidget {
  const ModalExample({super.key});

  @override
  State<ModalExample> createState() => _ModalExampleState();
}

class _ModalExampleState extends State<ModalExample> {
  final List dropdownSizeOptions = [
    GSModalSizes.$xs,
    GSModalSizes.$sm,
    GSModalSizes.$md,
    GSModalSizes.$lg,
    GSModalSizes.$full,
  ];
  GSModalSizes selectedSizeOption = GSModalSizes.$md;

  void updateSizeSelectedOption(dynamic newOption) {
    setState(() {
      selectedSizeOption = newOption;
    });
  }

  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    var code = '''
GSModal(
  isOpen: $isOpen,
  onClose: () {
    setState(() {});
  },
  size: $selectedSizeOption,
  content: GSModalContent(
    header: GSModalHeader(
      closeButton: GSModalCloseButton(
        icon: GSIcon(icon: Icons.close),
        onPressed: () {
          setState(() {
            isOpen = false;
          });
        },
      ),
      child: GSText(
        text: "Invite your team",
        style: GSStyle(
          textStyle: TextStyle(
            color: GSTheme.of(context).background900,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
    body: GSModalBody(
      child: GSText(
        text: "Elevate user interactions with our versatile modals. Seamlessly integrate notifications, forms, and media displays. Make an impact effortlessly.",
      ),
    ),
    footer: GSModalFooter(
      child: GSButtonGroup(
        buttons: [
          GSButton(
            action: GSButtonActions.primary,
            variant: GSButtonVariants.outline,
            child: GSText(
              text: "Cancel",
            ),
            onPressed: () {
              setState(() {
                isOpen = false;
              });
            },
          ),
          GSButton(
            action: GSButtonActions.primary,
            variant: GSButtonVariants.solid,
            child: GSText(
              text: "Explore",
            ),
            onPressed: () {
              setState(() {
                isOpen = false;
              });
            },
          ),
        ],
      ),
    ),
  ),
  child: GSBadge(
    text: GSBadgeText("Show Modal"),
  ),
)
''';

    return CustomGSLayout(
      title: "Modal",
      style: GSStyle(
        dark: GSStyle(bg: $GSColors.black),
      ),
      body: BaseLayout(
        code: code,
        component: GSModal(
            onClose: () {
              setState(() {});
            },
            isOpen: isOpen,
            size: selectedSizeOption,
            content: GSModalContent(
              header: GSModalHeader(
                closeButton: GSModalCloseButton(
                  icon: const GSIcon(icon: Icons.close),
                  onPressed: () {
                    setState(() {
                      isOpen = false;
                    });
                  },
                ),
                child: GSText(
                  text: "Invite your team",
                  style: GSStyle(
                      textStyle: TextStyle(
                          color: GSTheme.of(context).background900,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              body: const GSModalBody(
                child: GSText(
                  text:
                      "Elevate user interactions with our versatile modals. Seamlessly integrate notifications, forms, and media displays. Make an impact effortlessly.",
                ),
              ),
              footer: GSModalFooter(
                child: GSButtonGroup(
                  buttons: [
                    GSButton(
                        action: GSButtonActions.primary,
                        variant: GSButtonVariants.outline,
                        child: const GSText(
                          text: "Cancel",
                        ),
                        onPressed: () {
                          setState(() {
                            isOpen = false;
                          });
                        }),
                    GSButton(
                        action: GSButtonActions.primary,
                        variant: GSButtonVariants.solid,
                        child: const GSText(
                          text: "Explore",
                        ),
                        onPressed: () {
                          setState(() {
                            isOpen = false;
                          });
                        }),
                  ],
                ),
              ),
            ),
            child: const GSBadge(
              text: GSBadgeText("Show Modal"),
            )),
        controls: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomDropDown(
              title: "size",
              dropdownOptions: dropdownSizeOptions,
              selectedOption: selectedSizeOption,
              onChanged: updateSizeSelectedOption,
            ),
          ],
        ),
      ),
    );
  }
}
