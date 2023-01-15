{ config, ... }: {
  home.shellAliases = {
    homeup = "flake-commit && home-manager switch --flake /nix-config/#ashahir05@ashahir-PC";
  };
}
