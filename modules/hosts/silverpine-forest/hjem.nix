{
  pkgs,
  lib,
  ...
}:
{
  hjem.users = {
    chompou = {
      user = "chompou";
      directory = "/home/chompou";
      files = {
        ".config/jj/config.toml" = {
          source = path: ../../features/jujutsu.toml;
        };
      };
    };
  };
}
