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
      theme = "where_is_my_sddm_theme_qt5";
    };
    environment.systemPackages = [
      (pkgs.where-is-my-sddm-theme.override {
        variants = ["qt5"];
        themeConfig.General = {
          passwordCharacter = "*";
          passwordMask = true;
          passwordInputWidth = 0.5;
          passwordInputCursorVisible = true;
          passwordFontSize = 96;
          passwordCursorColor = "random";
          showSessionsByDefault = true;
          sessionsFontSize = 24;
          showUsersByDefault = true;
          usersFontSize = 48;
          backgroundFill = "#000000";
          backgroundFillMode = "aspect";
          basicTextColor = "#ffffff";
        };
      })
    ];
  };
}
