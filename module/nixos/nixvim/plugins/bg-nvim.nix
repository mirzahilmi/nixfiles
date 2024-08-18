{pkgs}: {
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [bg-nvim];
    extraConfigLua = ''
      require('bg').setup {}
    '';
  };
}
