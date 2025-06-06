{
  lib,
  config,
  ...
}: let
  cfg = config.custom.services.k3s;
in {
  options.custom.services.k3s = {
    enable = lib.mkEnableOption "k3s";
    docker = lib.mkOption {
      type = lib.types.bool;
      default = true;
      example = false;
      description = "Docker as container runtime";
    };
    permitSudoers = lib.mkOption {
      type = lib.types.bool;
      default = true;
      example = false;
      description = "Allow user in wheel group to use kubectl command";
    };
    multiNode = lib.mkOption {
      type = lib.types.bool;
      default = false;
      example = true;
      description = "Multi-node networking";
    };
  };

  config = lib.mkIf cfg.enable {
    services.k3s = {
      enable = true;
      role = "server";
      extraFlags = [
        (lib.optional cfg.docker "--docker")
        (lib.optional cfg.permitSudoers <| toString [
          "--write-kubeconfig-group"
          "wheel"
          "--write-kubeconfig-mode"
          "660"
        ])
      ] |> toString;
    };
    networking.firewall = {
      allowedTCPPorts = [6443];
      allowedUDPPorts = lib.mkIf cfg.multiNode [8472];
    };
  };
}
