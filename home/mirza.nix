{pkgs, ...}: {
  imports = [
    ./shared

    ../modules/home-manager/gnome

    ../modules/home-manager/foot.nix
    ../modules/home-manager/mpv.nix
    ../modules/home-manager/obs.nix
    ../modules/home-manager/spicetify.nix
    ../modules/home-manager/ssh.nix
    ../modules/home-manager/tealdeer.nix
    ../modules/home-manager/zed.nix

    ../modules/home-manager/cli/ohmyposh

    ../modules/home-manager/cli/bat.nix
    ../modules/home-manager/cli/btop.nix
    ../modules/home-manager/cli/direnv.nix
    ../modules/home-manager/cli/fastfetch.nix
    ../modules/home-manager/cli/fzf.nix
    ../modules/home-manager/cli/gpg.nix
    ../modules/home-manager/cli/git.nix
    ../modules/home-manager/cli/jq.nix
    ../modules/home-manager/cli/lsd.nix
    ../modules/home-manager/cli/ripgrep.nix
    ../modules/home-manager/cli/tmux.nix
    ../modules/home-manager/cli/zsh.nix

    ../modules/home-manager/wezterm.nix
  ];

  home = {
    username = "mirza";
    homeDirectory = "/home/mirza";
    packages = with pkgs; [
      alejandra
      asciiquarium
      biome
      bccli
      # ciscoPacketTracer8
      cloudflare-warp
      dig
      distrobox
      eduvpn-client
      fd
      gnumake
      hurl
      lazysql
      libreoffice
      nmap
      nvtop
      obsidian
      parabolic
      powertop
      signal-desktop
      slack
      ssh-to-age
      teams-for-linux
      terraform
      unzip
      (vesktop.overrideAttrs (_prev: {
        desktopItems = [
          ((builtins.elemAt _prev.desktopItems 0).override {
            icon = "${../imgs/discord.svg}";
            desktopName = "Discord";
          })
        ];
      }))
      wl-clipboard
      yaml-language-server
      zen-browser
      zoom-us
      unstable.ansible
      unstable.nixd
    ];

    stateVersion = "23.11";
  };

  xdg.userDirs = {
    publicShare = null;
    templates = null;
  };
}
