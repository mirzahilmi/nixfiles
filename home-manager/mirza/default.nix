{
  pkgs,
  inputs,
  config,
  ...
}: {
  imports = [
    inputs.spicetify-nix.homeManagerModule
    inputs.zimfw.homeManagerModules.zimfw

    ../programs/foot
    ../programs/gnome-tweaks
    ../programs/vscode

    ../programs/cli/nix-direnv
    ../programs/cli/tmux
    ../programs/cli/zsh

    ../programs/cli/bat.nix
    ../programs/cli/btop.nix
    ../programs/cli/fzf.nix
    ../programs/cli/git.nix
    ../programs/cli/gpg.nix
    ../programs/cli/home-manager.nix
    ../programs/cli/lsd.nix
    ../programs/cli/neovim.nix
    ../programs/cli/ripgrep.nix
  ];

  home = {
    username = "mirza";
    homeDirectory = "/home/mirza";
    sessionVariables = {
      DOCKER_CONFIG = "${config.xdg.configHome}/docker";
    };
  };

  dconf.enable = true;

  nixpkgs.config.allowUnfreePredicate = _: true;

  home.packages = with pkgs; [
    alejandra
    cointop
    cool-retro-term
    floorp
    gnumake
    gping
    libreoffice
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
