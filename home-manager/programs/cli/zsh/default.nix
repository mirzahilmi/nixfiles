{
  pkgs,
  config,
  ...
}: {
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    initExtraFirst = builtins.readFile ./p10k.config.zsh;
    initExtra = builtins.readFile ./zshrc;

    shellAliases = {
      ll = "ls -l";
    };

    enableAutosuggestions = true;

    history = {
      path = "${config.xdg.configHome}/zsh/history";
      size = 1000;
    };

    plugins = [
      {
        name = "powerlevel10k";
        file = "powerlevel10k.zsh-theme";
        src = pkgs.fetchFromGitHub {
          owner = "romkatv";
          repo = "powerlevel10k";
          rev = "v1.20.0";
          sha256 = "sha256-ES5vJXHjAKw/VHjWs8Au/3R+/aotSbY7PWnWAMzCR8E=";
        };
      }
      {
        name = "fast-syntax-highlighting";
        file = "fast-syntax-highlighting.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "zdharma-continuum";
          repo = "fast-syntax-highlighting";
          rev = "cf318e06a9b7c9f2219d78f41b46fa6e06011fd9";
          sha256 = "sha256-RVX9ZSzjBW3LpFs2W86lKI6vtcvDWP6EPxzeTcRZua4=";
        };
      }
      {
        name = "completion";
        file = "init.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "zimfw";
          repo = "completion";
          rev = "e544206fae7d08a9853a9dc34af2f840ed5753e4";
          sha256 = "sha256-k+MO31FuQ+W5RYJ0HgKmqvlzdGz1zkuWUf7l+WP5tbg=";
        };
      }
      {
        name = "editor";
        file = "init.zsh";
        src =
          pkgs.fetchFromGitHub {
            owner = "sorin-ionescu";
            repo = "prezto";
            rev = "380b96a218ef33d1ff4a641850822f583e11131a";
            sha256 = "sha256-//KY+MHE4H6wEWF6IQebB6uRcWVnlBsrMBaFxekO3kw=";
          }
          + "/modules/editor";
      }
      {
        name = "archive";
        file = "init.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "zimfw";
          repo = "archive";
          rev = "c7fe67e56162d50c3d03197a9afd50efcfbea1bf";
          sha256 = "sha256-++JL9UMK4Rs5QCcAPaOtc7VVNEuusiThunYUBr5GHGo=";
        };
      }
      {
        name = "utility";
        file = "init.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "zimfw";
          repo = "utility";
          rev = "6b74db5656509e5fe657901a9f0f52b6c7499904";
          sha256 = "sha256-5p2SlB7OuycvDV7c/mCr5ddUw+npZfCD+LfMeyBeGtE=";
        };
      }
    ];
  };

  xdg.configFile."powerlevel10k/p10k.zsh".source = ./p10k.zsh;
}
