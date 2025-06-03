#!/bin/bash

echo "Building test env"

cd shell/noname
kill $(cat .serverpid)

./set_window_pos.sh

gnome-terminal -- ./run_server.sh