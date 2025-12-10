{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.custom.programs.sddm;
in {
  options.custom.programs.sddm = {
    enable = lib.mkEnableOption "sddm";
  };

  config = lib.mkIf cfg.enable {
    services.displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      theme = "where_is_my_sddm_theme";
      settings.General.DisplayServer = "wayland";
    };
    environment.systemPackages = [
      (pkgs.where-is-my-sddm-theme.override {
        themeConfig.General = {
          passwordCharacter = "*";
          passwordMask = true;
          passwordInputWidth = 0.5;
          passwordInputBackground = "";
          passwordInputRadius = "";
          passwordInputCursorVisible = true;
          passwordFontSize = 96;
          passwordCursorColor = "random";
          passwordTextColor = "";

          showSessionsByDefault = false;
          sessionsFontSize = 24;

          showUsersByDefault = false;
          usersFontSize = 48;

          background = "";
          backgroundFill = "#000000";
          backgroundFillMode = "aspect";

          basicTextColor = "#ffffff";

          blurRadius = "";
        };
      })
    ];
  };
}
