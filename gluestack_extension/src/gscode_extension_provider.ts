import * as vscode from "vscode";

export class GSCodeActionProvider implements vscode.CodeActionProvider {
  provideCodeActions(
    document: vscode.TextDocument,
    range: vscode.Range,
    context: vscode.CodeActionContext,
    token: vscode.CancellationToken
  ): vscode.ProviderResult<vscode.CodeAction[]> {
    // Suggestions for code actions
    const actions: vscode.CodeAction[] = [];

    const wrapWithGSBoxAction = new vscode.CodeAction(
      "Wrap with GSBox",
      vscode.CodeActionKind.QuickFix
    );
    wrapWithGSBoxAction.command = {
      title: "Wrap with GSBox",
      command: "extension.wrapWithGSBox",
      arguments: [document, range],
    };
    actions.push(wrapWithGSBoxAction);

    const wrapWithGSHStackAction = new vscode.CodeAction(
      "Wrap with GSHStack",
      vscode.CodeActionKind.QuickFix
    );
    wrapWithGSHStackAction.command = {
      title: "Wrap with GSHStack",
      command: "extension.wrapWithGSHStack",
      arguments: [document, range],
    };
    actions.push(wrapWithGSHStackAction);

    const wrapWithGSVStackAction = new vscode.CodeAction(
      "Wrap with GSVStack",
      vscode.CodeActionKind.QuickFix
    );
    wrapWithGSVStackAction.command = {
      title: "Wrap with GSVStack",
      command: "extension.wrapWithGSVStack",
      arguments: [document, range],
    };
    actions.push(wrapWithGSVStackAction);

    return actions;
  }
}
