{
  pkgs,
  gnomeSchema,
  ...
}: let
  gnomeShellSchema = "${gnomeSchema}/shell";
  extensionsSchema = "${gnomeShellSchema}/extensions";
in {
  home.packages = builtins.attrValues {
    inherit
      (pkgs)
      draw-on-your-screen
      networkmanager-openvpn
      gnome-tweaks
      dconf-editor
      ;
    inherit
      (pkgs.gnomeExtensions)
      app-menu-is-back
      appindicator
      blur-my-shell
      clipboard-indicator
      dash-to-dock
      hide-minimized
      hide-top-bar
      vitals
      ;
  };

  dconf.settings = {
    "${gnomeShellSchema}" = {
      disable-user-extensions = false;
      enabled-extensions = [
        "appmenu-is-back@fthx"
        "blur-my-shell@aunetx"
        "clipboard-indicator@tudmotu.com"
        "dash-to-dock@micxgx.gmail.com"
        "drive-menu@gnome-shell-extensions.gcampax.github.com"
        "hide-minimized@danigm.net"
        "user-theme@gnome-shell-extensions.gcampax.github.com"
        "unlockDialogBackground@sun.wxg@gmail.com"
        "Vitals@CoreCoding.com"
      ];

      favorite-apps = [
        "org.gnome.Nautilus.desktop"
        "com.mitchellh.ghostty.desktop"
        "dev.zed.Zed.desktop"
        "zen.desktop"
      ];
    };

    "${extensionsSchema}/clipboard-indicator" = {
      display-mode = 0;
      disable-down-arrow = true;
      move-item-first = true;
      paste-button = true;
    };

    "${extensionsSchema}/dash-to-dock" = {
      apply-custom-theme = true;
      running-indicator-style = "DOTS";
      hot-keys = false;
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
