{
  lib,
  config,
  ...
}: let
  cfg = config.custom.programs.virt-manager;
in {
  options.custom.programs.virt-manager = {
    enable = lib.mkEnableOption "virt-manager";
  };

  config = lib.mkIf cfg.enable {
    programs.virt-manager.enable = true;
    virtualisation.libvirtd.enable = true;
  };
}
