#!/usr/bin/env bash

TARGET_DIR="plausible-data"

if [ ! -d "$TARGET_DIR" ]; then
    mkdir -p "$TARGET_DIR"
    echo "Directory created: $TARGET_DIR"
fi

if [ "$EUID" -ne 0 ]; then
    sudo chown 999:999 "$TARGET_DIR"
else
    chown 999:999 "$TARGET_DIR"
fi

if [ $? -eq 0 ]; then
    echo "Success: $TARGET_DIR ownership set to 999:999"
else
    echo "Error: Failed to change permissions."
    exit 1
fi
