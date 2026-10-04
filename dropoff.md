# Agent handoff: porting the YSL UI

This guide is for an AI coding agent adapting this repository's Roblox/Luau UI to a different script. Treat this repository as a reference implementation, not as a file to paste wholesale into another project. Preserve the destination script's existing startup, game logic, configuration format, UI framework, and cleanup conventions.

## What this project contains

- `YSLUILibrary.lua` is the complete standalone showcase bundle. It embeds its library, controls, settings, configuration, mascot images, and demo startup in one Luau file.
- `RunExample.lua` fetches that bundle from GitHub and executes it. A destination project that already distributes its own script should generally port the needed source behavior rather than add another remote loader.
- `README.md` describes the showcase's runtime behavior and entry points.

The bundle is designed to run in a Roblox client-side Luau environment. Its UI uses Roblox instances and services, and some persistence or optional behavior may depend on executor APIs. Do not assume those APIs are available in a different runtime.

## Recommended porting workflow

1. Inspect the destination project before editing. Find its UI construction, settings/config persistence, startup and unload paths, and any existing corner-radius or image widgets.
2. Select only the features the user asked to port. Avoid replacing the destination UI library or copying unrelated game automation and showcase examples.
3. Translate the behavior into the destination's existing module and naming conventions. Keep persistent setting IDs stable where possible.
4. Wire controls to the destination's setting callbacks and profile load/save lifecycle. A setting must apply on startup and when loading a saved profile, not only after a manual click.
5. Add cleanup for connections, tweens, `ScreenGui`s, and temporary instances using the destination's existing lifecycle.
6. Run the project's formatter, type checker, and focused tests. If the project has a Roblox runtime test harness, check behavior there too; static checks do not prove an asset loads or that GUI layering looks right.

## Unified curved-corners setting

This showcase has one **Curved UI corners** toggle. Off means square window and widget corners; on means a rounded window and widgets restored to their original theme radii. The outer-window radius slider is enabled only while the toggle is on. The default is off so the initial UI is boxy.

The reference logic is in `YSLUILibrary.lua`:

- `Library:SetWindowCornerRadius(radius)` applies the radius to the window outline (and any explicitly coupled preview/header elements); passing `nil` restores the window's recorded defaults.
- `Library:SetWidgetCornersBoxy(enabled)` records original `UICorner.CornerRadius` values, sets them to zero when enabled, and restores the saved values when disabled. While boxy mode is enabled, it observes `ScreenGui.DescendantAdded` so widgets created later also receive square corners.
- Settings creates the radius slider and one toggle. The toggle callback calls both corner APIs, and the slider callback reapplies the chosen radius only while curved mode is active.
- `SetWidgetCornersBoxy(true)` is applied during settings initialization so widgets are square before the user interacts with the toggle. If the destination library creates its UI before the settings panel, apply the default before constructing widgets or perform a one-time pass over existing descendants.

When porting, capture each original corner radius only once. Do not overwrite the cached default with an already-forced zero radius. Disconnect the descendant listener and restore or destroy owned UI during unload. If the destination has separate corner-style configuration already, reconcile or migrate it so saved profiles do not leave the window and widgets in contradictory states.

## Mascot / side-image behavior

The side-image code in `YSLUILibrary.lua` provides a useful Roblox-specific reference for image placement:

- It keeps side images in a transparent container and does not let the mascot intercept pointer input in the version that anchors it to the window. Other variants allow dragging; follow the destination's UX requirement.
- It computes a default position relative to the window, preview, and viewport, and clamps that position to the visible viewport.
- It creates images lazily, preloads assets, and emits a warning when Roblox reports a failed asset fetch.
- Selection and position are stored through the config API. Keep Roblox asset IDs validated as numeric strings if accepting custom IDs.
- If the image must render behind the interface, use a separate `ScreenGui` with an explicitly lower `DisplayOrder` than the main UI. `ZIndex` alone cannot order content across separate screen GUIs.

Port only the required subset. Ask whether images should be draggable, anchored to the window, or saved if the request does not make that behavior clear.

## Title and bundle notes

The showcase adds a small logo next to the centered title using asset ID `129868188377055`. The title layout accounts for the logo's width and keeps it inside the title content. Reuse the layout approach rather than hard-coding its absolute position if the destination title can change.

The remote bundle is generated for this showcase repository. If the destination project has source modules and a bundler, edit those source modules and regenerate the bundle; do not patch generated code alone. If it only distributes a single Luau file, make the corresponding change there and record that it is a standalone artifact.

## Acceptance checklist

- One setting controls both the window and widget corner styles.
- The disabled/default state is square; enabling curves both.
- The radius slider is disabled in square mode and updates both rounded surfaces in curved mode.
- Newly created widgets follow the current setting.
- Loading a saved profile applies the same combined state as manually toggling it.
- Unloading does not leave duplicate GUIs, live connections, or stale overlays.
- Mascot position, layering, and input behavior match the requested destination UX.
- The destination project's checks pass, and any Roblox-only visual behavior is explicitly called out as requiring runtime verification.
