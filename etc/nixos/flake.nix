{
  description = "My configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix-stable.url = "github:NixOS/nixpkgs/nixos-25.05";

    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";

    elephant.url = "github:abenz1267/elephant";
    matugen.url = "github:InioX/Matugen";

    walker = {
      url = "github:abenz1267/walker";
      inputs.elephant.follows = "elephant";
    };

    quickshell = {
      url = "github:outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:bostannnn/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    caelestia-shell = {
      url = "github:caelestia-dots/shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nautilus-css-hot-reload = {
      url = "github:bostannnn/nautilus-css-hot-reload";
      inputs.nixpkgs.follows = "nixpkgs";
    };
          baobab-css-hot-reload = {
        url = "path:/home/bostan/baobab-css-hot-reload";
        inputs.nixpkgs.follows = "nixpkgs";
      };
  };

  outputs = inputs@{
    nixpkgs,
    nix-stable,
    chaotic,
    walker,
    home-manager,
    nautilus-css-hot-reload,
    baobab-css-hot-reload,
    noctalia,
    ...
  }:
  let
    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };

    stable = import nix-stable {
      inherit system;
      config.allowUnfree = true;
    };
  in
  {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit stable noctalia inputs;
        };

        modules = [
          { nixpkgs.hostPlatform = system; }

          # ✅ Millennium overlay (manual import)
          {
  nixpkgs.overlays = [
    (final: prev: {
      steam-millennium =
        final.callPackage "${inputs.millennium}/nix/steam-millennium.nix" { };
    })
  ];
          }

          ./configuration.nix

          chaotic.nixosModules.default
          walker.nixosModules.default
          home-manager.nixosModules.home-manager
          nautilus-css-hot-reload.nixosModules.default
          baobab-css-hot-reload.nixosModules.default

          ({ pkgs, ... }: {
            environment.systemPackages = [
              (pkgs.buildNpmPackage {
                pname = "git2txt";
                version = "1.0.6";
                src = pkgs.fetchFromGitHub {
                  owner = "addyosmani";
                  repo = "git2txt";
                  rev = "main";
                  hash = "sha256-ItVYfKbounZnDQBJ+3klFT6Krvq/iA/gwUqeH8qD/Ms=";
                };
                npmDepsHash = "sha256-6/oMBMJbiu2mRL8NfwQJBDeSsoRdt70CeITmF2agg/E=";
                dontNpmBuild = true;
              })
            ];
          })

          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {
              inherit noctalia inputs;
            };
            home-manager.users.bostan = import ./home.nix;
          }
        ];
      };
    };
  };
}

