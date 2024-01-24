{ pkgs, ... }: 
let
  gnomeSchema = "org/gnome";
  desktopSchema = "${gnomeSchema}/desktop";
  wallpaperPath = "file://" + ../../assets/gnome-abstract-dark.png;
in {
  home.packages = with pkgs; [
    gnome.gnome-tweaks
    gnomeExtensions.blur-my-shell
    gnomeExtensions.clipboard-indicator
    gnomeExtensions.dash-to-dock
    gnomeExtensions.appindicator
    gnomeExtensions.vitals
  ];
  
  dconf.settings = {
    "${desktopSchema}/interface" = {
      color-scheme = "prefer-dark";
      # font-name = "IBM Plex 10";
      # document-font-name = "IBM Plex 10";
      monospace-font-name = "IBM Plex Mono 11";
    };
    # "${gnomeSchema}/nautilus/desktop".font = "IBM Plex 10";
    
    "${gnomeSchema}/shell" = {
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
    };

    "${desktopSchema}/background" = {
      color-shading-type = "solid";
      picture-options = "zoom";
      picture-uri = wallpaperPath;
      picture-uri-dark = wallpaperPath;
    };
  };
}