{
  pkgs,
  lib,
  config,
  osConfig,
  ...
}: {
  home.packages = with pkgs; [
    networkmanagerapplet
    wl-clipboard
    zen-browser
  ];

  custom.programs = {
    rofi.enable = true;
    # sway.enable = true;
    ghostty.enable = true;
    foot.enable = true;
  };
  services = {
    swww.enable = true;
  };

  xdg.configFile."sway/config".source =
    lib.mkIf osConfig.custom.programs.sway.enable
    (config.lib.file.mkOutOfStoreSymlink "/home/mirza/.config/nixfiles/modules/nixos/sway");
}
