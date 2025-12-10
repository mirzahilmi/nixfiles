{pkgs, ...}: {
  home.packages = with pkgs; [
    wl-clipboard
    unstable.insomnia
    jetbrains.datagrip
    discord
    mermaid-cli
    eduvpn-client
    mqttui
    usbutils
    zotero
    qwen-code
    drawio
    postgresql
    zap
    freerdp
    postman
    obsidian
    kind
    kubectl
    kubectl-explore
    ungoogled-chromium
    burpsuite
    wireshark
    minikube
    openssl
    exiftool
    tokei
    anydesk
    slack
    pandoc
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

  # thanks to https://github.com/NixOS/nixpkgs/issues/115878#issuecomment-1152105593
  home.file = {
    ".minikube/bin/docker-machine-driver-kvm2".source = "${pkgs.docker-machine-kvm2}/bin/docker-machine-driver-kvm2";
  };
}
