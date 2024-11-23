{lib, ...}: {
  time.timeZone = lib.mkDefault "Asia/Jakarta";
  i18n = {
    defaultLocale = lib.mkDefault "en_US.UTF-8";
    supportedLocales = lib.mkDefault ["en_US.UTF-8/UTF-8" "en_GB.UTF-8/UTF-8"];
  };
}
