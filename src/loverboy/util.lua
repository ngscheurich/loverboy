local lfs = require"lfs"
local request = require "http.request"

MFILES_PATH = "mfiles"

local util ={}

local function all_mfiles()
  local mfs = {}
  for file in lfs.dir(MFILES_PATH) do
    if file ~= "." and file ~= ".." then
      local f = MFILES_PATH .. "/" .. file
      local g = string.sub(f, 1, -5)
      table.insert(mfs, g)
    end
  end
  return mfs
end

function util.mdata_with_tag(tag)
  local mdata = {}
  for _, mf in ipairs(all_mfiles()) do
    local md = require(mf)
    for _, t in ipairs(md.tags) do
      if  t == tag then table.insert(mdata, md) end
    end
  end
  return mdata
end

function util.mdata_with_name(name)
  local mdata = {}
  for _, mf in ipairs(all_mfiles()) do
    local md = require(mf)
    if md.name == name then table.insert(mdata, md) end
  end
  return mdata
end

function util.github_url(repo)
  return "https://github.com/" .. repo
end

function util.print_bold(text)
  local t = "\\033[1m" .. text .. "\\033[0m"
  os.execute("echo \"" .. t .. "\"")
end

function util.print_underline(text)
  local t = "\\033[4m" .. text .. "\\033[0m"
  os.execute("echo \"" .. t .. "\"")
end

function util.download(repo, version, file, dir)
  local uri = "https://raw.githubusercontent.com/" .. repo .. "/v" .. version .. "/" .. file
  local req = request.new_from_uri(uri)
  local headers, stream = req:go(req_timeout)
  local body, err = stream:get_body_as_string()

  if not body and err then
    o.stderr:write(tostring(err), "\n")
    os.exit(1)
  end

  local f = assert(io.open(dir .. "/" .. file, "wb"))
  f:write(body)
  f:close()
end

return util
