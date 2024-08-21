{
  networking = {
    networkmanager = {
      enable = true;
      ## sadly can't be used because NetworkManager seems to only use /etc profiles
      # ensureProfiles.profiles = {
      #   "WiFi-UB.x" = {
      #     connection = {
      #       id = "WiFi-UB.x";
      #       type = "wifi";
      #     };
      #     "802-1x" = {
      #       phase1-auth-flags = 32;
      #     };
      #   };
      # };
    };
  };
}
