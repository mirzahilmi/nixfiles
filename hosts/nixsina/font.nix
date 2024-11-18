{pkgs, ...}: {
  fonts.packages = with pkgs; [
    (nerdfonts.override {
      fonts = [
        "IBMPlexMono"
        "Iosevka"
      ];
    })
    ibm-plex
    times-newer-roman
  ];
}
