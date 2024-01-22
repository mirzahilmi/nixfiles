{
  services.gpg-agent = {
    enable = true;
  };

  programs.gnupg = {
    agent.enable = true;
  };
}