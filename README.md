# Bouncy

A native Novus animation: two small coloured balls bounce inside a hollow square.
Each approaching ball-to-ball collision creates one additional ball near the
contact point. Wall rebounds do not create balls. Newborn balls flash white and
the border lights up when the population grows.

## Run on macOS

After cloning the repository, build and launch the animation by double-clicking
`run.command`, or run this from the checkout:

```sh
cd Bouncy
./run.command
```

After the first build, open `Bouncy.app` to launch it again. Run `run.command`
after changing the source to rebuild it.

Requires the Novus compiler on PATH. The vendored Novus window library includes
its native macOS helper and the source/build script to rebuild it with Xcode
Command Line Tools.
This checkout is verified with the installed Novus 0.3.1 compiler and its matching
library APIs.

## Controls

| Key | Action |
| --- | --- |
| Left / Right, or A / D | Shrink / enlarge the square |
| Space | Restart with exactly two balls |
| Down, or S | Pause / resume |
| Escape, or close the window | Quit |

The window can also be resized. The arena stays square and scales to fit.
There is a 512-ball performance limit; rebounds continue at that limit.

## Novus structure

- `Ball` owns its position, velocity, colour, wall rebounds and elastic contacts.
- `Arena` owns the balls, square size, reset and collision spawning.
- `BouncyApp` owns the native window, keyboard controls and drawing.

The application uses Novus classes, constructors, selective imports and dynamic
class arrays, following the local language reference and compiler class examples.
Graphics use the documented `window.wm_*` API. The macOS Cocoa helper is part of
the Novus window library; the animation and physics are written in Novus.
Dependencies are included in `lib/` so this checkout builds without downloads.

## Verify the physics

```sh
novus verify.nov
./build/darwin_arm64/verify
```

Checks the initial count, first collision, no immediate duplicate spawn, resize
limits, growth to the population limit, confinement and reset.
