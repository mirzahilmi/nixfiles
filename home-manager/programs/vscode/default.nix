{ pkgs, lib, ... }:
{
  programs.vscode = {
    enable = true;
    enableUpdateCheck = false;
    
    extensions = with pkgs.vscode-extensions; [
      bbenoist.nix
      bmewburn.vscode-intelephense-client
      editorconfig.editorconfig
      golang.go
      humao.rest-client
      jdinhlife.gruvbox
      pkief.material-icon-theme
      tobiasalthoff.atom-material-theme
      usernamehw.errorlens
    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "vscode-phpfmt";
        publisher = "kokororin";
        version = "1.1.36";
        sha256 = "sha256-Ln/vR1kyTzAYGy+q7Ru3HWhEv2mNc8ql3oKxaONUIlg=";
      }
      {
        name = "multi-cursor-case-preserve";
        publisher = "cardinal90";
        version = "1.0.5";
        sha256 = "sha256-eJafjYDydD8DW83VLH9MPFeDENXBx3el7XvjZqu88Jw=";
      }
      {
        name = "openapi-vs-code";
        publisher = "redocly";
        version = "0.4.0";
        sha256 = lib.fakeSha256;
      }
      {
        name = "vscord";
        publisher = "leonardssh";
        version = "5.1.18";
        sha256 = lib.fakeSha256;
      }
      {
        name = "php-docblocker";
        publisher = "neilbrayfield";
        version = "2.7.0";
        sha256 = lib.fakeSha256;
      }
    ];

    userSettings = {
      "editor.fontFamily" = "JetBrains Mono";
      "editor.fontLigatures" = true;
      "editor.fontSize" = 16;
      "editor.fontWeight" = "500";
      "editor.lineHeight" = 1.5;
      "editor.letterSpacing" = 0.5;
      "terminal.integrated.defaultProfile.linux" = "zsh";
      "terminal.integrated.persistentSessionReviveProcess" = "never";
      "terminal.integrated.fontFamily" = "FiraCode Nerd Font";
      "workbench.colorTheme" = "Gruvbox Dark Medium";
      "editor.formatOnSave" = true;
      "editor.renderLineHighlight" = "none";
      "editor.renderControlCharacters" = false;
      "editor.scrollbar.verticalScrollbarSize" = 2;
      "editor.scrollbar.horizontalScrollbarSize" = 2;
      "editor.scrollbar.vertical" = "hidden";
      "editor.scrollbar.horizontal" = "hidden";
      "editor.cursorBlinking" = "solid";
      "editor.cursorStyle" = "block";
      "editor.minimap.enabled" = false;
      "editor.showFoldingControls" = "never";
      "editor.glyphMargin" = false;
      "editor.rulers" = [ 100 ];
      "workbench.activityBar.location" = "hidden";
      "window.titleBarStyle" = "custom";
      "explorer.openEditors.visible" = 1;
      "window.menuBarVisibility" = "compact";
      "files.autoSave" = "onFocusChange";
      "extensions.ignoreRecommendations" = true;
      "workbench.iconTheme" = "material-icon-theme";
      "workbench.editor.limit.enabled" = true;
      "workbench.editor.limit.value" = 5;
      "workbench.editor.limit.perEditorGroup" = true;
      "workbench.editor.showTabs" = "multiple";
      "workbench.layoutControl.type" = "menu";
      "workbench.layoutControl.enabled" = false;
      "workbench.colorCustomizations" = {
        "[Atom Material Theme]" = {
          "statusBar.background" = "#23292d";
          "statusBar.noFolderBackground" = "#23292d";
        };
        "[Gruvbox Dark Hard]" = {
          "editorGroupHeader.noTabsBackground" = "#1d2021";
        };
      };
      "breadcrumbs.enabled" = false;
      "editor.matchBrackets" = "never";
      "editor.roundedSelection" = false;
      "explorer.compactFolders" = false;
      "editor.wordWrap" = "off";
      "[php]" = {
        "editor.defaultFormatter" = "kokororin.vscode-phpfmt";
      };
      "[java]" = {
        "editor.defaultFormatter" = null;
        "editor.formatOnSave" = false;
      };
      "[javascript]" = {
        "editor.defaultFormatter" = "biomejs.biome";
      };
      "vscord.app.name" = "Visual Studio Code";
      "vscord.status.idle.check" = false;
      "vscord.status.idle.enabled" = false;
      "vscord.status.state.text.editing" = "Working on {file_name}{file_extension} ={current_line}/{line_count}";
      "vscord.status.problems.text" = "- {problems_count} problems";
      "phpfmt.passes" = [
        "AllmanStyleBraces"
        "AlignDoubleArrow"
        "DoubleToSingleQuote"
        "OrderAndRemoveUseClauses"
        "PSR2EmptyFunction"
        "ReindentSwitchBlocks"
        "ReplaceIsNull"
        "MergeElseIf"
        "SortUseNameSpace"
        "SpaceBetweenMethods"
        "MergeNamespaceWithOpenTag"
      ];
      "phpfmt.exclude" = [
        "AlignDoubleSlashComments"
        "StripSpaces"
        "AutoSemicolon"
        "AlignEquals"
        "AlignTypehint"
        "AllmanStyleBraces"
        "ConvertOpenTagWithEcho"
        "DocBlockToComment"
        "IndentTernaryConditions"
      ];
      "java.debug.settings.showStaticVariables" = true;
      "intelephense.telemetry.enabled" = false;
      "vscode-pets.petColor" = "white";
      "vscode-pets.petSize" = "medium";
      "vscode-pets.theme" = "castle";
      "vscode-pets.petType" = "cat";
      "vscode-pets.position" = "explorer";
      "telemetry.telemetryLevel" = "off";
      "nix.enableLanguageServer" = true;
    };

    keybindings = [
      {
        "key" = "ctrl+shift+delete";
        "command" = "workbench.action.terminal.kill";
      }
      {
        "key" = "ctrl+shift+q";
        "command" = "git.openFile";
        "when" = "editorFocus && isInDiffEditor";
      }
      {
        "key" = "ctrl+shift+q";
        "command" = "git.openChange";
        "when" = "editorFocus && !isInDiffEditor";
      }
      {
        "key" = "shift+delete";
        "command" = "editor.action.deleteLines";
        "when" = "textInputFocus && !editorReadonly";
      }
      {
        "key" = "ctrl+shift+s";
        "command" = "workbench.action.files.saveAll";
      }
      {
        "key" = "ctrl+q";
        "command" = "workbench.action.quickOpenView";
      }
      {
        "key" = "ctrl+shift+alt+i";
        "command" = "workbench.action.increaseViewSize";
      }
      {
        "key" = "ctrl+shift+alt+d";
        "command" = "workbench.action.decreaseViewSize";
      }
      {
        "key" = "ctrl+shift+]";
        "command" = "editor.toggleFold";
        "when" = "editorTextFocus && foldingEnabled";
      }
      {
        "key" = "ctrl+k ctrl+l";
        "command" = "editor.action.showDefinitionPreviewHover";
      }
      {
        "key" = "ctrl+shift+up";
        "command" = "editor.action.copyLinesUpAction";
        "when" = "editorTextFocus && !editorReadonly";
      }
      {
        "key" = "ctrl+shift+down";
        "command" = "editor.action.copyLinesDownAction";
        "when" = "editorTextFocus && !editorReadonly";
      }
      {
        "key" = "ctrl+shift+backspace";
        "command" = "-search.searchEditor.action.deleteFileResults";
        "when" = "inSearchEditor";
      }
      {
        "key" = "shift+delete";
        "command" = "-editor.action.clipboardCutAction";
      }
      {
        "key" = "ctrl+shift+k";
        "command" = "-editor.action.deleteLines";
        "when" = "textInputFocus && !editorReadonly";
      }
      {
        "key" = "ctrl+shift+s";
        "command" = "-workbench.action.files.saveAs";
      }
      {
        "key" = "ctrl+shift+s";
        "command" = "-workbench.action.files.saveLocalFile";
        "when" = "remoteFileDialogVisible";
      }
      {
        "key" = "ctrl+shift+e";
        "command" = "-workbench.action.quickOpenNavigatePreviousInFilePicker";
        "when" = "inFilesPicker && inQuickOpen";
      }
      {
        "key" = "ctrl+q";
        "command" = "-workbench.action.quit";
      }
      {
        "key" = "ctrl+shift+alt+i";
        "command" = "-workbench.action.quickchat.toggle";
        "when" = "hasChatProvider";
      }
      {
        "key" = "ctrl+shift+]";
        "command" = "-editor.unfold";
        "when" = "editorTextFocus && foldingEnabled";
      }
      {
        "key" = "ctrl+shift+[";
        "command" = "-editor.fold";
        "when" = "editorTextFocus && foldingEnabled";
      }
      {
        "key" = "ctrl+k ctrl+l";
        "command" = "-editor.toggleFold";
        "when" = "editorTextFocus && foldingEnabled";
      }
      {
        "key" = "ctrl+shift+down";
        "command" = "-editor.action.insertCursorBelow";
        "when" = "editorTextFocus";
      }
      {
        "key" = "ctrl+shift+up";
        "command" = "-editor.action.insertCursorAbove";
        "when" = "editorTextFocus";
      }
      {
        "key" = "ctrl+shift+alt+down";
        "command" = "-editor.action.copyLinesDownAction";
        "when" = "editorTextFocus && !editorReadonly";
      }
      {
        "key" = "ctrl+shift+alt+up";
        "command" = "-editor.action.copyLinesUpAction";
        "when" = "editorTextFocus && !editorReadonly";
      }
    ];
  };
}