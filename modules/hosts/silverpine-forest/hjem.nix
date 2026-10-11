{ ... }:
{
  flake.nixosModules.silverpineHjem = {
    hjem.users.chompou = {
      directory = "/home/chompou";
    };
  };
}
