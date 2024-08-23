{lib}: {
  mkLspsConfigSetup = lsps:
    lib.strings.concatLines (
      builtins.map (lsp: ''
        require'lspconfig'.${lsp.name}.setup {
          cmd = { "${lib.strings.concatMapStringsSep ", " (s: "\"${s}\"") lsp.cmd}" },
        }
      '')
      lsps
    );
}
