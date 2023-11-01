{
  environment.sessionVariables = rec {
    # User Directories
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_CACHE_HOME  = "$HOME/.cache";
    XDG_DATA_HOME   = "$HOME/.local/share";
    XDG_STATE_HOME  = "$HOME/.local/state";

    # System Directories
    XDG_DATA_DIRS   = [ "/usr/local/share" "/usr/share" ];
    XDG_CONFIG_DIRS = [ "/etc/xdg" ];
  };
}