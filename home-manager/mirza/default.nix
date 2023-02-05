{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.zimfw.homeManagerModules.zimfw

    ../programs/foot
    ../programs/gnome-tweaks
    ../programs/vscode

    ../programs/cli/nix-direnv
    ../programs/cli/tmux
    ../programs/cli/zsh
    ../programs/cli/home-manager.nix
    ../programs/cli/git.nix
    ../programs/cli/gpg.nix
    ../programs/cli/neovim.nix
  ];

  home = {
    username = "mirza";
    homeDirectory = "/home/mirza";
  };

  dconf.enable = true;

  nixpkgs.config.allowUnfreePredicate = _: true;

  home.packages = with pkgs; [
    alejandra
    bat
    btop
    cointop
    cool-retro-term
    floorp
    gnumake
    gping
    libreoffice
    lsd
    (vesktop.overrideAttrs (prev: {
      desktopItems = [
        ((builtins.elemAt prev.desktopItems 0).override (_: {
          icon = "${../../assets/discord.svg}";
          desktopName = "Discord";
        }))
      ];
    }))
    wl-clipboard
  ];

  home.stateVersion = "23.11";
}
