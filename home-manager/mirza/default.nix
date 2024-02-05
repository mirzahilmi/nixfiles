{
  pkgs,
  inputs,
  outputs,
  config,
  ...
}: {
  imports = [
    inputs.spicetify-nix.homeManagerModule

    ../../modules/home-manager/zimfw

    ../programs/foot
    ../programs/gnome-tweaks
    ../programs/neovim
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
    ../programs/cli/ripgrep.nix
  ];

  nixpkgs = {
    overlays = [outputs.overlays.extras];
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  dconf.enable = true;

  home = {
    username = "mirza";
    homeDirectory = "/home/mirza";
    sessionVariables = {
      TERM = "screen-256color";
      # Declutter $HOME with XDG Based Directory
      #
      # Move ~/.docker
      DOCKER_CONFIG = "${config.xdg.configHome}/docker";
      # Move ~/.nv
      CUDA_CACHE_PATH = "${config.xdg.cacheHome}/nv";
    };

    packages = with pkgs; [
      inputs.st.packages.${pkgs.system}.st-snazzy

      alejandra
      cointop
      cool-retro-term
      floorp
      gnumake
      gping
      libgccjit
      libstdcxx5
      libreoffice
      nil
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

    stateVersion = "23.11";
  };
}
