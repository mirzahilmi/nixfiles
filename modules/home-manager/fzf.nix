{
  lib,
  config,
  ...
}: let
  cfg = config.custom.programs.fzf;
in {
  options.custom.programs.fzf = {
    enable = lib.mkEnableOption "fzf";
  };
  config = lib.mkIf cfg.enable {
    programs.fzf = {
      enable = true;
      enableZshIntegration = true;
      enableBashIntegration = false;
      enableFishIntegration = false;
      defaultOptions = ["--layout=reverse --info=inline --height=90%"];
    };
  };
}
