# gluestack-ui-flutter (alpha)

**gluestack-ui-flutter** is a universal UI library that provides optionally styled and accessible widgets. These widgets are designed for easy integration into applications developed with Flutter.

## Documentation

TODO

## Features

- **Customizable widgets:** Each widget in the library comes with a set of customizable props that allow you to tailor its appearance and behavior to your specific needs.

- **Responsive design:** The widgets are built using modern web design principles and are fully responsive, so they work seamlessly across a wide range of devices and screen sizes.

- **Well-documented:** The comes with comprehensive documentation for each widget, including a list of props and examples, to help you get up and running quickly.

- **Easy to use:** The widgets are designed to be easy to use and integrate into your existing Flutter applications. Simply install the library and import the widgets you need.

- **Frequent updates:** We are constantly working on improving the library and adding new widgets. Follow us on GitHub to stay up-to-date on the latest releases and features.

- **Community support:** Need help using the library or have a suggestion for a new feature? Join our [Discord](https://discord.com/invite/95qQ84nf6f) channel to connect with the community and get support.

## Installation

```bash
$ flutter pub add gluestack_ui
```

## Usage

Here is how GSButton widget can be easily integrated into your Flutter app. Here's an example of how to use it:

```dart
import 'package:gluestack_ui/gluestack_ui.dart';

GSButton(
  action: GSActions.negative,
  variant: GSVariants.solid,
  size: GSSizes.$lg,
  onPressed: () {},
  style: GSStyle(
    web: GSStyle(
      bg: $GSColors.amber600,
    ),
    ios: GSStyle(
      bg: $GSColors.pink600,
    ),
    onHover: GSStyle(
      bg: $GSColors.green400,
    ),
    md: GSStyle(
      bg: $GSColors.pink400,
    ),
  ),
  child: const GSButtonText(text: "Click Here"),
)
```

## Contributing

We welcome contributions from the community. If you'd like to contribute to `gluestack_ui`, please read our [contributing guide](./CONTRIBUTING.md) instructions on how to submit a pull request.

## License

Licensed under the MIT License, Copyright © 2023 GeekyAnts. See [LICENSE](./LICENSE) for more information.
