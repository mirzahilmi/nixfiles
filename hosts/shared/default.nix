{
  pkgs,
  outputs,
  ...
}: {
  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
    };
  };
  environment.systemPackages = with pkgs; [neovim];
}
