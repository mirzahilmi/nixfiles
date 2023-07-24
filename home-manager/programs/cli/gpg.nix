{config, ...}: {
  programs.gpg = {
    enable = true;
    homedir = "${config.xdg.dataHome}/gnupg";
  };

  services.gpg-agent = {
    enable = true;
    verbose = true;
    pinentryFlavor = "gnome3";
    defaultCacheTtl = 3600;
    maxCacheTtl = 86400;
  };
}
