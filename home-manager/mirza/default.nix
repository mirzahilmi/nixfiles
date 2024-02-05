{
  pkgs,
  inputs,
  outputs,
  config,
  ...
}: {
  imports = [
    inputs.spicetify-nix.homeManagerModule
    inputs.nixvim.homeManagerModules.nixvim

    ../../modules/home-manager/zimfw

    ../programs/gnome-tweaks
    ../programs/nixvim
    ../programs/spicetify
    ../programs/vscode

    ../programs/cli/nix-direnv
    ../programs/cli/tmux
    ../programs/cli/zsh

    ../programs/cli/bat.nix
    ../programs/cli/btop.nix
    ../programs/cli/gpg.nix
    ../programs/cli/fzf.nix
    ../programs/cli/git.nix
    ../programs/cli/home-manager.nix
    ../programs/cli/lsd.nix
    ../programs/cli/ripgrep.nix
  ];

  nixpkgs = {
    overlays = [outputs.overlays.extras];
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  dconf.enable = true;

  home = {
    username = "mirza";
    homeDirectory = "/home/mirza";
    sessionVariables = {
      # Declutter $HOME with XDG Based Directory
      #
      # Move ~/.docker
      DOCKER_CONFIG = "${config.xdg.configHome}/docker";
      # Move ~/.nv
      CUDA_CACHE_PATH = "${config.xdg.cacheHome}/nv";
    };

    packages = with pkgs; [
      alejandra
      cointop
      cool-retro-term
      floorp
      git-filter-repo
      gnumake
      gping
      libreoffice
      nil
      (st.overrideAttrs (oldAttrs: {
        buildInputs = oldAttrs.buildInputs ++ [harfbuzz];
        patches = [
          (fetchpatch {
            url = "https://st.suckless.org/patches/bold-is-not-bright/st-bold-is-not-bright-20190127-3be4cf1.diff";
            sha256 = "sha256-IhrTgZ8K3tcf5HqSlHm3GTacVJLOhO7QPho6SCGXTHw=";
          })
          (fetchpatch {
            url = "https://st.suckless.org/patches/fullscreen/st-fullscreen-0.8.5.diff";
            sha256 = "sha256-52lO6K9TGrrdPljXAFo+JB39XHeNF+0ru5QzDJ+9GX8=";
          })
          (fetchpatch {
            url = "https://st.suckless.org/patches/gruvbox/st-gruvbox-dark-0.8.5.diff";
            sha256 = "sha256-dOkrjXGxFgIRy4n9g2RQjd8EBAvpW4tNmkOVj4TaFGg=";
          })
          (fetchpatch {
            url = "https://st.suckless.org/patches/hidecursor/st-hidecursor-0.8.3.diff";
            sha256 = "sha256-Bj/n02xUl9iYXYr/3SlIEforFwFxAx8MrPFnimyU7vg=";
          })
          (fetchpatch {
            url = "https://st.suckless.org/patches/ligatures/0.9/st-ligatures-20230105-0.9.diff";
            sha256 = "sha256-F2LvUT2bPFfkw82vFS16wwGoB+TEIquTG2UnKAZfzh0=";
          })
        ];
      }))
      (vesktop.overrideAttrs (prev: {
        desktopItems = [
          ((builtins.elemAt prev.desktopItems 0).override (_: {
            icon = "${../../assets/discord.svg}";
            desktopName = "Discord";
          }))
        ];
      }))
      wl-clipboard
    ];

    stateVersion = "23.11";
  };
}
