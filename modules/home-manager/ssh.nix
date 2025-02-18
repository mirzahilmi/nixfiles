{
  lib,
  config,
  ...
}: let
  cfg = config.custom.programs.ssh;
in {
  options.custom.programs.ssh = {
    enable = lib.mkEnableOption "ssh";
  };
  config = lib.mkIf cfg.enable {
    programs.ssh = {
      enable = true;
      addKeysToAgent = "yes";
      matchBlocks = {
        "202.249.24.115" = {
          extraOptions = {
            KexAlgorithms = "+diffie-hellman-group1-sha1";
            PubkeyAcceptedAlgorithms = "+ssh-rsa";
            HostkeyAlgorithms = "+ssh-rsa";
            Ciphers = "+aes256-cbc";
          };
        };
        "202.249.25.154" = {
          extraOptions = {
            kexalgorithms = "+diffie-hellman-group1-sha1";
            pubkeyacceptedalgorithms = "+ssh-rsa";
            hostkeyalgorithms = "+ssh-rsa";
            ciphers = "+aes256-cbc";
          };
        };
        "202.249.25.149" = {
          extraOptions = {
            kexalgorithms = "+diffie-hellman-group1-sha1";
            pubkeyacceptedalgorithms = "+ssh-rsa";
            hostkeyalgorithms = "+ssh-rsa";
            ciphers = "+aes256-cbc";
          };
        };
      };
    };
  };
}
