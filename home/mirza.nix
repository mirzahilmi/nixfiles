{
  pkgs,
  outputs,
  ...
}: {
  imports = [
    ./shared

    ../modules/home-manager/gnome

    ../modules/home-manager/obs.nix
    ../modules/home-manager/ssh.nix
    ../modules/home-manager/spicetify.nix
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
      brave
      cloudflare-warp
      dig
      discord
      eduvpn-client
      fd
      gnumake
      hurl
      libreoffice
      nmap
      parabolic
      ssh-to-age
      unzip
      wl-clipboard
      zoom-us
      unstable.nixd
      unstable.sops
    ];

    stateVersion = "23.11";
  };

  xdg.userDirs = {
    publicShare = null;
    templates = null;
  };
}
