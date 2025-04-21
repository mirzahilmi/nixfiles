{
  pkgs,
  inputs,
  outputs,
  ...
}: {
  imports = [
    ../../modules/nixos
    ./nh.nix
    ./nix.nix
    ./ssh.nix
    ./shell.nix
    ./xdg.nix
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
