{
  config,
  pkgs,
  ...
}: {
  programs.git = {
    enable = true;
    package = pkgs.unstable.git;
    userName = "Mirza Hilmi";
    userEmail = "exquisitemirza@student.ub.ac.id";
    ignores = ["*.env" "*.env.json" "*.env.yaml"];

    extraConfig = {
      init.defaultBranch = "master";
      user.signing.key = "5FD12800DCA4F7B5";
      user.signingkey = "5FD12800DCA4F7B5";
      gpg.program = "${config.home.homeDirectory}/.nix-profile/bin/gpg";
      commit.gpgSign = true;
      # Change this later to more secure way
      credential.helper = "store --file ${config.xdg.configHome}/git/.key";
    };
  };
}
