{pkgs, ...}: {
  environment.gnome.excludePackages = with pkgs;
    [
      gnome-tour
      gnome-text-editor
      epiphany
      xterm
      gedit
    ]
    ++ (with gnome; [
      cheese
      gnome-music
      gnome-terminal
      gnome-contacts
      gnome-maps
      geary
      simple-scan
      yelp
      epiphany
      geary
      evince
      totem
      tali
      iagno
      hitori
      atomix
    ]);
}
