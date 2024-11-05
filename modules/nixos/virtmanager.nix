{
  lib,
  config,
  ...
}: let
  cfg = config._programs.virt-manager;
in {
  options._programs.virt-manager = {
    enable = lib.mkEnableOption "virt-manager";
  };

  config = lib.mkIf cfg.enable {
    programs.virt-manager.enable = true;
    virtualisation.libvirtd.enable = true;
  };
}
