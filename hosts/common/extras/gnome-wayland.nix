{ pkgs, ...}:
{
  services.xserver = {
    desktopManager.gnome = {
      enable = true;
    };
    displayManager.gdm = {
      enable = true;
      wayland = true;
    };
  };

  programs.xwayland.enable = true;

  environment.systemPackages = with pkgs; [
    gnomeExtensions.blur-my-shell
    gnomeExtensions.clipboard-indicator
    gnomeExtensions.dash-to-dock
    gnomeExtensions.Vitals
  ];
}