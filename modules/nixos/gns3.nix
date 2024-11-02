{inputs, ...}: {
  disabledModules = ["services/networking/gns3-server.nix"];
  imports = ["${inputs.nixpkgs-unstable}/nixos/modules/services/networking/gns3-server.nix"];
  services.gns3-server = {
    enable = true;
    vpcs.enable = true;
    ubridge.enable = true;
    dynamips.enable = true;
  };
  virtualisation.libvirtd.enable = true;
}
