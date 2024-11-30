{pkgs, ...}: {
  imports = [
    ./shared

    ../modules/home-manager/gnome
    ../modules/home-manager/ohmyposh

    ../modules/home-manager/bat.nix
    ../modules/home-manager/btop.nix
    ../modules/home-manager/direnv.nix
    ../modules/home-manager/fastfetch.nix
    ../modules/home-manager/foot.nix
    ../modules/home-manager/fzf.nix
    ../modules/home-manager/git.nix
    ../modules/home-manager/gpg.nix
    ../modules/home-manager/jq.nix
    ../modules/home-manager/lsd.nix
    ../modules/home-manager/mpv.nix
    ../modules/home-manager/obs.nix
    ../modules/home-manager/ripgrep.nix
    ../modules/home-manager/spicetify.nix
    ../modules/home-manager/ssh.nix
    ../modules/home-manager/tealdeer.nix
    ../modules/home-manager/tmux.nix
    ../modules/home-manager/zed.nix
    ../modules/home-manager/zsh.nix
  ];

  home = {
    username = "mirza";
    homeDirectory = "/home/mirza";
    packages = with pkgs; [
      alejandra
      asciiquarium
      biome
      bccli
      burpsuite
      ciscoPacketTracer8
      dig
      distrobox
      eduvpn-client
      fd
      ffmpeg-headless
      gnumake
      hurl
      libreoffice
      nmap
      nvtopPackages.full
      obsidian
      parabolic
      powertop
      signal-desktop
      slack
      ssh-to-age
      sqlfluff
      tcpdump
      teams-for-linux
      terraform
      tio
      unzip
      vesktop
      wl-clipboard
      wl-clip-persist
      yaml-language-server
      zap
      zen-browser
      zoom-us
      unstable.nixd
    ];
    sessionVariables = {
      MOZ_ENABLE_WAYLAND = 1;
    };

    stateVersion = "23.11";
  };
  orchestration.kubernetes.enable = true;

  xdg.userDirs = {
    publicShare = null;
    templates = null;
  };
}
