{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.custom.programs.tmux;
in {
  options.custom.programs.tmux = {
    enable = lib.mkEnableOption "Tmux";
    shell = lib.mkOption {
      type = lib.types.str;
      default = "${pkgs.zsh}/bin/zsh";
      example = "/usr/bin/zsh";
      description = "default shell absolute path";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.tmux = {
      enable = true;
      secureSocket = true;
    };
    xdg.configFile."tmux/tmux.conf".source =
      config.lib.file.mkOutOfStoreSymlink
      "/home/mirza/.config/nixfiles/modules/home-manager/tmux.conf";
  };
}
