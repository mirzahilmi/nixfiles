{
  # Enable zsh here (system-wide) so it wont cause an error
  # when setting user default shell
  programs.zsh = {
    enable = true;
    # See https://github.com/nix-community/home-manager/issues/108
    enableCompletion = false;
    enableGlobalCompInit = false;
  };
}
