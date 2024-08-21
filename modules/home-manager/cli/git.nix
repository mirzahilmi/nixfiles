{
  config,
  pkgs,
  ...
}: {
  programs.git = {
    enable = true;
    package = pkgs.unstable.git;
    userName = "Mirza Hilmi";
    userEmail = "dev@mrz.my.id";
    ignores = ["*.env" "*.env.json" "*.env.yaml"];
    aliases = {
      a = "add -A";
      ac = "!git a && git commit -m";
      dif = "!git diff --name-only --relative --diff-filter=d | xargs bat --diff";
      graph = "log --decorate --oneline --graph";
    };
    extraConfig = {
      branch.sort = "committerdate";
      column.ui = "auto";
      commit.gpgSign = true;
      commit.verbose = true;
      pull.rebase = false;
      push.autoSetupRemote = true;
      gpg.format = "ssh";
      init.defaultBranch = "master";
      push.default = "simple";
      user.signingkey = "~/.ssh/id_ed25519.pub";
    };
  };
}
