#!/bin/bash

godot --headless --path ~/coding/godot/mptServer &
pid=$!
echo $pid > .serverpid
wait $pid