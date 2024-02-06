{
  pkgs,
  config,
  ...
}: let
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
in {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    plugins = [treesitterWithGrammars];
  };

  home.file."${config.xdg.dataHome}/nvim/nvim-treesitter" = {
    source = treesitterWithGrammars;
    recursive = true;
  };
}
