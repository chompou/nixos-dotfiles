{
  config,
  lib,
  pkgs,
  ...
}:

{

  flake.nixosModules.users = {
    users.users.chompou = {
      isNormalUser = true;
      description = "Tobias";
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
    };
  };

}
