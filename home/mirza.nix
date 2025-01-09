{pkgs, ...}: {
  imports = [
    ./shared

    ../modules/home-manager/gnome
    ../modules/home-manager/ohmyposh

    ../modules/home-manager/bat.nix
    ../modules/home-manager/btop.nix
    ../modules/home-manager/direnv.nix
    ../modules/home-manager/fastfetch.nix
    ../modules/home-manager/fzf.nix
    ../modules/home-manager/git.nix
    ../modules/home-manager/gpg.nix
    ../modules/home-manager/jq.nix
    ../modules/home-manager/lsd.nix
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
      asciiquarium
      biome
      bccli
      burpsuite
      chafa
      dig
      distrobox
      easyeffects
      eduvpn-client
      fd
      ffmpeg-headless
      ghostty
      gnumake
      hurl
      lazygit
      unstable.lazysql
      libreoffice
      nmap
      nvtopPackages.full
      obsidian
      parabolic
      postman
      powertop
      simple-http-server
      slack
      ssh-to-age
      sqlfluff
      tcpdump
      teams-for-linux
      tio
      ungoogled-chromium
      unzip
      vesktop
      wl-clipboard
      wl-clip-persist
      zap
      zen-browser
      zoom-us
    ];
    sessionVariables = {
      MOZ_ENABLE_WAYLAND = 1;
    };

    stateVersion = "23.11";
  };
  orchestration.kubernetes = {
    enable = true;
    aliasKubectl = "kube";
  };
  _programs = {
    k9s.enable = true;
  };
  custom.programs = {
    tmux.enable = true;
  };

  xdg.userDirs = {
    publicShare = null;
    templates = null;
  };

  xdg.configFile."ghostty/config".text = ''
    auto-update = off
    cursor-invert-fg-bg = true
    cursor-style-blink = false
    font-family = Iosevka NF
    font-size = 16
    mouse-hide-while-typing = true
    theme = Dark+
    window-decoration = false
    window-padding-color = extend
    mouse-scroll-multiplier = 0.125

    keybind = ctrl+shift+o=unbind
    keybind = ctrl+enter=unbind
    keybind = f11=toggle_fullscreen
  '';

  programs.vscode = {
    enable = true;
  };
}
