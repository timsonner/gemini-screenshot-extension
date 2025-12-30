# Gemini Screenshot Extension

A simple but powerful extension for the [Gemini CLI](https://github.com/google/gemini-cli) that allows you to capture a screenshot and have the AI analyze it immediately.

## Features

- **Instant Capture:** Uses your system's native screenshot tool.
- **AI Analysis:** Automatically sends the image to Gemini for description or analysis.
- **Auto-Cleanup:** Keeps your workspace clean by managing temporary files.

## Prerequisites

Ensure you have one of the following screenshot tools installed on your system:

- **macOS:** `screencapture` (Pre-installed)
- **Linux:** `scrot`, `gnome-screenshot`, or `imagemagick` (`import`)

## Installation  

### Register extension

```bash
gemini extensions install https://github.com/timsonner/gemini-screenshot-extension
```

### Register command

1.  Change directories `cd gemini-screenshot-extension`
2.  Copy `screenshot.toml` to your Gemini commands directory (usually `~/.gemini/commands/`):
   ```bash
cp ./screenshot.toml ~/.gemini/commands/
   ```
4.  Make the script executable:
    ```bash
    chmod +x ~/.gemini/extensions/gemini-screenshot/screenshot.sh
    ```
    
## Usage  

From within Gemini CLI  
```
/screenshot
```

Simply run the command in your terminal:

```bash
gemini screenshot
```

## How It Works

1.  The script triggers your system's screenshot selection tool.
2.  It saves the image to a temporary location accessible to the Gemini agent.
3.  It invokes the `gemini` command with the image path, prompting the AI to describe it.
4.  The temporary image is deleted after processing.
