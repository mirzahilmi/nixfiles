{pkgs, ...}: {
  imports = [./shared];

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
      unstable.ghostty
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
      unstable.zed-editor
      zen-browser
      zoom-us
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
    k9s.enable = true;
    ripgrep.enable = true;
  };
  custom.programs = {
    bat.enable = true;
    btop.enable = true;
    direnv.enable = true;
    fzf.enable = true;
    git.enable = true;
    gpg.enable = true;
    gtk.enable = true;
    kind.enable = true;
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
}
