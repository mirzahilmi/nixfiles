{pkgs}: {
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [bg-nvim];
  };
}
