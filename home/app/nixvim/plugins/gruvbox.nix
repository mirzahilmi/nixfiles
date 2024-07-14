{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [gruvbox-material];
    colorscheme = "gruvbox-material";
    globals = {
      gruvbox_material_diagnostic_text_highlight = 1;
      gruvbox_material_diagnostic_virtual_text = 1;
    };
    highlightOverride = {
      AlphaHeader = {fg = "#d8a657";};
      DiffAdd = {bg = "#3c3836";};
    };
  };
}
