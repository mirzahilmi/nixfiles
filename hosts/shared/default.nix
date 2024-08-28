{
  pkgs,
  outputs,
  ...
}: {
  imports = [
    ./boot.nix
    ./nh.nix
    ./nix.nix
    ./ssh.nix
    ./xdg.nix
    ./zsh.nix
  ];
  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config.allowUnfree = true;
  };
  boot.kernelPackages = pkgs.linuxPackages_zen;
  environment = {
    systemPackages = [pkgs.neovim];
    variables.EDITOR = "nvim";
  };
  system.stateVersion = "23.11";
}
