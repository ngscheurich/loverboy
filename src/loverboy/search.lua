local cli = require "cliargs"
local util = require "loverboy.util"

local results = {}

local function search_tags(term)
  local mdata = util.mdata_with_tag(term)
  for _, md in ipairs(mdata) do results[md] = 1 end
end

local function search_names(term)
  local mdata = util.mdata_with_name(term)
  for _, md in ipairs(mdata) do results[md] = 1 end
end

cli:set_name("loverboy search")
cli:argument("TERM", "term to search for")
cli:flag("-t, --tag", "only search in tags", false)
cli:flag("-n, --name", "only search in names", false)

local args, err = cli:parse(arg)
if not args and err then
  print(err .. "\n")
  os.exit(1)
end

util.print_bold("==> Searching local metafiles...")

term = args["TERM"]

if args["tag"] then
  search_tags(term)
elseif args["name"] then
  search_names(term)
else
  search_tags(term)
  search_names(term)
end

for md, _v in pairs(results) do
  print(md.name)
end
