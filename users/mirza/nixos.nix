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
}
