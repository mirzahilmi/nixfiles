{
  users.extraUsers."mirza" = {
    isNormalUser = true;
    description = "Mirza's avatar";
    initialPassword = "password";
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
      "audio"
      "docker"
    ];
  }
}