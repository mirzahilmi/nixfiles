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

  system.activationScripts.script.text = ''
    cp ${../../../../home-manager/assets/otter.png} /var/lib/AccountsService/icons/mirza
  '';

  home-manager.users."mirza" = import ../../../../home-manager/mirza;
}
