{pkgs, ...}: {
  wsl.enable = true;
  wsl.defaultUser = "mirza";

  environment.systemPackages = [pkgs.neovim];
  system.stateVersion = "24.11";
}
