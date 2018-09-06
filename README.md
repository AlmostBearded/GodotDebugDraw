# Overview

This addon adds support for drawing shapes on the screen for various (mostly debugging) purposes. 

Currently there's only support for 2D drawing but I'll be extending this as I need it. 
Send me your feature requests and I'll see what I can do.


# Installation

You need to put the contents of this repository into your project's `addons` folder 
(usually a folder called `addons` in the root of your project).

## Via Git

You can install the addon via git by executing:

```
git clone git@github.com:AlmostBearded/GodotDebugDraw.git ADDONS_FOLDER
``` 

## Manually 

The alternative to installing via git would be to simply download a zip file of this repository 
and extract it into your `addons` folder.


## Autoload

The only thing left to do is to add an autoload for the DebugDraw2D script. 

(If anyone knows how I could automate this please tell me!)

Steps:
1. Go to Project > Project Settings
2. Go to the Autoload tab
3. Add the DebugDraw2D script by locating it via it's path and naming it DebugDraw2D

The result should look something like this: ![](https://i.imgur.com/31EuOoz.png)


# Usage

Because you added an Autoload to the DebugDraw2D script you can access it from everywhere with `DebugDraw2D`.

Supported Primitives:
- Cubes: `DebugDraw2D.draw_cube(center, size, color, duration)`
- Circles: `DebugDraw2D.draw_circle(center, radius, color, duration)`

# Extensions

Send me your feature requests and I'll see if I can extend the addon with further needed primitives. Alternatively just dig into the source and extend it yourself. Don't forget to send me your pull requests if you do so I can merge them back!
