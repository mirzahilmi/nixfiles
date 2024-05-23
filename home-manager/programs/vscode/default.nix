{
  pkgs,
  lib,
  ...
}: {
  programs.vscode = {
    enable = true;
    enableUpdateCheck = false;
    enableExtensionUpdateCheck = false;
    mutableExtensionsDir = true;
    package = pkgs.unstable.vscode;

    keybindings = lib.importJSON ./keybindings.json;

    extensions = with pkgs.vscode-extensions;
      [
        adpyke.codesnap
        bbenoist.nix
        bmewburn.vscode-intelephense-client
        editorconfig.editorconfig
        golang.go
        humao.rest-client
        jdinhlife.gruvbox
        jnoortheen.nix-ide
        kamadorueda.alejandra
        mkhl.direnv
        redhat.java
        redhat.vscode-yaml
        pkief.material-icon-theme
        tobiasalthoff.atom-material-theme
        usernamehw.errorlens
        tamasfe.even-better-toml
        github.copilot
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
          name = "biome";
          publisher = "biomejs";
          version = "2.1.2";
          sha256 = "sha256-bPAig5KK6hYxyAyt48Mfi2dEf50/hNiNngX7bTzIKcQ=";
        }
        {
          name = "vscode-drawio";
          publisher = "hediet";
          version = "1.6.6";
          sha256 = "sha256-SPcSnS7LnRL5gdiJIVsFaN7eccrUHSj9uQYIQZllm0M=";
        }
        {
          name = "hungry-delete";
          publisher = "jasonlhy";
          version = "1.7.0";
          sha256 = "sha256-TDs6i0/o0j9XFLQvWze4iloa6yRXce/xIqd2CnA5nug=";
        }
        {
          name = "vsliveshare";
          publisher = "MS-vsliveshare";
          version = "1.0.5918";
          sha256 = "sha256-Tk0mKydUF8M7l7NC9wEA7t2rzJWy/mq4/HvIHI2/ldQ=";
        }
        {
          name = "vscode-dbml";
          publisher = "matt-meyers";
          version = "0.3.5";
          sha256 = "sha256-AhxXM061HCkJqi/PPe+XepOod+3lyo+4C5JWK6Yk80w=";
        }
        {
          name = "dbml-viewer";
          publisher = "nicolas-liger";
          version = "0.1.0";
          sha256 = "sha256-jhA1w2twXS7r8dDoJ6ANzE20HO1020rOFi7yhR4wbL8=";
        }
      ];

    userSettings = {
      # me no like surveillance
      "telemetry.telemetryLevel" = "off";
      "intelephense.telemetry.enabled" = false;

      # Typography
      "editor.fontFamily" = "JetBrainsMono Nerd Font";
      "terminal.integrated.fontFamily" = "FiraCode Nerd Font";
      "editor.fontLigatures" = true;
      "editor.fontSize" = 16;
      "editor.fontWeight" = "500";
      "editor.lineHeight" = 1.5;
      "editor.letterSpacing" = 0.5;

      # Code Editor Interface
      "workbench.colorTheme" = "Gruvbox Dark Medium";
      "workbench.iconTheme" = "material-icon-theme";
      "workbench.sideBar.location" = "right";
      "editor.minimap.enabled" = false;
      "editor.cursorStyle" = "block";
      "editor.cursorBlinking" = "solid";
      "editor.renderLineHighlight" = "none";
      "editor.renderControlCharacters" = false;
      "editor.scrollbar.verticalScrollbarSize" = 2;
      "editor.scrollbar.horizontalScrollbarSize" = 2;
      "editor.scrollbar.vertical" = "hidden";
      "editor.scrollbar.horizontal" = "hidden";
      "editor.showFoldingControls" = "never";
      "editor.roundedSelection" = false;
      "editor.glyphMargin" = false;
      "workbench.activityBar.location" = "hidden";
      "window.titleBarStyle" = "native";
      "window.menuBarVisibility" = "hidden";
      "window.enableMenuBarMnemonics" = true;
      "explorer.openEditors.visible" = 1;
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
      "terminal.integrated.defaultProfile.linux" = "zsh";
      "terminal.integrated.persistentSessionReviveProcess" = "never";

      # Code Editor Behavior
      "editor.formatOnSave" = true;
      "files.autoSave" = "onFocusChange";
      "extensions.ignoreRecommendations" = true;
      "workbench.editor.limit.enabled" = true;
      "workbench.editor.limit.value" = 5;
      "workbench.editor.limit.perEditorGroup" = true;
      "breadcrumbs.enabled" = true;
      "workbench.editor.showTabs" = "multiple";
      "editor.matchBrackets" = "never";
      "explorer.compactFolders" = false;
      "editor.wordWrap" = "off";
      "editor.selectionClipboard" = false;
      "git.autorefresh" = true;
      "editor.stickyScroll.enabled" = false;

      # Language Specific Behavior
      "[nix]" = {
        "editor.defaultFormatter" = "kamadorueda.alejandra";
        "editor.formatOnPaste" = true;
        "editor.formatOnSave" = true;
        "editor.formatOnType" = false;
      };
      "[php]" = {
        "editor.defaultFormatter" = "kokororin.vscode-phpfmt";
      };
      "php.validate.executablePath" = "${pkgs.php}/bin/php";
      "[java]" = {
        "editor.defaultFormatter" = null;
        "editor.formatOnSave" = false;
      };
      "[javascript]" = {
        "editor.defaultFormatter" = "biomejs.biome";
      };

      # Extensions Configuration
      # VSCord
      "vscord.app.name" = "VSCodium";
      "vscord.status.idle.check" = false;
      "vscord.status.idle.enabled" = false;
      "vscord.status.state.text.editing" = "Working on {file_name}{file_extension}:{current_line}/{line_count}";
      "vscord.status.problems.text" = "- {problems_count} problems";
      "vscord.behaviour.suppressNotifications" = true;
      # PHPfmt || PHP's Formatter
      "phpfmt.php_bin" = "${pkgs.php}/bin/php";
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
      # Drawio integration
      "hediet.vscode-drawio.theme" = "atlas";
      # Codesnap
      "codesnap.transparentBackground" = true;
      # direnv
      "direnv.path.executable" = "${pkgs.direnv}/bin/direnv";
      # nil & Nix IDE : Nix's Language Server
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "${pkgs.nil}/bin/nil";
      # Alejandra : Nix's Formatter
      "alejandra.program" = "${pkgs.alejandra}/bin/alejandra";
      # golangci-lint : Go's Formatter
      "go.lintTool" = "golangci-lint";
      # Biome.js
      "biome.lspBin" = "${pkgs.biome}/bin/biome";
      # XML
      "xml.server.preferBinary" = true;
      "xml.server.binary.path" = "${pkgs.lemminx}/bin/lemminx";
      "xml.server.binary.trustedHashes" = [
        "1be10969257c6e350c8b26b5a30f7611fb4720b2584a2872e1059747cab22c42"
      ];
      # Java
      "java.configuration.runtimes" = [
        {
          "name" = "JavaSE-21";
          "path" = "${pkgs.jdk21}/bin/jdk";
          "default" = true;
        }
      ];
    };
  };
}
