{
  xdg.userDirs = {
    publicShare = null;
    templates = null;
  };

  # Add QEMU Connection for virt-manager
  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };
}
