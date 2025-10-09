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
          passwordInputWidth = 0.25;
          passwordInputBackground = "#7b9fe7";
          passwordInputRadius = 7;
          passwordInputCursorVisible = true;
          passwordFontSize = 28;
          passwordCursorColor = "#ffffff";
          passwordTextColor = "";
          showSessionsByDefault = false;
          sessionsFontSize = 24;
          showUsersByDefault = false;
          usersFontSize = 32;
          background = "";
          backgroundFill = "#8aadf4";
          backgroundFillMode = "aspect";
          basicTextColor = "#ffffff";
          blurRadius = "";
        };
      })
    ];
  };
}
