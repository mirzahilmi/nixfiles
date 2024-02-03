{pkgs, ...}: let
  userName = "mirza";
in {
  imports = [(import ./tweaks.nix userName)];

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
}
