{
  pkgs,
  config,
  ...
}: let
  userName = "mirza";
in {
  users = {
    extraUsers.${userName} = {
      isNormalUser = true;
      shell = pkgs.zsh;
      description = "Mirza's Avatar";
      hashedPasswordFile = config.sops.secrets.defaultPassword.path;
      extraGroups = [
        "networkmanager"
        "wheel"
        "video"
        "audio"
        "docker"
      ];
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILfBDFCdhrf2o3vuNKovPs+NqBMkCALqaeLwsAV3N7Lq mirza@nixsina"
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPB4xBL5wKhqusJipjrsV+Peq1D7ge1G2EHJtaSLL5p2 dev@mrz.my.id"
      ];
    };
  };

  boot.postBootCommands = ''
    if [[ ! -e /var/lib/AccountsService/users/${userName} ]]; then
      echo '[User]
      Session=
      Icon=${../../../img/otter.png}
      SystemAccount=false' > /var/lib/AccountsService/users/${userName}
    fi
  '';
}
