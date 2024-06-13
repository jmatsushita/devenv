#!/usr/bin/env bash
set -ex

mix local.hex --force
mix local.rebar --force
mix archive.install --force hex phx_new

echo y | mix phx.new --install hello

pushd hello
  sed -i -e "s/hostname: \"localhost\"/socket_dir: System.get_env(\"PGHOST\")/" ./config/dev.exs
popd
