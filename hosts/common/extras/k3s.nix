{pkgs, ...}: {
  # https://nixos.wiki/wiki/K3s
  environment.systemPackages = with pkgs; [k3s];
  services.k3s = {
    enable = true;
    role = "server";
    extraFlags = "--write-kubeconfig-mode 606";
  };
  networking.firewall.allowedTCPPorts = [
    6443 # k3s: required so that pods can reach the API server (running on port 6443 by default)
  ];
}
