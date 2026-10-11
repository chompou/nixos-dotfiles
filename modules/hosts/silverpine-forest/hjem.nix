{
  pkgs,
  lib,
  ...
}:
{
  hjem.users.chompou = {
    directory = "/home/chompou";
    files = {
      ".config/jj/config.toml" = {
        source = path: ../../features/jujutsu.toml;
      };
    };
  };
}
