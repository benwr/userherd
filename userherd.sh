#!/bin/sh

# This program was written by Ben Weinstein-Raun in 2023.
# Anyone may use it for any purpose, under the terms of the CC0-1.0
# License or the Apache 2.0 License, at the licensee's option. Both
# licenses are distributed with the program, in the files
# LICENSE-CC0.txt and LICENSE-APACHE.txt.

# Requirements:
# - coreutils (id)
# - shepherd
# - sudo

set -e -u -o pipefail

username=$1
uid=$(id -u "$username")

export XDG_RUNTIME_DIR="/run/user/$uid"
mkdir -p "$XDG_RUNTIME_DIR"
chmod 700 "$XDG_RUNTIME_DIR"
chown "$username" "$XDG_RUNTIME_DIR"

exec sudo -u shepherd
