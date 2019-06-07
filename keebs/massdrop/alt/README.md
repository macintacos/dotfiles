# [Setting up the keyboard correctly](https://drop.com/talk/10343/how-to-configure-your-alt-keyboard)

1. Create your configuration.
2. Compile the firmware with your configuration.

   Use our web-based configurator tool to handle both steps at once: https://www.massdrop.com/mechanical-keyboards/configurator . See below for more information about our configurator.

   If you are comfortable with programming and want to use QMK functionality that our configurator does not support, you can manually create and compile your configuration by checking out the official QMK repository: https://github.com/qmk/qmk_firmware . ALT Keyboard is in the folder "massdrop/ALT". QMK setup instructions are here: https://docs.qmk.fm/#/newbs

3. Load the firmware onto your keyboard.

   To load the firmware onto your ALT keyboard, download the appropriate loader application for your computer's OS here: https://github.com/Massdrop/mdloader/releases/tag/1.0.3. Then follow the instructions here: https://github.com/Massdrop/mdloader. Essentially, to load it up:

   1. Press the reset button on the back (need a pin to do it). This sets it into DFU mode.
   2. Enter the following code:

      ```bash
      $ chmod u+x mdloader_mac # This is done to make sure that it has the correct permissions
      $ ./mdloader_mac --first --download massdrop_alt_massdrop-alt-julian-config.bin --restart
      Massdrop Loader <version>
      ```

   3. You're done!

Have fun with the keyboard.
