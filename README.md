# YSL UI Library

This repository contains a standalone bundle of the YSL Method interface with game-specific features removed. It has only Main and Settings tabs. Main contains interactive placeholder controls to demonstrate the UI; placeholders do not run game features. The ESP Preview shows the local character and is positioned beside the window.

Settings uses YSL Method's settings module, including themes, interface controls, configuration management, watermark, keybind panel, console, HUD transparency, and window outline controls. The default theme is Mint.

The Settings page's Show Keybinds toggle is also bound to `H` by default, and its key can be changed in the UI. The Main page includes a key-bound placeholder toggle (`G` by default) to demonstrate the keybind panel. An original anime-inspired character illustration sits beside the window while it is open.

## Files

- `YSLUILibrary.lua` is the standalone showcase and includes the required UI, configuration, and settings modules.
- `RunExample.lua` downloads and runs the verified showcase from GitHub.

## Run the example

Execute `RunExample.lua` in a compatible Roblox Luau environment with HTTP and `loadstring` support. To run without downloading, execute `YSLUILibrary.lua` directly.
