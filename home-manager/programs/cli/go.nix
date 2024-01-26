{ pkgs, ... }:
{
  programs.go = {
    enable = true;
    goPath = ".config/go";
    goBin  = ".local/bin.go";
    packages = with pkgs; {
      "github.com/golangci/golangci-lint" = golangci-lint;
      "golang.org/x/tools/gopls" = gopls;
      "github.com/go-delve/delve" = delve;
    };
  };
}