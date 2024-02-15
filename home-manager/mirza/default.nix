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
    ../programs/k8s
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
    ../programs/cli/jq.nix
    ../programs/cli/lsd.nix
    ../programs/cli/ripgrep.nix
  ];

  nixpkgs = {
    overlays = [
      outputs.overlays.extras
      outputs.overlays.unstable-packages
    ];
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
      (github-dekstop.overrideAttrs (_prev: {
        version = "3.3.8";
        src = _prev.src.override {hash = "";};
      }))
      gnumake
      gping
      libreoffice
      nil
      (vesktop.overrideAttrs (_prev: {
        desktopItems = [
          ((builtins.elemAt _prev.desktopItems 0).override {
            icon = "${../../assets/discord.svg}";
            desktopName = "Discord";
          })
        ];
      }))
      wl-clipboard
    ];

    stateVersion = "23.11";
  };
}
