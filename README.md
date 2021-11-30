# LuaPack

LuaPack packs Lua scripts together along with a Lua interpretor (Lua 5.4.3)
and produces a standalone executable for Linux and Windows.

LuaPack runs on Linux.

LuaPack uses [luastatic](https://github.com/ers35/luastatic) to generate a single executable.

No Lua interpretor needs to be installed. LuaPack downloads and compiles its own interpretor.

## Installation

``` sh
$ make install    # install luapack to ~/.local/bin
```

LuaPack is a single autonomous shell script.
It does not need to be installed and can be copied anywhere you want.

## Usage

```
Usage: luapack [-h] [-c] [-w] [-o OUTPUT] [-b BUILD_DIR] script(s)

Options:
    -h          show this help
    -c          clean and rebuild the Lua libraries
    -w          generate a Windows binary with mingw
    -o OUTPUT   set the name of the output executable
    -b DIR      set the name of the Lua build directory
```

The main script shall be the first one.
Other scripts are libraries that can be loaded by the main script.

## Examples

### Linux executable

```
luapack main.lua lib1.lua lib2.lua -o linux_executable
```

Running `linux_executable` is equivalent to running `lua main.lua`.

### Windows executable

```
luapack main.lua lib1.lua lib2.lua -w -o windows_executable.exe
```

Running `windows_executable.exe` is equivalent to running `lua.exe main.lua`.
