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
    services.ssh-agent.enable = true;
    programs.ssh = {
      enable = true;
      addKeysToAgent = "3h";
      matchBlocks = {
        "GitHub" = {
          hostname = "github.com";
          user = "git";
          identityFile = "~/.ssh/id_ed25519";
          identitiesOnly = true;
        };
      };
    };
  };
}
