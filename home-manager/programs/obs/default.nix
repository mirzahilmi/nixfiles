{pkgs, ...}: {
  programs.obs = with pkgs; {
    enable = true;
    package = unstable.obs-studio;
    plugins = with obs-studio-plugins; [
      wlrobs
      input-overlay
      obs-backgroundremoval
      obs-pipewire-audio-capture
    ];
  };
}
