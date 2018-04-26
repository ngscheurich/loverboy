local cli = require "cliargs"
local util = require "loverboy.util"

cli:set_name("loverboy update")

local args, err = cli:parse(arg)
if not args and err then
  print(err .. "\n")
  cli:print_help()
  os.exit(1)
end

util.print_bold("==> Updating metafiles cache...")
os.execute("cd " .. MFILES_PATH .. " && git pull")
