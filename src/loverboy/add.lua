local cli = require "cliargs"
local util = require "src.loverboy.util"

local lib = nil

local function search_names(term)
  local mdata = util.mdata_with_name(term)
  for _, md in ipairs(mdata) do lib = md end
end

cli:set_name("loverboy add")
cli:argument("NAME", "name of library to add")
cli:option("-v, --version=VERSION", "version of the library to install")
cli:option("-d, --directory=DIRECTORY", "directory in which to add the library", "lib")

local args, err = cli:parse(arg)
if not args and err then
  cli:print_help()
  os.exit(1)
end

name = args["NAME"]
search_names(name)

if lib ~= nil then
  local version = ""
  if args["version"] then
    version = args["version"]
  else
    version = lib.versions[1]
  end

  print("==> Adding " .. lib.name .. " v" .. version .."...")

  for _, f in ipairs(lib.files) do
    util.download(lib.repo, version, f, args["directory"])
  end

  print("Done!")
else
  print("Library '" .. name .. "' not found")
end
