import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gluestack_ui/src/widgets/gs_app/gs_theme.dart';

enum GSThemeMode {
  system,
  light,
  dark,
}

class GSApp extends StatefulWidget {
  const GSApp({
    super.key,
    this.navigatorKey,
    this.onGenerateRoute,
    this.onGenerateInitialRoutes,
    this.onUnknownRoute,
    this.navigatorObservers = const <NavigatorObserver>[],
    this.initialRoute,
    this.home,
    this.routes = const <String, WidgetBuilder>{},
    this.builder,
    this.title = '',
    this.onGenerateTitle,
    this.color,
    this.locale,
    this.localizationsDelegates,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.showPerformanceOverlay = false,
    this.checkerboardRasterCacheImages = false,
    this.checkerboardOffscreenLayers = false,
    this.showSemanticsDebugger = false,
    this.debugShowCheckedModeBanner = true,
    this.shortcuts,
    this.actions,
    this.theme,
    this.darkTheme,
    this.themeMode,
    this.restorationScopeId,
    this.scrollBehavior = const GSAppScrollBehavior(),
    this.pageRouteBuilder,
  })  : routeInformationProvider = null,
        routeInformationParser = null,
        routerDelegate = null,
        backButtonDispatcher = null,
        routerConfig = null;

  GSApp.router({
    super.key,
    this.theme,
    this.darkTheme,
    this.themeMode,
    this.routeInformationProvider,
    this.routeInformationParser,
    this.routerDelegate,
    this.backButtonDispatcher,
    this.routerConfig,
    this.builder,
    this.title = '',
    this.onGenerateTitle,
    this.color,
    this.locale,
    this.localizationsDelegates = const [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.showPerformanceOverlay = false,
    this.checkerboardRasterCacheImages = false,
    this.checkerboardOffscreenLayers = false,
    this.showSemanticsDebugger = false,
    this.debugShowCheckedModeBanner = true,
    this.shortcuts,
    this.actions,
    this.restorationScopeId,
    this.scrollBehavior = const GSAppScrollBehavior(),
    this.pageRouteBuilder,
  })  : assert(() {
          if (routerConfig != null) {
            assert(
              (routeInformationProvider ??
                      routeInformationParser ??
                      routerDelegate ??
                      backButtonDispatcher) ==
                  null,
              'If the routerConfig is provided, all the other router delegates must not be provided',
            );
            return true;
          }
          assert(routerDelegate != null,
              'Either one of routerDelegate or routerConfig must be provided');
          assert(
            routeInformationProvider == null || routeInformationParser != null,
            'If routeInformationProvider is provided, routeInformationParser must also be provided',
          );
          return true;
        }()),
        assert(supportedLocales.isNotEmpty),
        navigatorObservers = null,
        navigatorKey = null,
        onGenerateRoute = null,
        home = null,
        onGenerateInitialRoutes = null,
        onUnknownRoute = null,
        routes = null,
        initialRoute = null;

  /// A key for the navigator, allowing for interaction with the navigator from outside of it.
  final GlobalKey<NavigatorState>? navigatorKey;

  /// Functions for generating routes based on settings, supporting on-the-fly route generation.
  final RouteFactory? onGenerateRoute;
  final InitialRouteListFactory? onGenerateInitialRoutes;
  final RouteFactory? onUnknownRoute;

  /// Observers for the navigator, allowing for monitoring of navigation changes.
  final List<NavigatorObserver>? navigatorObservers;

  /// The initial route to load when the app starts.
  final String? initialRoute;

  /// The widget to display when the app starts, typically the app's home screen.
  final Widget? home;

  /// A map of routes for the app, allowing for named navigation.
  final Map<String, WidgetBuilder>? routes;

  /// A builder for inserting widgets above the navigator but below the rest of the app.
  final TransitionBuilder? builder;

  /// The title of the app, displayed in the task switcher.
  final String title;

  /// A function for dynamically generating the app title.
  final GenerateAppTitle? onGenerateTitle;

  /// The primary color of the app, used in the operating system task switcher.
  final Color? color;

  /// The locale for the app, overriding the device default.
  final Locale? locale;

  /// Delegates for localizing the app's content.
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;

  /// Callbacks for resolving the locale from a list of user preferences.
  final LocaleListResolutionCallback? localeListResolutionCallback;
  final LocaleResolutionCallback? localeResolutionCallback;

  /// A list of supported locales for the app.
  final Iterable<Locale> supportedLocales;

  /// Flags for enabling various development aids.
  final bool showPerformanceOverlay;
  final bool checkerboardRasterCacheImages;
  final bool checkerboardOffscreenLayers;
  final bool showSemanticsDebugger;
  final bool debugShowCheckedModeBanner;

  /// Maps for defining keyboard shortcuts and actions.
  final Map<ShortcutActivator, Intent>? shortcuts;
  final Map<Type, Action<Intent>>? actions;

  /// Custom theme data for the app.
  final GSThemeData? theme;
  final GSThemeData? darkTheme;

  /// Controls the theme mode for the app.
  final GSThemeMode? themeMode;

  /// An ID for restoring the navigation stack's state.
  final String? restorationScopeId;

  /// Custom scroll behavior for the app.
  final ScrollBehavior scrollBehavior;

  /// A custom page route builder for the app.
  final PageRouteFactory? pageRouteBuilder;

  final RouteInformationProvider? routeInformationProvider;
  final RouteInformationParser<Object>? routeInformationParser;
  final RouterDelegate<Object>? routerDelegate;
  final BackButtonDispatcher? backButtonDispatcher;
  final RouterConfig<Object>? routerConfig;
  @override
  State<GSApp> createState() => _GSAppState();
}

class _GSAppState extends State<GSApp> {
  late HeroController _heroController;

  @override
  void initState() {
    super.initState();
    _heroController = HeroController();
  }

  Iterable<LocalizationsDelegate<dynamic>> get _localizationsDelegates sync* {
    final localizationsDelegates = widget.localizationsDelegates;
    if (localizationsDelegates != null) {
      yield* localizationsDelegates;
    }
    yield GlobalMaterialLocalizations.delegate;
    yield GlobalCupertinoLocalizations.delegate;
    yield GlobalWidgetsLocalizations.delegate;
  }

  bool get _usesRouter =>
      widget.routerDelegate != null || widget.routerConfig != null;

  @override
  Widget build(BuildContext context) {
    final result = _buildApp(context);
    return ScrollConfiguration(
      behavior: widget.scrollBehavior,
      child: HeroControllerScope(
        controller: _heroController,
        child: result,
      ),
    );
  }

  GSThemeData theme(BuildContext context) {
    final mode = widget.themeMode ?? GSThemeMode.system;
    final platformBrightness = MediaQuery.platformBrightnessOf(context);

    final usedarkStyle = mode == GSThemeMode.dark ||
        (mode == GSThemeMode.system && platformBrightness == Brightness.dark);

    final data = () {
      late GSThemeData result;
      if (usedarkStyle) {
        result = widget.darkTheme ?? widget.theme ?? GSThemeData();
      } else {
        result = widget.theme ?? GSThemeData();
      }
      return result;
    }();
    return data;
  }

  Widget _builder(BuildContext context, Widget? child) {
    final themeData = theme(context);
    //final mTheme = context.findAncestorWidgetOfExactType<m.Theme>();

    return GSThemeWidget(
      data: themeData,
      child: widget.builder != null
          ? Builder(
              builder: (BuildContext context) {
                return widget.builder!(context, child);
              },
            )
          : child ?? const SizedBox.shrink(),
    );
  }

  Widget _buildApp(BuildContext context) {
    final gsAppColor = widget.color ?? const Color(0xFF0000FF);
    if (_usesRouter) {
      return WidgetsApp.router(
        key: GlobalObjectKey(this),
        routeInformationProvider: widget.routeInformationProvider,
        routeInformationParser: widget.routeInformationParser,
        routerDelegate: widget.routerDelegate,
        routerConfig: widget.routerConfig,
        backButtonDispatcher: widget.backButtonDispatcher,
        builder: _builder,
        title: widget.title,
        onGenerateTitle: widget.onGenerateTitle,
        color: gsAppColor,
        locale: widget.locale,
        localeResolutionCallback: widget.localeResolutionCallback,
        localeListResolutionCallback: widget.localeListResolutionCallback,
        supportedLocales: widget.supportedLocales,
        showPerformanceOverlay: widget.showPerformanceOverlay,
        checkerboardRasterCacheImages: widget.checkerboardRasterCacheImages,
        checkerboardOffscreenLayers: widget.checkerboardOffscreenLayers,
        showSemanticsDebugger: widget.showSemanticsDebugger,
        debugShowCheckedModeBanner: widget.debugShowCheckedModeBanner,
        shortcuts: widget.shortcuts,
        actions: widget.actions,
        restorationScopeId: widget.restorationScopeId,
        localizationsDelegates: _localizationsDelegates,
      );
    }

    return WidgetsApp(
      key: widget.key,
      navigatorKey: widget.navigatorKey,
      onGenerateRoute: widget.onGenerateRoute,
      onGenerateInitialRoutes: widget.onGenerateInitialRoutes,
      onUnknownRoute: widget.onUnknownRoute,
      builder: _builder,
      title: widget.title,
      onGenerateTitle: widget.onGenerateTitle,
      locale: widget.locale,
      localizationsDelegates: widget.localizationsDelegates,
      localeListResolutionCallback: widget.localeListResolutionCallback,
      localeResolutionCallback: widget.localeResolutionCallback,
      supportedLocales: widget.supportedLocales,
      showPerformanceOverlay: widget.showPerformanceOverlay,
      checkerboardRasterCacheImages: widget.checkerboardRasterCacheImages,
      checkerboardOffscreenLayers: widget.checkerboardOffscreenLayers,
      showSemanticsDebugger: widget.showSemanticsDebugger,
      debugShowCheckedModeBanner: widget.debugShowCheckedModeBanner,
      shortcuts: widget.shortcuts,
      actions: widget.actions,
      restorationScopeId: widget.restorationScopeId,
      initialRoute: widget.initialRoute,
      home: widget.home,
      // routes: widget.routes,
      // inspectorSelectButtonBuilder: widget.inspectorSelectButtonBuilder,
      // navigatorObservers: widget.navigatorObservers,
      // debugShowWidgetInspector: widget.debugShowWidgetInspector,
      pageRouteBuilder: widget.pageRouteBuilder ?? _defaultPageRouteBuilder,
      // textStyle: widget.textStyle,
      color: gsAppColor,
    );
  }

  PageRoute<T> _defaultPageRouteBuilder<T>(
      RouteSettings settings, WidgetBuilder builder) {
    return PageRouteBuilder<T>(
      settings: settings,
      pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) =>
          builder(context),
      transitionsBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }
}

class GSAppScrollBehavior extends ScrollBehavior {
  const GSAppScrollBehavior();

  @override
  Widget buildScrollbar(context, child, details) {
    switch (axisDirectionToAxis(details.direction)) {
      case Axis.horizontal:
        return child;
      case Axis.vertical:
        switch (getPlatform(context)) {
          case TargetPlatform.macOS:
          case TargetPlatform.iOS:
          case TargetPlatform.linux:
          case TargetPlatform.windows:
          case TargetPlatform.android:
          case TargetPlatform.fuchsia:
            return child;
        }
    }
  }
}
