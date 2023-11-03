{ pkgs, ... }: 
let
  gnomeSchema = "org/gnome";
  desktopSchema = "${gnomeSchema}/desktop";
  wallpaperPath = "file://" + ../../assets/gnome-abstract-dark.png;
in {
  home.packages = with pkgs; [
    gnomeExtensions.blur-my-shell
    gnomeExtensions.clipboard-indicator
    gnomeExtensions.dash-to-dock
    gnomeExtensions.vitals
  ];
  
  dconf.settings = {
    "${desktopSchema}/interface".color-scheme = "prefer-dark";
    
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