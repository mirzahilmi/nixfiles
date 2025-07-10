{inputs, ...}: {
  imports = [
    inputs.nixos-wsl.nixosModules.default
    ../shared
    ../../users/mirza/nixos.nix
  ];

  networking.hostName = "t4s";

  wsl = {
    enable = true;
    defaultUser = "mirza";
    wslConf = {
      interop.appendWindowsPath = false;
      interop.includePath = false;
    };
    extraBin = [
      # vim yank pass-through WSL
      {src = "/mnt/c/Windows/System32/clip.exe";}
      {src = "/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe";}
      {src = "/mnt/c/Users/mirza/AppData/Local/SumatraPDF/SumatraPDF.exe";}
    ];
  };

  custom.services.docker.enable = true;
}
