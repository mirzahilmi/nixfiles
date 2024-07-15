{
  programs.ssh = {
    startAgent = true;
    enableAskPassword = true;
    agentTimeout = "1h";
  };
}
