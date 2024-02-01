{config, ...}: {
  programs.git = {
    enable = true;
    userName = "Mirza Hilmi";
    userEmail = "exquisitemirza@student.ub.ac.id";
    ignores = ["*.env" "*.env.json" "*.env.yaml"];
    extraConfig = {
      init.defaultBranch = "master";
      user.signing.key = "71BCEF0BD6178F2DE8EF4F77C92E3238B87A7B1D";
      user.signingkey = "71BCEF0BD6178F2DE8EF4F77C92E3238B87A7B1D";
      gpg.program = "${config.home.homeDirectory}/.nix-profile/bin/gpg";
      commit.gpgSign = true;
      # Change this later to more secure way
      credential.helper = "store --file ${config.xdg.configHome}/git/.key";
    };
  };
}
