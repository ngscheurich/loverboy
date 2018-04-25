local cli = require "cliargs"

local function print_version()
  print("loverboy.lua: version 0.1.0")
  print("lua_cliargs: version " .. cli.VERSION)
  os.exit(0)
end

cli:set_name("loverboy")

cli
  :command("add", "add a library to the current project")
  :file("src/loverboy/add.lua")
cli
  :command("info", "display information about a library")
  :file("src/loverboy/info.lua")
cli
  :command("search", "search available libraries")
  :file("src/loverboy/search.lua")

cli:flag("-v, --version", "prints the program's version", print_version)

local args, err = cli:parse(arg)

if not args and err then
  print(err)
  os.exit(1)
end
