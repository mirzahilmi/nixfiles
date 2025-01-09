{
  lib,
  config,
  ...
}: let
  cfg = config.custom.programs.ssh;
in {
  options.custom.programs.ssh = {
    enable = lib.mkEnableOption "ssh";
  };
  config = lib.mkIf cfg.enable {
    programs.ssh = {
      enable = true;
      addKeysToAgent = "yes";
    };
  };
}
