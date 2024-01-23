import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class GSApp extends WidgetsApp {
  GSApp({
    super.key,
    super.navigatorKey,
    super.onGenerateRoute,
    super.onGenerateInitialRoutes,
    super.onUnknownRoute,
    super.onNavigationNotification,
    List<NavigatorObserver> super.navigatorObservers =
        const <NavigatorObserver>[],
    super.initialRoute,
    super.pageRouteBuilder,
    super.home,
    Map<String, WidgetBuilder> super.routes = const <String, WidgetBuilder>{},
    super.builder,
    super.title = '',
    super.onGenerateTitle,
    super.textStyle,
    required super.color,
    super.locale,
    super.localizationsDelegates,
    super.localeListResolutionCallback,
    super.localeResolutionCallback,
    super.supportedLocales = const <Locale>[Locale('en', 'US')],
    super.showPerformanceOverlay = false,
    super.checkerboardRasterCacheImages = false,
    super.checkerboardOffscreenLayers = false,
    super.showSemanticsDebugger = false,
    super.debugShowWidgetInspector = false,
    super.debugShowCheckedModeBanner = true,
    super.inspectorSelectButtonBuilder,
    super.shortcuts,
    super.actions,
    super.restorationScopeId,
    @Deprecated('Remove super parameter as it is now ignored. '
        'WidgetsApp never introduces its own MediaQuery; the View widget takes care of that. '
        'super feature was deprecated after v3.7.0-29.0.pre.')
    super.useInheritedMediaQuery = false,
  })  : assert(
          home == null || onGenerateInitialRoutes == null,
          'If onGenerateInitialRoutes is specified, the home argument will be '
          'redundant.',
        ),
        assert(
          home == null || !routes.containsKey(Navigator.defaultRouteName),
          'If the home property is specified, the routes table '
          'cannot include an entry for "/", since it would be redundant.',
        ),
        assert(
          builder != null ||
              home != null ||
              routes.containsKey(Navigator.defaultRouteName) ||
              onGenerateRoute != null ||
              onUnknownRoute != null,
          'Either the home property must be specified, '
          'or the routes table must include an entry for "/", '
          'or there must be on onGenerateRoute callback specified, '
          'or there must be an onUnknownRoute callback specified, '
          'or the builder property must be specified, '
          'because otherwise there is nothing to fall back on if the '
          'app is started with an intent that specifies an unknown route.',
        ),
        assert(
          (home != null ||
                  routes.isNotEmpty ||
                  onGenerateRoute != null ||
                  onUnknownRoute != null) ||
              (builder != null &&
                  navigatorKey == null &&
                  initialRoute == null &&
                  navigatorObservers.isEmpty),
          'If no route is provided using '
          'home, routes, onGenerateRoute, or onUnknownRoute, '
          'a non-null callback for the builder property must be provided, '
          'and the other navigator-related properties, '
          'navigatorKey, initialRoute, and navigatorObservers, '
          'must have their initial values '
          '(null, null, and the empty list, respectively).',
        ),
        assert(
          builder != null ||
              onGenerateRoute != null ||
              pageRouteBuilder != null,
          'If neither builder nor onGenerateRoute are provided, the '
          'pageRouteBuilder must be specified so that the default handler '
          'will know what kind of PageRoute transition to build.',
        ),
        assert(supportedLocales.isNotEmpty);

  GSApp.router({
    Key? key,
    RouteInformationProvider? routeInformationProvider,
    RouteInformationParser<Object>? routeInformationParser,
    RouterDelegate<Object>? routerDelegate,
    RouterConfig<Object>? routerConfig,
    BackButtonDispatcher? backButtonDispatcher,
    TransitionBuilder? builder,
    String title = '',
    GenerateAppTitle? onGenerateTitle,
    Color color = const Color(0xFFFFFFFF),
    Locale? locale,
    Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates,
    LocaleListResolutionCallback? localeListResolutionCallback,
    LocaleResolutionCallback? localeResolutionCallback,
    Iterable<Locale> supportedLocales = const <Locale>[Locale('en', 'US')],
    bool showPerformanceOverlay = false,
    bool checkerboardRasterCacheImages = false,
    bool checkerboardOffscreenLayers = false,
    bool showSemanticsDebugger = false,
    bool debugShowWidgetInspector = false,
    bool debugShowCheckedModeBanner = true,
    InspectorSelectButtonBuilder? inspectorSelectButtonBuilder,
    Map<ShortcutActivator, Intent>? shortcuts,
    Map<Type, Action<Intent>>? actions,
    String? restorationScopeId,
  }) : super.router(
          key: key,
          routeInformationProvider: routeInformationProvider,
          routeInformationParser: routeInformationParser,
          routerDelegate: routerDelegate,
          backButtonDispatcher: backButtonDispatcher,
          builder: builder,
          title: title,
          onGenerateTitle: onGenerateTitle,
          color: color,
          locale: locale,
          localizationsDelegates: localizationsDelegates,
          localeListResolutionCallback: localeListResolutionCallback,
          localeResolutionCallback: localeResolutionCallback,
          supportedLocales: supportedLocales,
          showPerformanceOverlay: showPerformanceOverlay,
          checkerboardRasterCacheImages: checkerboardRasterCacheImages,
          checkerboardOffscreenLayers: checkerboardOffscreenLayers,
          showSemanticsDebugger: showSemanticsDebugger,
          debugShowWidgetInspector: debugShowWidgetInspector,
          debugShowCheckedModeBanner: debugShowCheckedModeBanner,
          inspectorSelectButtonBuilder: inspectorSelectButtonBuilder,
          shortcuts: shortcuts,
          actions: actions,
          restorationScopeId: restorationScopeId,
        );
}

//
class GSAppRouter extends StatelessWidget {
  final RouteInformationProvider? routeInformationProvider;
  final RouteInformationParser<Object>? routeInformationParser;
  final RouterDelegate<Object>? routerDelegate;
  final RouterConfig<Object>? routerConfig;
  final BackButtonDispatcher? backButtonDispatcher;
  final TransitionBuilder? builder;
  final String title;
  final GenerateAppTitle? onGenerateTitle;
  final Color color;
  final Locale? locale;
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;
  final LocaleListResolutionCallback? localeListResolutionCallback;
  final LocaleResolutionCallback? localeResolutionCallback;
  final Iterable<Locale> supportedLocales;
  final bool showPerformanceOverlay;
  final bool checkerboardRasterCacheImages;
  final bool checkerboardOffscreenLayers;
  final bool showSemanticsDebugger;
  final bool debugShowWidgetInspector;
  final bool debugShowCheckedModeBanner;
  final InspectorSelectButtonBuilder? inspectorSelectButtonBuilder;
  final Map<ShortcutActivator, Intent>? shortcuts;
  final Map<Type, Action<Intent>>? actions;
  final String? restorationScopeId;

  const GSAppRouter({
    super.key,
    this.routeInformationParser,
    this.routeInformationProvider,
    this.routerDelegate,
    this.routerConfig,
    this.title = '',
    this.color = const Color(0xffffffff),
    this.backButtonDispatcher,
    this.builder,
    this.onGenerateTitle,
    this.locale,
    this.localizationsDelegates = const [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.inspectorSelectButtonBuilder,
    this.shortcuts,
    this.actions,
    this.restorationScopeId,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.showPerformanceOverlay = false,
    this.checkerboardRasterCacheImages = false,
    this.debugShowCheckedModeBanner = true,
    this.checkerboardOffscreenLayers = false,
    this.showSemanticsDebugger = false,
    this.debugShowWidgetInspector = false,
  });

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      child: WidgetsApp.router(
        routerConfig: routerConfig,
        routeInformationProvider: routeInformationProvider,
        routeInformationParser: routeInformationParser,
        routerDelegate: routerDelegate,
        backButtonDispatcher: backButtonDispatcher,
        builder: builder,
        title: title,
        onGenerateTitle: onGenerateTitle,
        color: color,
        locale: locale,
        localizationsDelegates: localizationsDelegates,
        localeListResolutionCallback: localeListResolutionCallback,
        localeResolutionCallback: localeResolutionCallback,
        supportedLocales: supportedLocales,
        showPerformanceOverlay: showPerformanceOverlay,
        checkerboardRasterCacheImages: checkerboardRasterCacheImages,
        checkerboardOffscreenLayers: checkerboardOffscreenLayers,
        showSemanticsDebugger: showSemanticsDebugger,
        debugShowWidgetInspector: debugShowWidgetInspector,
        debugShowCheckedModeBanner: debugShowCheckedModeBanner,
        inspectorSelectButtonBuilder: inspectorSelectButtonBuilder,
        shortcuts: shortcuts,
        actions: actions,
        restorationScopeId: restorationScopeId,
      ),
    );
  }
}
