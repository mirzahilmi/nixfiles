{pkgs, ...}: {
  programs.btop = {
    enable = true;
    package = pkgs.btop.override {cudaSupport = true;};
    settings = {color_theme = "gruvbox_material_dark";};
  };
}
