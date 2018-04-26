# 💘 Loverboy

> I learned my passion in the good old-fashioned school of lover boys

Loverboy makes it easy to add Lua libraries to your [LÖVE](https://love2d.org/) project. This exists because I found myself all-too-frequently navigating to the GitHub repo of a library I was interested in, copying the URL to the raw Lua file, `cd`ing to my project, `wget`ing, etc., etc. I wanted a tool to handle that for me. There's [Luarocks](https://luarocks.org/), of course, which is awesome, but can be overkill for my LÖVE-specific needs and tends to clutter up my project directory. So here we are.

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

## Contributing

PRs are welcome—just be sure and adhere to the
[code of conduct](https://github.com/ngscheurich/loverboy-mfiles/blob/master/CODE_OF_CONDUCT.md).

## License

Loverboy is released under the [MIT license](https://github.com/ngscheurich/loverboy/blob/master/LICENSE).
