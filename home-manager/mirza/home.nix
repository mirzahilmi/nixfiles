{ pkgs, inputs, outputs, ... }:
{
  imports = [
    ../programs/gnome-tweaks
    ../programs/vscode
    
    ../programs/cli/git
    ../programs/cli/gpg
    ../programs/cli/zsh
    ../programs/cli/prezto
  ];

  home = {
    username = "mirza";
    homeDirectory = "/home/mirza";
  };

  dconf.enable = true;

  home.packages = with pkgs; [
    floorp
    vesktop
    cool-retro-term
  ];

  home.stateVersion = "23.11";
}