{
  config,
  lib,
  ...
}: let
  cfg = config._programs.k9s;
in {
  options._programs.k9s = {
    enable = lib.mkEnableOption "k9s";
  };

  config = lib.mkIf cfg.enable {
    programs.k9s.enable = true;
  };
}
