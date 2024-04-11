import * as vscode from "vscode";

export function activate(context: vscode.ExtensionContext) {
  // Command to wrap with GSBox
  const wrapWithGSBoxCommand = vscode.commands.registerCommand(
    "extension.wrapWithGSBox",
    async () => {
      const editor = vscode.window.activeTextEditor;
      if (!editor) {
        return;
      }

      const selection = editor.selection;
      const widget = editor.document.getText(selection);

      // Validate selection to ensure it's a valid widget
      if (!isValidWidgetSelectionGSBox(widget)) {
        vscode.window.showErrorMessage(
          "Please select a valid widget to wrap with GSBox."
        );
        return;
      }

      const wrappedWidget = `GSBox(child: ${widget} )`;
      try {
        // Perform the replacement with a single edit
        const edit = new vscode.WorkspaceEdit();

        edit.replace(editor.document.uri, selection, wrappedWidget);
        await vscode.workspace.applyEdit(edit);

        // Adjust imports for GSBox
        adjustImportsForGSBox(editor.document);
      } catch (error) {
        console.error("Error wrapping with GSBox:", error);
        vscode.window.showErrorMessage(
          "Failed to wrap widget with GSBox. Please check for errors."
        );
      }
    }
  );

  // Command to wrap with GSHStack
  const wrapWithGSHStackCommand = vscode.commands.registerCommand(
    "extension.wrapWithGSHStack",
    async () => {
      const editor = vscode.window.activeTextEditor;
      if (!editor) {
        return;
      }

      const selection = editor.selection;
      const widget = editor.document.getText(selection);

      // Validate selection to ensure it's a valid widget
      if (!isValidWidgetSelectionGSHStack(widget)) {
        vscode.window.showErrorMessage(
          "Please select a valid widget to wrap with GSHStack."
        );
        return;
      }
      const wrappedWidget = `GSHStack(\n\tchildren: [\n\t\t${widget}\n\t],\n)`;
      try {
        // Perform the replacement with a single edit
        const edit = new vscode.WorkspaceEdit();

        edit.replace(editor.document.uri, selection, wrappedWidget);
        await vscode.workspace.applyEdit(edit);

        // Adjust imports if necessary
        adjustImports(editor.document);
      } catch (error) {
        console.error("Error wrapping with GSHStack:", error);
        vscode.window.showErrorMessage(
          "Failed to wrap widget with GSHStack. Please check for errors."
        );
      }
    }
  );

  // Command to wrap with GSVStack
  const wrapWithGSVStackCommand = vscode.commands.registerCommand(
    "extension.wrapWithGSVStack",
    async () => {
      const editor = vscode.window.activeTextEditor;
      if (!editor) {
        return;
      }

      const selection = editor.selection;
      const widget = editor.document.getText(selection);

      // Validate selection to ensure it's a valid widget
      if (!isValidWidgetSelectionGSVStack(widget)) {
        vscode.window.showErrorMessage(
          "Please select a valid widget to wrap with GSVStack."
        );
        return;
      }

      const wrappedWidget = `GSVStack(\n\tchildren: [\n\t\t${widget}\n\t],\n)`;
      try {
        // Perform the replacement with a single edit
        const edit = new vscode.WorkspaceEdit();

        edit.replace(editor.document.uri, selection, wrappedWidget);
        await vscode.workspace.applyEdit(edit);

        // Adjust imports if necessary
        adjustImports(editor.document);
      } catch (error) {
        console.error("Error wrapping with GSVStack:", error);
        vscode.window.showErrorMessage(
          "Failed to wrap widget with GSVStack. Please check for errors."
        );
      }
    }
  );

  // Register code action provider for "More actions" dropdown
  context.subscriptions.push(
    vscode.languages.registerCodeActionsProvider(
      { scheme: "file", language: "dart" },
      new GSCodeActionProvider(),
      { providedCodeActionKinds: [vscode.CodeActionKind.QuickFix] }
    )
  );

  // Register all commands
  context.subscriptions.push(
    wrapWithGSBoxCommand,
    wrapWithGSHStackCommand,
    wrapWithGSVStackCommand
  );
}

export function deactivate() {}

function isValidWidgetSelectionGSBox(widget: string): boolean {
  return widget.trim().startsWith("GS") && !widget.includes("GSBox");
}

function isValidWidgetSelectionGSHStack(widget: string): boolean {
  return widget.trim().startsWith("GS") && !widget.includes("GSHStack");
}
function isValidWidgetSelectionGSVStack(widget: string): boolean {
  return widget.trim().startsWith("GS") && !widget.includes("GSVStack");
}

function adjustImportsForGSBox(document: vscode.TextDocument) {}

function adjustImports(document: vscode.TextDocument) {
  // Logic to adjust imports
}

class GSCodeActionProvider implements vscode.CodeActionProvider {
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
