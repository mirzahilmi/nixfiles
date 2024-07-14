let
  mkButton = {
    cmd,
    hl ? "Keyword",
    shortcut,
    val,
  }: {
    type = "button";
    inherit val;
    on_press = {__raw = cmd;};
    opts = {
      inherit shortcut hl;
      position = "center";
      cursor = 3;
      width = 38;
      align_shortcut = "right";
    };
  };
in {
  programs.nixvim = {
    highlightOverride = {
      AlphaHeader = {
        fg = "#d8a657";
      };
    };
    plugins.alpha = {
      enable = true;
      layout = [
        {
          type = "padding";
          val = 4;
        }
        {
          opts = {
            hl = "AlphaHeader";
            position = "center";
          };
          type = "text";
          val = [
            "                                                                       "
            "                                                                     "
            "       ████ ██████           █████      ██                     "
            "      ███████████             █████                             "
            "      █████████ ███████████████████ ███   ███████████   "
            "     █████████  ███    █████████████ █████ ██████████████   "
            "    █████████ ██████████ █████████ █████ █████ ████ █████   "
            "  ███████████ ███    ███ █████████ █████ █████ ████ █████  "
            " ██████  █████████████████████ ████ █████ █████ ████ ██████ "
            "                                                                       "
          ];
        }
        {
          type = "padding";
          val = 2;
        }
        {
          type = "group";
          val = [
            (
              mkButton {
                val = "󰱼 Find file";
                shortcut = "<leader>sf";
                cmd = "function() require('telescope.builtin').find_files({hidden = true}) end";
              }
            )
            {
              type = "padding";
              val = 1;
            }
            (
              mkButton {
                val = " Regex match";
                shortcut = "<leader>sg";
                cmd = "function() require('telescope.builtin').live_grep() end";
              }
            )
            {
              type = "padding";
              val = 1;
            }
            (
              mkButton {
                val = "󰋚 Oldfiles";
                shortcut = "<leader>s";
                cmd = "function() require('telescope.builtin').oldfiles() end";
              }
            )
            {
              type = "padding";
              val = 1;
            }
            (
              mkButton {
                val = "󰅚 Quit Neovim";
                shortcut = "ZQ";
                cmd = "function() vim.cmd[[qa]] end";
                hl = "String";
              }
            )
          ];
        }
        {
          type = "padding";
          val = 2;
        }
      ];
    };
  };
}
