{pkgs, ...}: {
  home.packages = with pkgs; [
    wl-clipboard
    insomnia
    jetbrains.datagrip
    discord
    texliveFull
    mermaid-cli
    eduvpn-client
    mqttui
    usbutils
    zotero
    unstable.gemini-cli
    qwen-code
    drawio
    postgresql
    zap
    rpi-imager
    freerdp
    postman
    obsidian
    kind
    kubectl
    kubectl-explore
    ungoogled-chromium
    burpsuite
    wireshark
    redisinsight
  ];

  custom.programs = {
    zathura.enable = true;
    spicetify.enable = true;
    gtk.enable = true;
    k9s.enable = true;
    ghostty.enable = true;
    swayidle.enable = true;
    librewolf.enable = true;
    winapps.enable = true;
    obs.enable = true;

    zsh.aliases = {
      lg = "lazygit";
      k9 = "k9s";
      k = "kubectl";
    };
  };

  xdg.mimeApps = {
    enable = true;
    # see https://mimetype.io/all-types
    defaultApplications = {
      "x-scheme-handler/http" = ["librewolf.desktop"];
      "x-scheme-handler/https" = ["librewolf.desktop"];
      "x-scheme-handler/ftp" = ["librewolf.desktop"];
      "text/html" = ["librewolf.desktop"];
      "application/xhtml+xml" = ["librewolf.desktop"];
      "application/pdf" = ["librewolf.desktop"];
      "text/uri-list" = ["librewolf.desktop"];
      "application/x-extension-htm" = ["librewolf.desktop"];
      "application/x-extension-html" = ["librewolf.desktop"];
      "application/x-extension-shtml" = ["librewolf.desktop"];
      "application/x-extension-xhtml" = ["librewolf.desktop"];
      "application/x-extension-xht" = ["librewolf.desktop"];
    };
  };

  dconf.settings = {
    "org/gnome/desktop/interface".color-scheme = "prefer-dark";
  };
}
