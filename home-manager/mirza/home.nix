{ inputs, outputs, ... }:
{
  home = {
    username = "mirza";
    homeDirectory = "/home/mirza";
  };

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface".color-scheme = "prefer-dark";
      
      "org/gnome/shell" = {
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

      "org/gnome/desktop/background" = {
        color-shading-type = "solid";
        picture-options = "zoom";
        picture-uri = "file://" + ../assets/gnome-abstract-dark.png;
        picture-uri-dark = "file://" + ../assets/gnome-abstract-dark.png;
      };
    };
  };

  programs.git.enable = true;

  home.stateVersion = "23.11";
}