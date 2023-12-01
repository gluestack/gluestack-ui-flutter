import 'package:flutter/material.dart';
import 'package:gluestack_ui_example/home.dart';
import 'package:gluestack_ui_example/main.dart';
import 'package:gluestack_ui_example/preview_widgets/badge_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/button_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/input_preview.dart';
import 'package:go_router/go_router.dart';

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
      ],
    ),
  ],
);
