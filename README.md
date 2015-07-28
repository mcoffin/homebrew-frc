# homebrew-frc

A collection of homebrew formulae for an arm-frc-linux-gnueabi toolchain

## Usage

First, please set up a sysroot for the roborio in `$(brew --prefix)/arm-frc-linux-gnueabi`

If you need help setting up a sysroot for the roboRIO, you can use the awesome toolchain builder tool at [https://bitbucket.org/byteit101/toolchain-builder/overview](https://bitbucket.org/byteit101/toolchain-builder/overview) to so.

````bash
brew tap mcoffin/homebrew-frc
brew install arm-frc-linux-gnueabi-gcc
````
