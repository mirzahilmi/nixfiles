{lib, ...}: {
  environment = {
    sessionVariables = {
      XDG_CACHE_HOME = lib.mkDefault "$HOME/.cache";
      XDG_CONFIG_DIRS = lib.mkDefault "/etc/xdg";
      XDG_CONFIG_HOME = lib.mkDefault "$HOME/.config";
      XDG_DATA_DIRS = lib.mkDefault "/usr/local/share/:/usr/share/";
      XDG_DATA_HOME = lib.mkDefault "$HOME/.local/share";
      XDG_STATE_HOME = lib.mkDefault "$HOME/.local/state";
    };
    etc."xdg/user-dirs.defaults".text = ''
      DOWNLOAD="$HOME/Downloads"
      DOCUMENTS="$HOME/Documents"
      MUSIC="$HOME/Musics"
      PICTURES="$HOME/Pictures"
      VIDEOS="$HOME/Videos"
    '';
  };
}
