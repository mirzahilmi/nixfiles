# GNOME Desktop Environtment/Manager Setup
# Runned under Wayland
{outputs, ...}: {
  imports = [
    ./pkgs.nix
  ];

  nixpkgs.overlays = [
    outputs.overlays.gnome-dynamic-triple-buffering
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
