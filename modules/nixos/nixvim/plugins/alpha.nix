let
  mkButton = {
    cmd,
    hl_shortcut ? "TSDanger",
    hl ? "",
    shortcut,
    val,
  }: {
    type = "button";
    inherit val;
    on_press = {__raw = cmd;};
    opts = {
      inherit hl_shortcut hl;
      shortcut = " ${shortcut} ";
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
                hl = "Keyword";
              }
            )
          ];
        }
        {
          type = "padding";
          val = 2;
        }
        {
          type = "group";
          val = [
            {
              type = "text";
              val.__raw = "vim.fn.getcwd()";
              opts = {
                hl = "TSField";
                position = "center";
              };
            }
            {
              type = "padding";
              val = 1;
            }
            {
              type = "text";
              val.__raw = "\" v\" .. vim.version().major .. \".\" .. vim.version().minor .. \".\" .. vim.version().patch";
              opts = {
                hl = "Orange";
                position = "center";
              };
            }
          ];
        }
      ];
    };
  };
}
