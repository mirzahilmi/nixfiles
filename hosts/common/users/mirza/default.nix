{pkgs, ...}: let
  userName = "mirza";
in {
  imports = [(import ./tweaks.nix userName)];

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
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILfBDFCdhrf2o3vuNKovPs+NqBMkCALqaeLwsAV3N7Lq mirza@nixsina"
    ];
  };
}
