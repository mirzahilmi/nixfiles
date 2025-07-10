{pkgs, ...}: {
  custom.programs = {
    k9s.enable = true;
    kind.enable = true;
  };

  home.packages = with pkgs; [
    kubectx
    sumatrapdf-wrapper
    texliveMedium
  ];
}
