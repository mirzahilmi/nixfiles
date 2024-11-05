{
  pkgs,
  inputs,
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
    ../../modules/nixos
    inputs.disko.nixosModules.disko
  ];
  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
    };
  };
  environment = {
    systemPackages = [pkgs.neovim];
    variables.EDITOR = "nvim";
  };
  system.stateVersion = "23.11";
}
