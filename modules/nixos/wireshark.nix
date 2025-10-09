{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.custom.programs.wireshark;
in {
  options.custom.programs.wireshark = {
    enable = lib.mkEnableOption "wireshark";
  };

  config = lib.mkIf cfg.enable {
    programs = {
      wireshark.enable = true;
      mtr.enable = true;
    };
  };
}
