{
  pkgs,
  lib,
  ...
}: {
  programs.vscode = {
    enable = true;
    enableUpdateCheck = false;

    keybindings = lib.importJSON ./keybindings.json;

    extensions = with pkgs.vscode-extensions;
      [
        bbenoist.nix
        bmewburn.vscode-intelephense-client
        editorconfig.editorconfig
        golang.go
        humao.rest-client
        jdinhlife.gruvbox
        kamadorueda.alejandra
        pkief.material-icon-theme
        tobiasalthoff.atom-material-theme
        usernamehw.errorlens
      ]
      ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
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
          sha256 = "sha256-u5CAg3ZQrtHpopff6nn2ZLhOwutOl0UMerYUSCr/Yxk=";
        }
        {
          name = "vscord";
          publisher = "leonardssh";
          version = "5.1.18";
          sha256 = "sha256-pJ9loVW1uhlITXSNBsCEgW+o3ABn0cxcZxg6S7cKWHI=";
        }
        {
          name = "php-docblocker";
          publisher = "neilbrayfield";
          version = "2.7.0";
          sha256 = "sha256-swuDZJVWvgAvBuoI1xTwzBtKstet8ahkDQKpZlfz830=";
        }
        {
          name = "direnv";
          publisher = "mkhl";
          version = "0.16.0";
          sha256 = "sha256-u2AFjvhm3zio1ygW9yD9ZwbywLrEssd0O7/0AtfCvMo=";
        }
      ];

    userSettings = with pkgs; {
      # me no like surveillance
      telemetry.telemetryLevel = "off";
      intelephense.telemetry.enabled = false;

      # Typography
      editor.fontFamily = "JetBrainsMono Nerd Font";
      terminal.integrated.fontFamily = "FiraCode Nerd Font";
      editor.fontLigatures = true;
      editor.fontSize = 16;
      editor.fontWeight = "500";
      editor.lineHeight = 1.5;
      editor.letterSpacing = 0.5;

      # Code Editor Interface
      workbench.colorTheme = "Gruvbox Dark Medium";
      workbench.iconTheme = "material-icon-theme";
      editor.minimap.enabled = false;
      editor.cursorStyle = "block";
      editor.cursorBlinking = "solid";
      editor.renderLineHighlight = "none";
      editor.renderControlCharacters = false;
      editor.scrollbar.verticalScrollbarSize = 2;
      editor.scrollbar.horizontalScrollbarSize = 2;
      editor.scrollbar.vertical = "hidden";
      editor.scrollbar.horizontal = "hidden";
      editor.showFoldingControls = "never";
      editor.roundedSelection = false;
      editor.glyphMargin = false;
      editor.rulers = [100];
      workbench.activityBar.location = "hidden";
      window.titleBarStyle = "custom";
      explorer.openEditors.visible = 1;
      window.menuBarVisibility = "compact";
      workbench.layoutControl.type = "menu";
      workbench.layoutControl.enabled = false;
      workbench.colorCustomizations = {
        "[Atom Material Theme]" = {
          statusBar.background = "#23292d";
          statusBar.noFolderBackground = "#23292d";
        };
        "[Gruvbox Dark Hard]" = {
          editorGroupHeader.noTabsBackground = "#1d2021";
        };
      };
      terminal.integrated.defaultProfile.linux = "zsh";
      terminal.integrated.persistentSessionReviveProcess = "never";

      # Code Editor Behavior
      editor.formatOnSave = true;
      files.autoSave = "onFocusChange";
      extensions.ignoreRecommendations = true;
      workbench.editor.limit.enabled = true;
      workbench.editor.limit.value = 5;
      workbench.editor.limit.perEditorGroup = true;
      workbench.editor.showTabs = "multiple";
      breadcrumbs.enabled = false;
      editor.matchBrackets = "never";
      explorer.compactFolders = false;
      editor.wordWrap = "off";

      # Language Specific Behavior
      "[nix]" = {
        editor.defaultFormatter = "kamadorueda.alejandra";
        editor.formatOnPaste = true;
        editor.formatOnSave = true;
        editor.formatOnType = false;
      };
      "[php]" = {
        editor.defaultFormatter = "kokororin.vscode-phpfmt";
      };
      "[java]" = {
        editor.defaultFormatter = null;
        editor.formatOnSave = false;
      };
      "[javascript]" = {
        editor.defaultFormatter = "biomejs.biome";
      };

      # Extensions Configuration
      # VSCord
      vscord.app.name = "Visual Studio Code";
      vscord.status.idle.check = false;
      vscord.status.idle.enabled = false;
      vscord.status.state.text.editing = "Working on {file_name}{file_extension} ={current_line}/{line_count}";
      vscord.status.problems.text = "- {problems_count} problems";
      # PHPfmt || PHP's Formatter
      phpfmt.passes = [
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
      phpfmt.exclude = [
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
      # nil & Nix IDE : Nix's Language Server
      nix.enableLanguageServer = true;
      nix.serverPath = pkgs.nil;
      # Alejandra : Nix's Formatter
      alejandra.program = pkgs.alejandra;
      # golangci-lint : Go's Formatter
      go.lintTool = "golangci-lint";
    };
  };
}
