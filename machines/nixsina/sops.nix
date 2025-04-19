{
  pkgs,
  config,
  inputs,
  ...
}: {
  imports = [inputs.sops-nix.nixosModules.sops];
  environment.systemPackages = [pkgs.unstable.sops];
  sops = {
    defaultSopsFile = ../../sops.yaml;
    age = {
      sshKeyPaths = ["/home/mirza/.ssh/id_ed25519"];
      generateKey = true;
    };
    secrets = {
      nixAccessTokens = {
        mode = "0440";
        group = config.users.groups.keys.name;
      };
    };
  };
}
