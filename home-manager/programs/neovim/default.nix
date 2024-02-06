{pkgs, ...}: let
  treesitterWithGrammars = pkgs.vimPlugins.nvim-treesitter.withPlugins (lang: [
    lang.bash
    lang.c
    lang.cmake
    lang.comment
    lang.cpp
    lang.css
    lang.csv
    lang.diff
    lang.dockerfile
    lang.go
    lang.gomod
    lang.gosum
    lang.gowork
    lang.gpg
    lang.graphql
    lang.html
    lang.http
    lang.ini
    lang.java
    lang.javascript
    lang.json
    lang.jsonc
    lang.kotlin
    lang.lua
    lang.make
    lang.markdown
    lang.nix
    lang.passwd
    lang.php
    lang.phpdoc
    lang.regex
    lang.rust
    lang.sql
    lang.ssh_config
    lang.terraform
    lang.toml
    lang.typescript
    lang.yaml
  ]);

  nvimPlugin = "nvim/nix";
in {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    plugins = with pkgs.vimPlugins; [
      treesitterWithGrammars
      telescope-fzf-native-nvim
    ];
  };

  xdg.dataFile = with pkgs.vimPlugins; {
    # Treesitter
    "${nvimPlugin}/nvim-treesitter" = {
      source = treesitterWithGrammars;
      recursive = true;
    };
    # Telescope
    "${nvimPlugin}/telescope-fzf-native.nvim" = {
      source = telescope-fzf-native-nvim;
      recursive = true;
    };
  };
}
