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
    ../programs/obs
    ../programs/openssh
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
      brave
      cool-retro-term
      dig
      du-dust
      eduvpn-client
      fd
      ffmpeg-headless
      gnumake
      gping
      gradience
      libreoffice
      nil
      postman
      slack
      ubridge
      (vesktop.overrideAttrs (prev: {
        desktopItems = [
          ((builtins.elemAt prev.desktopItems 0).override {
            icon = "${../../assets/discord.svg}";
            desktopName = "Discord";
          })
        ];
      }))
      video-trimmer
      warp-terminal
      wl-clipboard
      zoom-us

      unstable.beekeeper-studio
    ];

    stateVersion = "23.11";
  };
}
