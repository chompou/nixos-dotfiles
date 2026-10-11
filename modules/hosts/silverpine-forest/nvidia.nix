{ ... }:
{
  flake.nixosModules.nvidia = {
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
