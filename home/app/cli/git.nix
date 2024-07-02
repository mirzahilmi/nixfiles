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
      dif = "!git diff --name-only --relative --diff-filter=d | xargs bat --diff";
      graph = "log --decorate --oneline --graph";
      pus = "push";
      pusf = "push --force-with-lease";
    };
    extraConfig = {
      init.defaultBranch = "master";
      commit.verbose = true;
      commit.gpgSign = true;
      gpg.program = "${pkgs.gnupg}/bin/gpg";
      user.signingkey = "5FD12800DCA4F7B5";
      credential.helper = "store --file ${config.xdg.configHome}/git/.key";
      column.ui = "auto";
      branch.sort = "-committerdate";
    };
  };
}
