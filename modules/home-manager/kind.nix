{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.orchestration.kubernetes;
in {
  options.orchestration.kubernetes = {
    enable = lib.mkEnableOption "Local Kubernetes";
  };
  config = lib.mkIf cfg.enable {
    home.packages = builtins.attrValues {inherit (pkgs) kind kubectl;};
  };
}
