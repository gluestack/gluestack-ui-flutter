import '../gs_exports.dart';

final GoRouter router = GoRouter(
  navigatorKey: navigatorKey,
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: "buttonPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const ButtonPreview();
          },
        ),
        GoRoute(
          path: "inputPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const InputPreview();
          },
        ),
        GoRoute(
          path: "badgePreview",
          builder: (BuildContext context, GoRouterState state) {
            return const BadgePreview();
          },
        ),
        GoRoute(
          path: "switchPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const SwitchPreview();
          },
        ),
        GoRoute(
          path: "avatarPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const AvatarPreview();
          },
        ),
        GoRoute(
          path: "checkboxPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const CheckboxPreview();
          },
        ),
        GoRoute(
          path: "hstackPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const HStackPreview();
          },
        ),
        GoRoute(
          path: "vstackPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const VStackPreview();
          },
        ),
        GoRoute(
          path: "imagePreview",
          builder: (BuildContext context, GoRouterState state) {
            return const ImagePreview();
          },
        ),
        GoRoute(
          path: "radioButtonPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const RadioButtonPreview();
          },
        ),
        GoRoute(
          path: "progressPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const ProgressPreview();
          },
        ),
        GoRoute(
          path: "iconPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const IconPreview();
          },
        ),
        GoRoute(
          path: "textPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const TextPreview();
          },
        ),
        GoRoute(
          path: "headingPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const HeadingPreview();
          },
        ),
        GoRoute(
          path: "dividerPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const DividerPreview();
          },
        ),
        GoRoute(
          path: "centerPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const CenterPreview();
          },
        ),
        GoRoute(
          path: "boxPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const BoxPreview();
          },
        ),
        GoRoute(
          path: "spinnerPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const SpinnerPreview();
          },
        ),
        GoRoute(
          path: "toastPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const ToastPreview();
          },
        ),
        GoRoute(
          path: "linkPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const LinkPreview();
          },
        ),
        GoRoute(
          path: "pressablePreview",
          builder: (BuildContext context, GoRouterState state) {
            return const PressablePreview();
          },
        ),
        GoRoute(
          path: "textareaPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const TextareaPreview();
          },
        ),
        GoRoute(
          path: "alertDialogPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const AlertDialogPreview();
          },
        ),
        GoRoute(
          path: "fabPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const FabPreview();
          },
        ),
        GoRoute(
          path: "formExample",
          builder: (BuildContext context, GoRouterState state) {
            return const FormExample();
          },
        ),
        GoRoute(
          path: "fabExample",
          builder: (BuildContext context, GoRouterState state) {
            return const FabExample();
          },
        ),
        GoRoute(
          path: "linkExample",
          builder: (BuildContext context, GoRouterState state) {
            return const LinkExample();
          },
        ),
        GoRoute(
          path: "switchExample",
          builder: (BuildContext context, GoRouterState state) {
            return const SwitchExample();
          },
        ),
        GoRoute(
          path: "avatarExample",
          builder: (BuildContext context, GoRouterState state) {
            return const AvatarExample();
          },
        ),
        GoRoute(
          path: "textExample",
          builder: (BuildContext context, GoRouterState state) {
            return const TextExample();
          },
        ),
        GoRoute(
          path: "checkboxExample",
          builder: (BuildContext context, GoRouterState state) {
            return const CheckBoxExample();
          },
        ),
        GoRoute(
          path: "headingExample",
          builder: (BuildContext context, GoRouterState state) {
            return const HeadingExample();
          },
        ),
        GoRoute(
          path: "hstackExample",
          builder: (BuildContext context, GoRouterState state) {
            return const HStackExample();
          },
        ),
        GoRoute(
          path: "vstackExample",
          builder: (BuildContext context, GoRouterState state) {
            return const VStackExample();
          },
        ),
        GoRoute(
          path: "buttonExample",
          builder: (BuildContext context, GoRouterState state) {
            return const ButtonExample();
          },
        ),
        GoRoute(
          path: "imageExample",
          builder: (BuildContext context, GoRouterState state) {
            return const ImageExample();
          },
        ),
        GoRoute(
          path: "inputExample",
          builder: (BuildContext context, GoRouterState state) {
            return const InputExample();
          },
        ),
        GoRoute(
          path: "radiobuttonExample",
          builder: (BuildContext context, GoRouterState state) {
            return const RadioButtonExample();
          },
        ),
        GoRoute(
          path: "badgeExample",
          builder: (BuildContext context, GoRouterState state) {
            return const BadgeExample();
          },
        ),
        GoRoute(
          path: "centerExample",
          builder: (BuildContext context, GoRouterState state) {
            return const CenterExample();
          },
        ),
        GoRoute(
          path: "alertExample",
          builder: (BuildContext context, GoRouterState state) {
            return const AlertExample();
          },
        ),
        GoRoute(
          path: "dividerExample",
          builder: (BuildContext context, GoRouterState state) {
            return const DividerExample();
          },
        ),
        GoRoute(
          path: "spinnerExample",
          builder: (BuildContext context, GoRouterState state) {
            return const SpinnerExample();
          },
        ),
        GoRoute(
          path: "progressExample",
          builder: (BuildContext context, GoRouterState state) {
            return const ProgressExample();
          },
        ),
        GoRoute(
          path: "iconExample",
          builder: (BuildContext context, GoRouterState state) {
            return const IconExample();
          },
        ),
        GoRoute(
          path: "textareaExample",
          builder: (BuildContext context, GoRouterState state) {
            return const TextAreaExample();
          },
        ),
        GoRoute(
          path: "pressableExample",
          builder: (BuildContext context, GoRouterState state) {
            return const PressableExample();
          },
        ),
        GoRoute(
          path: "toastExample",
          builder: (BuildContext context, GoRouterState state) {
            return const ToastExample();
          },
        ),
        GoRoute(
          path: "flexExample",
          builder: (BuildContext context, GoRouterState state) {
            return const FlexExample();
          },
        ),
      ],
    ),
  ],
);
