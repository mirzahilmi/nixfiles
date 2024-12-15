{pkgs, ...}: {
  programs.git = {
    enable = true;
    lfs.enable = true;
    package = pkgs.unstable.git;
    userName = "Mirza Hilmi";
    userEmail = "dev@mrz.my.id";
    ignores = ["*.env" "*.env.json" "*.env.yaml"];
    aliases = {
      a = "add --all";
      acp = builtins.replaceStrings ["\n"] [""] ''
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
      commit.gpgSign = true;
      commit.verbose = true;
      gpg.format = "ssh";
      init.defaultBranch = "master";
      merge.conflictStyle = "zdiff3";
      pull.rebase = false;
      push.autoSetupRemote = true;
      push.default = "simple";
      rerere.enabled = true;
      user.signingkey = "~/.ssh/id_ed25519.pub";
    };
  };
}
