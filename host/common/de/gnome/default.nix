# GNOME Desktop Environtment/Manager Setup
# Runned under Wayland
{
  imports = [
    ./pkgs.nix
  ];

  services.xserver = {
    enable = true;
    desktopManager.gnome.enable = true;
    displayManager.gdm = {
      enable = true;
      wayland = true;
    };
  };
  programs.xwayland.enable = true;
}
