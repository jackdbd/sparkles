{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: {
  enterShell = ''
    versions
  '';

  env = {
    NODE_ENV = "development";
  };

  packages = with pkgs; [
    git
    netlify-cli
  ];

  # https://devenv.sh/pre-commit-hooks/
  # pre-commit.hooks.shellcheck.enable = true;

  # https://devenv.sh/processes/
  # processes.cargo-watch.exec = "cargo-watch";

  scripts = {
    "debug:test".exec = ''
      echo "debug test file $1.js"
      echo "Don't forget to set some breakpoints and attach to the Node.js process using the configuration that has \"request\": \"attach\" in launch.json"
      NODE_ENV=test node --inspect-brk --test test/$1.js
    '';
    versions.exec = ''
      echo "=== Versions ==="
      netlify --version
      echo "=== === ==="
    '';
  };

  # https://devenv.sh/services/
  # services.postgres.enable = true;

  # https://devenv.sh/tasks/
  # tasks = {
  #   "myproj:setup".exec = "mytool build";
  #   "devenv:enterShell".after = [ "myproj:setup" ];
  # };
}
