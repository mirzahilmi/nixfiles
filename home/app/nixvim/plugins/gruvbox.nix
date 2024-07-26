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
    };
  };
}
