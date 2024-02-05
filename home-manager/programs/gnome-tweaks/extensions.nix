{
  pkgs,
  gnomeSchema,
  ...
}: let
  gnomeShellSchema = "${gnomeSchema}/shell";
  extensionsSchema = "${gnomeShellSchema}/extensions";
in {
  home.packages = with pkgs; [
    gnome.gnome-tweaks
    gnome.dconf-editor
    gnomeExtensions.blur-my-shell
    gnomeExtensions.clipboard-indicator
    gnomeExtensions.dash-to-dock
    gnomeExtensions.appindicator
    gnomeExtensions.vitals
  ];

  dconf.settings = {
    "${gnomeShellSchema}" = {
      disable-user-extensions = false;
      enabled-extensions = [
        "drive-menu@gnome-shell-extensions.gcampax.github.com"
        "user-theme@gnome-shell-extensions.gcampax.github.com"
        "dash-to-dock@micxgx.gmail.com"
        "blur-my-shell@aunetx"
        "Vitals@CoreCoding.com"
        "clipboard-indicator@tudmotu.com"
        "unlockDialogBackground@sun.wxg@gmail.com"
      ];

      favorite-apps = [
        "org.gnome.Nautilus.desktop"
        "st.desktop"
        "code.desktop"
        "floorp.desktop"
      ];
    };

    "${extensionsSchema}/blur-my-shell" = {
      color-and-noise = true;
      hacks-level = 1;
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
  };
}
