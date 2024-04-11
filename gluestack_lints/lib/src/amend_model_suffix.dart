import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:analyzer/source/source_range.dart';
import 'package:analyzer/error/error.dart';

class AmendModelSuffix extends DartLintRule {
  AmendModelSuffix() : super(code: _code);

  static const _code = LintCode(
    name: 'amend_model_suffix',
    problemMessage: 'Amend Model suffix in class names',
    correctionMessage: 'Rename class',
  );

  static const _modelSuffix = 'Model';

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    context.registry.addClassDeclaration((node) {
      final className = node.name.lexeme;
      if (className.endsWith(_modelSuffix)) {
        reporter.reportErrorForToken(code, node.name);
      }
    });
  }

  @override
  List<Fix> getFixes() => [_AmendModelSuffixFix()];
}

class _AmendModelSuffixFix extends DartFix {
  @override
  void run(
    CustomLintResolver resolver,
    ChangeReporter reporter,
    CustomLintContext context,
    AnalysisError analysisError,
    List<AnalysisError> others,
  ) {
    context.registry.addClassDeclaration((node) {
      if (!analysisError.sourceRange.intersects(node.name.sourceRange)) return;

      final validName = node.name.lexeme.substring(
          0, node.name.lexeme.length - AmendModelSuffix._modelSuffix.length);

      final changeBuilder = reporter.createChangeBuilder(
          message: 'Rename to $validName', priority: 0);

      changeBuilder.addDartFileEdit((builder) {
        builder.addSimpleReplacement(
            SourceRange(node.name.offset, node.name.length), validName);
      });
    });
  }
}
