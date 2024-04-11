import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:analyzer/source/source_range.dart';
import 'package:analyzer/error/error.dart';

class ReplaceContainerWithGSBox extends DartLintRule {
  ReplaceContainerWithGSBox() : super(code: _code);

  static const _code = LintCode(
    name: 'replace_container_with_gsbox',
    problemMessage: 'Use GSBox instead of Container',
    correctionMessage: 'Replace Container with GSBox',
  );

  static const _containerClass = 'Container';

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    context.registry.addClassMember((node) {
      if (node.toString() == _containerClass) {
        reporter.reportErrorForNode(code, node);
      }
    });
  }

  @override
  List<Fix> getFixes() => [_ReplaceContainerWithGSBoxFix()];
}

class _ReplaceContainerWithGSBoxFix extends DartFix {
  @override
  void run(
    CustomLintResolver resolver,
    ChangeReporter reporter,
    CustomLintContext context,
    AnalysisError analysisError,
    List<AnalysisError> others,
  ) {
    context.registry.addClassMember((node) {
      if (!analysisError.sourceRange.intersects(node.sourceRange)) return;

      final changeBuilder = reporter.createChangeBuilder(
          message: 'Replace with GSBox constructor', priority: 0);

      changeBuilder.addDartFileEdit((builder) {
        builder.addSimpleReplacement(
            SourceRange(node.offset, node.length), 'GSBox');

        try {} catch (e) {
          print('Error adjusting imports: $e');
        }
      });
    });
  }
}
