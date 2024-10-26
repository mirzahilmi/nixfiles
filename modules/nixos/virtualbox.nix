{
  virtualisation.virtualbox.host = {
    enable = true;
    # enableKvm = true;
  };
  users.extraGroups.vboxusers.members = ["mirza"];
}
