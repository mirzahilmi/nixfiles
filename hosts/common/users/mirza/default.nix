{ pkgs, ... }:
let
  userName = "mirza";
in {
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

  boot.postBootCommands = let
    gdm_user_conf = ''
      [User]
      Session=
      Icon=${../../../../home-manager/assets/otter.png}
      SystemAccount=false
    '';
  in ''
    echo '${gdm_user_conf}' > /var/lib/AccountsService/users/${userName}
  '';

  home-manager.users.${userName} = import ../../../../home-manager/${userName};
}
