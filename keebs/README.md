# Keebs

This is where I keep all of my keyboard configurations. There are a few “gotchas” that you should know if you’re going to compile some of these.

## Custom Configurations

The [QMK configurator](config.qmk.fim) no longer provides the ability to download the `keymap.c` file directly. You have to download [the `qmk` CLI tool](https://docs.qmk.fm/#/cli) and then convert the JSON file you get when you configure your layout in the configurator, like so:

```bash
qmk json2c /path/to/keymap.json -o /path/to/where/you/want/to/output/keymap.c
```

Then, you can take a `config.h`/`rules.mk` file from the default layout and modify whatever things you’d like (like these: https://docs.qmk.fm/#/config_options?id=the-configh-file). Put all of these files (`cofig.h`/`rules.mk` and the new `keymap.c`) into the relevant `$QMK_HOME/keyboard/<keyboards-name>/keymaps/<keymaps-name>` folder to prep for the last step.

When you’re ready, compile the keyboard like so:

```bash
qmk compile -kb <keyboards-name> -km <keymaps-name>
```

The newly-compiled binary will be in the `$QMK_HOME/.build` directory.

Source for initial process: https://www.reddit.com/r/olkb/comments/g3q5ha/qmk_configurator_where_is_the_keymapc/
