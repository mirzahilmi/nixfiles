{
  pkgs,
  inputs,
  config,
  ...
}: {
  imports = [
    inputs.spicetify-nix.homeManagerModule

    ../../modules/home-manager/zimfw

    ../programs/foot
    ../programs/gnome-tweaks
    ../programs/spicetify
    ../programs/vscode

    ../programs/cli/nix-direnv
    ../programs/cli/tmux
    ../programs/cli/zsh

    ../programs/cli/bat.nix
    ../programs/cli/btop.nix
    ../programs/cli/gpg.nix
    ../programs/cli/fzf.nix
    ../programs/cli/git.nix
    ../programs/cli/home-manager.nix
    ../programs/cli/lsd.nix
    ../programs/cli/neovim.nix
    ../programs/cli/ripgrep.nix
  ];

  nixpkgs.config.allowUnfreePredicate = _: true;
  dconf.enable = true;

  home = {
    username = "mirza";
    homeDirectory = "/home/mirza";
    sessionVariables = {
      # Declutter $HOME with XDG Based Directory
      #
      # Move ~/.docker
      DOCKER_CONFIG = "${config.xdg.configHome}/docker";
      # Move ~/.nv
      CUDA_CACHE_PATH = "${config.xdg.cacheHome}/nv";
    };

    packages = with pkgs; [
      alejandra
      cointop
      cool-retro-term
      floorp
      git-filter-repo
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
      nixd
      wl-clipboard
    ];

    stateVersion = "23.11";
  };
}
