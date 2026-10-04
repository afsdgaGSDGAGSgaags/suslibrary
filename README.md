# YSL UI Library

This repository contains a standalone bundle of the YSL Method interface with game-specific features removed. It has only Main and Settings tabs. Main contains interactive placeholder controls to demonstrate the UI; placeholders do not run game features. The ESP Preview shows the local character and is positioned beside the window.

Settings uses YSL Method's settings module, including themes, screen effects (Rain/Snow/Off), interface controls, configuration management, watermark, keybind panel, console, HUD transparency, and window outline controls. Rain is on by default. The default theme is Mint; the theme list also includes Transparent, which makes the UI surfaces translucent. The animated-gradient cycle starts at 2 seconds; its control supports 1–12 seconds.

The Settings page's Show Keybinds toggle is also bound to `H` by default, and its key can be changed in the UI. The Main page includes a key-bound placeholder toggle (`G` by default) to demonstrate the keybind panel; bound-key labels are bold. The Curved UI corners setting rounds both the outer window and widgets; turn it off for square corners. The radius slider adjusts the outer window, while widgets use their original theme radii. Settings can display multiple mascot images, including Roblox assets `81182146149930` and `74029364711949`, and lets you add other numeric asset IDs. Drag each image to place it; selected assets and positions are saved in named configs.

## Files

- `YSLUILibrary.lua` is the standalone showcase and includes the required UI, configuration, and settings modules.
- `RunExample.lua` downloads and runs the verified showcase from GitHub.
- `dropoff.md` explains how an AI coding agent can port the UI and its settings into another script.

## Run the example

Execute `RunExample.lua` in a compatible Roblox Luau environment with HTTP and `loadstring` support. To run without downloading, execute `YSLUILibrary.lua` directly.
