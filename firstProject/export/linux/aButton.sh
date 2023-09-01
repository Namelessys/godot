#!/bin/sh
echo -ne '\033c\033]0;A Button\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/aButton.x86_64" "$@"
