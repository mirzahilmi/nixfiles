{
  osConfig,
  lib,
  ...
}: {
  config = lib.mkIf osConfig.custom.programs.hyprland.enable {
    wayland.windowManager.hyprland = {
      enable = true;
      settings = {
        "$mod" = "SUPER";
        "$term" = "ghostty";
        "$menu" = "rofi -show drun -theme /home/mirza/.config/rofi/config.rasi";
        bind = [
          "$mod, RETURN, exec, $term"
          "$mod, SPACE, exec, $menu"
          "$mod, F, togglefloating,"
          "$mod, Q, killactive,"
        ];
        bindm = [
          "$mod, mouse:272, movewindow"
          "$mod, mouse:273, resizewindow"
          "$mod ALT, mouse:272, resizewindow"
        ];
        bindel = [
          ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
          ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
          ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
          ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
          ",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
          ",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
        ];
      };
    };
  };
}
