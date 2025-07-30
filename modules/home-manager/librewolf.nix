{
  config,
  lib,
  ...
}: let
  cfg = config.custom.programs.librewolf;
in {
  options.custom.programs.librewolf = {
    enable = lib.mkEnableOption "librewolf";
  };

  config = lib.mkIf cfg.enable {
    programs.librewolf = {
      enable = true;
    };
  };
}
