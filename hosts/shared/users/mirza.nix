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
      initialHashedPassword = "$y$j9T$UCjJGShH7mrXJaboQNwTZ1$1pL9WizElBvl/FagbPKmus902iujrDMxcFJuFOFRCEC";
      extraGroups = [
        "wheel"
        "audio"
        "docker"
        "libvirtd"
        "networkmanager"
        "video"
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
