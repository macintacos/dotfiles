#!/usr/bin/env bash
# USAGE: Utility script to open a list of links passed to it.

for link in "$@"; do
    open "$link"
done