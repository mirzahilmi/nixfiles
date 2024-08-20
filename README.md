# nixfiles

## Hosts

### ⛄ Nixsina
[![nixsina-rice.png](https://i.postimg.cc/y8bgffK7/nixsina-rice.png)](https://postimg.cc/K1t8jD4W)

## Note for Me
Formatting with disko
```bash
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko /tmp/disko.nix --arg device '"/dev/vda"'
```
Install NixOS
```bash
nixos-install --root /mnt --flake /mnt/etc/nixos#default
```
