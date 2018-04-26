MFILES_PATH = os.getenv("HOME") .. "/.local/share/loverboy/mfiles"

package.path = package.path .. ";src/?.lua"

local cli = require "cliargs"
local util = require "loverboy.util"

local function print_version()
  print("loverboy version 0.1.0")
  os.exit(0)
end

cli:set_name("loverboy")
cli:command("add", "Add a library to the current project"):file(util.abspath("add"))
cli:command("info", "Display information about a library"):file(util.abspath("info"))
cli:command("search", "Search available libraries"):file(util.abspath("search"))
cli:command("update", "Update local metafiles cache"):file(util.abspath("update"))
cli:flag("-v, --version", "Prints the program's version", print_version)

local args, err = cli:parse(arg)

if not args and err then
  print(err .. "\n")
  cli:print_help()
  os.exit(1)
elseif args then
  cli:print_help()
  os.exit(0)
end
