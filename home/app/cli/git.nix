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
      pus = "push origin HEAD";
      graph = "log --decorate --oneline --graph";
    };
    extraConfig = {
      init.defaultBranch = "master";
      user.signingkey = "5FD12800DCA4F7B5";
      gpg.program = "${pkgs.gnupg}/bin/gpg";
      commit.gpgSign = true;
      commit.verbose = true;
      credential.helper = "store --file ${config.xdg.configHome}/git/.key";
    };
  };
}
