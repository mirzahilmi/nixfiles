{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.custom.programs.gtk;
in {
  options.custom.programs.gtk = {
    enable = lib.mkEnableOption "gtk";
  };
  config = lib.mkIf cfg.enable {
    gtk = {
      enable = true;
      gtk3.extraConfig = {
        gtk-application-prefer-dark-theme = 1;
      };
      iconTheme = {
        package = pkgs.adwaita-icon-theme;
        name = "Adwaita";
      };
    };
  };
}
