{pkgs, ...}: {
  # Enable zsh here (system-wide) so it wont cause an error
  # when setting user default shell
  custom.programs.zsh.enable = true;
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
