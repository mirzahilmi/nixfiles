{
  pkgs,
  inputs,
  ...
}: {
  imports = [];

  wsl.enable = true;
  wsl.defaultUser = "nixos";

  environment.systemPackages = with pkgs; [
    git
    lazygit
    tmux
    inputs.nvim.packages.${pkgs.system}.default
  ];
  nix = {
    optimise.automatic = true;
    settings = {
      experimental-features = toString [
        "nix-command"
        "flakes"
      ];
    };
  };
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
  virtualisation.docker = {
    enable = true;
    autoPrune.enable = true;
  };
  system.stateVersion = "24.11";
}
