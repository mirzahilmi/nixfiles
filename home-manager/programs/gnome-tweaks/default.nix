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
      # font-name = "IBM Plex 10";
      # document-font-name = "IBM Plex 10";
      monospace-font-name = "IBM Plex Mono 11";
    };
    # "${gnomeSchema}/nautilus/desktop".font = "IBM Plex 10";
    
    "${desktopSchema}/background" = {
      color-shading-type = "solid";
      picture-options = "zoom";
      picture-uri = wallpaperPath;
      picture-uri-dark = wallpaperPath;
    };
    
    "${desktopSchema}/wm/preferences" = {
      button-layout = "close,minimize,maximize:appmenu";
    };
  };
}