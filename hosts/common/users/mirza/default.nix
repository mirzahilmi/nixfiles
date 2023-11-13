{ pkgs, ... }:
{
  users.extraUsers."mirza" = {
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

  home-manager.users."mirza" = import ../../../../home-manager/mirza;
}
