{
  lib,
  config,
  inputs,
  pkgs,
  ...
}: let
  cfg = config.custom.programs.niri;
in {
  imports = [inputs.niri.homeModules.niri];

  options.custom.programs.niri = {
    enable = lib.mkEnableOption "niri";
  };

  config = lib.mkIf cfg.enable {
    programs.niri = {
      enable = true;
      package = pkgs.unstable.niri;
      settings.environment = {
        CLUTTER_BACKEND = "wayland";
        DISPLAY = null;
        GDK_BACKEND = "wayland,x11";
        MOZ_ENABLE_WAYLAND = "1";
        NIXOS_OZONE_WL = "1";
        QT_QPA_PLATFORM = "wayland;xcb";
        QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
        SDL_VIDEODRIVER = "wayland";
        # see https://www.electronjs.org/docs/latest/api/environment-variables#electron_ozone_platform_hint-linux
        ELECTRON_OZONE_PLATFORM_HINT = "auto";
      };
    };
  };
}
