{
  pkgs,
  outputs,
  ...
}: {
  imports = [
    ./xdgify.nix
    ../../modules/home-manager
  ];

  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "mirza";
    homeDirectory = "/home/mirza";
    packages = with pkgs; [
      bccli
      dig
      discord
      easyeffects
      eduvpn-client
      fd
      ffmpeg-headless
      gnumake
      gthumb
      hurl
      jetbrains.datagrip
      jetbrains.idea-community
      libreoffice
      nmap
      obsidian
      parabolic
      postman
      powertop
      tcpdump
      tio
      ungoogled-chromium
      unzip
      wl-clip-persist
      wl-clipboard
      yazi
      zap
      zen-browser
      zip

      unstable.zed-editor
    ];
    sessionVariables = {
      MOZ_ENABLE_WAYLAND = 1;
    };

    stateVersion = "23.11";
  };

  programs = {
    vscode.enable = true;
    fastfetch.enable = true;
    jq.enable = true;
    ripgrep.enable = true;
  };
  custom.programs = {
    bat.enable = true;
    btop.enable = true;
    direnv.enable = true;
    fzf.enable = true;
    ghostty.enable = true;
    git.enable = true;
    gtk.enable = true;
    kind.enable = true;
    lazydocker.enable = true;
    lazygit.enable = true;
    lsd.enable = true;
    obs.enable = true;
    ohmyposh.enable = true;
    spicetify.enable = true;
    ssh.enable = true;
    tldr.enable = true;
    tmux.enable = true;
    zsh.enable = true;
  };

  xdg.userDirs = {
    publicShare = null;
    templates = null;
  };
}
