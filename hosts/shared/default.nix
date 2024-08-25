{
  pkgs,
  outputs,
  ...
}: {
  imports = [
    ./boot.nix
    ./nix.nix
    ./xdg.nix
  ];
  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
    };
  };
  boot.kernelPackages = pkgs.linuxPackages_zen;
  environment.systemPackages = with pkgs; [neovim];
  system.stateVersion = "23.11";
}
