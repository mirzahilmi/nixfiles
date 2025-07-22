{pkgs, ...}: {
  home.packages = with pkgs; [
    wl-clipboard
    zen-browser
    xfce.thunar
    obsidian
    insomnia
    jetbrains.datagrip
    discord
    texliveFull
    kubectx
    mermaid-cli
    bluetuith
    wev
  ];

  custom.programs = {
    rofi.enable = true;
    foot.enable = true;
    hyprcursor.enable = true;
    zathura.enable = true;
    spicetify.enable = true;
    flameshot.enable = true;
    gtk.enable = true;
    k9s.enable = true;
    kind.enable = true;
    ghostty.enable = true;
    eww.enable = true;
  };

  services = {
    swww.enable = true;
  };
}
