{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.desktop.gnome;
in {
  options.desktop.gnome = {
    enable = lib.mkEnableOption "GNOME Desktop Environment";
    wayland = lib.mkOption {
      type = lib.types.bool;
      default = true;
      example = false;
      description = "Enable Wayland & XWayland";
    };
    tripleBuffering = lib.mkOption {
      type = lib.types.bool;
      default = false;
      example = true;
      description = "Enable dynamic triple buffering";
    };
    excludePackages = lib.mkOption {
      type = lib.types.listOf lib.types.package;
      default = [];
      example = [pkgs.gnome-tour pkgs.xterm];
      description = "Packages to be excluded from default installation";
    };
  };

  config = lib.mkIf cfg.enable {
    services.xserver = {
      enable = true;
      desktopManager.gnome.enable = true;
      displayManager.gdm = {
        enable = true;
        wayland = cfg.wayland;
      };
    };
    environment.gnome.excludePackages = cfg.excludePackages;
    nixpkgs.overlays = lib.mkIf cfg.tripleBuffering [
      (final: prev: {
        gnome = prev.gnome.overrideScope (_: _prev: {
          mutter = _prev.mutter.overrideAttrs (_: {
            src = final.fetchFromGitLab {
              domain = "gitlab.gnome.org";
              owner = "vanvugt";
              repo = "mutter";
              rev = "triple-buffering-v4-46";
              hash = "sha256-C2VfW3ThPEZ37YkX7ejlyumLnWa9oij333d5c4yfZxc=";
            };
          });
        });
      })
    ];
  };
}
