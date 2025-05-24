![Godot 4.0](https://img.shields.io/badge/Godot-v4.0-%23478cbf?logo=godot-engine&logoColor=white)
# Overview

This addon adds support for drawing shapes on the screen for various (mostly debugging) purposes. 

Currently there's only support for 2D drawing but I'll be extending this as I need it.

![](https://i.imgur.com/2DCAKgp.png)

# Installation

Add this addon to your project by importing it in the AssetLib tab in the Godot Editor.

- First fetch the addon:
  - execute `git clone git@github.com:AlmostBearded/GodotDebugDraw.git` to fetch the repository via git and open context menu to execute the "Send to > Compressed (zipped) folder" action.
  - OR download a zip file of this repository via github.
  - either way you should have a zipped folder at the end.
- Open your Godot project in your Godot editor.
- Open the AssetLib.
- Click the "Import..." button.
- Select the zip file fetched at first step and click on "Open".
- Click the "Plugins..." button.
- On the row with name "GodotDebugDraw", check the checkbox in column "Enabled" to enable the addon.
- The addon is now active.

# Usage

The DebugDraw2D script is available from everywhere with the `DebugDraw2D` keyword (as an autoload).

Some of the available methods:
- `DebugDraw2D.line(...)`
- `DebugDraw2D.rect(...)`
- `DebugDraw2D.cube(...)`
- `DebugDraw2D.arrow(...)`
- `DebugDraw2D.circle(...)`
- `DebugDraw2D.circle_arc(...)`

Supported features:
- Draw in any color
- Draw with any line width
- Draw filled shapes with `DebugDraw2D...._filled()`
- Draw for a any duration or for just one frame

Supported Primitives:
- Lines
- Arrows
- Rectangles
- Cubes
- Circles
- Circle Arcs/Pies

Check the source code if you need more details. It's a fairly small asset so you should find your way around quickly.

# Extensions

Send me your feature requests and I'll see if I can extend the addon with further needed primitives. Alternatively just dig into the source and extend it yourself. Don't forget to send me your pull requests if you do so I can merge them back!
