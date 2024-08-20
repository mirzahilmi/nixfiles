{pkgs, ...}: {
  home.packages = with pkgs.unstable; [zed-editor];
  home.sessionVariables = {WAYLAND_DISPLAY = "";};
}
