userName: let
  gdmUserConfig = ''
    [User]
    Session=
    Icon=${../../../../../assets/otter.png}
    SystemAccount=false
  '';
in {
  boot.postBootCommands = ''
    if [[ ! -e /var/lib/AccountsService/users/${userName} ]]; then
      echo '${gdmUserConfig}' > /var/lib/AccountsService/users/${userName}
    fi
  '';
}
