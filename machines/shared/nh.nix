{
  programs.nh = {
    enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/home/mirza/.config/nixfiles";
  };
}
