{
  pkgs,
  lib,
  config,
  osConfig,
  ...
}: {
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
  ];

  custom.programs = {
    rofi.enable = true;
    foot.enable = true;
    hyprcursor.enable = true;
    zathura.enable = true;
    spicetify.enable = true;
    flameshot.enable = true;
    waybar.enable = true;
    gtk.enable = true;
    niri.enable = true;
    anyrun.enable = true;
    k9s.enable = true;
    kind.enable = true;
  };

  services = {
    swww.enable = true;
  };

  # xdg.configFile."sway/config".source =
  #   lib.mkIf osConfig.custom.programs.sway.enable
  #   (config.hm.lib.file.mkOutOfStoreSymlink "/home/mirza/.config/nixfiles/modules/nixos/sway");
}
