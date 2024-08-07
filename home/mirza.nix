{
  pkgs,
  outputs,
  ...
}: {
  imports = [
    ./common

    ./app/gnome
    ./app/nixvim
    ./app/vscode

    ./app/obs.nix
    ./app/openssh.nix
    ./app/spicetify.nix

    ./app/cli/ohmyposh

    ./app/cli/bat.nix
    ./app/cli/btop.nix
    ./app/cli/direnv.nix
    ./app/cli/fastfetch.nix
    ./app/cli/fzf.nix
    ./app/cli/gpg.nix
    ./app/cli/git.nix
    ./app/cli/jq.nix
    ./app/cli/lsd.nix
    ./app/cli/ripgrep.nix
    ./app/cli/tmux.nix
    ./app/cli/zsh.nix

    ../module/home-manager/wezterm.nix
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
      hurl
      # l5p-keyboard-rgb
      libreoffice
      nmap
      parabolic
      postman
      shotwell
      slack
      ssh-to-age
      st-snazzy
      ubridge
      unzip
      wl-clipboard
      zoom-us
      qgis
      unstable.nixd
      # unstable.zed-editor
    ];

    stateVersion = "23.11";
  };

  xdg.userDirs = {
    publicShare = null;
    templates = null;
  };
}
