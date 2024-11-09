{
  lib,
  config,
  pkgs,
  inputs,
  ...
}: let
  cfg = config._programs.gns3;
in {
  disabledModules = ["services/networking/gns3-server.nix"];
  imports = [(inputs.nixpkgs-unstable + "/nixos/modules/services/networking/gns3-server.nix")];

  options._programs.gns3 = {
    enable = lib.mkEnableOption "GNS3 Server";
    gui = lib.mkOption {
      type = lib.types.bool;
      default = true;
      example = false;
      description = "Enable GNS3 GUI";
    };
  };

  config = lib.mkIf cfg.enable {
    services.gns3-server = {
      enable = true;
      vpcs.enable = true;
      ubridge.enable = true;
      dynamips.enable = true;
    };
    environment.systemPackages = lib.mkIf cfg.gui [
      pkgs.gns3-gui
      pkgs.inetutils
      pkgs.tigervnc
      pkgs.wireshark
    ];
  };
}
