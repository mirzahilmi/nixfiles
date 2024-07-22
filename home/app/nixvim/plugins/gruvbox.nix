{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [gruvbox-material];
    colorscheme = "gruvbox-material";
    globals = {
      gruvbox_material_diagnostic_virtual_text = 1;
    };
    highlightOverride = {
      TelescopeSelection = {link = "CursorLine";};
      NormalFloat = {link = "@none";};
      FloatBorder = {link = "@none";};
      MiniStatuslineModeNormal = {
        fg = "#282828";
        bg = "#a9b665";
        ctermfg.__raw = "235";
        ctermbg.__raw = "142";
        bold = true;
      };
      MiniStatuslineModeInsert = {
        fg = "#282828";
        bg = "#e78a4e";
        ctermfg.__raw = "235";
        ctermbg.__raw = "208";
        bold = true;
      };
    };
  };
}
