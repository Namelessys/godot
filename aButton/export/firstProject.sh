#!/bin/sh
echo -ne '\033c\033]0;firstProject\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/firstProject.x86_64" "$@"
