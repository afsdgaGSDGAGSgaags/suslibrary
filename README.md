# YSL UI Library

This repository contains a standalone UI showcase styled and laid out like YSL Method. It has Main, Visuals, Fun, and Settings tabs. Main, Visuals, and Fun contain interactive placeholders; only the local ESP preview and interface ambience are shown, with no player/game feature actions.

The Settings tab uses YSL Method's settings module, including themes, interface controls, configuration management, watermark, keybind panel, console, HUD transparency, and window outline controls. Screen Effect and Array List are in Settings; Rain is enabled at startup.

## Files

- `YSLUILibrary.lua` is the standalone showcase and includes the required UI, configuration, and settings modules.
- `RunExample.lua` downloads and runs the verified showcase from GitHub.

## Run the example

Execute `RunExample.lua` in a compatible Roblox Luau environment with HTTP and `loadstring` support. To run without downloading, execute `YSLUILibrary.lua` directly. The ESP preview uses a local-character clone and its ESP controls only affect the preview.
