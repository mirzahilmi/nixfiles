{
  final,
  prev,
}: {
  # see https://github.com/NixOS/nixpkgs/blob/ce01daebf8489ba97bd1609d185ea276efdeb121/pkgs/misc/tmux-plugins/default.nix#L10-L70
  mkTmuxPlugin = let
    rtpPath = "share/tmux-plugins";

    addRtp = path: rtpFilePath: attrs: derivation:
      derivation
      // {
        rtp = "${derivation}/${path}/${rtpFilePath}";
      }
      // {
        overrideAttrs = f: mkTmuxPlugin (attrs // f attrs);
      };

    mkTmuxPlugin = a @ {
      pluginName,
      rtpFilePath ? (builtins.replaceStrings ["-"] ["_"] pluginName) + ".tmux",
      namePrefix ? "tmuxplugin-",
      src,
      unpackPhase ? "",
      configurePhase ? ":",
      buildPhase ? ":",
      addonInfo ? null,
      preInstall ? "",
      postInstall ? "",
      path ? final.lib.getName pluginName,
      ...
    }:
      if final.lib.hasAttr "dependencies" a
      then throw "dependencies attribute is obselete. see NixOS/nixpkgs#118034" # added 2021-04-01
      else
        addRtp "${rtpPath}/${path}" rtpFilePath a (
          final.stdenv.mkDerivation (
            a
            // {
              pname = namePrefix + pluginName;

              inherit
                pluginName
                unpackPhase
                configurePhase
                buildPhase
                addonInfo
                preInstall
                postInstall
                ;

              installPhase = ''
                runHook preInstall

                target=$out/${rtpPath}/${path}
                mkdir -p $out/${rtpPath}
                cp -r . $target
                if [ -n "$addonInfo" ]; then
                  echo "$addonInfo" > $target/addon-info.json
                fi

                runHook postInstall
              '';
            }
          )
        );
  in
    mkTmuxPlugin;

  stripNewline = str: builtins.replaceStrings ["\n"] [""] str;
}
