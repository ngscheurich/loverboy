local lfs = require"lfs"
local request = require "http.request"

local MFILES_PATH = os.getenv("HOME") .. "/.local/share/loverboy/mfiles"
package.path = package.path .. ";" .. MFILES_PATH .. "/?.lua"

local util ={}

local function load_mfiles()
  local mfs = {}
  for file in lfs.dir(MFILES_PATH) do
    if string.sub(file, -3) == "lua" then
      f = string.sub(file, 1, -5)
      table.insert(mfs, f)
    end
  end
  return mfs
end

local mfiles = load_mfiles()

function util.mdata_with_tag(tag)
  local mdata = {}
  for _, mf in ipairs(mfiles) do
    local md = require(mf)
    for _, t in ipairs(md.tags) do
      if  t == tag then table.insert(mdata, md) end
    end
  end
  return mdata
end

function util.mdata_with_name(name)
  local mdata = {}
  for _, mf in ipairs(mfiles) do
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

function util.print_color(text, colorcode)
  local t = "\\e[" .. colorcode .. "m" .. text .. "\\e[39m"
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

function util.abspath(file)
  path = package.searchpath("loverboy." .. file, package.path)
  return path
end

return util
