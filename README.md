![Godot 4.0](https://img.shields.io/badge/Godot-v4.0-%23478cbf?logo=godot-engine&logoColor=white)
# Overview

This addon adds support for drawing shapes on the screen for various (mostly debugging) purposes. 

Currently there's only support for 2D drawing but I'll be extending this as I need it.

![](https://i.imgur.com/2DCAKgp.png)

# Installation

Copy the addons/debugdraw2d/ folder into addons/debugdraw2d/ in your project.

## Via Git

You can install the addon via git by executing:

```
git clone git@github.com:AlmostBearded/GodotDebugDraw.git ADDONS_FOLDER
mv ADDONS_FOLDER/debugdraw2d $yourproject/addons/debugdraw2d
``` 

## Manually 

The alternative to installing via git would be to simply download a zip file of this repository,
extract it, and copy the `debugdraw2d` folder into your `addons` folder.


## Autoload

The only thing left to do is to add an autoload for the `DebugDraw2D` script. 

(If anyone knows how I could automate this please tell me!)

Steps:
1. Go to Project > Project Settings
2. Go to the Autoload tab
3. Add the DebugDraw2D script by locating it via it's path and naming it DebugDraw2D

The result should look something like this: ![](https://i.imgur.com/31EuOoz.png)


# Usage

Because you added an Autoload to the DebugDraw2D script you can access it from everywhere with `DebugDraw2D`.

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
