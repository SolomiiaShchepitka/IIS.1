"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const packageJson_1 = require("./packageJson");
const vscode = require("vscode");
const path = require("path");
const registerCommand = vscode.commands.registerCommand;
const disposables = [];
const init = async (context) => {
    disposables.forEach(btn => btn.dispose());
    const config = vscode.workspace.getConfiguration('actionButtons');
    const defaultColor = config.get('defaultColor') || 'white';
    const reloadButton = config.get('reloadButton');
    const loadNpmCommands = config.get('loadNpmCommands') !== false;
    const cmds = config.get('commands');
    const customVars = config.get('customVars') || {};
    const commands = [];
    if (reloadButton !== null) {
        loadButton({
            command: 'extension.refreshButtons',
            name: reloadButton || '↻',
            tooltip: 'Refreshes the action buttons',
            color: defaultColor
        });
    }
    else {
        const onCfgChange = vscode.workspace.onDidChangeConfiguration(e => {
            if (e.affectsConfiguration('actionButtons')) {
                vscode.commands.executeCommand('extension.refreshButtons');
            }
        });
        context.subscriptions.push(onCfgChange);
        disposables.push(onCfgChange);
    }
    if (cmds && cmds.length) {
        commands.push(...cmds);
    }
    if (loadNpmCommands !== false) {
        commands.push(...(await (0, packageJson_1.buildConfigFromPackageJson)(defaultColor)));
    }
    if (commands.length) {
        const terminals = {};
        commands.forEach(({ cwd, command, name, tooltip, color, singleInstance, focus, useVsCodeApi, args, ignoreCwd, ignoreClear, extraCommands, terminalName, timeoutAfterCreate }) => {
            const vsCommand = `extension.${name.replace(' ', '')}`;
            const disposable = registerCommand(vsCommand, async () => {
                //const vars = {
                const vars = {
                    // - the path of the folder opened in VS Code
                    workspaceFolder: vscode.workspace.rootPath || '',
                    // - the name of the folder opened in VS Code without any slashes (/)
                    workspaceFolderBasename: (vscode.workspace.rootPath) ? path.basename(vscode.workspace.rootPath) : '',
                    // - the current opened file
                    file: (vscode.window.activeTextEditor) ? vscode.window.activeTextEditor.document.fileName : '',
                    // - the current opened file relative to workspaceFolder
                    relativeFile: (vscode.window.activeTextEditor && vscode.workspace.rootPath) ? path.relative(vscode.workspace.rootPath, vscode.window.activeTextEditor.document.fileName) : '',
                    // - the current opened file's basename
                    fileBasename: (vscode.window.activeTextEditor) ? path.basename(vscode.window.activeTextEditor.document.fileName) : '',
                    // - the current opened file's basename with no file extension
                    fileBasenameNoExtension: (vscode.window.activeTextEditor) ? path.parse(path.basename(vscode.window.activeTextEditor.document.fileName)).name : '',
                    // - the current opened file's dirname
                    fileDirname: (vscode.window.activeTextEditor) ? path.dirname(vscode.window.activeTextEditor.document.fileName) : '',
                    // - the current opened file's extension
                    fileExtname: (vscode.window.activeTextEditor) ? path.parse(path.basename(vscode.window.activeTextEditor.document.fileName)).ext : '',
                    // - the task runner's current working directory on startup
                    cwd: cwd || vscode.workspace.rootPath || require('os').homedir() || '',
                    //- the current selected line number in the active file
                    lineNumber: (vscode.window.activeTextEditor) ? String(vscode.window.activeTextEditor.selection.active.line + 1) : '0',
                    // - the current selected text in the active file
                    selectedText: (vscode.window.activeTextEditor) ? vscode.window.activeTextEditor.document.getText(vscode.window.activeTextEditor.selection) : '',
                    // - the path to the running VS Code executable
                    execPath: process.execPath
                };
                if (!command) {
                    vscode.window.showErrorMessage('No command to execute for this action');
                    return;
                }
                if (useVsCodeApi) {
                    vscode.commands.executeCommand(command, ...(args || []));
                }
                else {
                    // find terminal or create new one
                    let justCreated = false;
                    let doClear = true;
                    let assocTerminal;
                    if (terminalName) {
                        // extended features
                        assocTerminal = vscode.window.terminals.find(x => x.name === terminalName);
                        if (!assocTerminal) {
                            assocTerminal = vscode.window.createTerminal(ignoreCwd ? { name: terminalName } : { name: terminalName, cwd: vars.cwd });
                            justCreated = true;
                        }
                    }
                    else {
                        // basic features
                        assocTerminal = terminals[vsCommand];
                        if (!assocTerminal) {
                            assocTerminal = vscode.window.createTerminal(ignoreCwd ? { name } : { name, cwd: vars.cwd });
                            justCreated = true;
                            terminals[vsCommand] = assocTerminal;
                        }
                        else {
                            if (singleInstance) {
                                delete terminals[vsCommand];
                                assocTerminal.dispose();
                                assocTerminal = vscode.window.createTerminal({ name, cwd: vars.cwd });
                                justCreated = true;
                                terminals[vsCommand] = assocTerminal;
                                doClear = false;
                            }
                            else {
                                doClear = true;
                            }
                        }
                    }
                    if (assocTerminal) {
                        if (justCreated) {
                            let timeout = timeoutAfterCreate || 0;
                            if (timeout < 0) {
                                timeout = 0;
                            }
                            if (timeout > 30000) {
                                timeout = 30000;
                            }
                            if (timeout) {
                                await new Promise(resolve => setTimeout(resolve, timeout));
                            }
                        }
                        if (doClear && !ignoreClear) {
                            assocTerminal.sendText('clear');
                        }
                        assocTerminal.show(!focus);
                        assocTerminal.sendText(interpolateString(command, vars, customVars));
                        if (extraCommands) {
                            let curTerminal = assocTerminal;
                            extraCommands.forEach(cmd => {
                                curTerminal.sendText(interpolateString(cmd, vars, customVars));
                            });
                        }
                    }
                    else {
                        console.error("Failed to find/create terminal");
                    }
                }
            });
            context.subscriptions.push(disposable);
            disposables.push(disposable);
            loadButton({
                command: vsCommand,
                name,
                tooltip: tooltip || command,
                color: color || defaultColor,
            });
        });
    }
    else {
        vscode.window.setStatusBarMessage('VSCode Action Buttons: There are no commands to run.', 4000);
    }
};
function loadButton({ command, name, tooltip, color, }) {
    const runButton = vscode.window.createStatusBarItem(1, 0);
    runButton.text = name;
    runButton.color = color;
    runButton.tooltip = tooltip;
    runButton.command = command;
    runButton.show();
    disposables.push(runButton);
}
function interpolateString(tpl, vars, customVars) {
    let re = /\$\{([^\}]+)\}/g, match;
    let result = tpl;
    while (match = re.exec(tpl)) {
        let path = match[1].split('.').reverse();
        if (path.length) {
            let arg = path.pop() || '';
            if (arg.length) {
                let value = vars[arg] || '';
                if (!value.length) {
                    value = customVars[arg] || ''; // vars have precedence over customVars
                }
                result = result.replace(match[0], value);
            }
        }
    }
    return result;
}
exports.default = init;
//# sourceMappingURL=init.js.map