{pkgs, ...}: {
  programs.foot = {
    enable = true;
    package = pkgs.unstable.foot;
    settings = {
      main = {
        font = "JetBrainsMono Nerd Font:size=13";
      };
      mouse.hide-when-typing = "yes";
      key-bindings.fullscreen = "F11";
      csd = {
        size = 0;
        border-width = 2;
        border-color = "ff404040";
      };
    };
  };
}
