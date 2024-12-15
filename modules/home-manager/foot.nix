{pkgs, ...}: {
  programs.foot = {
    enable = true;
    package = pkgs.unstable.foot;
    settings = {
      main = {
        font = "Iosevka NF:size=16";
      };
      mouse.hide-when-typing = "yes";
      key-bindings.fullscreen = "F11";
      colors.alpha = 0.95;
      csd = {
        preferred = "client";
        size = 0;
        border-width = 2;
        border-color = "ff404040";
      };
    };
  };
}
