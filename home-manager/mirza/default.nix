{
  pkgs,
  inputs,
  outputs,
  ...
}: {
  imports = [
    inputs.spicetify-nix.homeManagerModule
    outputs.homeManagerModules.zimfw

    ./tweaks.nix

    ../programs/foot
    ../programs/gnome-tweaks
    ../programs/neovim
    ../programs/spicetify
    ../programs/vscode
    ../programs/xdgify

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

  home = {
    username = "mirza";
    homeDirectory = "/home/mirza";
    packages = with pkgs; [
      alejandra
      cointop
      cool-retro-term
      fd
      floorp
      gnumake
      gping
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
