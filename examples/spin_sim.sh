#!/bin/sh -x

# usage: spin_verify.sh <pathfile>

f="$1"
# spin -u14 "$f" # run only 14 steps
spin "$f"
