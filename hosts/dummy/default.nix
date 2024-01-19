# Host-level configuration
# (it replaces /etc/nixos/configuration.nix)
{ config, pkgs, inputs, outputs, ... }:

{
  imports = [
    # inputs.hardware.nixosModules.lenovo-legion-15arh05h
    inputs.home-manager.nixosModules.home-manager    
    
    ./hardware-configuration.nix
    ../common/global
    ../common/extras/gnome-wayland.nix
    ../common/extras/pipewire.nix
    ../common/users/mirza
  ];

  networking = {
    hostName = "dummy";
    networkmanager.enable = true;
  };

  nixpkgs = {
    config.allowUnfree = true;
  };

  services.openssh.enable = true;

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };
    users = {
      "mirza" = import ../../home-manager/mirza/home.nix;
    };
  };
}
