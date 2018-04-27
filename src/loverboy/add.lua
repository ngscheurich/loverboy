local cli = require "cliargs"
local util = require "loverboy.util"

local lib
local base_dir
local lib_dir
local version

local function search_names(term)
  local mdata = util.mdata_with_name(term)
  for _, md in ipairs(mdata) do lib = md end
end

local function recursiveDownload(files)
  for k, v in pairs(files) do
    if type(v) == "table" then
      lib_dir = k
      os.execute("mkdir " .. base_dir .. "/" .. lib_dir)
      recursiveDownload(v)
    else
      util.download(lib.repo, version, v, base_dir, lib_dir)
    end
  end
end

cli:set_name("loverboy add")
cli:argument("NAME", "name of library to add")
cli:option("-v, --version=VERSION", "version of the library to install")
cli:option("-d, --directory=DIRECTORY", "directory in which to add the library", "lib")

local args, err = cli:parse(arg)
if not args and err then
  print(err .. "\n")
  os.exit(1)
end

name = args["NAME"]
search_names(name)

if lib ~= nil then
  base_dir = args["directory"]

  if args["version"] then
    version = args["version"]
  else
    version = lib.versions[1]
  end

  print("==> Adding " .. lib.name .. " (" .. version ..")...")
  recursiveDownload(lib.files, base_dir)
  print("Done!")
else
  print("Library '" .. name .. "' not found")
end
