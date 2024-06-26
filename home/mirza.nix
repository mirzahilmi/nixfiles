{
  pkgs,
  outputs,
  ...
}: {
  imports = [
    ./app/foot
    ./app/gnome-tweaks
    ./app/k8s
    ./app/nixvim
    ./app/obs
    ./app/openssh
    ./app/spicetify
    ./app/vscode
    ./app/xdgify

    ./app/cli/nix-direnv
    ./app/cli/tmux
    ./app/cli/zsh

    ./app/cli/bat.nix
    ./app/cli/btop.nix
    ./app/cli/gpg.nix
    ./app/cli/fzf.nix
    ./app/cli/git.nix
    ./app/cli/home-manager.nix
    ./app/cli/jq.nix
    ./app/cli/lsd.nix
    ./app/cli/ripgrep.nix
  ];

  nixpkgs = {
    overlays = [
      outputs.overlays.extra
      outputs.overlays.unstable-package
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
      biome
      brave
      dig
      discord
      eduvpn-client
      fd
      ffmpeg-headless
      gns3-gui
      gnumake
      gradience
      libreoffice
      nil
      nmap
      postman
      shotwell
      slack
      ubridge
      wl-clipboard
      zoom-us
    ];

    stateVersion = "23.11";
  };

  xdg.userDirs = {
    publicShare = null;
    templates = null;
  };

  # Add QEMU Connection for virt-manager
  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };
}
