# TODO

- [x] Check out some plugins for better markdown management
- [x] Change the icons for warnings (they don't look very nice)
- [x] Should look into changing the buffer resizers so that they’re “aware” of where they are.

For example: I have a window “frame” split in two, with a buffer above (that has focus) and a buffer below it. Currently, I’m using `<M-W/A/S/D>` to resize buffers up/down/left/right, as one would expect. However, right now, you’d use `<M-W>` to _increase_ the size of the current buffer, which doesn’t make sense from a visual perspective, but it _does_ from the literal perspective where `W` means “up” in `WASD`-land.I want to make it so that it’s almost like my command it taking command of the split’s “divider” and the direction I move it is the direction that I want it to go, thus, making the buffer larger would mean that keybinding would be `<M-S>`. However, this means that it’d need to be “split aware”, since that same keybinding wouldn’t make sense if we were in the bottom buffer (`<M-W>` would make the buffer bigger in that case, and `<M-S>` would make it smaller).

Maybe there’s a plugin that can do this, but perhaps this is something that I’ll just had to add myself one day.
