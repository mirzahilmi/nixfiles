{
  pkgs,
  inputs,
  outputs,
  ...
}: {
  imports = [
    inputs.disko.nixosModules.disko
    ../../modules/nixos
    ./boot.nix
    ./locale.nix
    ./nh.nix
    ./nix.nix
    ./ssh.nix
    ./xdg.nix
    ./shell.nix
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
