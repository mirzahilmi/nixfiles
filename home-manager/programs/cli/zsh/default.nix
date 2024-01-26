{ pkgs, config, ... }:
{
  programs.zsh = {
    enable = true;
    autocd = true;
    dotDir = ".config/zsh";
    initExtra = builtins.readFile ./.zshrc;
    
    shellAliases = {
      ll = "ls -l";
    };
    
    syntaxHighlighting.enable = true;
    enableAutosuggestions = true;
    
    history = {
      path = "${config.xdg.configHome}/zsh/history";
      size = 1000;
    };

    plugins = [
      {
        name = "zsh-autosuggestions";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-autosuggestions";
          rev = "v0.7.0";
          sha256 = "0z6i9wjjklb4lvr7zjhbphibsyx51psv50gm07mbb0kj9058j6kc";
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
        src = pkgs.fetchFromGitHub {
          owner = "sorin-ionescu";
          repo = "prezto";
          rev = "380b96a218ef33d1ff4a641850822f583e11131a";
          sha256 = "sha256-//KY+MHE4H6wEWF6IQebB6uRcWVnlBsrMBaFxekO3kw=";
        } + "/modules/editor";
      }
      {
        name = "run-help";
        file = "init.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "zimfw";
          repo = "run-help";
          rev = "ce45a756b384225abc192105d28016ac933986e0";
          sha256 = "sha256-yTgqJzVp39kMT30LLCGuToIS1GLS79RKTh3h2MwpwD0=";
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
          sha256 = "sha256-5p2SlB7OuycvDV7c/mCr5ddUw+npZfCD+LfMeyBeGtE=";
        };
      }
    ];
  };
}
