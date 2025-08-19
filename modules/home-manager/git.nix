{
  pkgs,
  lib,
  config,
  current,
  ...
}: let
  cfg = config.custom.programs.git;
in {
  options.custom.programs.git = {
    enable = lib.mkEnableOption "git";
  };
  config = lib.mkIf cfg.enable {
    programs.git = {
      enable = true;
      lfs.enable = true;
      userName = "${current.username}@${current.hostname}";
      userEmail = "dev@mrz.my.id";
      ignores = ["*.env" "*.env.json" "*.env.yaml" ".envrc"];
      aliases = {
        a = "add --all";
        acp = pkgs.libx.stripNewline ''
          !f() {
            git add --all &&
            git commit --message "$1" &&
            git push;
          }; f
        '';
        graph = "log --decorate --oneline --graph";
        caa = "commit --all --amend --reuse-message HEAD";
        pusf = "push --force-with-lease";
        st = "status";
      };
      delta = {
        enable = true;
        options = {
          line-numbers = true;
        };
      };
      extraConfig = {
        branch.sort = "committerdate";
        column.ui = "auto";
        commit.verbose = true;
        init.defaultBranch = "master";
        merge.conflictStyle = "zdiff3";
        pull.rebase = true;
        push.autoSetupRemote = true;
        push.default = "simple";
        rerere.enabled = true;
        gpg.format = "ssh";
        commit.gpgSign = true;
        user.signingkey = "~/.ssh/id_ed25519.pub";
      };
    };
  };
}
