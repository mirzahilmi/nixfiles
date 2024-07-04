{pkgs, ...}: {
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      return {
          font = wezterm.font("JetBrainsMono Nerd Font"),
          font_size = 11.0,
          color_scheme = "OneDark (base16)",
          window_decorations = "RESIZE",
          enable_tab_bar = false,
          window_padding = { left = 0, right = 0, top = 0, bottom = 0 },
          default_prog = {"${pkgs.bash}/bin/bash", "-c", "exec ${pkgs.tmux}/bin/tmux"}
      }
    '';
  };
}
