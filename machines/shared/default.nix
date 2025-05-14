{
  pkgs,
  outputs,
  ...
}: {
  imports = [
    ../../modules/nixos
    ./nh.nix
    ./nix.nix
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
    variables = {
      EDITOR = "nvim";
      MANPAGER = "nvim +Man!";
    };
  };
  system.stateVersion = "23.11";
}
