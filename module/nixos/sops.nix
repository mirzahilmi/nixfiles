{inputs, ...}: {
  imports = [inputs.sops-nix.nixosModules.sops];
  sops = {
    defaultSopsFile = ../../globals.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = "/home/mirza/.config/sops/age/keys.txt";
    secrets = {
      defaultPassword = {neededForUsers = true;};
    };
  };
}
