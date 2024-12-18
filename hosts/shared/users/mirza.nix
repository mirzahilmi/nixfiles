{pkgs, ...}: {
  users.extraUsers.mirza = {
    description = "Mirza's Avatar";
    shell = pkgs.zsh;
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "audio"
      "docker"
      "networkmanager"
      "video"
      "wireshark"
    ];
  };
  boot.postBootCommands = ''
    if [[ ! -e /var/lib/AccountsService/users/mirza ]]; then
      echo '[User]
      Icon=${../../../imgs/otter.png}
      SystemAccount=false' > /var/lib/AccountsService/users/mirza
    fi
  '';
}
