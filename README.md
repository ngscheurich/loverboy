# 💘 Loverboy

> I learned my passion in the good old-fashioned school of lover boys

Loverboy makes it easy to add Lua libraries to your LÖVE project with a simple set of commands.
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

The easiest way to install Loverboy is using [LuaRocks](https://luarocks.org/):

```
$ luarocks install loverboy
```

You’ll also need the metafiles that describe the libraries available to Loverboy:

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

- [ ] Install multi-file libraries, e.g., [hump](https://github.com/vrld/hump), to their own subdirectory
- [ ] Consolidate installation of Loverboy and metafiles

## Contributing

PRs are welcome—just be sure and adhere to the
[code of conduct](https://github.com/ngscheurich/loverboy/blob/master/CODE_OF_CONDUCT.md).

Is your favorite library not available? You’ll want to have a look at
[loverboy-mfiles](https://github.com/ngscheurich/loverboy-mfiles).

## License

Loverboy is released under the [MIT license](https://github.com/ngscheurich/loverboy/blob/master/LICENSE).
