# see https://demontalembert.com/colours-for-makefile/
COLOUR_GREEN=\033[0;32m
COLOUR_RED=\033[0;31m
COLOUR_BLUE=\033[0;34m
COLOUR_END=\033[0m

.PHONY: help
help:
	@echo "No helps today, just check the Makefile 👍"

.PHONY: home
home:
	@printf "$(COLOUR_BLUE)> %s...$(COLOUR_END)\n" "Checkout unstaged files"
	git add --all
	nh home switch .

.PHONY: os
os:
	@printf "$(COLOUR_BLUE)> %s...$(COLOUR_END)\n" "Checkout unstaged files"
	git add --all
	@printf "$(COLOUR_BLUE)> %s...$(COLOUR_END)\n" "Checking for neovim config updates"
	nix flake update nvim
	nh os switch .
