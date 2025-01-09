{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.custom.programs.wezterm;
in {
  options.custom.programs.wezterm = {
    enable = lib.mkEnableOption "wezterm";
  };
  config = lib.mkIf cfg.enable {
    programs.wezterm = {
      enable = true;
      enableBashIntegration = false;
      enableZshIntegration = true;
      extraConfig =
        # Lua
        ''
          local config = wezterm.config_builder()

          local xcursor_size = nil
          local xcursor_theme = nil

          local success, stdout, stderr = wezterm.run_child_process({"gsettings", "get", "org.gnome.desktop.interface", "cursor-theme"})
          if success then
            xcursor_theme = stdout:gsub("'(.+)'\n", "%1")
          end

          local success, stdout, stderr = wezterm.run_child_process({"gsettings", "get", "org.gnome.desktop.interface", "cursor-size"})
          if success then
            xcursor_size = tonumber(stdout)
          end

          config.default_prog = {
            "${pkgs.bash}/bin/bash", "-c", [[
              if [ -x "$(command -v ${pkgs.tmux}/bin/tmux)" ] && [ -n "''${DISPLAY}" ] && [ -z "''${TMUX}" ]; then
                exec ${pkgs.tmux}/bin/tmux new-session -A -s ''${USER} >/dev/null 2>&1
              fi
            ]]
          }

          config.font = wezterm.font("JetBrainsMono Nerd Font", {weight = "Regular"})
          config.font_size = 13
          config.window_decorations = "RESIZE"
          config.color_scheme = "Vs Code Dark+ (Gogh)"
          config.enable_wayland = true
          config.max_fps = 144
          config.enable_tab_bar = false
          config.use_fancy_tab_bar = false
          config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
          config.check_for_updates = false
          config.force_reverse_video_cursor = true
          config.warn_about_missing_glyphs = false
          config.xcursor_theme = xcursor_theme
          config.xcursor_size = xcursor_size
          config.hide_mouse_cursor_when_typing = true
          config.adjust_window_size_when_changing_font_size = false
          config.keys = {
              {
                  key = 'F11',
                  action = wezterm.action.ToggleFullScreen,
              }
          }

          return config
        '';
    };
  };
}
