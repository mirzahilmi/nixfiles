{pkgs, ...}: {
  programs.git = {
    enable = true;
    package = pkgs.unstable.git;
    userName = "Mirza Hilmi";
    userEmail = "dev@mrz.my.id";
    ignores = ["*.env" "*.env.json" "*.env.yaml"];
    aliases = {
      a = "add -A";
      ac = "!git a && git commit --message";
      am = "!git a && git commit --ammend";
      # dif = "!git diff --name-only --relative --diff-filter=d | xargs bat --diff";
      graph = "log --decorate --oneline --graph";
    };
    delta.enable = true;
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
