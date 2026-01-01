# Gemini Screenshot Extension

A simple but powerful extension for the [Gemini CLI](https://github.com/google/gemini-cli) that allows you to capture a screenshot and have the AI analyze it immediately.

## Features

- **Instant Capture:** Uses your system's native screenshot tool.
- **AI Analysis:** Automatically sends the image to Gemini for description or analysis.
- **Cross-Platform:** Works on macOS and major Linux environments.

## Prerequisites

Ensure you have one of the following screenshot tools installed on your system:

- **macOS:** `screencapture` (Pre-installed)
- **Linux:** `scrot`, `gnome-screenshot`, or `imagemagick` (`import`)

## Installation

1. Ensure you have the [Gemini CLI](https://github.com/google/gemini-cli) installed.
2. Run the following command:

```bash
gemini extensions install https://github.com/timsonner/gemini-screenshot-extension
```

*Note: If you are already inside a Gemini CLI session, you may need to exit and restart it for the `/screenshot` command to appear.*

## Usage

From within Gemini CLI:
```
/screenshot
```

Or directly from your terminal:
```bash
gemini screenshot
```

## Use Cases

This extension is particularly powerful for front-end developers and creatives:

- **UI Implementation:** Take a screenshot of a design or a live site and ask: *"How would you render this web element using Tailwind CSS?"*
- **Asset Creation:** Capture a UI icon and ask: *"Can you recreate this icon as a clean, optimized SVG?"*
- **Bug Reporting:** Snap a visual glitch and ask: *"Identify the likely CSS layout issue causing this alignment problem."*
- **Creative Inspiration:** Capture any visual element and use follow-up prompts to brainstorm variations or alternative color palettes.

## How It Works

1.  The extension triggers your system's screenshot selection tool (e.g., crosshairs appear).
2.  It saves the captured image to a temporary location.
3.  It generates a prompt for the Gemini agent including the image path (using the `@` syntax).
4.  Gemini analyzes the image within your current session.

## Removal

To uninstall the extension, run:

```bash
gemini extensions remove gemini-screenshot-extension
```

Alternatively, you can manually delete the extension directory:
```bash
rm -rf ~/.gemini/extensions/gemini-screenshot-extension
```