{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [inputs.sops-nix.nixosModules.sops];
  environment.systemPackages = [pkgs.unstable.sops];
  sops = {
    defaultSopsFile = ../../globals.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = "/home/mirza/.config/sops/age/keys.txt";
    secrets = {
      nixAccessTokens = {
        mode = "0440";
        group = config.users.groups.keys.name;
      };
    };
  };
}
