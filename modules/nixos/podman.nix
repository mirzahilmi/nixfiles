{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.virtualization.podman;
in {
  options.virtualization.podman = {
    enable = lib.mkEnableOption "Podman";
    compose = lib.mkOption {
      type = lib.types.bool;
      default = true;
      example = false;
      description = "Enable compose support";
    };
    dockerAlias = lib.mkOption {
      type = lib.types.bool;
      default = true;
      example = false;
      description = "Alias docker with podman through binary substitution";
    };
  };

  config = lib.mkIf cfg.enable {
    virtualisation = {
      containers.enable = true;
      podman = {
        enable = true;
        dockerCompat = cfg.dockerAlias;
        defaultNetwork.settings.dns_enabled = true;
      };
    };
    environment.systemPackages = lib.mkIf cfg.compose [pkgs.podman-compose];
  };
}
