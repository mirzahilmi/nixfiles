{
  pkgs,
  config,
  ...
}: {
  services.gnome-keyring.enable = true;

  programs.gpg = {
    enable = true;
    homedir = "${config.xdg.dataHome}/gnupg";
  };

  services.gpg-agent = {
    enable = true;
    verbose = true;
    defaultCacheTtl = 3600;
    maxCacheTtl = 86400;
    pinentryPackage = pkgs.pinentry-gnome3;
  };
}
