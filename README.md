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

### Manual Installation

1.  Clone this repository or download the files.
2.  Copy `screenshot.sh` to your Gemini commands directory (usually `~/.gemini/commands/`).
3.  Make the script executable:
    ```bash
    chmod +x ~/.gemini/commands/screenshot.sh
    ```
4.  Add a command alias in `~/.gemini/commands/screenshot.toml` (optional but recommended):
    ```toml
    description = "Take a screenshot and analyze it"
    prompt = "!{bash ~/.gemini/commands/screenshot.sh}"
    ```

### Via Gemini CLI (If published)

```bash
gemini extensions install <repository-url>
```

## Usage

Simply run the command in your terminal:

```bash
gemini screenshot
```

Or if you installed it as a direct script:

```bash
~/.gemini/commands/screenshot.sh
```

## How It Works

1.  The script triggers your system's screenshot selection tool.
2.  It saves the image to a temporary location accessible to the Gemini agent.
3.  It invokes the `gemini` command with the image path, prompting the AI to describe it.
4.  The temporary image is deleted after processing.
