import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/theme/config/accordian/accordian.dart';

// GSStyle representing the base style for the Accordion
final GSStyle accordionStyle = GSStyle.fromMap(
  data: getIt<GluestackCustomConfig>().accordion,
);
