///
/// Configuration for Gluestack UI widget. It is used to track the relationship between
/// widgets and its ancestor / descendents, so that we can implicitly apply styles to descendent widgets.
///
class GSStyleConfig {
  final String componentName;
  final List<String> descendantStyle;
  final List<String> ancestorStyle;

  const GSStyleConfig({
    required this.componentName,
    this.ancestorStyle = const [],
    this.descendantStyle = const [],
  });
}
