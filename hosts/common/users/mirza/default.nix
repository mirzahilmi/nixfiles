{ pkgs, ... }:
let
  userName = "mirza";
in {
  imports = [ ./tweaks.nix (inherit userName) ];

  users.extraUsers.${userName} = {
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

  home-manager.users.${userName} = import ../../../../home-manager/${userName};
}
