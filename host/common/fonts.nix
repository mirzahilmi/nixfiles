{pkgs, ...}: {
  fonts.packages = with pkgs; [
    (nerdfonts.override {
      fonts = [
        "FiraCode"
        "Gohu"
        "IBMPlexMono"
        "JetBrainsMono"
        "UbuntuMono"
      ];
    })
    ibm-plex
    times-newer-roman
  ];
}
