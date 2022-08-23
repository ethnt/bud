#!/usr/bin/env bash

HOST="${1:-$HOST}"

attr="$FLAKEROOT#darwinConfigurations.\"$HOST\".config.system.build.vm"

nix build "$attr" "${@:2}"

exec $FLAKEROOT/result/bin/run-*-vm
