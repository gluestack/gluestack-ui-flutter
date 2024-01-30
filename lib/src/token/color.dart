import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:gluestack_ui/src/provider/gluestack_provider.dart';

var colorInstance = getIt<GSColorsToken>();

class GSColorsToken {
  final Color rose50;
  final Color rose100;
  final Color rose200;
  final Color rose300;
  final Color rose400;
  final Color rose500;
  final Color rose600;
  final Color rose700;
  final Color rose800;
  final Color rose900;
  final Color pink50;
  final Color pink100;
  final Color pink200;
  final Color pink300;
  final Color pink400;
  final Color pink500;
  final Color pink600;
  final Color pink700;
  final Color pink800;
  final Color pink900;
  final Color fuchsia50;
  final Color fuchsia100;
  final Color fuchsia200;
  final Color fuchsia300;
  final Color fuchsia400;
  final Color fuchsia500;
  final Color fuchsia600;
  final Color fuchsia700;
  final Color fuchsia800;
  final Color fuchsia900;
  final Color purple50;
  final Color purple100;
  final Color purple200;
  final Color purple300;
  final Color purple400;
  final Color purple500;
  final Color purple600;
  final Color purple700;
  final Color purple800;
  final Color purple900;
  final Color violet50;
  final Color violet100;
  final Color violet200;
  final Color violet300;
  final Color violet400;
  final Color violet500;
  final Color violet600;
  final Color violet700;
  final Color violet800;
  final Color violet900;
  final Color indigo50;
  final Color indigo100;
  final Color indigo200;
  final Color indigo300;
  final Color indigo400;
  final Color indigo500;
  final Color indigo600;
  final Color indigo700;
  final Color indigo800;
  final Color indigo900;
  final Color blue50;
  final Color blue100;
  final Color blue200;
  final Color blue300;
  final Color blue400;
  final Color blue500;
  final Color blue600;
  final Color blue700;
  final Color blue800;
  final Color blue900;
  final Color lightBlue50;
  final Color lightBlue100;
  final Color lightBlue200;
  final Color lightBlue300;
  final Color lightBlue400;
  final Color lightBlue500;
  final Color lightBlue600;
  final Color lightBlue700;
  final Color lightBlue800;
  final Color lightBlue900;
  final Color darkBlue50;
  final Color darkBlue100;
  final Color darkBlue200;
  final Color darkBlue300;
  final Color darkBlue400;
  final Color darkBlue500;
  final Color darkBlue600;
  final Color darkBlue700;
  final Color darkBlue800;
  final Color darkBlue900;
  final Color cyan50;
  final Color cyan100;
  final Color cyan200;
  final Color cyan300;
  final Color cyan400;
  final Color cyan500;
  final Color cyan600;
  final Color cyan700;
  final Color cyan800;
  final Color cyan900;
  final Color teal50;
  final Color teal100;
  final Color teal200;
  final Color teal300;
  final Color teal400;
  final Color teal500;
  final Color teal600;
  final Color teal700;
  final Color teal800;
  final Color teal900;
  final Color emerald50;
  final Color emerald100;
  final Color emerald200;
  final Color emerald300;
  final Color emerald400;
  final Color emerald500;
  final Color emerald600;
  final Color emerald700;
  final Color emerald800;
  final Color emerald900;
  final Color green50;
  final Color green100;
  final Color green200;
  final Color green300;
  final Color green400;
  final Color green500;
  final Color green600;
  final Color green700;
  final Color green800;
  final Color green900;
  final Color lime50;
  final Color lime100;
  final Color lime200;
  final Color lime300;
  final Color lime400;
  final Color lime500;
  final Color lime600;
  final Color lime700;
  final Color lime800;
  final Color lime900;
  final Color yellow50;
  final Color yellow100;
  final Color yellow200;
  final Color yellow300;
  final Color yellow400;
  final Color yellow500;
  final Color yellow600;
  final Color yellow700;
  final Color yellow800;
  final Color yellow900;
  final Color amber50;
  final Color amber100;
  final Color amber200;
  final Color amber300;
  final Color amber400;
  final Color amber500;
  final Color amber600;
  final Color amber700;
  final Color amber800;
  final Color amber900;
  final Color orange50;
  final Color orange100;
  final Color orange200;
  final Color orange300;
  final Color orange400;
  final Color orange500;
  final Color orange600;
  final Color orange700;
  final Color orange800;
  final Color orange900;
  final Color red50;
  final Color red100;
  final Color red200;
  final Color red300;
  final Color red400;
  final Color red500;
  final Color red600;
  final Color red700;
  final Color red800;
  final Color red900;
  final Color warmGray50;
  final Color warmGray100;
  final Color warmGray200;
  final Color warmGray300;
  final Color warmGray400;
  final Color warmGray500;
  final Color warmGray600;
  final Color warmGray700;
  final Color warmGray800;
  final Color warmGray900;
  final Color trueGray50;
  final Color trueGray100;
  final Color trueGray200;
  final Color trueGray300;
  final Color trueGray400;
  final Color trueGray500;
  final Color trueGray600;
  final Color trueGray700;
  final Color trueGray800;
  final Color trueGray900;
  final Color coolGray50;
  final Color coolGray100;
  final Color coolGray200;
  final Color coolGray300;
  final Color coolGray400;
  final Color coolGray500;
  final Color coolGray600;
  final Color coolGray700;
  final Color coolGray800;
  final Color coolGray900;
  final Color blueGray50;
  final Color blueGray100;
  final Color blueGray200;
  final Color blueGray300;
  final Color blueGray400;
  final Color blueGray500;
  final Color blueGray600;
  final Color blueGray700;
  final Color blueGray800;
  final Color blueGray900;
  final Color tertiary50;
  final Color tertiary100;
  final Color tertiary200;
  final Color tertiary300;
  final Color tertiary400;
  final Color tertiary500;
  final Color tertiary600;
  final Color tertiary700;
  final Color tertiary800;
  final Color tertiary900;
  final Color error00;
  final Color error50;
  final Color error100;
  final Color error200;
  final Color error300;
  final Color error400;
  final Color error500;
  final Color error600;
  final Color error700;
  final Color error800;
  final Color error900;
  final Color error950;
  final Color success0;
  final Color success50;
  final Color success100;
  final Color success200;
  final Color success300;
  final Color success400;
  final Color success500;
  final Color success600;
  final Color success700;
  final Color success800;
  final Color success900;
  final Color success950;
  final Color warning50;
  final Color warning100;
  final Color warning200;
  final Color warning300;
  final Color warning400;
  final Color warning500;
  final Color warning600;
  final Color warning700;
  final Color warning800;
  final Color warning900;
  final Color info50;
  final Color info100;
  final Color info200;
  final Color info300;
  final Color info400;
  final Color info500;
  final Color info600;
  final Color info700;
  final Color info800;
  final Color info900;
  final Color light50;
  final Color light100;
  final Color light200;
  final Color light300;
  final Color light400;
  final Color light500;
  final Color light600;
  final Color light700;
  final Color light800;
  final Color light900;
  final Color primary0;
  final Color primary50;
  final Color primary100;
  final Color primary200;
  final Color primary300;
  final Color primary400;
  final Color primary500;
  final Color primary600;
  final Color primary700;
  final Color primary800;
  final Color primary900;
  final Color primary950;
  final Color secondary0;
  final Color secondary50;
  final Color secondary100;
  final Color secondary200;
  final Color secondary300;
  final Color secondary400;
  final Color secondary500;
  final Color secondary600;
  final Color secondary700;
  final Color secondary800;
  final Color secondary900;
  final Color secondary950;
  final Color textLight0;
  final Color textLight50;
  final Color textLight100;
  final Color textLight200;
  final Color textLight300;
  final Color textLight400;
  final Color textLight500;
  final Color textLight600;
  final Color textLight700;
  final Color textLight800;
  final Color textLight900;
  final Color textLight950;
  final Color textDark0;
  final Color textDark50;
  final Color textDark100;
  final Color textDark200;
  final Color textDark300;
  final Color textDark400;
  final Color textDark500;
  final Color textDark600;
  final Color textDark700;
  final Color textDark800;
  final Color textDark900;
  final Color textDark950;
  final Color borderDark0;
  final Color borderDark50;
  final Color borderDark100;
  final Color borderDark200;
  final Color borderDark300;
  final Color borderDark400;
  final Color borderDark500;
  final Color borderDark600;
  final Color borderDark700;
  final Color borderDark800;
  final Color borderDark900;
  final Color borderDark950;
  final Color borderLight0;
  final Color borderLight50;
  final Color borderLight100;
  final Color borderLight200;
  final Color borderLight300;
  final Color borderLight400;
  final Color borderLight500;
  final Color borderLight600;
  final Color borderLight700;
  final Color borderLight800;
  final Color borderLight900;
  final Color borderLight950;
  final Color backgroundDark0;
  final Color backgroundDark50;
  final Color backgroundDark100;
  final Color backgroundDark200;
  final Color backgroundDark300;
  final Color backgroundDark400;
  final Color backgroundDark500;
  final Color backgroundDark600;
  final Color backgroundDark700;
  final Color backgroundDark800;
  final Color backgroundDark900;
  final Color backgroundDark950;
  final Color backgroundLight0;
  final Color backgroundLight50;
  final Color backgroundLight100;
  final Color backgroundLight200;
  final Color backgroundLight300;
  final Color backgroundLight400;
  final Color backgroundLight500;
  final Color backgroundLight600;
  final Color backgroundLight700;
  final Color backgroundLight800;
  final Color backgroundLight900;
  final Color backgroundLight950;
  final Color backgroundLightError;
  final Color backgroundDarkError;
  final Color backgroundLightWarning;
  final Color backgroundDarkWarning;
  final Color backgroundLightSuccess;
  final Color backgroundDarkSuccess;
  final Color backgroundLightInfo;
  final Color backgroundDarkInfo;
  final Color backgroundLightMuted;
  final Color backgroundDarkMuted;
  final Color white;
  final Color black;
  final Color? fromBaseColor;

  const GSColorsToken({
    this.rose50 = const Color(0xFFFFF1F2),
    this.rose100 = const Color(0xFFFFE4E6),
    this.rose200 = const Color(0xFFFECDCE),
    this.rose300 = const Color(0xFFFDA4AF),
    this.rose400 = const Color(0xFFFB7185),
    this.rose500 = const Color(0xFFF43F5E),
    this.rose600 = const Color(0xFFE11D48),
    this.rose700 = const Color(0xFFBE123C),
    this.rose800 = const Color(0xFF9F1239),
    this.rose900 = const Color(0xFF881337),
    this.pink50 = const Color(0xFFfdf2f8),
    this.pink100 = const Color(0xFFfce7f3),
    this.pink200 = const Color(0xFFfbcfe8),
    this.pink300 = const Color(0xFFf9a8d4),
    this.pink400 = const Color(0xFFf472b6),
    this.pink500 = const Color(0xFFec4899),
    this.pink600 = const Color(0xFFdb2777),
    this.pink700 = const Color(0xFFbe185d),
    this.pink800 = const Color(0xFF9d174d),
    this.pink900 = const Color(0xFF831843),
    this.fuchsia50 = const Color(0xFFfdf4ff),
    this.fuchsia100 = const Color(0xFFfae8ff),
    this.fuchsia200 = const Color(0xFFf5d0fe),
    this.fuchsia300 = const Color(0xFFf0abfc),
    this.fuchsia400 = const Color(0xFFe879f9),
    this.fuchsia500 = const Color(0xFFd946ef),
    this.fuchsia600 = const Color(0xFFc026d3),
    this.fuchsia700 = const Color(0xFFa21caf),
    this.fuchsia800 = const Color(0xFF86198f),
    this.fuchsia900 = const Color(0xFF701a75),
    this.purple50 = const Color(0xFFfaf5ff),
    this.purple100 = const Color(0xFFf3e8ff),
    this.purple200 = const Color(0xFFe9d5ff),
    this.purple300 = const Color(0xFFd8b4fe),
    this.purple400 = const Color(0xFFc084fc),
    this.purple500 = const Color(0xFFa855f7),
    this.purple600 = const Color(0xFF9333ea),
    this.purple700 = const Color(0xFF7e22ce),
    this.purple800 = const Color(0xFF6b21a8),
    this.purple900 = const Color(0xFF581c87),
    this.violet50 = const Color(0xFFf5f3ff),
    this.violet100 = const Color(0xFFede9fe),
    this.violet200 = const Color(0xFFddd6fe),
    this.violet300 = const Color(0xFFc4b5fd),
    this.violet400 = const Color(0xFFa78bfa),
    this.violet500 = const Color(0xFF8b5cf6),
    this.violet600 = const Color(0xFF7c3aed),
    this.violet700 = const Color(0xFF6d28d9),
    this.violet800 = const Color(0xFF5b21b6),
    this.violet900 = const Color(0xFF4c1d95),
    this.indigo50 = const Color(0xFFeef2ff),
    this.indigo100 = const Color(0xFFe0e7ff),
    this.indigo200 = const Color(0xFFc7d2fe),
    this.indigo300 = const Color(0xFFa5b4fc),
    this.indigo400 = const Color(0xFF818cf8),
    this.indigo500 = const Color(0xFF6366f1),
    this.indigo600 = const Color(0xFF4f46e5),
    this.indigo700 = const Color(0xFF4338ca),
    this.indigo800 = const Color(0xFF3730a3),
    this.indigo900 = const Color(0xFF312e81),
    this.blue50 = const Color(0xFFeff6ff),
    this.blue100 = const Color(0xFFdbeafe),
    this.blue200 = const Color(0xFFbfdbfe),
    this.blue300 = const Color(0xFF93c5fd),
    this.blue400 = const Color(0xFF60a5fa),
    this.blue500 = const Color(0xFF3b82f6),
    this.blue600 = const Color(0xFF2563eb),
    this.blue700 = const Color(0xFF1d4ed8),
    this.blue800 = const Color(0xFF1e40af),
    this.blue900 = const Color(0xFF1e3a8a),
    this.lightBlue50 = const Color(0xFFf0f9ff),
    this.lightBlue100 = const Color(0xFFe0f2fe),
    this.lightBlue200 = const Color(0xFFbae6fd),
    this.lightBlue300 = const Color(0xFF7dd3fc),
    this.lightBlue400 = const Color(0xFF38bdf8),
    this.lightBlue500 = const Color(0xFF0ea5e9),
    this.lightBlue600 = const Color(0xFF0284c7),
    this.lightBlue700 = const Color(0xFF0369a1),
    this.lightBlue800 = const Color(0xFF075985),
    this.lightBlue900 = const Color(0xFF0c4a6e),
    this.darkBlue50 = const Color(0xFFdbf4ff),
    this.darkBlue100 = const Color(0xFFaddbff),
    this.darkBlue200 = const Color(0xFF7cc2ff),
    this.darkBlue300 = const Color(0xFF4aa9ff),
    this.darkBlue400 = const Color(0xFF1a91ff),
    this.darkBlue500 = const Color(0xFF0077e6),
    this.darkBlue600 = const Color(0xFF005db4),
    this.darkBlue700 = const Color(0xFF004282),
    this.darkBlue800 = const Color(0xFF002851),
    this.darkBlue900 = const Color(0xFF000e21),
    this.cyan50 = const Color(0xFFecfeff),
    this.cyan100 = const Color(0xFFcffafe),
    this.cyan200 = const Color(0xFFa5f3fc),
    this.cyan300 = const Color(0xFF67e8f9),
    this.cyan400 = const Color(0xFF22d3ee),
    this.cyan500 = const Color(0xFF06b6d4),
    this.cyan600 = const Color(0xFF0891b2),
    this.cyan700 = const Color(0xFF0e7490),
    this.cyan800 = const Color(0xFF155e75),
    this.cyan900 = const Color(0xFF164e63),
    this.teal50 = const Color(0xFFf0fdfa),
    this.teal100 = const Color(0xFFccfbf1),
    this.teal200 = const Color(0xFF99f6e4),
    this.teal300 = const Color(0xFF5eead4),
    this.teal400 = const Color(0xFF2dd4bf),
    this.teal500 = const Color(0xFF14b8a6),
    this.teal600 = const Color(0xFF0d9488),
    this.teal700 = const Color(0xFF0f766e),
    this.teal800 = const Color(0xFF115e59),
    this.teal900 = const Color(0xFF134e4a),
    this.emerald50 = const Color(0xFFecfdf5),
    this.emerald100 = const Color(0xFFd1fae5),
    this.emerald200 = const Color(0xFFa7f3d0),
    this.emerald300 = const Color(0xFF6ee7b7),
    this.emerald400 = const Color(0xFF34d399),
    this.emerald500 = const Color(0xFF10b981),
    this.emerald600 = const Color(0xFF059669),
    this.emerald700 = const Color(0xFF047857),
    this.emerald800 = const Color(0xFF065f46),
    this.emerald900 = const Color(0xFF064e3b),
    this.green50 = const Color(0xFFf0fdf4),
    this.green100 = const Color(0xFFdcfce7),
    this.green200 = const Color(0xFFbbf7d0),
    this.green300 = const Color(0xFF86efac),
    this.green400 = const Color(0xFF4ade80),
    this.green500 = const Color(0xFF22c55e),
    this.green600 = const Color(0xFF16a34a),
    this.green700 = const Color(0xFF15803d),
    this.green800 = const Color(0xFF166534),
    this.green900 = const Color(0xFF14532d),
    this.lime50 = const Color(0xFFf7fee7),
    this.lime100 = const Color(0xFFecfccb),
    this.lime200 = const Color(0xFFd9f99d),
    this.lime300 = const Color(0xFFbef264),
    this.lime400 = const Color(0xFFa3e635),
    this.lime500 = const Color(0xFF84cc16),
    this.lime600 = const Color(0xFF65a30d),
    this.lime700 = const Color(0xFF4d7c0f),
    this.lime800 = const Color(0xFF3f6212),
    this.lime900 = const Color(0xFF365314),
    this.yellow50 = const Color(0xFFfefce8),
    this.yellow100 = const Color(0xFFfef9c3),
    this.yellow200 = const Color(0xFFfef08a),
    this.yellow300 = const Color(0xFFfde047),
    this.yellow400 = const Color(0xFFfacc15),
    this.yellow500 = const Color(0xFFeab308),
    this.yellow600 = const Color(0xFFca8a04),
    this.yellow700 = const Color(0xFFa16207),
    this.yellow800 = const Color(0xFF854d0e),
    this.yellow900 = const Color(0xFF713f12),
    this.amber50 = const Color(0xFFfffbeb),
    this.amber100 = const Color(0xFFfef3c7),
    this.amber200 = const Color(0xFFfde68a),
    this.amber300 = const Color(0xFFfcd34d),
    this.amber400 = const Color(0xFFfbbf24),
    this.amber500 = const Color(0xFFf59e0b),
    this.amber600 = const Color(0xFFd97706),
    this.amber700 = const Color(0xFFb45309),
    this.amber800 = const Color(0xFF92400e),
    this.amber900 = const Color(0xFF78350f),
    this.orange50 = const Color(0xFFfff7ed),
    this.orange100 = const Color(0xFFffedd5),
    this.orange200 = const Color(0xFFfed7aa),
    this.orange300 = const Color(0xFFfdba74),
    this.orange400 = const Color(0xFFfb923c),
    this.orange500 = const Color(0xFFf97316),
    this.orange600 = const Color(0xFFea580c),
    this.orange700 = const Color(0xFFc2410c),
    this.orange800 = const Color(0xFF9a3412),
    this.orange900 = const Color(0xFF7c2d12),
    this.red50 = const Color(0xFFfef2f2),
    this.red100 = const Color(0xFFfee2e2),
    this.red200 = const Color(0xFFfecaca),
    this.red300 = const Color(0xFFfca5a5),
    this.red400 = const Color(0xFFf87171),
    this.red500 = const Color(0xFFef4444),
    this.red600 = const Color(0xFFdc2626),
    this.red700 = const Color(0xFFb91c1c),
    this.red800 = const Color(0xFF991b1b),
    this.red900 = const Color(0xFF7f1d1d),
    this.warmGray50 = const Color(0xFFfafaf9),
    this.warmGray100 = const Color(0xFFf5f5f4),
    this.warmGray200 = const Color(0xFFe7e5e4),
    this.warmGray300 = const Color(0xFFd6d3d1),
    this.warmGray400 = const Color(0xFFa8a29e),
    this.warmGray500 = const Color(0xFF78716c),
    this.warmGray600 = const Color(0xFF57534e),
    this.warmGray700 = const Color(0xFF44403c),
    this.warmGray800 = const Color(0xFF292524),
    this.warmGray900 = const Color(0xFF1c1917),
    this.trueGray50 = const Color(0xFFfafafa),
    this.trueGray100 = const Color(0xFFf5f5f5),
    this.trueGray200 = const Color(0xFFe5e5e5),
    this.trueGray300 = const Color(0xFFd4d4d4),
    this.trueGray400 = const Color(0xFFa3a3a3),
    this.trueGray500 = const Color(0xFF737373),
    this.trueGray600 = const Color(0xFF525252),
    this.trueGray700 = const Color(0xFF404040),
    this.trueGray800 = const Color(0xFF262626),
    this.trueGray900 = const Color(0xFF171717),
    this.coolGray50 = const Color(0xFFf9fafb),
    this.coolGray100 = const Color(0xFFf3f4f6),
    this.coolGray200 = const Color(0xFFe5e7eb),
    this.coolGray300 = const Color(0xFFd1d5db),
    this.coolGray400 = const Color(0xFF9ca3af),
    this.coolGray500 = const Color(0xFF6b7280),
    this.coolGray600 = const Color(0xFF4b5563),
    this.coolGray700 = const Color(0xFF374151),
    this.coolGray800 = const Color(0xFF1f2937),
    this.coolGray900 = const Color(0xFF111827),
    this.blueGray50 = const Color(0xFFf8fafc),
    this.blueGray100 = const Color(0xFFf1f5f9),
    this.blueGray200 = const Color(0xFFe2e8f0),
    this.blueGray300 = const Color(0xFFcbd5e1),
    this.blueGray400 = const Color(0xFF94a3b8),
    this.blueGray500 = const Color(0xFF64748b),
    this.blueGray600 = const Color(0xFF475569),
    this.blueGray700 = const Color(0xFF334155),
    this.blueGray800 = const Color(0xFF1e293b),
    this.blueGray900 = const Color(0xFF0f172a),
    this.tertiary50 = const Color(0xFFecfdf5),
    this.tertiary100 = const Color(0xFFd1fae5),
    this.tertiary200 = const Color(0xFFa7f3d0),
    this.tertiary300 = const Color(0xFF6ee7b7),
    this.tertiary400 = const Color(0xFF34d399),
    this.tertiary500 = const Color(0xFF10b981),
    this.tertiary600 = const Color(0xFF059669),
    this.tertiary700 = const Color(0xFF047857),
    this.tertiary800 = const Color(0xFF065f46),
    this.tertiary900 = const Color(0xFF064e3b),
    this.error00 = const Color(0xFFFEE9E9),
    this.error50 = const Color(0xFFFEE2E2),
    this.error100 = const Color(0xFFFECACA),
    this.error200 = const Color(0xFFFCA5A5),
    this.error300 = const Color(0xFFF87171),
    this.error400 = const Color(0xFFEF4444),
    this.error500 = const Color(0xFFE63535),
    this.error600 = const Color(0xFFDC2626),
    this.error700 = const Color(0xFFB91C1C),
    this.error800 = const Color(0xFF7F1D1D),
    this.error900 = const Color(0xFF991B1B),
    this.error950 = const Color(0xFF220808),
    this.success0 = const Color(0xFFE4FFF4),
    this.success50 = const Color(0xFFCAFFE8),
    this.success100 = const Color(0xFFA2F1C0),
    this.success200 = const Color(0xFF84D3A2),
    this.success300 = const Color(0xFF66B584),
    this.success400 = const Color(0xFF489766),
    this.success500 = const Color(0xFF348352),
    this.success600 = const Color(0xFF2A7948),
    this.success700 = const Color(0xFF206F3E),
    this.success800 = const Color(0xFF166534),
    this.success900 = const Color(0xFF14532D),
    this.success950 = const Color(0xFF071F11),
    this.warning50 = const Color(0xFFFFF7ED),
    this.warning100 = const Color(0xFFFFEDD5),
    this.warning200 = const Color(0xFFFFD7AA),
    this.warning300 = const Color(0xFFFDBA74),
    this.warning400 = const Color(0xFFFB923C),
    this.warning500 = const Color(0xFFF97316),
    this.warning600 = const Color(0xFFEA580C),
    this.warning700 = const Color(0xFFC2410C),
    this.warning800 = const Color(0xFF9A3412),
    this.warning900 = const Color(0xFF7C2D12),
    this.info50 = const Color(0xFFF0F9FF),
    this.info100 = const Color(0xFFE0F2FE),
    this.info200 = const Color(0xFFBAE6FD),
    this.info300 = const Color(0xFF7DD3FC),
    this.info400 = const Color(0xFF38BDF8),
    this.info500 = const Color(0xFF0EA5E9),
    this.info600 = const Color(0xFF0284C7),
    this.info700 = const Color(0xFF0369A1),
    this.info800 = const Color(0xFF075985),
    this.info900 = const Color(0xFF0C4A6E),
    this.light50 = const Color(0xFFFAFAF9),
    this.light100 = const Color(0xFFF5F5F4),
    this.light200 = const Color(0xFFE7E5E4),
    this.light300 = const Color(0xFFD6D3D1),
    this.light400 = const Color(0xFFA8A29E),
    this.light500 = const Color(0xFF78716C),
    this.light600 = const Color(0xFF57534E),
    this.light700 = const Color(0xFF44403C),
    this.light800 = const Color(0xFF292524),
    this.light900 = const Color(0xFF1C1917),
    this.primary0 = const Color(0xFFE5F1FB),
    this.primary50 = const Color(0xFFCCE9FF),
    this.primary100 = const Color(0xFFADDBFF),
    this.primary200 = const Color(0xFF7CC2FF),
    this.primary300 = const Color(0xFF4AA9FF),
    this.primary400 = const Color(0xFF1A91FF),
    this.primary500 = const Color(0xFF0077E6),
    this.primary600 = const Color(0xFF005DB4),
    this.primary700 = const Color(0xFF004282),
    this.primary800 = const Color(0xFF002851),
    this.primary900 = const Color(0xFF011838),
    this.primary950 = const Color(0xFF000711),
    this.secondary0 = const Color(0xFFF6F6F6),
    this.secondary50 = const Color(0xFFF3F3F3),
    this.secondary100 = const Color(0xFFE9E9E9),
    this.secondary200 = const Color(0xFFDADADA),
    this.secondary300 = const Color(0xFFB0B0B0),
    this.secondary400 = const Color(0xFF737373),
    this.secondary500 = const Color(0xFF5F5F5F),
    this.secondary600 = const Color(0xFF525252),
    this.secondary700 = const Color(0xFF404040),
    this.secondary800 = const Color(0xFF262626),
    this.secondary900 = const Color(0xFF171717),
    this.secondary950 = const Color(0xFF0C0C0C),
    this.textLight0 = const Color(0xFFFCFCFC),
    this.textLight50 = const Color(0xFFF5F5F5),
    this.textLight100 = const Color(0xFFE5E5E5),
    this.textLight200 = const Color(0xFFDBDBDB),
    this.textLight300 = const Color(0xFFD4D4D4),
    this.textLight400 = const Color(0xFFA3A3A3),
    this.textLight500 = const Color(0xFF8C8C8C),
    this.textLight600 = const Color(0xFF737373),
    this.textLight700 = const Color(0xFF525252),
    this.textLight800 = const Color(0xFF404040),
    this.textLight900 = const Color(0xFF262626),
    this.textLight950 = const Color(0xFF171717),
    this.textDark0 = const Color(0xFFFCFCFC),
    this.textDark50 = const Color(0xFFF5F5F5),
    this.textDark100 = const Color(0xFFE5E5E5),
    this.textDark200 = const Color(0xFFDBDBDB),
    this.textDark300 = const Color(0xFFD4D4D4),
    this.textDark400 = const Color(0xFFA3A3A3),
    this.textDark500 = const Color(0xFF8C8C8C),
    this.textDark600 = const Color(0xFF737373),
    this.textDark700 = const Color(0xFF525252),
    this.textDark800 = const Color(0xFF404040),
    this.textDark900 = const Color(0xFF262626),
    this.textDark950 = const Color(0xFF171717),
    this.borderDark0 = const Color(0xFFFCFCFC),
    this.borderDark50 = const Color(0xFFF5F5F5),
    this.borderDark100 = const Color(0xFFE5E5E5),
    this.borderDark200 = const Color(0xFFDBDBDB),
    this.borderDark300 = const Color(0xFFD4D4D4),
    this.borderDark400 = const Color(0xFFA3A3A3),
    this.borderDark500 = const Color(0xFF8C8C8C),
    this.borderDark600 = const Color(0xFF737373),
    this.borderDark700 = const Color(0xFF525252),
    this.borderDark800 = const Color(0xFF404040),
    this.borderDark900 = const Color(0xFF262626),
    this.borderDark950 = const Color(0xFF171717),
    this.borderLight0 = const Color(0xFFFCFCFC),
    this.borderLight50 = const Color(0xFFF5F5F5),
    this.borderLight100 = const Color(0xFFE5E5E5),
    this.borderLight200 = const Color(0xFFDBDBDB),
    this.borderLight300 = const Color(0xFFD4D4D4),
    this.borderLight400 = const Color(0xFFA3A3A3),
    this.borderLight500 = const Color(0xFF8C8C8C),
    this.borderLight600 = const Color(0xFF737373),
    this.borderLight700 = const Color(0xFF525252),
    this.borderLight800 = const Color(0xFF404040),
    this.borderLight900 = const Color(0xFF262626),
    this.borderLight950 = const Color(0xFF171717),
    this.backgroundDark0 = const Color(0xFFFCFCFC),
    this.backgroundDark50 = const Color(0xFFF5F5F5),
    this.backgroundDark100 = const Color(0xFFF1F1F1),
    this.backgroundDark200 = const Color(0xFFDBDBDB),
    this.backgroundDark300 = const Color(0xFFD4D4D4),
    this.backgroundDark400 = const Color(0xFFA3A3A3),
    this.backgroundDark500 = const Color(0xFF8C8C8C),
    this.backgroundDark600 = const Color(0xFF737373),
    this.backgroundDark700 = const Color(0xFF525252),
    this.backgroundDark800 = const Color(0xFF404040),
    this.backgroundDark900 = const Color(0xFF262626),
    this.backgroundDark950 = const Color(0xFF171717),
    this.backgroundLight0 = const Color(0xFFFCFCFC),
    this.backgroundLight50 = const Color(0xFFF5F5F5),
    this.backgroundLight100 = const Color(0xFFF1F1F1),
    this.backgroundLight200 = const Color(0xFFDBDBDB),
    this.backgroundLight300 = const Color(0xFFD4D4D4),
    this.backgroundLight400 = const Color(0xFFA3A3A3),
    this.backgroundLight500 = const Color(0xFF8C8C8C),
    this.backgroundLight600 = const Color(0xFF737373),
    this.backgroundLight700 = const Color(0xFF525252),
    this.backgroundLight800 = const Color(0xFF404040),
    this.backgroundLight900 = const Color(0xFF262626),
    this.backgroundLight950 = const Color(0xFF171717),
    this.backgroundLightError = const Color(0xFFFEF1F1),
    this.backgroundDarkError = const Color(0xFF422B2B),
    this.backgroundLightWarning = const Color(0xFFFFF4EB),
    this.backgroundDarkWarning = const Color(0xFF412F23),
    this.backgroundLightSuccess = const Color(0xFFEDFCF2),
    this.backgroundDarkSuccess = const Color(0xFF1C2B21),
    this.backgroundLightInfo = const Color(0xFFEBF8FE),
    this.backgroundDarkInfo = const Color(0xFF1A282E),
    this.backgroundLightMuted = const Color(0xFFF6F6F7),
    this.backgroundDarkMuted = const Color(0xFF252526),
    this.white = const Color(0xFFFFFFFF),
    this.black = const Color(0xFF000000),
    this.fromBaseColor,
  });

  GSColorsToken copyWith({
    Color? rose50,
    Color? rose100,
    Color? rose200,
    Color? rose300,
    Color? rose400,
    Color? rose500,
    Color? rose600,
    Color? rose700,
    Color? rose800,
    Color? rose900,
    Color? pink50,
    Color? pink100,
    Color? pink200,
    Color? pink300,
    Color? pink400,
    Color? pink500,
    Color? pink600,
    Color? pink700,
    Color? pink800,
    Color? pink900,
    Color? fuchsia50,
    Color? fuchsia100,
    Color? fuchsia200,
    Color? fuchsia300,
    Color? fuchsia400,
    Color? fuchsia500,
    Color? fuchsia600,
    Color? fuchsia700,
    Color? fuchsia800,
    Color? fuchsia900,
    Color? purple50,
    Color? purple100,
    Color? purple200,
    Color? purple300,
    Color? purple400,
    Color? purple500,
    Color? purple600,
    Color? purple700,
    Color? purple800,
    Color? purple900,
    Color? violet50,
    Color? violet100,
    Color? violet200,
    Color? violet300,
    Color? violet400,
    Color? violet500,
    Color? violet600,
    Color? violet700,
    Color? violet800,
    Color? violet900,
    Color? indigo50,
    Color? indigo100,
    Color? indigo200,
    Color? indigo300,
    Color? indigo400,
    Color? indigo500,
    Color? indigo600,
    Color? indigo700,
    Color? indigo800,
    Color? indigo900,
    Color? blue50,
    Color? blue100,
    Color? blue200,
    Color? blue300,
    Color? blue400,
    Color? blue500,
    Color? blue600,
    Color? blue700,
    Color? blue800,
    Color? blue900,
    Color? lightBlue50,
    Color? lightBlue100,
    Color? lightBlue200,
    Color? lightBlue300,
    Color? lightBlue400,
    Color? lightBlue500,
    Color? lightBlue600,
    Color? lightBlue700,
    Color? lightBlue800,
    Color? lightBlue900,
    Color? darkBlue50,
    Color? darkBlue100,
    Color? darkBlue200,
    Color? darkBlue300,
    Color? darkBlue400,
    Color? darkBlue500,
    Color? darkBlue600,
    Color? darkBlue700,
    Color? darkBlue800,
    Color? darkBlue900,
    Color? cyan50,
    Color? cyan100,
    Color? cyan200,
    Color? cyan300,
    Color? cyan400,
    Color? cyan500,
    Color? cyan600,
    Color? cyan700,
    Color? cyan800,
    Color? cyan900,
    Color? teal50,
    Color? teal100,
    Color? teal200,
    Color? teal300,
    Color? teal400,
    Color? teal500,
    Color? teal600,
    Color? teal700,
    Color? teal800,
    Color? teal900,
    Color? emerald50,
    Color? emerald100,
    Color? emerald200,
    Color? emerald300,
    Color? emerald400,
    Color? emerald500,
    Color? emerald600,
    Color? emerald700,
    Color? emerald800,
    Color? emerald900,
    Color? green50,
    Color? green100,
    Color? green200,
    Color? green300,
    Color? green400,
    Color? green500,
    Color? green600,
    Color? green700,
    Color? green800,
    Color? green900,
    Color? lime50,
    Color? lime100,
    Color? lime200,
    Color? lime300,
    Color? lime400,
    Color? lime500,
    Color? lime600,
    Color? lime700,
    Color? lime800,
    Color? lime900,
    Color? yellow50,
    Color? yellow100,
    Color? yellow200,
    Color? yellow300,
    Color? yellow400,
    Color? yellow500,
    Color? yellow600,
    Color? yellow700,
    Color? yellow800,
    Color? yellow900,
    Color? amber50,
    Color? amber100,
    Color? amber200,
    Color? amber300,
    Color? amber400,
    Color? amber500,
    Color? amber600,
    Color? amber700,
    Color? amber800,
    Color? amber900,
    Color? orange50,
    Color? orange100,
    Color? orange200,
    Color? orange300,
    Color? orange400,
    Color? orange500,
    Color? orange600,
    Color? orange700,
    Color? orange800,
    Color? orange900,
    Color? red50,
    Color? red100,
    Color? red200,
    Color? red300,
    Color? red400,
    Color? red500,
    Color? red600,
    Color? red700,
    Color? red800,
    Color? red900,
    Color? warmGray50,
    Color? warmGray100,
    Color? warmGray200,
    Color? warmGray300,
    Color? warmGray400,
    Color? warmGray500,
    Color? warmGray600,
    Color? warmGray700,
    Color? warmGray800,
    Color? warmGray900,
    Color? trueGray50,
    Color? trueGray100,
    Color? trueGray200,
    Color? trueGray300,
    Color? trueGray400,
    Color? trueGray500,
    Color? trueGray600,
    Color? trueGray700,
    Color? trueGray800,
    Color? trueGray900,
    Color? coolGray50,
    Color? coolGray100,
    Color? coolGray200,
    Color? coolGray300,
    Color? coolGray400,
    Color? coolGray500,
    Color? coolGray600,
    Color? coolGray700,
    Color? coolGray800,
    Color? coolGray900,
    Color? blueGray50,
    Color? blueGray100,
    Color? blueGray200,
    Color? blueGray300,
    Color? blueGray400,
    Color? blueGray500,
    Color? blueGray600,
    Color? blueGray700,
    Color? blueGray800,
    Color? blueGray900,
    Color? tertiary50,
    Color? tertiary100,
    Color? tertiary200,
    Color? tertiary300,
    Color? tertiary400,
    Color? tertiary500,
    Color? tertiary600,
    Color? tertiary700,
    Color? tertiary800,
    Color? tertiary900,
    Color? error00,
    Color? error50,
    Color? error100,
    Color? error200,
    Color? error300,
    Color? error400,
    Color? error500,
    Color? error600,
    Color? error700,
    Color? error800,
    Color? error900,
    Color? error950,
    Color? success0,
    Color? success50,
    Color? success100,
    Color? success200,
    Color? success300,
    Color? success400,
    Color? success500,
    Color? success600,
    Color? success700,
    Color? success800,
    Color? success900,
    Color? success950,
    Color? warning50,
    Color? warning100,
    Color? warning200,
    Color? warning300,
    Color? warning400,
    Color? warning500,
    Color? warning600,
    Color? warning700,
    Color? warning800,
    Color? warning900,
    Color? info50,
    Color? info100,
    Color? info200,
    Color? info300,
    Color? info400,
    Color? info500,
    Color? info600,
    Color? info700,
    Color? info800,
    Color? info900,
    Color? light50,
    Color? light100,
    Color? light200,
    Color? light300,
    Color? light400,
    Color? light500,
    Color? light600,
    Color? light700,
    Color? light800,
    Color? light900,
    Color? primary0,
    Color? primary50,
    Color? primary100,
    Color? primary200,
    Color? primary300,
    Color? primary400,
    Color? primary500,
    Color? primary600,
    Color? primary700,
    Color? primary800,
    Color? primary900,
    Color? primary950,
    Color? secondary0,
    Color? secondary50,
    Color? secondary100,
    Color? secondary200,
    Color? secondary300,
    Color? secondary400,
    Color? secondary500,
    Color? secondary600,
    Color? secondary700,
    Color? secondary800,
    Color? secondary900,
    Color? secondary950,
    Color? textLight0,
    Color? textLight50,
    Color? textLight100,
    Color? textLight200,
    Color? textLight300,
    Color? textLight400,
    Color? textLight500,
    Color? textLight600,
    Color? textLight700,
    Color? textLight800,
    Color? textLight900,
    Color? textLight950,
    Color? textDark0,
    Color? textDark50,
    Color? textDark100,
    Color? textDark200,
    Color? textDark300,
    Color? textDark400,
    Color? textDark500,
    Color? textDark600,
    Color? textDark700,
    Color? textDark800,
    Color? textDark900,
    Color? textDark950,
    Color? borderDark0,
    Color? borderDark50,
    Color? borderDark100,
    Color? borderDark200,
    Color? borderDark300,
    Color? borderDark400,
    Color? borderDark500,
    Color? borderDark600,
    Color? borderDark700,
    Color? borderDark800,
    Color? borderDark900,
    Color? borderDark950,
    Color? borderLight0,
    Color? borderLight50,
    Color? borderLight100,
    Color? borderLight200,
    Color? borderLight300,
    Color? borderLight400,
    Color? borderLight500,
    Color? borderLight600,
    Color? borderLight700,
    Color? borderLight800,
    Color? borderLight900,
    Color? borderLight950,
    Color? backgroundDark0,
    Color? backgroundDark50,
    Color? backgroundDark100,
    Color? backgroundDark200,
    Color? backgroundDark300,
    Color? backgroundDark400,
    Color? backgroundDark500,
    Color? backgroundDark600,
    Color? backgroundDark700,
    Color? backgroundDark800,
    Color? backgroundDark900,
    Color? backgroundDark950,
    Color? backgroundLight0,
    Color? backgroundLight50,
    Color? backgroundLight100,
    Color? backgroundLight200,
    Color? backgroundLight300,
    Color? backgroundLight400,
    Color? backgroundLight500,
    Color? backgroundLight600,
    Color? backgroundLight700,
    Color? backgroundLight800,
    Color? backgroundLight900,
    Color? backgroundLight950,
    Color? backgroundLightError,
    Color? backgroundDarkError,
    Color? backgroundLightWarning,
    Color? backgroundDarkWarning,
    Color? backgroundLightSuccess,
    Color? backgroundDarkSuccess,
    Color? backgroundLightInfo,
    Color? backgroundDarkInfo,
    Color? backgroundLightMuted,
    Color? backgroundDarkMuted,
    Color? white,
    Color? black,
    ValueGetter<Color?>? colorFromBase,
  }) {
    return GSColorsToken(
      rose50: rose50 ?? this.rose50,
      rose100: rose100 ?? this.rose100,
      rose200: rose200 ?? this.rose200,
      rose300: rose300 ?? this.rose300,
      rose400: rose400 ?? this.rose400,
      rose500: rose500 ?? this.rose500,
      rose600: rose600 ?? this.rose600,
      rose700: rose700 ?? this.rose700,
      rose800: rose800 ?? this.rose800,
      rose900: rose900 ?? this.rose900,
      pink50: pink50 ?? this.pink50,
      pink100: pink100 ?? this.pink100,
      pink200: pink200 ?? this.pink200,
      pink300: pink300 ?? this.pink300,
      pink400: pink400 ?? this.pink400,
      pink500: pink500 ?? this.pink500,
      pink600: pink600 ?? this.pink600,
      pink700: pink700 ?? this.pink700,
      pink800: pink800 ?? this.pink800,
      pink900: pink900 ?? this.pink900,
      fuchsia50: fuchsia50 ?? this.fuchsia50,
      fuchsia100: fuchsia100 ?? this.fuchsia100,
      fuchsia200: fuchsia200 ?? this.fuchsia200,
      fuchsia300: fuchsia300 ?? this.fuchsia300,
      fuchsia400: fuchsia400 ?? this.fuchsia400,
      fuchsia500: fuchsia500 ?? this.fuchsia500,
      fuchsia600: fuchsia600 ?? this.fuchsia600,
      fuchsia700: fuchsia700 ?? this.fuchsia700,
      fuchsia800: fuchsia800 ?? this.fuchsia800,
      fuchsia900: fuchsia900 ?? this.fuchsia900,
      purple50: purple50 ?? this.purple50,
      purple100: purple100 ?? this.purple100,
      purple200: purple200 ?? this.purple200,
      purple300: purple300 ?? this.purple300,
      purple400: purple400 ?? this.purple400,
      purple500: purple500 ?? this.purple500,
      purple600: purple600 ?? this.purple600,
      purple700: purple700 ?? this.purple700,
      purple800: purple800 ?? this.purple800,
      purple900: purple900 ?? this.purple900,
      violet50: violet50 ?? this.violet50,
      violet100: violet100 ?? this.violet100,
      violet200: violet200 ?? this.violet200,
      violet300: violet300 ?? this.violet300,
      violet400: violet400 ?? this.violet400,
      violet500: violet500 ?? this.violet500,
      violet600: violet600 ?? this.violet600,
      violet700: violet700 ?? this.violet700,
      violet800: violet800 ?? this.violet800,
      violet900: violet900 ?? this.violet900,
      indigo50: indigo50 ?? this.indigo50,
      indigo100: indigo100 ?? this.indigo100,
      indigo200: indigo200 ?? this.indigo200,
      indigo300: indigo300 ?? this.indigo300,
      indigo400: indigo400 ?? this.indigo400,
      indigo500: indigo500 ?? this.indigo500,
      indigo600: indigo600 ?? this.indigo600,
      indigo700: indigo700 ?? this.indigo700,
      indigo800: indigo800 ?? this.indigo800,
      indigo900: indigo900 ?? this.indigo900,
      blue50: blue50 ?? this.blue50,
      blue100: blue100 ?? this.blue100,
      blue200: blue200 ?? this.blue200,
      blue300: blue300 ?? this.blue300,
      blue400: blue400 ?? this.blue400,
      blue500: blue500 ?? this.blue500,
      blue600: blue600 ?? this.blue600,
      blue700: blue700 ?? this.blue700,
      blue800: blue800 ?? this.blue800,
      blue900: blue900 ?? this.blue900,
      lightBlue50: lightBlue50 ?? this.lightBlue50,
      lightBlue100: lightBlue100 ?? this.lightBlue100,
      lightBlue200: lightBlue200 ?? this.lightBlue200,
      lightBlue300: lightBlue300 ?? this.lightBlue300,
      lightBlue400: lightBlue400 ?? this.lightBlue400,
      lightBlue500: lightBlue500 ?? this.lightBlue500,
      lightBlue600: lightBlue600 ?? this.lightBlue600,
      lightBlue700: lightBlue700 ?? this.lightBlue700,
      lightBlue800: lightBlue800 ?? this.lightBlue800,
      lightBlue900: lightBlue900 ?? this.lightBlue900,
      darkBlue50: darkBlue50 ?? this.darkBlue50,
      darkBlue100: darkBlue100 ?? this.darkBlue100,
      darkBlue200: darkBlue200 ?? this.darkBlue200,
      darkBlue300: darkBlue300 ?? this.darkBlue300,
      darkBlue400: darkBlue400 ?? this.darkBlue400,
      darkBlue500: darkBlue500 ?? this.darkBlue500,
      darkBlue600: darkBlue600 ?? this.darkBlue600,
      darkBlue700: darkBlue700 ?? this.darkBlue700,
      darkBlue800: darkBlue800 ?? this.darkBlue800,
      darkBlue900: darkBlue900 ?? this.darkBlue900,
      cyan50: cyan50 ?? this.cyan50,
      cyan100: cyan100 ?? this.cyan100,
      cyan200: cyan200 ?? this.cyan200,
      cyan300: cyan300 ?? this.cyan300,
      cyan400: cyan400 ?? this.cyan400,
      cyan500: cyan500 ?? this.cyan500,
      cyan600: cyan600 ?? this.cyan600,
      cyan700: cyan700 ?? this.cyan700,
      cyan800: cyan800 ?? this.cyan800,
      cyan900: cyan900 ?? this.cyan900,
      teal50: teal50 ?? this.teal50,
      teal100: teal100 ?? this.teal100,
      teal200: teal200 ?? this.teal200,
      teal300: teal300 ?? this.teal300,
      teal400: teal400 ?? this.teal400,
      teal500: teal500 ?? this.teal500,
      teal600: teal600 ?? this.teal600,
      teal700: teal700 ?? this.teal700,
      teal800: teal800 ?? this.teal800,
      teal900: teal900 ?? this.teal900,
      emerald50: emerald50 ?? this.emerald50,
      emerald100: emerald100 ?? this.emerald100,
      emerald200: emerald200 ?? this.emerald200,
      emerald300: emerald300 ?? this.emerald300,
      emerald400: emerald400 ?? this.emerald400,
      emerald500: emerald500 ?? this.emerald500,
      emerald600: emerald600 ?? this.emerald600,
      emerald700: emerald700 ?? this.emerald700,
      emerald800: emerald800 ?? this.emerald800,
      emerald900: emerald900 ?? this.emerald900,
      green50: green50 ?? this.green50,
      green100: green100 ?? this.green100,
      green200: green200 ?? this.green200,
      green300: green300 ?? this.green300,
      green400: green400 ?? this.green400,
      green500: green500 ?? this.green500,
      green600: green600 ?? this.green600,
      green700: green700 ?? this.green700,
      green800: green800 ?? this.green800,
      green900: green900 ?? this.green900,
      lime50: lime50 ?? this.lime50,
      lime100: lime100 ?? this.lime100,
      lime200: lime200 ?? this.lime200,
      lime300: lime300 ?? this.lime300,
      lime400: lime400 ?? this.lime400,
      lime500: lime500 ?? this.lime500,
      lime600: lime600 ?? this.lime600,
      lime700: lime700 ?? this.lime700,
      lime800: lime800 ?? this.lime800,
      lime900: lime900 ?? this.lime900,
      yellow50: yellow50 ?? this.yellow50,
      yellow100: yellow100 ?? this.yellow100,
      yellow200: yellow200 ?? this.yellow200,
      yellow300: yellow300 ?? this.yellow300,
      yellow400: yellow400 ?? this.yellow400,
      yellow500: yellow500 ?? this.yellow500,
      yellow600: yellow600 ?? this.yellow600,
      yellow700: yellow700 ?? this.yellow700,
      yellow800: yellow800 ?? this.yellow800,
      yellow900: yellow900 ?? this.yellow900,
      amber50: amber50 ?? this.amber50,
      amber100: amber100 ?? this.amber100,
      amber200: amber200 ?? this.amber200,
      amber300: amber300 ?? this.amber300,
      amber400: amber400 ?? this.amber400,
      amber500: amber500 ?? this.amber500,
      amber600: amber600 ?? this.amber600,
      amber700: amber700 ?? this.amber700,
      amber800: amber800 ?? this.amber800,
      amber900: amber900 ?? this.amber900,
      orange50: orange50 ?? this.orange50,
      orange100: orange100 ?? this.orange100,
      orange200: orange200 ?? this.orange200,
      orange300: orange300 ?? this.orange300,
      orange400: orange400 ?? this.orange400,
      orange500: orange500 ?? this.orange500,
      orange600: orange600 ?? this.orange600,
      orange700: orange700 ?? this.orange700,
      orange800: orange800 ?? this.orange800,
      orange900: orange900 ?? this.orange900,
      red50: red50 ?? this.red50,
      red100: red100 ?? this.red100,
      red200: red200 ?? this.red200,
      red300: red300 ?? this.red300,
      red400: red400 ?? this.red400,
      red500: red500 ?? this.red500,
      red600: red600 ?? this.red600,
      red700: red700 ?? this.red700,
      red800: red800 ?? this.red800,
      red900: red900 ?? this.red900,
      warmGray50: warmGray50 ?? this.warmGray50,
      warmGray100: warmGray100 ?? this.warmGray100,
      warmGray200: warmGray200 ?? this.warmGray200,
      warmGray300: warmGray300 ?? this.warmGray300,
      warmGray400: warmGray400 ?? this.warmGray400,
      warmGray500: warmGray500 ?? this.warmGray500,
      warmGray600: warmGray600 ?? this.warmGray600,
      warmGray700: warmGray700 ?? this.warmGray700,
      warmGray800: warmGray800 ?? this.warmGray800,
      warmGray900: warmGray900 ?? this.warmGray900,
      trueGray50: trueGray50 ?? this.trueGray50,
      trueGray100: trueGray100 ?? this.trueGray100,
      trueGray200: trueGray200 ?? this.trueGray200,
      trueGray300: trueGray300 ?? this.trueGray300,
      trueGray400: trueGray400 ?? this.trueGray400,
      trueGray500: trueGray500 ?? this.trueGray500,
      trueGray600: trueGray600 ?? this.trueGray600,
      trueGray700: trueGray700 ?? this.trueGray700,
      trueGray800: trueGray800 ?? this.trueGray800,
      trueGray900: trueGray900 ?? this.trueGray900,
      coolGray50: coolGray50 ?? this.coolGray50,
      coolGray100: coolGray100 ?? this.coolGray100,
      coolGray200: coolGray200 ?? this.coolGray200,
      coolGray300: coolGray300 ?? this.coolGray300,
      coolGray400: coolGray400 ?? this.coolGray400,
      coolGray500: coolGray500 ?? this.coolGray500,
      coolGray600: coolGray600 ?? this.coolGray600,
      coolGray700: coolGray700 ?? this.coolGray700,
      coolGray800: coolGray800 ?? this.coolGray800,
      coolGray900: coolGray900 ?? this.coolGray900,
      blueGray50: blueGray50 ?? this.blueGray50,
      blueGray100: blueGray100 ?? this.blueGray100,
      blueGray200: blueGray200 ?? this.blueGray200,
      blueGray300: blueGray300 ?? this.blueGray300,
      blueGray400: blueGray400 ?? this.blueGray400,
      blueGray500: blueGray500 ?? this.blueGray500,
      blueGray600: blueGray600 ?? this.blueGray600,
      blueGray700: blueGray700 ?? this.blueGray700,
      blueGray800: blueGray800 ?? this.blueGray800,
      blueGray900: blueGray900 ?? this.blueGray900,
      tertiary50: tertiary50 ?? this.tertiary50,
      tertiary100: tertiary100 ?? this.tertiary100,
      tertiary200: tertiary200 ?? this.tertiary200,
      tertiary300: tertiary300 ?? this.tertiary300,
      tertiary400: tertiary400 ?? this.tertiary400,
      tertiary500: tertiary500 ?? this.tertiary500,
      tertiary600: tertiary600 ?? this.tertiary600,
      tertiary700: tertiary700 ?? this.tertiary700,
      tertiary800: tertiary800 ?? this.tertiary800,
      tertiary900: tertiary900 ?? this.tertiary900,
      error00: error00 ?? this.error00,
      error50: error50 ?? this.error50,
      error100: error100 ?? this.error100,
      error200: error200 ?? this.error200,
      error300: error300 ?? this.error300,
      error400: error400 ?? this.error400,
      error500: error500 ?? this.error500,
      error600: error600 ?? this.error600,
      error700: error700 ?? this.error700,
      error800: error800 ?? this.error800,
      error900: error900 ?? this.error900,
      error950: error950 ?? this.error950,
      success0: success0 ?? this.success0,
      success50: success50 ?? this.success50,
      success100: success100 ?? this.success100,
      success200: success200 ?? this.success200,
      success300: success300 ?? this.success300,
      success400: success400 ?? this.success400,
      success500: success500 ?? this.success500,
      success600: success600 ?? this.success600,
      success700: success700 ?? this.success700,
      success800: success800 ?? this.success800,
      success900: success900 ?? this.success900,
      success950: success950 ?? this.success950,
      warning50: warning50 ?? this.warning50,
      warning100: warning100 ?? this.warning100,
      warning200: warning200 ?? this.warning200,
      warning300: warning300 ?? this.warning300,
      warning400: warning400 ?? this.warning400,
      warning500: warning500 ?? this.warning500,
      warning600: warning600 ?? this.warning600,
      warning700: warning700 ?? this.warning700,
      warning800: warning800 ?? this.warning800,
      warning900: warning900 ?? this.warning900,
      info50: info50 ?? this.info50,
      info100: info100 ?? this.info100,
      info200: info200 ?? this.info200,
      info300: info300 ?? this.info300,
      info400: info400 ?? this.info400,
      info500: info500 ?? this.info500,
      info600: info600 ?? this.info600,
      info700: info700 ?? this.info700,
      info800: info800 ?? this.info800,
      info900: info900 ?? this.info900,
      light50: light50 ?? this.light50,
      light100: light100 ?? this.light100,
      light200: light200 ?? this.light200,
      light300: light300 ?? this.light300,
      light400: light400 ?? this.light400,
      light500: light500 ?? this.light500,
      light600: light600 ?? this.light600,
      light700: light700 ?? this.light700,
      light800: light800 ?? this.light800,
      light900: light900 ?? this.light900,
      primary0: primary0 ?? this.primary0,
      primary50: primary50 ?? this.primary50,
      primary100: primary100 ?? this.primary100,
      primary200: primary200 ?? this.primary200,
      primary300: primary300 ?? this.primary300,
      primary400: primary400 ?? this.primary400,
      primary500: primary500 ?? this.primary500,
      primary600: primary600 ?? this.primary600,
      primary700: primary700 ?? this.primary700,
      primary800: primary800 ?? this.primary800,
      primary900: primary900 ?? this.primary900,
      primary950: primary950 ?? this.primary950,
      secondary0: secondary0 ?? this.secondary0,
      secondary50: secondary50 ?? this.secondary50,
      secondary100: secondary100 ?? this.secondary100,
      secondary200: secondary200 ?? this.secondary200,
      secondary300: secondary300 ?? this.secondary300,
      secondary400: secondary400 ?? this.secondary400,
      secondary500: secondary500 ?? this.secondary500,
      secondary600: secondary600 ?? this.secondary600,
      secondary700: secondary700 ?? this.secondary700,
      secondary800: secondary800 ?? this.secondary800,
      secondary900: secondary900 ?? this.secondary900,
      secondary950: secondary950 ?? this.secondary950,
      textLight0: textLight0 ?? this.textLight0,
      textLight50: textLight50 ?? this.textLight50,
      textLight100: textLight100 ?? this.textLight100,
      textLight200: textLight200 ?? this.textLight200,
      textLight300: textLight300 ?? this.textLight300,
      textLight400: textLight400 ?? this.textLight400,
      textLight500: textLight500 ?? this.textLight500,
      textLight600: textLight600 ?? this.textLight600,
      textLight700: textLight700 ?? this.textLight700,
      textLight800: textLight800 ?? this.textLight800,
      textLight900: textLight900 ?? this.textLight900,
      textLight950: textLight950 ?? this.textLight950,
      textDark0: textDark0 ?? this.textDark0,
      textDark50: textDark50 ?? this.textDark50,
      textDark100: textDark100 ?? this.textDark100,
      textDark200: textDark200 ?? this.textDark200,
      textDark300: textDark300 ?? this.textDark300,
      textDark400: textDark400 ?? this.textDark400,
      textDark500: textDark500 ?? this.textDark500,
      textDark600: textDark600 ?? this.textDark600,
      textDark700: textDark700 ?? this.textDark700,
      textDark800: textDark800 ?? this.textDark800,
      textDark900: textDark900 ?? this.textDark900,
      textDark950: textDark950 ?? this.textDark950,
      borderDark0: borderDark0 ?? this.borderDark0,
      borderDark50: borderDark50 ?? this.borderDark50,
      borderDark100: borderDark100 ?? this.borderDark100,
      borderDark200: borderDark200 ?? this.borderDark200,
      borderDark300: borderDark300 ?? this.borderDark300,
      borderDark400: borderDark400 ?? this.borderDark400,
      borderDark500: borderDark500 ?? this.borderDark500,
      borderDark600: borderDark600 ?? this.borderDark600,
      borderDark700: borderDark700 ?? this.borderDark700,
      borderDark800: borderDark800 ?? this.borderDark800,
      borderDark900: borderDark900 ?? this.borderDark900,
      borderDark950: borderDark950 ?? this.borderDark950,
      borderLight0: borderLight0 ?? this.borderLight0,
      borderLight50: borderLight50 ?? this.borderLight50,
      borderLight100: borderLight100 ?? this.borderLight100,
      borderLight200: borderLight200 ?? this.borderLight200,
      borderLight300: borderLight300 ?? this.borderLight300,
      borderLight400: borderLight400 ?? this.borderLight400,
      borderLight500: borderLight500 ?? this.borderLight500,
      borderLight600: borderLight600 ?? this.borderLight600,
      borderLight700: borderLight700 ?? this.borderLight700,
      borderLight800: borderLight800 ?? this.borderLight800,
      borderLight900: borderLight900 ?? this.borderLight900,
      borderLight950: borderLight950 ?? this.borderLight950,
      backgroundDark0: backgroundDark0 ?? this.backgroundDark0,
      backgroundDark50: backgroundDark50 ?? this.backgroundDark50,
      backgroundDark100: backgroundDark100 ?? this.backgroundDark100,
      backgroundDark200: backgroundDark200 ?? this.backgroundDark200,
      backgroundDark300: backgroundDark300 ?? this.backgroundDark300,
      backgroundDark400: backgroundDark400 ?? this.backgroundDark400,
      backgroundDark500: backgroundDark500 ?? this.backgroundDark500,
      backgroundDark600: backgroundDark600 ?? this.backgroundDark600,
      backgroundDark700: backgroundDark700 ?? this.backgroundDark700,
      backgroundDark800: backgroundDark800 ?? this.backgroundDark800,
      backgroundDark900: backgroundDark900 ?? this.backgroundDark900,
      backgroundDark950: backgroundDark950 ?? this.backgroundDark950,
      backgroundLight0: backgroundLight0 ?? this.backgroundLight0,
      backgroundLight50: backgroundLight50 ?? this.backgroundLight50,
      backgroundLight100: backgroundLight100 ?? this.backgroundLight100,
      backgroundLight200: backgroundLight200 ?? this.backgroundLight200,
      backgroundLight300: backgroundLight300 ?? this.backgroundLight300,
      backgroundLight400: backgroundLight400 ?? this.backgroundLight400,
      backgroundLight500: backgroundLight500 ?? this.backgroundLight500,
      backgroundLight600: backgroundLight600 ?? this.backgroundLight600,
      backgroundLight700: backgroundLight700 ?? this.backgroundLight700,
      backgroundLight800: backgroundLight800 ?? this.backgroundLight800,
      backgroundLight900: backgroundLight900 ?? this.backgroundLight900,
      backgroundLight950: backgroundLight950 ?? this.backgroundLight950,
      backgroundLightError: backgroundLightError ?? this.backgroundLightError,
      backgroundDarkError: backgroundDarkError ?? this.backgroundDarkError,
      backgroundLightWarning:
          backgroundLightWarning ?? this.backgroundLightWarning,
      backgroundDarkWarning:
          backgroundDarkWarning ?? this.backgroundDarkWarning,
      backgroundLightSuccess:
          backgroundLightSuccess ?? this.backgroundLightSuccess,
      backgroundDarkSuccess:
          backgroundDarkSuccess ?? this.backgroundDarkSuccess,
      backgroundLightInfo: backgroundLightInfo ?? this.backgroundLightInfo,
      backgroundDarkInfo: backgroundDarkInfo ?? this.backgroundDarkInfo,
      backgroundLightMuted: backgroundLightMuted ?? this.backgroundLightMuted,
      backgroundDarkMuted: backgroundDarkMuted ?? this.backgroundDarkMuted,
      white: white ?? this.white,
      black: black ?? this.black,
      fromBaseColor:
          colorFromBase != null ? colorFromBase() : fromBaseColor,
    );
  }
}

class $GSColors {
  static Color get rose50 => colorInstance.rose50;
  static Color get rose100 => colorInstance.rose100;
  static Color get rose200 => colorInstance.rose200;
  static Color get rose300 => colorInstance.rose300;
  static Color get rose400 => colorInstance.rose400;
  static Color get rose500 => colorInstance.rose500;
  static Color get rose600 => colorInstance.rose600;
  static Color get rose700 => colorInstance.rose700;
  static Color get rose800 => colorInstance.rose800;
  static Color get rose900 => colorInstance.rose900;
  static Color get pink50 => colorInstance.pink50;
  static Color get pink100 => colorInstance.pink100;
  static Color get pink200 => colorInstance.pink200;
  static Color get pink300 => colorInstance.pink300;
  static Color get pink400 => colorInstance.pink400;
  static Color get pink500 => colorInstance.pink500;
  static Color get pink600 => colorInstance.pink600;
  static Color get pink700 => colorInstance.pink700;
  static Color get pink800 => colorInstance.pink800;
  static Color get pink900 => colorInstance.pink900;
  static Color get fuchsia50 => colorInstance.fuchsia50;
  static Color get fuchsia100 => colorInstance.fuchsia100;
  static Color get fuchsia200 => colorInstance.fuchsia200;
  static Color get fuchsia300 => colorInstance.fuchsia300;
  static Color get fuchsia400 => colorInstance.fuchsia400;
  static Color get fuchsia500 => colorInstance.fuchsia500;
  static Color get fuchsia600 => colorInstance.fuchsia600;
  static Color get fuchsia700 => colorInstance.fuchsia700;
  static Color get fuchsia800 => colorInstance.fuchsia800;
  static Color get fuchsia900 => colorInstance.fuchsia900;
  static Color get purple50 => colorInstance.purple50;
  static Color get purple100 => colorInstance.purple100;
  static Color get purple200 => colorInstance.purple200;
  static Color get purple300 => colorInstance.purple300;
  static Color get purple400 => colorInstance.purple400;
  static Color get purple500 => colorInstance.purple500;
  static Color get purple600 => colorInstance.purple600;
  static Color get purple700 => colorInstance.purple700;
  static Color get purple800 => colorInstance.purple800;
  static Color get purple900 => colorInstance.purple900;
  static Color get violet50 => colorInstance.violet50;
  static Color get violet100 => colorInstance.violet100;
  static Color get violet200 => colorInstance.violet200;
  static Color get violet300 => colorInstance.violet300;
  static Color get violet400 => colorInstance.violet400;
  static Color get violet500 => colorInstance.violet500;
  static Color get violet600 => colorInstance.violet600;
  static Color get violet700 => colorInstance.violet700;
  static Color get violet800 => colorInstance.violet800;
  static Color get violet900 => colorInstance.violet900;
  static Color get indigo50 => colorInstance.indigo50;
  static Color get indigo100 => colorInstance.indigo100;
  static Color get indigo200 => colorInstance.indigo200;
  static Color get indigo300 => colorInstance.indigo300;
  static Color get indigo400 => colorInstance.indigo400;
  static Color get indigo500 => colorInstance.indigo500;
  static Color get indigo600 => colorInstance.indigo600;
  static Color get indigo700 => colorInstance.indigo700;
  static Color get indigo800 => colorInstance.indigo800;
  static Color get indigo900 => colorInstance.indigo900;
  static Color get blue50 => colorInstance.blue50;
  static Color get blue100 => colorInstance.blue100;
  static Color get blue200 => colorInstance.blue200;
  static Color get blue300 => colorInstance.blue300;
  static Color get blue400 => colorInstance.blue400;
  static Color get blue500 => colorInstance.blue500;
  static Color get blue600 => colorInstance.blue600;
  static Color get blue700 => colorInstance.blue700;
  static Color get blue800 => colorInstance.blue800;
  static Color get blue900 => colorInstance.blue900;
  static Color get lightBlue50 => colorInstance.lightBlue50;
  static Color get lightBlue100 => colorInstance.lightBlue100;
  static Color get lightBlue200 => colorInstance.lightBlue200;
  static Color get lightBlue300 => colorInstance.lightBlue300;
  static Color get lightBlue400 => colorInstance.lightBlue400;
  static Color get lightBlue500 => colorInstance.lightBlue500;
  static Color get lightBlue600 => colorInstance.lightBlue600;
  static Color get lightBlue700 => colorInstance.lightBlue700;
  static Color get lightBlue800 => colorInstance.lightBlue800;
  static Color get lightBlue900 => colorInstance.lightBlue900;
  static Color get darkBlue50 => colorInstance.darkBlue50;
  static Color get darkBlue100 => colorInstance.darkBlue100;
  static Color get darkBlue200 => colorInstance.darkBlue200;
  static Color get darkBlue300 => colorInstance.darkBlue300;
  static Color get darkBlue400 => colorInstance.darkBlue400;
  static Color get darkBlue500 => colorInstance.darkBlue500;
  static Color get darkBlue600 => colorInstance.darkBlue600;
  static Color get darkBlue700 => colorInstance.darkBlue700;
  static Color get darkBlue800 => colorInstance.darkBlue800;
  static Color get darkBlue900 => colorInstance.darkBlue900;
  static Color get cyan50 => colorInstance.cyan50;
  static Color get cyan100 => colorInstance.cyan100;
  static Color get cyan200 => colorInstance.cyan200;
  static Color get cyan300 => colorInstance.cyan300;
  static Color get cyan400 => colorInstance.cyan400;
  static Color get cyan500 => colorInstance.cyan500;
  static Color get cyan600 => colorInstance.cyan600;
  static Color get cyan700 => colorInstance.cyan700;
  static Color get cyan800 => colorInstance.cyan800;
  static Color get cyan900 => colorInstance.cyan900;
  static Color get teal50 => colorInstance.teal50;
  static Color get teal100 => colorInstance.teal100;
  static Color get teal200 => colorInstance.teal200;
  static Color get teal300 => colorInstance.teal300;
  static Color get teal400 => colorInstance.teal400;
  static Color get teal500 => colorInstance.teal500;
  static Color get teal600 => colorInstance.teal600;
  static Color get teal700 => colorInstance.teal700;
  static Color get teal800 => colorInstance.teal800;
  static Color get teal900 => colorInstance.teal900;
  static Color get emerald50 => colorInstance.emerald50;
  static Color get emerald100 => colorInstance.emerald100;
  static Color get emerald200 => colorInstance.emerald200;
  static Color get emerald300 => colorInstance.emerald300;
  static Color get emerald400 => colorInstance.emerald400;
  static Color get emerald500 => colorInstance.emerald500;
  static Color get emerald600 => colorInstance.emerald600;
  static Color get emerald700 => colorInstance.emerald700;
  static Color get emerald800 => colorInstance.emerald800;
  static Color get emerald900 => colorInstance.emerald900;
  static Color get green50 => colorInstance.green50;
  static Color get green100 => colorInstance.green100;
  static Color get green200 => colorInstance.green200;
  static Color get green300 => colorInstance.green300;
  static Color get green400 => colorInstance.green400;
  static Color get green500 => colorInstance.green500;
  static Color get green600 => colorInstance.green600;
  static Color get green700 => colorInstance.green700;
  static Color get green800 => colorInstance.green800;
  static Color get green900 => colorInstance.green900;
  static Color get lime50 => colorInstance.lime50;
  static Color get lime100 => colorInstance.lime100;
  static Color get lime200 => colorInstance.lime200;
  static Color get lime300 => colorInstance.lime300;
  static Color get lime400 => colorInstance.lime400;
  static Color get lime500 => colorInstance.lime500;
  static Color get lime600 => colorInstance.lime600;
  static Color get lime700 => colorInstance.lime700;
  static Color get lime800 => colorInstance.lime800;
  static Color get lime900 => colorInstance.lime900;
  static Color get yellow50 => colorInstance.yellow50;
  static Color get yellow100 => colorInstance.yellow100;
  static Color get yellow200 => colorInstance.yellow200;
  static Color get yellow300 => colorInstance.yellow300;
  static Color get yellow400 => colorInstance.yellow400;
  static Color get yellow500 => colorInstance.yellow500;
  static Color get yellow600 => colorInstance.yellow600;
  static Color get yellow700 => colorInstance.yellow700;
  static Color get yellow800 => colorInstance.yellow800;
  static Color get yellow900 => colorInstance.yellow900;
  static Color get amber50 => colorInstance.amber50;
  static Color get amber100 => colorInstance.amber100;
  static Color get amber200 => colorInstance.amber200;
  static Color get amber300 => colorInstance.amber300;
  static Color get amber400 => colorInstance.amber400;
  static Color get amber500 => colorInstance.amber500;
  static Color get amber600 => colorInstance.amber600;
  static Color get amber700 => colorInstance.amber700;
  static Color get amber800 => colorInstance.amber800;
  static Color get amber900 => colorInstance.amber900;
  static Color get orange50 => colorInstance.orange50;
  static Color get orange100 => colorInstance.orange100;
  static Color get orange200 => colorInstance.orange200;
  static Color get orange300 => colorInstance.orange300;
  static Color get orange400 => colorInstance.orange400;
  static Color get orange500 => colorInstance.orange500;
  static Color get orange600 => colorInstance.orange600;
  static Color get orange700 => colorInstance.orange700;
  static Color get orange800 => colorInstance.orange800;
  static Color get orange900 => colorInstance.orange900;
  static Color get red50 => colorInstance.red50;
  static Color get red100 => colorInstance.red100;
  static Color get red200 => colorInstance.red200;
  static Color get red300 => colorInstance.red300;
  static Color get red400 => colorInstance.red400;
  static Color get red500 => colorInstance.red500;
  static Color get red600 => colorInstance.red600;
  static Color get red700 => colorInstance.red700;
  static Color get red800 => colorInstance.red800;
  static Color get red900 => colorInstance.red900;
  static Color get warmGray50 => colorInstance.warmGray50;
  static Color get warmGray100 => colorInstance.warmGray100;
  static Color get warmGray200 => colorInstance.warmGray200;
  static Color get warmGray300 => colorInstance.warmGray300;
  static Color get warmGray400 => colorInstance.warmGray400;
  static Color get warmGray500 => colorInstance.warmGray500;
  static Color get warmGray600 => colorInstance.warmGray600;
  static Color get warmGray700 => colorInstance.warmGray700;
  static Color get warmGray800 => colorInstance.warmGray800;
  static Color get warmGray900 => colorInstance.warmGray900;
  static Color get trueGray50 => colorInstance.trueGray50;
  static Color get trueGray100 => colorInstance.trueGray100;
  static Color get trueGray200 => colorInstance.trueGray200;
  static Color get trueGray300 => colorInstance.trueGray300;
  static Color get trueGray400 => colorInstance.trueGray400;
  static Color get trueGray500 => colorInstance.trueGray500;
  static Color get trueGray600 => colorInstance.trueGray600;
  static Color get trueGray700 => colorInstance.trueGray700;
  static Color get trueGray800 => colorInstance.trueGray800;
  static Color get trueGray900 => colorInstance.trueGray900;
  static Color get coolGray50 => colorInstance.coolGray50;
  static Color get coolGray100 => colorInstance.coolGray100;
  static Color get coolGray200 => colorInstance.coolGray200;
  static Color get coolGray300 => colorInstance.coolGray300;
  static Color get coolGray400 => colorInstance.coolGray400;
  static Color get coolGray500 => colorInstance.coolGray500;
  static Color get coolGray600 => colorInstance.coolGray600;
  static Color get coolGray700 => colorInstance.coolGray700;
  static Color get coolGray800 => colorInstance.coolGray800;
  static Color get coolGray900 => colorInstance.coolGray900;
  static Color get blueGray50 => colorInstance.blueGray50;
  static Color get blueGray100 => colorInstance.blueGray100;
  static Color get blueGray200 => colorInstance.blueGray200;
  static Color get blueGray300 => colorInstance.blueGray300;
  static Color get blueGray400 => colorInstance.blueGray400;
  static Color get blueGray500 => colorInstance.blueGray500;
  static Color get blueGray600 => colorInstance.blueGray600;
  static Color get blueGray700 => colorInstance.blueGray700;
  static Color get blueGray800 => colorInstance.blueGray800;
  static Color get blueGray900 => colorInstance.blueGray900;
  static Color get tertiary50 => colorInstance.tertiary50;
  static Color get tertiary100 => colorInstance.tertiary100;
  static Color get tertiary200 => colorInstance.tertiary200;
  static Color get tertiary300 => colorInstance.tertiary300;
  static Color get tertiary400 => colorInstance.tertiary400;
  static Color get tertiary500 => colorInstance.tertiary500;
  static Color get tertiary600 => colorInstance.tertiary600;
  static Color get tertiary700 => colorInstance.tertiary700;
  static Color get tertiary800 => colorInstance.tertiary800;
  static Color get tertiary900 => colorInstance.tertiary900;
  static Color get error00 => colorInstance.error00;
  static Color get error50 => colorInstance.error50;
  static Color get error100 => colorInstance.error100;
  static Color get error200 => colorInstance.error200;
  static Color get error300 => colorInstance.error300;
  static Color get error400 => colorInstance.error400;
  static Color get error500 => colorInstance.error500;
  static Color get error600 => colorInstance.error600;
  static Color get error700 => colorInstance.error700;
  static Color get error800 => colorInstance.error800;
  static Color get error900 => colorInstance.error900;
  static Color get error950 => colorInstance.error950;
  static Color get success0 => colorInstance.success0;
  static Color get success50 => colorInstance.success50;
  static Color get success100 => colorInstance.success100;
  static Color get success200 => colorInstance.success200;
  static Color get success300 => colorInstance.success300;
  static Color get success400 => colorInstance.success400;
  static Color get success500 => colorInstance.success500;
  static Color get success600 => colorInstance.success600;
  static Color get success700 => colorInstance.success700;
  static Color get success800 => colorInstance.success800;
  static Color get success900 => colorInstance.success900;
  static Color get success950 => colorInstance.success950;
  static Color get warning50 => colorInstance.warning50;
  static Color get warning100 => colorInstance.warning100;
  static Color get warning200 => colorInstance.warning200;
  static Color get warning300 => colorInstance.warning300;
  static Color get warning400 => colorInstance.warning400;
  static Color get warning500 => colorInstance.warning500;
  static Color get warning600 => colorInstance.warning600;
  static Color get warning700 => colorInstance.warning700;
  static Color get warning800 => colorInstance.warning800;
  static Color get warning900 => colorInstance.warning900;
  static Color get info50 => colorInstance.info50;
  static Color get info100 => colorInstance.info100;
  static Color get info200 => colorInstance.info200;
  static Color get info300 => colorInstance.info300;
  static Color get info400 => colorInstance.info400;
  static Color get info500 => colorInstance.info500;
  static Color get info600 => colorInstance.info600;
  static Color get info700 => colorInstance.info700;
  static Color get info800 => colorInstance.info800;
  static Color get info900 => colorInstance.info900;
  static Color get light50 => colorInstance.light50;
  static Color get light100 => colorInstance.light100;
  static Color get light200 => colorInstance.light200;
  static Color get light300 => colorInstance.light300;
  static Color get light400 => colorInstance.light400;
  static Color get light500 => colorInstance.light500;
  static Color get light600 => colorInstance.light600;
  static Color get light700 => colorInstance.light700;
  static Color get light800 => colorInstance.light800;
  static Color get light900 => colorInstance.light900;
  static Color get primary0 => colorInstance.primary0;
  static Color get primary50 => colorInstance.primary50;
  static Color get primary100 => colorInstance.primary100;
  static Color get primary200 => colorInstance.primary200;
  static Color get primary300 => colorInstance.primary300;
  static Color get primary400 => colorInstance.primary400;
  static Color get primary500 => colorInstance.primary500;
  static Color get primary600 => colorInstance.primary600;
  static Color get primary700 => colorInstance.primary700;
  static Color get primary800 => colorInstance.primary800;
  static Color get primary900 => colorInstance.primary900;
  static Color get primary950 => colorInstance.primary950;
  static Color get secondary0 => colorInstance.secondary0;
  static Color get secondary50 => colorInstance.secondary50;
  static Color get secondary100 => colorInstance.secondary100;
  static Color get secondary200 => colorInstance.secondary200;
  static Color get secondary300 => colorInstance.secondary300;
  static Color get secondary400 => colorInstance.secondary400;
  static Color get secondary500 => colorInstance.secondary500;
  static Color get secondary600 => colorInstance.secondary600;
  static Color get secondary700 => colorInstance.secondary700;
  static Color get secondary800 => colorInstance.secondary800;
  static Color get secondary900 => colorInstance.secondary900;
  static Color get secondary950 => colorInstance.secondary950;
  static Color get textLight0 => colorInstance.textLight0;
  static Color get textLight50 => colorInstance.textLight50;
  static Color get textLight100 => colorInstance.textLight100;
  static Color get textLight200 => colorInstance.textLight200;
  static Color get textLight300 => colorInstance.textLight300;
  static Color get textLight400 => colorInstance.textLight400;
  static Color get textLight500 => colorInstance.textLight500;
  static Color get textLight600 => colorInstance.textLight600;
  static Color get textLight700 => colorInstance.textLight700;
  static Color get textLight800 => colorInstance.textLight800;
  static Color get textLight900 => colorInstance.textLight900;
  static Color get textLight950 => colorInstance.textLight950;
  static Color get textDark0 => colorInstance.textDark0;
  static Color get textDark50 => colorInstance.textDark50;
  static Color get textDark100 => colorInstance.textDark100;
  static Color get textDark200 => colorInstance.textDark200;
  static Color get textDark300 => colorInstance.textDark300;
  static Color get textDark400 => colorInstance.textDark400;
  static Color get textDark500 => colorInstance.textDark500;
  static Color get textDark600 => colorInstance.textDark600;
  static Color get textDark700 => colorInstance.textDark700;
  static Color get textDark800 => colorInstance.textDark800;
  static Color get textDark900 => colorInstance.textDark900;
  static Color get textDark950 => colorInstance.textDark950;
  static Color get borderDark0 => colorInstance.borderDark0;
  static Color get borderDark50 => colorInstance.borderDark50;
  static Color get borderDark100 => colorInstance.borderDark100;
  static Color get borderDark200 => colorInstance.borderDark200;
  static Color get borderDark300 => colorInstance.borderDark300;
  static Color get borderDark400 => colorInstance.borderDark400;
  static Color get borderDark500 => colorInstance.borderDark500;
  static Color get borderDark600 => colorInstance.borderDark600;
  static Color get borderDark700 => colorInstance.borderDark700;
  static Color get borderDark800 => colorInstance.borderDark800;
  static Color get borderDark900 => colorInstance.borderDark900;
  static Color get borderDark950 => colorInstance.borderDark950;
  static Color get borderLight0 => colorInstance.borderLight0;
  static Color get borderLight50 => colorInstance.borderLight50;
  static Color get borderLight100 => colorInstance.borderLight100;
  static Color get borderLight200 => colorInstance.borderLight200;
  static Color get borderLight300 => colorInstance.borderLight300;
  static Color get borderLight400 => colorInstance.borderLight400;
  static Color get borderLight500 => colorInstance.borderLight500;
  static Color get borderLight600 => colorInstance.borderLight600;
  static Color get borderLight700 => colorInstance.borderLight700;
  static Color get borderLight800 => colorInstance.borderLight800;
  static Color get borderLight900 => colorInstance.borderLight900;
  static Color get borderLight950 => colorInstance.borderLight950;
  static Color get backgroundDark0 => colorInstance.backgroundDark0;
  static Color get backgroundDark50 => colorInstance.backgroundDark50;
  static Color get backgroundDark100 => colorInstance.backgroundDark100;
  static Color get backgroundDark200 => colorInstance.backgroundDark200;
  static Color get backgroundDark300 => colorInstance.backgroundDark300;
  static Color get backgroundDark400 => colorInstance.backgroundDark400;
  static Color get backgroundDark500 => colorInstance.backgroundDark500;
  static Color get backgroundDark600 => colorInstance.backgroundDark600;
  static Color get backgroundDark700 => colorInstance.backgroundDark700;
  static Color get backgroundDark800 => colorInstance.backgroundDark800;
  static Color get backgroundDark900 => colorInstance.backgroundDark900;
  static Color get backgroundDark950 => colorInstance.backgroundDark950;
  static Color get backgroundLight0 => colorInstance.backgroundLight0;
  static Color get backgroundLight50 => colorInstance.backgroundLight50;
  static Color get backgroundLight100 => colorInstance.backgroundLight100;
  static Color get backgroundLight200 => colorInstance.backgroundLight200;
  static Color get backgroundLight300 => colorInstance.backgroundLight300;
  static Color get backgroundLight400 => colorInstance.backgroundLight400;
  static Color get backgroundLight500 => colorInstance.backgroundLight500;
  static Color get backgroundLight600 => colorInstance.backgroundLight600;
  static Color get backgroundLight700 => colorInstance.backgroundLight700;
  static Color get backgroundLight800 => colorInstance.backgroundLight800;
  static Color get backgroundLight900 => colorInstance.backgroundLight900;
  static Color get backgroundLight950 => colorInstance.backgroundLight950;
  static Color get backgroundLightError => colorInstance.backgroundLightError;
  static Color get backgroundDarkError => colorInstance.backgroundDarkError;
  static Color get backgroundLightWarning =>
      colorInstance.backgroundLightWarning;
  static Color get backgroundDarkWarning => colorInstance.backgroundDarkWarning;
  static Color get backgroundLightSuccess =>
      colorInstance.backgroundLightSuccess;
  static Color get backgroundDarkSuccess => colorInstance.backgroundDarkSuccess;
  static Color get backgroundLightInfo => colorInstance.backgroundLightInfo;
  static Color get backgroundDarkInfo => colorInstance.backgroundDarkInfo;
  static Color get backgroundLightMuted => colorInstance.backgroundLightMuted;
  static Color get backgroundDarkMuted => colorInstance.backgroundDarkMuted;
  static Color get white => colorInstance.white;
  static Color get black => colorInstance.black;

  static Map<String, Color> colorMap = {
    "rose50": rose50,
    "rose100": rose100,
    "rose200": rose200,
    "rose300": rose300,
    "rose400": rose400,
    "rose500": rose500,
    "rose600": rose600,
    "rose700": rose700,
    "rose800": rose800,
    "rose900": rose900,
    "pink50": pink50,
    "pink100": pink100,
    "pink200": pink200,
    "pink300": pink300,
    "pink400": pink400,
    "pink500": pink500,
    "pink600": pink600,
    "pink700": pink700,
    "pink800": pink800,
    "pink900": pink900,
    "fuchsia50": fuchsia50,
    "fuchsia100": fuchsia100,
    "fuchsia200": fuchsia200,
    "fuchsia300": fuchsia300,
    "fuchsia400": fuchsia400,
    "fuchsia500": fuchsia500,
    "fuchsia600": fuchsia600,
    "fuchsia700": fuchsia700,
    "fuchsia800": fuchsia800,
    "fuchsia900": fuchsia900,
    "purple50": purple50,
    "purple100": purple100,
    "purple200": purple200,
    "purple300": purple300,
    "purple400": purple400,
    "purple500": purple500,
    "purple600": purple600,
    "purple700": purple700,
    "purple800": purple800,
    "purple900": purple900,
    "violet50": violet50,
    "violet100": violet100,
    "violet200": violet200,
    "violet300": violet300,
    "violet400": violet400,
    "violet500": violet500,
    "violet600": violet600,
    "violet700": violet700,
    "violet800": violet800,
    "violet900": violet900,
    "indigo50": indigo50,
    "indigo100": indigo100,
    "indigo200": indigo200,
    "indigo300": indigo300,
    "indigo400": indigo400,
    "indigo500": indigo500,
    "indigo600": indigo600,
    "indigo700": indigo700,
    "indigo800": indigo800,
    "indigo900": indigo900,
    "blue50": blue50,
    "blue100": blue100,
    "blue200": blue200,
    "blue300": blue300,
    "blue400": blue400,
    "blue500": blue500,
    "blue600": blue600,
    "blue700": blue700,
    "blue800": blue800,
    "blue900": blue900,
    "lightBlue50": lightBlue50,
    "lightBlue100": lightBlue100,
    "lightBlue200": lightBlue200,
    "lightBlue300": lightBlue300,
    "lightBlue400": lightBlue400,
    "lightBlue500": lightBlue500,
    "lightBlue600": lightBlue600,
    "lightBlue700": lightBlue700,
    "lightBlue800": lightBlue800,
    "lightBlue900": lightBlue900,
    "darkBlue50": darkBlue50,
    "darkBlue100": darkBlue100,
    "darkBlue200": darkBlue200,
    "darkBlue300": darkBlue300,
    "darkBlue400": darkBlue400,
    "darkBlue500": darkBlue500,
    "darkBlue600": darkBlue600,
    "darkBlue700": darkBlue700,
    "darkBlue800": darkBlue800,
    "darkBlue900": darkBlue900,
    "cyan50": cyan50,
    "cyan100": cyan100,
    "cyan200": cyan200,
    "cyan300": cyan300,
    "cyan400": cyan400,
    "cyan500": cyan500,
    "cyan600": cyan600,
    "cyan700": cyan700,
    "cyan800": cyan800,
    "cyan900": cyan900,
    "teal50": teal50,
    "teal100": teal100,
    "teal200": teal200,
    "teal300": teal300,
    "teal400": teal400,
    "teal500": teal500,
    "teal600": teal600,
    "teal700": teal700,
    "teal800": teal800,
    "teal900": teal900,
    "emerald50": emerald50,
    "emerald100": emerald100,
    "emerald200": emerald200,
    "emerald300": emerald300,
    "emerald400": emerald400,
    "emerald500": emerald500,
    "emerald600": emerald600,
    "emerald700": emerald700,
    "emerald800": emerald800,
    "emerald900": emerald900,
    "green50": green50,
    "green100": green100,
    "green200": green200,
    "green300": green300,
    "green400": green400,
    "green500": green500,
    "green600": green600,
    "green700": green700,
    "green800": green800,
    "green900": green900,
    "lime50": lime50,
    "lime100": lime100,
    "lime200": lime200,
    "lime300": lime300,
    "lime400": lime400,
    "lime500": lime500,
    "lime600": lime600,
    "lime700": lime700,
    "lime800": lime800,
    "lime900": lime900,
    "yellow50": yellow50,
    "yellow100": yellow100,
    "yellow200": yellow200,
    "yellow300": yellow300,
    "yellow400": yellow400,
    "yellow500": yellow500,
    "yellow600": yellow600,
    "yellow700": yellow700,
    "yellow800": yellow800,
    "yellow900": yellow900,
    "amber50": amber50,
    "amber100": amber100,
    "amber200": amber200,
    "amber300": amber300,
    "amber400": amber400,
    "amber500": amber500,
    "amber600": amber600,
    "amber700": amber700,
    "amber800": amber800,
    "amber900": amber900,
    "orange50": orange50,
    "orange100": orange100,
    "orange200": orange200,
    "orange300": orange300,
    "orange400": orange400,
    "orange500": orange500,
    "orange600": orange600,
    "orange700": orange700,
    "orange800": orange800,
    "orange900": orange900,
    "red50": red50,
    "red100": red100,
    "red200": red200,
    "red300": red300,
    "red400": red400,
    "red500": red500,
    "red600": red600,
    "red700": red700,
    "red800": red800,
    "red900": red900,
    "warmGray50": warmGray50,
    "warmGray100": warmGray100,
    "warmGray200": warmGray200,
    "warmGray300": warmGray300,
    "warmGray400": warmGray400,
    "warmGray500": warmGray500,
    "warmGray600": warmGray600,
    "warmGray700": warmGray700,
    "warmGray800": warmGray800,
    "warmGray900": warmGray900,
    "trueGray50": trueGray50,
    "trueGray100": trueGray100,
    "trueGray200": trueGray200,
    "trueGray300": trueGray300,
    "trueGray400": trueGray400,
    "trueGray500": trueGray500,
    "trueGray600": trueGray600,
    "trueGray700": trueGray700,
    "trueGray800": trueGray800,
    "trueGray900": trueGray900,
    "coolGray50": coolGray50,
    "coolGray100": coolGray100,
    "coolGray200": coolGray200,
    "coolGray300": coolGray300,
    "coolGray400": coolGray400,
    "coolGray500": coolGray500,
    "coolGray600": coolGray600,
    "coolGray700": coolGray700,
    "coolGray800": coolGray800,
    "coolGray900": coolGray900,
    "blueGray50": blueGray50,
    "blueGray100": blueGray100,
    "blueGray200": blueGray200,
    "blueGray300": blueGray300,
    "blueGray400": blueGray400,
    "blueGray500": blueGray500,
    "blueGray600": blueGray600,
    "blueGray700": blueGray700,
    "blueGray800": blueGray800,
    "blueGray900": blueGray900,
    "tertiary50": tertiary50,
    "tertiary100": tertiary100,
    "tertiary200": tertiary200,
    "tertiary300": tertiary300,
    "tertiary400": tertiary400,
    "tertiary500": tertiary500,
    "tertiary600": tertiary600,
    "tertiary700": tertiary700,
    "tertiary800": tertiary800,
    "tertiary900": tertiary900,
    "error00": error00,
    "error50": error50,
    "error100": error100,
    "error200": error200,
    "error300": error300,
    "error400": error400,
    "error500": error500,
    "error600": error600,
    "error700": error700,
    "error800": error800,
    "error900": error900,
    "error950": error950,
    "success0": success0,
    "success50": success50,
    "success100": success100,
    "success200": success200,
    "success300": success300,
    "success400": success400,
    "success500": success500,
    "success600": success600,
    "success700": success700,
    "success800": success800,
    "success900": success900,
    "success950": success950,
    "warning50": warning50,
    "warning100": warning100,
    "warning200": warning200,
    "warning300": warning300,
    "warning400": warning400,
    "warning500": warning500,
    "warning600": warning600,
    "warning700": warning700,
    "warning800": warning800,
    "warning900": warning900,
    "info50": info50,
    "info100": info100,
    "info200": info200,
    "info300": info300,
    "info400": info400,
    "info500": info500,
    "info600": info600,
    "info700": info700,
    "info800": info800,
    "info900": info900,
    "light50": light50,
    "light100": light100,
    "light200": light200,
    "light300": light300,
    "light400": light400,
    "light500": light500,
    "light600": light600,
    "light700": light700,
    "light800": light800,
    "light900": light900,
    "primary0": primary0,
    "primary50": primary50,
    "primary100": primary100,
    "primary200": primary200,
    "primary300": primary300,
    "primary400": primary400,
    "primary500": primary500,
    "primary600": primary600,
    "primary700": primary700,
    "primary800": primary800,
    "primary900": primary900,
    "primary950": primary950,
    "secondary0": secondary0,
    "secondary50": secondary50,
    "secondary100": secondary100,
    "secondary200": secondary200,
    "secondary300": secondary300,
    "secondary400": secondary400,
    "secondary500": secondary500,
    "secondary600": secondary600,
    "secondary700": secondary700,
    "secondary800": secondary800,
    "secondary900": secondary900,
    "secondary950": secondary950,
    "textLight0": textLight0,
    "textLight50": textLight50,
    "textLight100": textLight100,
    "textLight200": textLight200,
    "textLight300": textLight300,
    "textLight400": textLight400,
    "textLight500": textLight500,
    "textLight600": textLight600,
    "textLight700": textLight700,
    "textLight800": textLight800,
    "textLight900": textLight900,
    "textLight950": textLight950,
    "textDark0": textDark0,
    "textDark50": textDark50,
    "textDark100": textDark100,
    "textDark200": textDark200,
    "textDark300": textDark300,
    "textDark400": textDark400,
    "textDark500": textDark500,
    "textDark600": textDark600,
    "textDark700": textDark700,
    "textDark800": textDark800,
    "textDark900": textDark900,
    "textDark950": textDark950,
    "borderDark0": borderDark0,
    "borderDark50": borderDark50,
    "borderDark100": borderDark100,
    "borderDark200": borderDark200,
    "borderDark300": borderDark300,
    "borderDark400": borderDark400,
    "borderDark500": borderDark500,
    "borderDark600": borderDark600,
    "borderDark700": borderDark700,
    "borderDark800": borderDark800,
    "borderDark900": borderDark900,
    "borderDark950": borderDark950,
    "borderLight0": borderLight0,
    "borderLight50": borderLight50,
    "borderLight100": borderLight100,
    "borderLight200": borderLight200,
    "borderLight300": borderLight300,
    "borderLight400": borderLight400,
    "borderLight500": borderLight500,
    "borderLight600": borderLight600,
    "borderLight700": borderLight700,
    "borderLight800": borderLight800,
    "borderLight900": borderLight900,
    "borderLight950": borderLight950,
    "backgroundDark0": backgroundDark0,
    "backgroundDark50": backgroundDark50,
    "backgroundDark100": backgroundDark100,
    "backgroundDark200": backgroundDark200,
    "backgroundDark300": backgroundDark300,
    "backgroundDark400": backgroundDark400,
    "backgroundDark500": backgroundDark500,
    "backgroundDark600": backgroundDark600,
    "backgroundDark700": backgroundDark700,
    "backgroundDark800": backgroundDark800,
    "backgroundDark900": backgroundDark900,
    "backgroundDark950": backgroundDark950,
    "backgroundLight0": backgroundLight0,
    "backgroundLight50": backgroundLight50,
    "backgroundLight100": backgroundLight100,
    "backgroundLight200": backgroundLight200,
    "backgroundLight300": backgroundLight300,
    "backgroundLight400": backgroundLight400,
    "backgroundLight500": backgroundLight500,
    "backgroundLight600": backgroundLight600,
    "backgroundLight700": backgroundLight700,
    "backgroundLight800": backgroundLight800,
    "backgroundLight900": backgroundLight900,
    "backgroundLight950": backgroundLight950,
    "backgroundLightError": backgroundLightError,
    "backgroundDarkError": backgroundDarkError,
    "backgroundLightWarning": backgroundLightWarning,
    "backgroundDarkWarning": backgroundDarkWarning,
    "backgroundLightSuccess": backgroundLightSuccess,
    "backgroundDarkSuccess": backgroundDarkSuccess,
    "backgroundLightInfo": backgroundLightInfo,
    "backgroundDarkInfo": backgroundDarkInfo,
    "backgroundLightMuted": backgroundLightMuted,
    "backgroundDarkMuted": backgroundDarkMuted,
    "white": white,
    "black": black,
  };
}
