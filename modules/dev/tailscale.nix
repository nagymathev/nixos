{
  config,
  pkgs,
  lib,
  ...
}:
with lib; let
  cfg = config.modules.tailscale;
in {
  options.modules.tailscale = {
    enable = mkEnableOption "Tailscale";
    autoconnect = mkEnableOption "Autoconnect to tailscale services";

    authKey = mkOption {
      default = "";
      type = types.string;
      description = ''
        Tailscale authKey. Needs to be a path.
      '';
    };
  };

  config = mkIf cfg.enable {
    # List packages installed in system profile. To search, run:
    # $ nix search wget
    environment.systemPackages = with pkgs; [
      tailscale
      tailscale-systray
    ];

    # Tailscale and its systemd authentication service
    services.tailscale.enable = true;
    # create a oneshot job to authenticate to Tailscale
    systemd.services.tailscale-autoconnect = mkIf cfg.autoconnect {
      description = "Automatic connection to Tailscale";

      # make sure tailscale is running before trying to connect to tailscale
      after = ["network-pre.target" "tailscale.service"];
      wants = ["network-pre.target" "tailscale.service"];
      wantedBy = ["multi-user.target"];

      # set this service as a oneshot job
      serviceConfig.Type = "oneshot";

      # have the job run this shell script
      script = with pkgs; ''
        # wait for tailscaled to settle
        sleep 2

        # check if we are already authenticated to tailscale
        # status="$(${tailscale}/bin/tailscale status -json | ${jq}/bin/jq -r .BackendState)"
        # if [ $status = "Running" ]; then # if so, then do nothing
        # exit 0
        # fi

        ${tailscale}/bin/tailscale up -authkey $(cat ${cfg.authKey})
      '';
    };
  };
}
