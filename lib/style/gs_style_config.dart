class GSStyleConfig {
  final String componentName;
  final List<String> descendantStyle;
  final List<String> ancestorStyle;
  GSStyleConfig({
    required this.componentName,
    this.ancestorStyle = const [],
    this.descendantStyle = const [],
  });
}
