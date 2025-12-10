{
  pkgs,
  lib,
  ...
}: {
  # Enable zsh here (system-wide) so it wont cause an error
  # when setting user default shell
  custom.programs.zsh.enable = true;
  users.extraUsers.mirza = {
    description = "Mirza";
    shell = lib.mkForce pkgs.zsh;
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "audio"
      "docker"
      "networkmanager"
      "video"
      "wireshark"
      "dialout"
    ];
  };
}
