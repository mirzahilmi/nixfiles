{
  programs.ssh = {
    startAgent = true;
    pubkeyAcceptedKeyTypes = ["ssh-ed25519" "ssh-rsa"];
    hostKeyAlgorithms = ["ssh-ed25519" "ssh-rsa"];
    agentTimeout = "1h";
  };
}
