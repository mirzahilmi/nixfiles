{ pkgs, inputs, ... }:
{
  imports = [
    ../programs/gnome-tweaks
    ../programs/vscode
    
    ../programs/cli/git.nix
    ../programs/cli/gpg.nix
    ../programs/cli/zsh.nix
  ];

  home = {
    username = "mirza";
    homeDirectory = "/home/mirza";
  };

  dconf.enable = true;

  nixpkgs.config.allowUnfreePredicate = _: true;

  home.packages = with pkgs; [
    bat
    cool-retro-term
    floorp
    foot
    libreoffice
    lsd
    vesktop
    wl-clipboard
  ];

  home.stateVersion = "23.11";
}