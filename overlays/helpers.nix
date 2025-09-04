{lib, ...}: {
  stripNewline = str: builtins.replaceStrings ["\n"] [""] str;
  listNixfiles = dir:
    builtins.filter (
      path: let
        file = builtins.baseNameOf path;
      in
        (lib.hasSuffix ".nix" file)
        && (file != "default.nix")
    ) (lib.filesystem.listFilesRecursive dir);
}
