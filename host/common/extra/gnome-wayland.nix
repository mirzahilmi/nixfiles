{pkgs, ...}: {
  # GNOME Desktop Config
  programs.xwayland.enable = true;
  services.xserver = {
    enable = true;
    desktopManager.gnome = {
      enable = true;
    };
    displayManager.gdm = {
      enable = true;
      wayland = true;
    };
  };
  environment.systemPackages = with pkgs; [
    xdg-desktop-portal-gnome
    xdg-desktop-portal-gtk
  ];
}
