userName:
let
  gdmUserConfig = ''
    [User]
    Session=
    Icon=${../../../../home-manager/assets/otter.png}
    SystemAccount=false
  '';
in {
  boot.postBootCommands = ''
    if [[ ! -e /var/lib/AccountsService/users/${userName} ]]; then
      echo '${gdm_user_conf}' > /var/lib/AccountsService/users/${userName}
    fi
  '';
}