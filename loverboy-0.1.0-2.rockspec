package = "loverboy"
version = "0.1.0-2"

source = {
   url = "https://github.com/ngscheurich/loverboy"
}

description = {
   summary = "Download libraries to help with LÖVE development",
   homepage = "https://github.com/ngscheurich/loverboy",
   maintainer = "N. G. Scheurich <nick@scheurich.me>",
   license = "MIT"
}

dependencies = {
   "lua ~> 5.3",
   "lua_cliargs ~> 3",
   "luafilesystem ~> 1.7",
   "http ~> 0.2"
}

build = {
   type = "builtin",
   modules = {
      ["loverboy"] = "src/loverboy.lua",
      ["loverboy.add"] = "src/loverboy/add.lua",
      ["loverboy.info"] = "src/loverboy/info.lua",
      ["loverboy.search"] = "src/loverboy/search.lua",
      ["loverboy.util"] = "src/loverboy/util.lua"
   },
   install = {
      bin = { "bin/loverboy" }
   }
}
