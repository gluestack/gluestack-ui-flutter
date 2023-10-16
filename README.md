# gluestack_flutter

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Table of Contents

- File Structure
- Implementation
- Usage
- Contributing

## File Structure

The project's file structure is organized as follows:

```
├── lib/
│   ├── main.dart
│   ├── widgets/
│   │   ├── gs_box
│   │   ├── gs_button
│   ├── style/
│   │   ├── style_data.dart
│   ├── tokens/
│   │   ├── color_token.dart
├── pubspec.yaml
├── README.md
```

## Implementation

Here is a little elaboration on how we are creating apis. For every api that we create we follow these steps where required:

#### Tokens

This file serves as a token file, defining essential constants, enums, and base styles used in a GS component.
Enums like action, variant, size, etc, define the possible values for different attributes of a component.
You can refer [here](lib/widgets/gs_button/gs_button_token.dart)

#### Attributes

This file defines the attributes class, which provides a configuration mechanism for customizing the visual style of GS components. The mapping of this class allows you to configure how component should appear in different scenarios.
You can refer [here](lib/widgets/gs_button/gs_button_attributes.dart)

#### Provider

This file defines the GS Provider class, which is an InheritedWidget used to share the component's attributes throughout the widget tree. The updateShouldNotify method is used to determine if the widget should notify its descendants of changes in component's attributes, ensuring that updates are propagated effectively.
You can refer [here](lib/widgets/gs_button/gs_button_provider.dart)

#### Style

This file defines the StyleData class, which is used for customizing the visual style of GS components.
It can be used to specify various styles, including colors, border colors, border radii, font sizes, and more, based on the context (theme mode and screen size).
The StyleData class is designed to facilitate the customization of component's appearance according to the app's design and responsive needs.
You can refer [here](lib/style/style_data.dart)

## Usage

Here is how GSButton component can be easily integrated into your Flutter app. Here's an example of how to use it:

```
import 'package:your_package/gs_button.dart';

GSButton(
  action: GSButtonAction.primary,
  variant: GSButtonVariant.solid,
  size: GSButtonSize.lg,
  onPressed: () {
    // Add your button click logic here
  },
  style: StyleData(context)
      .onDark(color: $GSColors.purple800)
      .sm(color: $GSColors.green500)
      .smDark(color: $GSColors.amber400),
  child: const GSButtonText(text: "Click Here"),
)
```

This code snippet demonstrates how to create a GSButton with various customization options, such as action, variant, size, and style. You can easily customize the button's appearance and behavior to match your app's design.

## Contributing

We welcome contributions from the community. If you'd like to contribute to the Gluestack Flutter Package, please follow these steps:

- Open an issue to discuss your idea or bug report.
- Fork the repository and create a new branch for your contribution.
- Implement your changes and tests.
- Create a pull request to submit your contribution.
