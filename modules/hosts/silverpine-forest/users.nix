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
      packages = with pkgs; [
      ];
    };

    users.groups.nixosvmtest = { };
    users.users.nixosvmtest = {
      isNormalUser = true;
      initialPassword = "test";
      group = "nixosvmtest";
    };
    users.groups.nixosvmtest = { };

  };

}
