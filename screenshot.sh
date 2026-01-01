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
    # macOS - Interactive mode (-i)
    # We use stderr for status messages to avoid polluting the prompt output
    screencapture -i "$IMG_FILE"
elif command -v scrot &> /dev/null; then
    scrot -s "$IMG_FILE"
elif command -v gnome-screenshot &> /dev/null; then
    gnome-screenshot -a -f "$IMG_FILE"
elif command -v import &> /dev/null; then
    import "$IMG_FILE"
else
    echo "Error: No screenshot tool found. Please install scrot, screencapture (macOS) or gnome-screenshot/import (Linux)." >&2
    exit 1
fi

# Check if the file was created (user might have cancelled)
if [ ! -s "$IMG_FILE" ]; then
    echo "Screenshot cancelled or failed (no file created)." >&2
    exit 1
fi

# Send the prompt to Gemini CLI
# Instead of calling 'gemini' recursively, we output the formatted prompt.
# The calling CLI will substitute !{bash ...} with this output.
echo "Describe the content of this screenshot in detail: @$IMG_FILE"

# Note: The file is NOT removed here. The Gemini CLI needs to read it.
# It will remain in the temporary directory until system cleanup.