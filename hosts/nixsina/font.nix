{pkgs, ...}: {
  fonts.packages = with pkgs; [
    (nerdfonts.override {
      fonts = [
        "IBMPlexMono"
        "JetBrainsMono"
      ];
    })
    ibm-plex
    times-newer-roman
  ];
}
