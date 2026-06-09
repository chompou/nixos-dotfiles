{
  config,
  lib,
  pkgs,
  ...
}:

{

  flake.nixosModules.silverpineNvidia = {
    services.xserver.videoDrivers = [ "nvidia" ];
    hardware = {
      nvidia = {
        open = true;
        powerManagement.enable = true;
      };
      graphics.enable = true;
    };
  };
}
