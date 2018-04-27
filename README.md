# 💘 Löverboy

> I learned my passion in the good old-fashioned school of lover boys

Löverboy makes it easy to add Lua libraries to your [LÖVE](https://love2d.org/) project with a simple set of commands.
Library files are added directly to your project directory so distributing your game is a snap.

## Table of contents

* [Loverboy](#-loverboy)
  * [Table of Contents](#table-of-contents)
  * [Installation](#installation)
  * [Usage](#usage)
  * [Roadmap](#roadmap)
  * [Contributing](#contributing)
  * [License](#license)

## Installation

The easiest way to install Löverboy is using [LuaRocks](https://luarocks.org/):

```
$ luarocks install loverboy
```

You’ll also need the metafiles that describe the libraries available to Löverboy:

```
$ git clone https://github.com/ngscheurich/loverboy-mfiles.git ~/.local/share/loverboy
```

## Usage

```
Usage: loverboy [OPTIONS]

COMMANDS:
  add           Add a library to the current project
  info          Display information about a library
  search        Search available libraries
  update        Update local metafiles cache

OPTIONS:
  -v, --version Prints the program's version
```

## Roadmap

* [x] Install multi-file libraries, e.g., [hump](https://github.com/vrld/hump), to their own subdirectory
* [x] Consolidate installation of Löverboy and metafiles
* [ ] Let user select a subset of files from a multi-file library

## Contributing

PRs are welcome—just be sure and adhere to the
[code of conduct](https://github.com/ngscheurich/loverboy/blob/master/CODE_OF_CONDUCT.md).

Is your favorite library not available? You’ll want to have a look at the
[Löverboy Metafiles repo](https://github.com/ngscheurich/loverboy-mfiles).

## License

Löverboy is released under the [MIT license](https://github.com/ngscheurich/loverboy/blob/master/LICENSE).
