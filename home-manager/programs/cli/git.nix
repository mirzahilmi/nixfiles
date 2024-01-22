{
  programs.git = {
    enable = true;
    userName = "Mirza Hilmi";
    userEmail = "exquisitemirza@student.ub.ac.id";
    config = {
      init.defaultBranch = "master";
      user.signing.key = "71BCEF0BD6178F2DE8EF4F77C92E3238B87A7B1D";
      commit.gpgSign = true;
    };
  };
}