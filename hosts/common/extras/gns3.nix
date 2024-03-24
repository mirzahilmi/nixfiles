{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    gns3-server
  ];
}
