#!/bin/bash
# gemini-snap: Capture a screenshot and send it to Gemini CLI for analysis

# Define a safe temporary file path
# We use mktemp to generate a unique file in the system temp directory
# Linux/macOS compatible temporary file creation
if [ -n "$TMPDIR" ]; then
    TEMP_DIR="$TMPDIR"
else
    TEMP_DIR="/tmp"
fi

IMG_FILE="${TEMP_DIR}/gemini_screenshot_$(date +%s).png"

# Capture screenshot (macOS: screencapture, Linux: scrot, gnome-screenshot or import)
if command -v screencapture &> /dev/null; then
    screencapture -i "$IMG_FILE"
elif command -v scrot &> /dev/null; then
    scrot -s "$IMG_FILE"
elif command -v gnome-screenshot &> /dev/null; then
    gnome-screenshot -a -f "$IMG_FILE"
elif command -v import &> /dev/null; then
    import "$IMG_FILE"
else
    echo "Error: No screenshot tool found. Please install scrot, screencapture (macOS) or gnome-screenshot/import (Linux)."
    exit 1
fi

# Send to Gemini CLI for analysis
# The '@' symbol tells Gemini to process the file content
gemini "Describe the content of this screenshot in detail: @$IMG_FILE"

# Clean up the file after the command (optional, can be commented out for debugging)
rm "$IMG_FILE"
