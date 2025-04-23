{
  lib,
  config,
  ...
}: let
  cfg = config.custom.programs.zsh;
in {
  options.custom.programs.zsh = {
    enable = lib.mkEnableOption "zsh";
  };
  config = lib.mkIf cfg.enable {
    programs.zsh = {
      enable = true;
      # See https://github.com/nix-community/home-manager/issues/108
      enableCompletion = false;
      enableGlobalCompInit = false;
    };
  };
}
