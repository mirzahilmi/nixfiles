{
  pkgs,
  outputs,
  ...
}: {
  imports = [
    ./shared

    ../module/home-manager/gnome

    ../module/home-manager/obs.nix
    ../module/home-manager/openssh.nix
    ../module/home-manager/spicetify.nix
    ../module/home-manager/zed.nix

    ../module/home-manager/cli/ohmyposh

    ../module/home-manager/cli/bat.nix
    ../module/home-manager/cli/btop.nix
    ../module/home-manager/cli/direnv.nix
    ../module/home-manager/cli/fastfetch.nix
    ../module/home-manager/cli/fzf.nix
    ../module/home-manager/cli/gpg.nix
    ../module/home-manager/cli/git.nix
    ../module/home-manager/cli/jq.nix
    ../module/home-manager/cli/lsd.nix
    ../module/home-manager/cli/ripgrep.nix
    ../module/home-manager/cli/tmux.nix
    ../module/home-manager/cli/zsh.nix

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
