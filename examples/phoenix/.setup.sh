#!/usr/bin/env bash
set -ex

mix local.hex --force
mix local.rebar --force
mix archive.install --force hex phx_new

if [ ! -d "hello" ]; then
  yes | mix phx.new hello
  sed -i -e "s/hostname: \"localhost\"/socket_dir: System.get_env(\"PGHOST\")/" ./hello/config/dev.exs
fi

pushd hello
  mix deps.get
popd
