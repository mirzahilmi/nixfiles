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
    };
  };

  boot.postBootCommands = ''
    if [[ ! -e /var/lib/AccountsService/users/${userName} ]]; then
      echo '[User]
      Session=
      Icon=${../../../imgs/otter.png}
      SystemAccount=false' > /var/lib/AccountsService/users/${userName}
    fi
  '';
}
