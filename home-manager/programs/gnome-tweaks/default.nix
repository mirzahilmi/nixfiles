{pkgs, ...}: let
  gnomeSchema = "org/gnome";
  desktopSchema = "${gnomeSchema}/desktop";
  wallpaperPath = "file://" + ../../../assets/post-soviet-life.jpg;
in {
  imports = [
    (import ./extensions.nix {inherit pkgs gnomeSchema;})
  ];

  home.packages = with pkgs; [
    bibata-cursors
  ];

  dconf = {
    enable = true;
    settings = {
      "${desktopSchema}/interface" = {
        clock-show-seconds = true;
        clock-show-weekday = true;
        color-scheme = "prefer-dark";
        document-font-name = "IBM Plex Sans 11";
        enable-hot-corners = false;
        font-name = "IBM Plex Sans 11";
        gtk-theme = "Adwaita-dark";
        monospace-font-name = "IBM Plex Mono 11";
        show-battery-percentage = true;
        cursor-theme = "Bibata-Original-Classic";
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

      "${gnomeSchema}/settings-daemon/plugins/media-keys" = {
        magnifier = ["<Alt><Super>z"];
      };

      "${desktopSchema}/wm/keybindings" = {
        switch-to-workspace-right = ["<Super><Alt>Right"];
        switch-to-workspace-left = ["<Super><Alt>Left"];
      };
    };
  };
}
