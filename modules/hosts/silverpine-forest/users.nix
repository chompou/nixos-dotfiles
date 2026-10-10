{
  config,
  lib,
  pkgs,
  inputs,
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
