{inputs, ...}: {
  # This one brings custom packages from the 'pkg' directory
  extra = final: prev:
    import ../pkg {
      pkgs = final;
      inherit inputs prev;
    };

  # Unstable nixpkgs set (declared in the flake inputs) are
  # accessible through 'pkgs.unstable'
  unstable-package = final: prev: {
    unstable = import inputs.nixpkgs-unstable {
      system = final.system;
      config = {
        allowUnfree = true;
      };
    };
  };

  gnome-dynamic-triple-buffering = final: prev: {
    gnome = prev.gnome.overrideScope (gnomeFinal: gnomePrev: {
      mutter = gnomePrev.mutter.overrideAttrs (old: {
        src = final.fetchFromGitLab {
          domain = "gitlab.gnome.org";
          owner = "vanvugt";
          repo = "mutter";
          rev = "triple-buffering-v4-46";
          hash = "sha256-C2VfW3ThPEZ37YkX7ejlyumLnWa9oij333d5c4yfZxc=";
        };
      });
    });
  };
}
