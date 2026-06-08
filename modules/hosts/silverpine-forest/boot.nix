{
  config,
  pkgs,
  lib,
  ...
}:

{
  flake.nixosModules.silverpineBoot = {

    boot.loader.efi.canTouchEfiVariables = true;
    boot.loader.limine = {
      enable = true;
      maxGenerations = 5;
      extraEntries = ''
        /Windows 11
          protocol: efi
          path: guid(d25e1abc-9b8e-11ed-9249-049226d372e6):/EFI/Microsoft/Boot/bootmgfw.efi
      '';
    };
  };
}
