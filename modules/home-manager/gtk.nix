{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.custom.programs.gtk;
in {
  options.custom.programs.gtk = {
    enable = lib.mkEnableOption "gtk customization";
    darkMode = lib.mkOption {
      type = lib.types.bool;
      default = true;
      example = false;
    };
    sensible = lib.mkOption {
      type = lib.types.bool;
      default = true;
      example = false;
    };
  };

  config = lib.mkIf cfg.enable {
    home = {
      sessionVariables.XCURSOR_THEME = "Bibata-Original-Classic";
      packages = lib.mkIf cfg.darkMode (builtins.attrValues {
        inherit
          (pkgs)
          adw-gtk3
          qadwaitadecorations
          qadwaitadecorations-qt6
          qgnomeplatform
          qgnomeplatform-qt6
          # Extensions
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
          hide-minimized
          vitals
          ;
      });
    };

    gtk = lib.mkIf cfg.sensible {
      enable = true;
      cursorTheme = {
        name = "Bibata-Original-Classic";
        package = pkgs.bibata-cursors;
      };
      gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
      gtk3.extraConfig = {
        Settings = ''
          gtk-application-prefer-dark-theme=1
        '';
      };
      gtk4.extraConfig = {
        Settings = ''
          gtk-application-prefer-dark-theme=1
        '';
      };
    };

    dconf = lib.mkIf cfg.sensible {
      enable = true;
      settings = {
        "org/gnome/desktop/interface" = {
          clock-show-seconds = true;
          clock-show-weekday = true;
          color-scheme = "prefer-dark";
          document-font-name = "IBM Plex Sans 11";
          enable-hot-corners = false;
          font-name = "IBM Plex Sans 11";
          monospace-font-name = "IBM Plex Mono 11";
          show-battery-percentage = true;
          gtk-theme = "adw-gtk3-dark";
        };

        "org/gnome/mutter" = {
          dynamic-workspaces = true;
          edge-tiling = true;
          workspaces-only-on-primary = true;
        };

        "org/gnome/nautilus/desktop".font = "IBM Plex Sans 11";

        "org/gnome/desktop/background" = {
          color-shading-type = "solid";
          picture-options = "zoom";
          picture-uri = "file://${../../imgs/postsoviet2.jpg}";
          picture-uri-dark = "file://${../../imgs/postsoviet2.jpg}";
        };

        "org/gnome/desktop/wm/preferences" = {
          button-layout = "close,minimize,maximize:appmenu";
        };

        "org/gnome/desktop/peripherals/touchpad" = {
          tap-to-click = true;
        };

        "org/gnome/settings-daemon/plugins/media-keys" = {
          magnifier = ["<Alt><Super>z"];
        };

        "org/gnome/desktop/wm/keybindings" = {
          switch-to-workspace-right = ["<Super><Alt>Right"];
          switch-to-workspace-left = ["<Super><Alt>Left"];
          switch-to-workspace-up = [""];
          switch-to-workspace-down = [""];
        };

        "org/gnome/shell" = {
          disable-user-extensions = false;
          enabled-extensions = [
            "appmenu-is-back@fthx"
            "blur-my-shell@aunetx"
            "clipboard-indicator@tudmotu.com"
            "drive-menu@gnome-shell-extensions.gcampax.github.com"
            "hide-minimized@danigm.net"
            "Vitals@CoreCoding.com"
          ];

          favorite-apps = [
            "org.gnome.Nautilus.desktop"
            "com.mitchellh.ghostty.desktop"
            "dev.zed.Zed.desktop"
            "zen.desktop"
          ];
        };

        "org/gnome/shell/extensions/clipboard-indicator" = {
          display-mode = 0;
          disable-down-arrow = true;
          move-item-first = true;
          paste-button = true;
        };

        "org/gnome/shell/extensions/vitals" = {
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

        "org/gnome/shell/extensions/draw-on-your-screen" = {
          persistent-over-toggles = false;
        };
      };
    };
  };
}
