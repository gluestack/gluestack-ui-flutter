import '../gs_exports.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    const elementSpacing = SizedBox(height: 20);
    return Scaffold(
      appBar: AppBar(
        title: GSText(
          text: GSStringConstants.kGSTitle,
          style: GSStyle(textStyle: const TextStyle(fontSize: 25)),
        ),
      ),
      body: SingleChildScrollView(
        child: GSCenter(
          child: GSVStack(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: [
              elementSpacing,
              CustomGSPressableButton(
                buttonText: GSStringConstants.kPreviewButton,
                onPress: () => router.push("/${GSRoutes.buttonPreview.name}"),
              ),
              elementSpacing,
              CustomGSPressableButton(
                buttonText: GSStringConstants.kPreviewInput,
                onPress: () => router.push("/${GSRoutes.inputPreview.name}"),
              ),
              elementSpacing,
              CustomGSPressableButton(
                buttonText: GSStringConstants.kPreviewBadge,
                onPress: () => router.push("/${GSRoutes.badgePreview.name}"),
              ),
              elementSpacing,
              CustomGSPressableButton(
                buttonText: GSStringConstants.kPreviewSwitch,
                onPress: () => router.push("/${GSRoutes.switchPreview.name}"),
              ),
              elementSpacing,
              CustomGSPressableButton(
                buttonText: GSStringConstants.kPreviewAvatar,
                onPress: () => router.push("/${GSRoutes.avatarPreview.name}"),
              ),
              elementSpacing,
              CustomGSPressableButton(
                buttonText: GSStringConstants.kPreviewCheckbox,
                onPress: () => router.push("/${GSRoutes.checkboxPreview.name}"),
              ),
              elementSpacing,
              CustomGSPressableButton(
                buttonText: GSStringConstants.kPreviewHStack,
                onPress: () => router.push("/${GSRoutes.hstackPreview.name}"),
              ),
              elementSpacing,
              CustomGSPressableButton(
                buttonText: GSStringConstants.kPreviewVStack,
                onPress: () => router.push("/${GSRoutes.vstackPreview.name}"),
              ),
              elementSpacing,
              CustomGSPressableButton(
                buttonText: GSStringConstants.kPreviewImage,
                onPress: () => router.push("/${GSRoutes.imagePreview.name}"),
              ),
              elementSpacing,
              CustomGSPressableButton(
                buttonText: GSStringConstants.kPreviewRadioButton,
                onPress: () =>
                    router.push("/${GSRoutes.radioButtonPreview.name}"),
              ),
              elementSpacing,
              CustomGSPressableButton(
                buttonText: GSStringConstants.kPreviewProgress,
                onPress: () => router.push("/${GSRoutes.progressPreview.name}"),
              ),
              elementSpacing,
              CustomGSPressableButton(
                buttonText: GSStringConstants.kPreviewIcon,
                onPress: () => router.push("/${GSRoutes.iconPreview.name}"),
              ),
              elementSpacing,
              CustomGSPressableButton(
                buttonText: GSStringConstants.kPreviewText,
                onPress: () => router.push("/${GSRoutes.textPreview.name}"),
              ),
              elementSpacing,
              CustomGSPressableButton(
                buttonText: GSStringConstants.kPreviewHeading,
                onPress: () => router.push("/${GSRoutes.headingPreview.name}"),
              ),
              elementSpacing,
              CustomGSPressableButton(
                buttonText: GSStringConstants.kPreviewDivider,
                onPress: () => router.push("/${GSRoutes.dividerPreview.name}"),
              ),
              elementSpacing,
              CustomGSPressableButton(
                buttonText: GSStringConstants.kPreviewCenter,
                onPress: () => router.push("/${GSRoutes.centerPreview.name}"),
              ),
              elementSpacing,
              CustomGSPressableButton(
                buttonText: GSStringConstants.kPreviewBox,
                onPress: () => router.push("/${GSRoutes.boxPreview.name}"),
              ),
              elementSpacing,
              CustomGSPressableButton(
                buttonText: GSStringConstants.kPreviewSpinner,
                onPress: () => router.push("/${GSRoutes.spinnerPreview.name}"),
              ),
              elementSpacing,
              CustomGSPressableButton(
                buttonText: GSStringConstants.kPreviewToast,
                onPress: () => router.push("/${GSRoutes.toastPreview.name}"),
              ),
              elementSpacing,
              CustomGSPressableButton(
                buttonText: GSStringConstants.kPreviewLink,
                onPress: () => router.push("/${GSRoutes.linkPreview.name}"),
              ),
              elementSpacing,
              CustomGSPressableButton(
                buttonText: GSStringConstants.kPreviewPressable,
                onPress: () =>
                    router.push("/${GSRoutes.pressablePreview.name}"),
              ),
              elementSpacing,
              CustomGSPressableButton(
                buttonText: GSStringConstants.kPreviewTextArea,
                onPress: () => router.push("/${GSRoutes.textareaPreview.name}"),
              ),
              elementSpacing,
              CustomGSPressableButton(
                buttonText: GSStringConstants.kPreviewAlertDialog,
                onPress: () =>
                    router.push("/${GSRoutes.alertDialogPreview.name}"),
              ),
              elementSpacing,
              CustomGSPressableButton(
                buttonText: GSStringConstants.kPreviewFab,
                onPress: () => router.push("/${GSRoutes.fabPreview.name}"),
              ),
              elementSpacing,
              CustomGSPressableButton(
                buttonText: GSStringConstants.kGSForm,
                onPress: () => router.push("/${GSRoutes.formExample.name}"),
              ),
              elementSpacing,
              CustomGSPressableButton(
                buttonText: GSStringConstants.kGSFab,
                onPress: () => router.push("/${GSRoutes.fabExample.name}"),
              ),
              elementSpacing,
              CustomGSPressableButton(
                buttonText: GSStringConstants.kGSSwitch,
                onPress: () => router.push("/${GSRoutes.switchExample.name}"),
              ),
              elementSpacing,
              CustomGSPressableButton(
                buttonText: GSStringConstants.kGSLink,
                onPress: () => router.push("/${GSRoutes.linkExample.name}"),
              ),
              elementSpacing,
              CustomGSPressableButton(
                buttonText: GSStringConstants.kGSAvatar,
                onPress: () => router.push("/${GSRoutes.avatarExample.name}"),
              ),
              elementSpacing,
              CustomGSPressableButton(
                buttonText: GSStringConstants.kGSText,
                onPress: () => router.push("/${GSRoutes.textExample.name}"),
              ),
              elementSpacing,
              CustomGSPressableButton(
                buttonText: GSStringConstants.kGSCheckBox,
                onPress: () => router.push("/${GSRoutes.checkboxExample.name}"),
              ),
              elementSpacing,
              CustomGSPressableButton(
                buttonText: GSStringConstants.kGSHeading,
                onPress: () => router.push("/${GSRoutes.headingExample.name}"),
              ),
              elementSpacing,
              CustomGSPressableButton(
                buttonText: GSStringConstants.kGSHStack,
                onPress: () => router.push("/${GSRoutes.hstackExample.name}"),
              ),
              elementSpacing,
              CustomGSPressableButton(
                buttonText: GSStringConstants.kGSVStack,
                onPress: () => router.push("/${GSRoutes.vstackExample.name}"),
              ),
              elementSpacing,
              CustomGSPressableButton(
                buttonText: GSStringConstants.kGSButton,
                onPress: () => router.push("/${GSRoutes.buttonExample.name}"),
              ),
              elementSpacing,
              CustomGSPressableButton(
                buttonText: GSStringConstants.kGSImage,
                onPress: () => router.push("/${GSRoutes.imageExample.name}"),
              ),
              elementSpacing,
              CustomGSPressableButton(
                buttonText: GSStringConstants.kGSInput,
                onPress: () => router.push("/${GSRoutes.inputExample.name}"),
              ),
              elementSpacing,
              CustomGSPressableButton(
                buttonText: GSStringConstants.kGSRadioButton,
                onPress: () =>
                    router.push("/${GSRoutes.radiobuttonExample.name}"),
              ),
              elementSpacing,
              CustomGSPressableButton(
                buttonText: GSStringConstants.kGSBadge,
                onPress: () => router.push("/${GSRoutes.badgeExample.name}"),
              ),
              elementSpacing,
              CustomGSPressableButton(
                buttonText: GSStringConstants.kGSCenter,
                onPress: () => router.push("/${GSRoutes.centerExample.name}"),
              ),
              elementSpacing,
              CustomGSPressableButton(
                buttonText: GSStringConstants.kGSAlert,
                onPress: () => router.push("/${GSRoutes.alertExample.name}"),
              ),
              elementSpacing,
              CustomGSPressableButton(
                buttonText: GSStringConstants.kGSDivider,
                onPress: () => router.push("/${GSRoutes.dividerExample.name}"),
              ),
              elementSpacing,
              CustomGSPressableButton(
                buttonText: GSStringConstants.kGSSpinner,
                onPress: () => router.push("/${GSRoutes.spinnerExample.name}"),
              ),
              elementSpacing,
              CustomGSPressableButton(
                buttonText: GSStringConstants.kGSProgress,
                onPress: () => router.push("/${GSRoutes.progressExample.name}"),
              ),
              elementSpacing,
              CustomGSPressableButton(
                buttonText: GSStringConstants.kGSIcon,
                onPress: () => router.push("/${GSRoutes.iconExample.name}"),
              ),
              elementSpacing,
              CustomGSPressableButton(
                buttonText: GSStringConstants.kGSTextArea,
                onPress: () => router.push("/${GSRoutes.textareaExample.name}"),
              ),
              elementSpacing,
              CustomGSPressableButton(
                buttonText: GSStringConstants.kGSPressable,
                onPress: () =>
                    router.push("/${GSRoutes.pressableExample.name}"),
              ),
              elementSpacing,
              CustomGSPressableButton(
                buttonText: GSStringConstants.kGSToast,
                onPress: () => router.push("/${GSRoutes.toastExample.name}"),
              ),
              elementSpacing,
              CustomGSPressableButton(
                buttonText: GSStringConstants.kGSFlex,
                onPress: () => router.push("/${GSRoutes.flexExample.name}"),
              ),
              elementSpacing,
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          myAppStateKey.currentState?.toggleThemeMode();
        },
        child: Icon(
          Theme.of(context).brightness == Brightness.dark
              ? Icons.light_mode
              : Icons.dark_mode,
        ),
      ),
    );
  }
}

class CustomGSPressableButton extends StatelessWidget {
  final void Function()? onPress;
  final String buttonText;
  const CustomGSPressableButton({
    super.key,
    this.onPress,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return GSPressable(
      onPress: onPress,
      child: GSText(
        underline: true,
        style: GSStyle(
            textStyle: TextStyle(
          fontSize: 20,
          color: $GSColors.blue400,
        )),
        text: buttonText,
      ),
    );
  }
}
