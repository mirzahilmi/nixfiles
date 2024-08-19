{pkgs, ...}: {
  programs.wezterm = {
    enable = true;
    enableBashIntegration = false;
    enableZshIntegration = true;
    extraConfig = ''
      local config = wezterm.config_builder()

      config.default_prog = {
        "${pkgs.bash}/bin/bash", "-c", [[
          if [ -x "$(command -v ${pkgs.tmux}/bin/tmux)" ] && [ -n "''${DISPLAY}" ] && [ -z "''${TMUX}" ]; then
            exec ${pkgs.tmux}/bin/tmux new-session -A -s ''${USER} >/dev/null 2>&1
          fi
        ]]
      }
      config.font = wezterm.font("JetBrainsMono Nerd Font", {weight = "Regular"})
      config.font_size = 12
      config.scrollback_lines = 1024
      config.color_scheme = "Default Dark (base16)"
      config.window_decorations = "RESIZE"
      config.enable_wayland = true
      config.enable_tab_bar = false
      config.use_fancy_tab_bar = false
      config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
      config.check_for_updates = false
      config.force_reverse_video_cursor = true
      config.warn_about_missing_glyphs = false
      config.xcursor_theme = "Bibata-Original-Classic"
      config.hide_mouse_cursor_when_typing = true

      return config
    '';
  };
}
