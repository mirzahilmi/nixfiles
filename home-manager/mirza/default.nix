{ pkgs, inputs, ... }:
{
  imports = [
    inputs.zimfw.homeManagerModules.zimfw

    ../programs/gnome-tweaks
    ../programs/vscode
    
    ../programs/cli/git.nix
    ../programs/cli/gpg.nix
    ../programs/cli/zsh.nix
    ../programs/cli/zimfw.nix
  ];

  home = {
    username = "mirza";
    homeDirectory = "/home/mirza";
  };

  dconf.enable = true;

  nixpkgs.config.allowUnfreePredicate = _: true;

  home.packages = with pkgs; [
    floorp
    vesktop
    cool-retro-term
    wl-clipboard
    foot
  ];

  home.stateVersion = "23.11";
}