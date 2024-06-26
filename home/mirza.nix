{
  pkgs,
  outputs,
  ...
}: {
  imports = [
    ./common/global

    ./app/gnome
    ./app/vscode

    ./app/foot.nix
    ./app/nixvim.nix
    ./app/obs.nix
    ./app/openssh.nix
    ./app/spicetify.nix

    ./app/cli/bat.nix
    ./app/cli/btop.nix
    ./app/cli/direnv.nix
    ./app/cli/fastfetch.nix
    ./app/cli/fzf.nix
    ./app/cli/gpg.nix
    ./app/cli/git.nix
    ./app/cli/home-manager.nix
    ./app/cli/jq.nix
    ./app/cli/lsd.nix
    ./app/cli/ohmyposh.nix
    ./app/cli/ripgrep.nix
    ./app/cli/tmux.nix
    ./app/cli/zsh.nix
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
      gimp
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
