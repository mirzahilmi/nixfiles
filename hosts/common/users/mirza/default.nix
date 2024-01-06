{ pkgs, ... }:
{
  home-manager.users."mirza" = import ../../../../home-manager/mirza/home.nix;

  users.users."mirza" = {
    isNormalUser = true;
    shell = pkgs.zsh;
    description = "Mirza's Avatar";
    initialPassword = "password";
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
      "audio"
      "docker"
    ];
  };
}
