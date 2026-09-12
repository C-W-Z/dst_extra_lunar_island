return {
  version = "1.1",
  luaversion = "5.1",
  orientation = "orthogonal",
  width = 19,
  height = 19,
  tilewidth = 64,
  tileheight = 64,
  properties = {},
  -- tilesets = {
  --   {
  --     name = "tiles",
  --     firstgid = 1,
  --     tilewidth = 64,
  --     tileheight = 64,
  --     spacing = 0,
  --     margin = 0,
  --     image = "../../../../../../Don't Starve Mod Tools/mod_tools/Tiled/dont_starve/tiles.png",
  --     imagewidth = 516,
  --     imageheight = 384,
  --     properties = {},
  --     tiles = {}
  --   }
  -- },
  layers = {
    {
      type = "tilelayer",
      name = "BG_TILES",
      x = 0,
      y = 0,
      width = 19,
      height = 19,
      visible = true,
      opacity = 1,
      properties = {},
      encoding = "lua",
      data = {
          0,  0,  0,  0,  0,  0, 34, 34, 34, 34, 34, 34, 34,  0,  0,  0,  0,  0,  0,
          0,  0,  0,  0, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34,  0,  0,  0,  0,
          0,  0,  0, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34,  0,  0,  0,
          0,  0, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34,  0,  0,
          0, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34,  0,
          0, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34,  0,
         34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34,
         34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34,
         34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34,
         34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34,
         34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34,
         34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34,
         34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34,
          0, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34,  0,
          0, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34,  0,
          0,  0, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34,  0,  0,
          0,  0,  0, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34,  0,  0,  0,
          0,  0,  0,  0, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34,  0,  0,  0,  0,
          0,  0,  0,  0,  0,  0, 34, 34, 34, 34, 34, 34, 34,  0,  0,  0,  0,  0,  0
      }
    },
    {
      type = "objectgroup",
      name = "FG_OBJECTS",
      visible = true,
      opacity = 1,
      properties = {},
      objects = {
        -- {
        --   name = "",
        --   type = "spawnpoint_master",
        --   shape = "rectangle",
        --   x = 642,
        --   y = 642,
        --   width = 60,
        --   height = 60,
        --   visible = true,
        --   properties = {}
        -- },
        -- {
        --   name = "",
        --   type = "multiplayer_portal",
        --   shape = "rectangle",
        --   x = 642,
        --   y = 642,
        --   width = 60,
        --   height = 60,
        --   visible = true,
        --   properties = {}
        -- },
        {
          name = "",
          type = "extra_circle_lunar/moon_pool_anchor",
          shape = "rectangle",
          x = 576,
          y = 576,
          width = 64,
          height = 64,
          visible = true,
          properties = {}
        }
      }
    }
  }
}