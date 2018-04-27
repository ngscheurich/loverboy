local cli = require "cliargs"
local util = require "loverboy.util"

local lib = nil

local function search_names(term)
  local mdata = util.mdata_with_name(term)
  for _, md in ipairs(mdata) do lib = md end
end

cli:set_name("loverboy info")
cli:argument("NAME", "name of library to get info about")

local args, err = cli:parse(arg)
if not args and err then
  print(err .. "\n")
  os.exit(1)
end

name = args["NAME"]
search_names(name)

if lib ~= nil then
  util.print_bold(lib.name)

  if string.len(lib.desc) > 80 then
    local d = string.sub(lib.desc, 1, 79) .. "..."
    print(d)
  else
    print(lib.desc)
  end

  util.print_underline("https://github.com/" .. lib.repo)

  local lvs = lib.versions
  local versions = ""
  for i = 1, #lvs do
    versions = versions .. lvs[i]
    if i ~= #lvs then versions = versions .. ", " end
  end
  print("Versions: " .. versions)

  local lts = lib.tags
  local tags = ""
  for i = 1, #lts do
    tags = tags .. lts[i]
    if i ~= #lts then tags = tags .. ", " end
  end
  print("Tags: " .. tags)
else
  print("Library '" .. name .. "' not found")
end
