{ self, inputs, ... }:
{
  flake.nixosModules.passwordManager = {
    { pkgs, lib, ... }:
    {
    programs = {
      _1password-cli.enable = true;
      _1password-gui = {
        enable = true;
        polkitPolicyOwners = [ "chompou" ];
      };
    };
    }
    environment.etc = {
      "1password/custom_allowed_browsers" = {
        text = ''
          vivaldi-bin
        '';
        mode = "0755";
      };
    };
  };
}
