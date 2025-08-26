{pkgs, ...}: {
  home.packages = with pkgs; [
    wl-clipboard
    xfce.thunar
    obsidian
    insomnia
    jetbrains.datagrip
    discord
    texliveFull
    mermaid-cli
    bluetuith
    wev
    xwayland-satellite
    eduvpn-client
    mqttui
    wl-mirror
    wl-screenrec
    usbutils
    zotero
    unstable.gemini-cli
    qwen-code
  ];

  custom.programs = {
    rofi.enable = true;
    hyprcursor.enable = true;
    zathura.enable = true;
    spicetify.enable = true;
    flameshot.enable = true;
    gtk.enable = true;
    k9s.enable = true;
    kind.enable = true;
    ghostty.enable = true;
    eww.enable = true;
    swayidle.enable = true;
    librewolf.enable = true;
    wbg.enable = true;
    quickshell.enable = true;
    winapps.enable = true;
  };

  services = {
    swww.enable = true;
  };

  xdg.mimeApps = {
    enable = true;
    # see https://mimetype.io/all-types
    defaultApplications = {
      "application/pdf" = ["librewolf.desktop"];
      "text/html" = ["librewolf.desktop"];
    };
  };
}
