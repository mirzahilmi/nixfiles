# Bootloader (GRUB) configuration
{ pkgs, ... }:
{
  boot.loader.grub = {
    enable = true;
    device = "/dev/vda"; # FIXME Change to the correct disk path
    useOSProber = true;

    theme = pkgs.stdenv.mkDerivation {
      pname = "distro-grub-themes";
      version = "3.1";
      src = pkgs.fetchFromGitHub {
        owner = "shvchk";
        repo = "fallout-grub-theme";
        rev = "e8433860b11abb08720d7c32f5b9a2a534011bca";
        hash = "";
      };
      installPhase = "cp -r customize/nixos $out";
    };
  };
}
