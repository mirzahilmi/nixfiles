{pkgs, ...}: let
  userName = "mirza";
in {
  users = {
    groups.ubridge = {};
    extraUsers.${userName} = {
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
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILfBDFCdhrf2o3vuNKovPs+NqBMkCALqaeLwsAV3N7Lq mirza@nixsina"
      ];
    };
  };

  boot.postBootCommands = ''
    if [[ ! -e /var/lib/AccountsService/users/${userName} ]]; then
      echo '[User]
      Session=
      Icon=${../../../asset/otter.png}
      SystemAccount=false' > /var/lib/AccountsService/users/${userName}
    fi
  '';
}
