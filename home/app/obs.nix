{pkgs, ...}: {
  programs.obs-studio = {
    enable = true;
    package = pkgs.unstable.obs-studio;
    plugins = builtins.attrValues {
      inherit
        (pkgs.obs-studio-plugins)
        wlrobs
        input-overlay
        obs-backgroundremoval
        obs-pipewire-audio-capture
        ;
    };
  };
}
