home:
	@git a
	@nh home switch .

os:
	@git a
	@nh os switch .

upgrade:
	@git a
	@sudo nixos-rebuild switch --flake . --upgrade

.PHONY: home os upgrade
