{
  pkgs,
  lib,
  osConfig,
  ...
}: {
  home.packages = with pkgs; [
    bccli
    discord
    easyeffects
    eduvpn-client
    gthumb
    hurl
    jetbrains.datagrip
    jetbrains.idea-community
    libreoffice
    obsidian
    parabolic
    postman
    powertop
    tcpdump
    tio
    ungoogled-chromium
    wl-clip-persist
    wl-clipboard
    zap
    zen-browser
    unstable.zed-editor
  ];
  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = 1;
  };

  programs = {
    vscode.enable = true;
  };
  custom.programs = {
    ghostty.enable = true;
    obs.enable = true;
    spicetify.enable = true;
  };
  custom.programs.gsettings = lib.mkIf osConfig.desktop.gnome.enable {enable = true;};
}
