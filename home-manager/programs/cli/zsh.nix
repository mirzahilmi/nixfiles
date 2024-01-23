{ pkgs, ... }:
{
  programs.zsh = rec {
    enable = true;
    autocd = true;
    dotDir = "$XDG_CONFIG_HOME/zsh";
    
    shellAliases = {
      ll = "ls -l";
    };
    
    syntaxHighlighting.enable = true;
    enableAutosuggestions = true;
    
    history = {
      path = "${dotDir}/history";
      size = 1000;
    };

    plugins = [
      {
        name = "completion";
        file = "init.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "zimfw";
          repo = "completion";
          rev = "e544206fae7d08a9853a9dc34af2f840ed5753e4";
          sha256 = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
        };
      }
      {
        name = "input";
        file = "init.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "zimfw";
          repo = "input";
          rev = "b2a8a80071dc781dd1b075a5161d2a0225140916";
          sha256 = "sha256-BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB=";
        };
      }
      {
        name = "run-help";
        file = "init.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "zimfw";
          repo = "run-help";
          rev = "ce45a756b384225abc192105d28016ac933986e0";
          sha256 = "sha256-CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC=";
        };
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
          sha256 = "sha256-EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE=";
        };
      }
    ];

    initExtra = ''
      source ${pkgs.zsh-vi-mode}/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
    '';
  };
}