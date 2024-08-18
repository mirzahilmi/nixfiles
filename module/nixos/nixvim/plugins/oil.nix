{
  programs.nixvim = {
    plugins.oil = {
      enable = true;
      settings = {
        default_file_explorer = true;
        delete_to_trash = true;
        skip_confirm_for_simple_edits = true;
        view_options = {
          show_hidden = true;
          natural_order = true;
        };
        keymaps = {
          "<C-c>" = false;
          "<C-h>" = false;
          "<C-j>" = false;
          "<C-k>" = false;
          "<C-l>" = false;
          "q" = "actions.close";
        };
      };
    };
    keymaps = [
      {
        mode = "n";
        key = "-";
        action = "<CMD>Oil<CR>";
        options = {
          desc = "Open parent directory";
        };
      }
    ];
  };
}
