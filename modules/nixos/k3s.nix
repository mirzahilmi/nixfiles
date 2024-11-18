{
  lib,
  config,
  ...
}: let
  cfg = config.orchestration.k3s;
in {
  options.orchestration.k3s = {
    enable = lib.mkEnableOption "k3s";
    multiNode = lib.mkOption {
      type = lib.types.bool;
      default = false;
      example = true;
      description = "Multi-node networking";
    };
  };

  config = lib.mkIf cfg.enable {
    services.k3s.enable = true;
    services.k3s.role = "server";
    networking.firewall.allowedTCPPorts = [6443];
    networking.firewall.allowedUDPPorts = lib.mkIf cfg.multiNode [8472];
  };
}
