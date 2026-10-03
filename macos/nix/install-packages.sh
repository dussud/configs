#!/bin/sh
# Installs every package in packages.txt into the user Nix profile.
cd "$(dirname "$0")"
nix profile add $(sed 's/^/nixpkgs#/' packages.txt)
