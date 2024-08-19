{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = with pkgs.unstable.vimPlugins; [cord-nvim];
    extraConfigLua = ''
      require('cord').setup {
        editor = { tooltip = "Neovim" }
      }
    '';
  };
}
