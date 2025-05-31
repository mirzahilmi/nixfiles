{
  lib,
  config,
  ...
}: let
  cfg = config.custom.programs.k9s;
in {
  options.custom.programs.k9s = {
    enable = lib.mkEnableOption "k9s";
  };
  config = lib.mkIf cfg.enable {
    programs.k9s = {
      enable = true;
    };
  };
}
