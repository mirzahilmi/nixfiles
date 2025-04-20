{
  pkgs,
  config,
  ...
}: {
  imports = [../shared];

  home = {
    username = "mirza";
    homeDirectory = "/home/${config.home.username}";
    packages = with pkgs; [
      bccli
      dig
      fd
      gnumake
      hurl
      nmap
      tcpdump
      unzip
      zip
    ];

    stateVersion = "23.11";
  };

  programs = {
    fastfetch.enable = true;
    jq.enable = true;
    ripgrep.enable = true;
  };
  custom.programs = {
    bat.enable = true;
    btop.enable = true;
    direnv.enable = true;
    fzf.enable = true;
    git.enable = true;
    lazydocker.enable = true;
    lazygit.enable = true;
    lsd.enable = true;
    ohmyposh.enable = true;
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
