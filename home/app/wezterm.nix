{pkgs, ...}: {
  programs.wezterm = {
    enable = true;
    enableBashIntegration = false;
    enableZshIntegration = true;
    extraConfig = ''
      return {
          default_prog = {
            "${pkgs.bash}/bin/bash", "-c", [[
              if [ -x "$(command -v ${pkgs.tmux}/bin/tmux)" ] && [ -n "''${DISPLAY}" ] && [ -z "''${TMUX}" ]; then
                exec ${pkgs.tmux}/bin/tmux new-session -A -s ''${USER} >/dev/null 2>&1
              fi
            ]]
          },
          font = wezterm.font("JetBrainsMono Nerd Font", {weight = "Regular"}),
          font_size = 10.75,
          scrollback_lines = 1024,
          color_scheme = "Gruvbox Dark (Gogh)",
          window_decorations = "RESIZE",
          enable_wayland = true,
          enable_tab_bar = false,
          use_fancy_tab_bar = false,
          window_padding = { left = 0, right = 0, top = 0, bottom = 0 },
          check_for_updates = false,
          force_reverse_video_cursor = true,
          warn_about_missing_glyphs = false,
          xcursor_theme = "Bibata-Original-Classic";
      }
    '';
  };
}
