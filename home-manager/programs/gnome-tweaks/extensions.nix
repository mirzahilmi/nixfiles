{
  pkgs,
  gnomeSchema,
  ...
}: let
  gnomeShellSchema = "${gnomeSchema}/shell";
  extensionsSchema = "${gnomeShellSchema}/extensions";
in {
  home.packages = with pkgs; [
    draw-on-screen
    gnome.gnome-tweaks
    gnome.dconf-editor
    gnomeExtensions.appindicator
    gnomeExtensions.app-menu-is-back
    gnomeExtensions.blur-my-shell
    gnomeExtensions.clipboard-indicator
    gnomeExtensions.dash-to-dock
    gnomeExtensions.hide-minimized
    gnomeExtensions.vitals
  ];

  dconf.settings = {
    "${gnomeShellSchema}" = {
      disable-user-extensions = false;
      enabled-extensions = [
        "appmenu-is-back@fthx"
        "blur-my-shell@aunetx"
        "clipboard-indicator@tudmotu.com"
        "dash-to-dock@micxgx.gmail.com"
        "draw-on-your-screen2@zhrexl.github.com"
        "drive-menu@gnome-shell-extensions.gcampax.github.com"
        "hide-minimized@danigm.net"
        "user-theme@gnome-shell-extensions.gcampax.github.com"
        "unlockDialogBackground@sun.wxg@gmail.com"
        "Vitals@CoreCoding.com"
      ];

      favorite-apps = [
        "org.gnome.Nautilus.desktop"
        "org.codeberg.dnkl.foot.desktop"
        "code.desktop"
        "beekeeper-studio.desktop"
        "brave-browser.desktop"
      ];
    };

    "${extensionsSchema}/clipboard-indicator" = {
      display-mode = 0;
      disable-down-arrow = true;
      move-item-first = true;
      paste-button = true;
    };

    "${extensionsSchema}/dash-to-dock" = {
      apply-custom-theme = false;
      background-color = "rgb(36,31,49)";
      background-opacity = 0.77000000000000002;
      click-action = "minimize";
      custom-background-color = false;
      custom-theme-shrink = false;
      dash-max-icon-size = 48;
      disable-overview-on-startup = false;
      dock-position = "BOTTOM";
      height-fraction = 1.0;
      hot-keys = false;
      hotkeys-overlay = false;
      multi-monitor = true;
      preferred-monitor = -2;
      preferred-monitor-by-connector = "eDP-2";
      show-trash = false;
      transparency-mode = "DYNAMIC";
      running-indicator-style = "DOTS";
    };

    "${extensionsSchema}/vitals" = {
      hide-icons = false;
      hide-zeros = false;
      include-public-ip = false;
      include-static-info = false;
      memory-measurement = 1;
      menu-centered = false;
      network-speed-format = 0;
      position-in-panel = 1;
      show-fan = false;
      show-network = true;
      show-storage = false;
      show-temperature = true;
      show-voltage = true;
      update-time = 30;
      use-higher-precision = false;
    };

    "${extensionsSchema}/draw-on-your-screen" = {
      persistent-over-toggles = false;
    };
  };
}
