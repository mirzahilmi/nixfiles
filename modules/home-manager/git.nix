{pkgs, ...}: {
  programs.git = {
    enable = true;
    lfs.enable = true;
    package = pkgs.unstable.git;
    userName = "Mirza Hilmi";
    userEmail = "dev@mrz.my.id";
    ignores = ["*.env" "*.env.json" "*.env.yaml"];
    aliases = {
      a = "add -A";
      ac = "!git add -A && git commit --message";
      acp = "!acp() { git add -A && git commit --message \"$1\" && git push; }; acp";
      am = "!git a && git commit --ammend";
      graph = "log --decorate --oneline --graph";
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
