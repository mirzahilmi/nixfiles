{ pkgs, ... }:
let
  gnomeSchema = "org/gnome";
  desktopSchema = "${gnomeSchema}/desktop";
  wallpaperPath = "file://" + ../../assets/gnome-abstract-dark.png;
in {
  imports = [
    (import ./extensions.nix { inherit pkgs gnomeSchema; })
  ];

  dconf.settings = {
    "${desktopSchema}/interface" = {
      color-scheme = "prefer-dark";
      font-name = "IBM Plex Sans 11";
      document-font-name = "IBM Plex Sans 11";
      monospace-font-name = "IBM Plex Mono 11";
      clock-show-seconds = true;
      clock-show-weekday = true;
      enable-hot-corners = false;
      show-battery-percentage = true;
    };

    "${gnomeSchema}/mutter" = {
      dynamic-workspaces = true;
      edge-tiling = true;
    };

    "${gnomeSchema}/nautilus/desktop".font = "IBM Plex Sans 11";
    
    "${desktopSchema}/background" = {
      color-shading-type = "solid";
      picture-options = "zoom";
      picture-uri = wallpaperPath;
      picture-uri-dark = wallpaperPath;
    };
    
    "${desktopSchema}/wm/preferences" = {
      button-layout = "close,minimize,maximize:appmenu";
    };

    "${desktopSchema}/peripherals/touchpad" = {
      tap-to-click = true;
    };
  };
}