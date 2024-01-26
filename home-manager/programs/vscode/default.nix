{ pkgs, lib, ... }:
{
  programs.vscode = {
    enable = true;
    enableUpdateCheck = false;

    userSettings = lib.importJSON ./settings.json;
    keybindings  = lib.importJSON ./keybindings.json;

    extensions = with pkgs.vscode-extensions; [
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
    ];
  };
}
