return {
  version = "1.2",
  luaversion = "5.1",
  tiledversion = "1.2.1",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 32,
  height = 16,
  tilewidth = 16,
  tileheight = 16,
  nextlayerid = 5,
  nextobjectid = 17,
  properties = {},
  tilesets = {
    {
      name = "tilea4",
      firstgid = 1,
      filename = "tilea4.tsx",
      tilewidth = 16,
      tileheight = 16,
      spacing = 0,
      margin = 0,
      columns = 32,
      image = "tilea4.png",
      imagewidth = 512,
      imageheight = 480,
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 16,
        height = 16
      },
      properties = {},
      terrains = {},
      tilecount = 960,
      tiles = {}
    }
  },
  layers = {
    {
      type = "objectgroup",
      id = 1,
      name = "obstacle",
      visible = false,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      draworder = "topdown",
      properties = {
        ["collidable"] = true
      },
      objects = {
        {
          id = 2,
          name = "",
          type = "",
          shape = "rectangle",
          x = 112.5,
          y = 192,
          width = 143,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["friction"] = 0.5
          }
        },
        {
          id = 3,
          name = "",
          type = "",
          shape = "rectangle",
          x = 16.5,
          y = 208.5,
          width = 111.5,
          height = 15,
          rotation = 0,
          visible = true,
          properties = {
            ["friction"] = 0.2
          }
        },
        {
          id = 4,
          name = "",
          type = "",
          shape = "rectangle",
          x = 162,
          y = 160.5,
          width = 93,
          height = 32.5,
          rotation = 0,
          visible = true,
          properties = {
            ["friction"] = 0.2
          }
        },
        {
          id = 5,
          name = "",
          type = "",
          shape = "polygon",
          x = 250.5,
          y = 165,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 31.5, y = -4 },
            { x = 59.5, y = -13 },
            { x = 100.5, y = -35.5 },
            { x = 133, y = -62.5 },
            { x = 148.5, y = -98 },
            { x = 158.5, y = -126 },
            { x = 228, y = -126 },
            { x = 217.5, y = 41.5 }
          },
          properties = {}
        },
        {
          id = 12,
          name = "",
          type = "",
          shape = "rectangle",
          x = 166.5,
          y = 148.5,
          width = 11,
          height = 9.5,
          rotation = 0,
          visible = true,
          properties = {
            ["density"] = 1000,
            ["dynamic"] = true,
            ["friction"] = 1
          }
        },
        {
          id = 13,
          name = "",
          type = "",
          shape = "rectangle",
          x = 167,
          y = 128.5,
          width = 10,
          height = 17,
          rotation = 0,
          visible = true,
          properties = {
            ["density"] = 1000,
            ["dynamic"] = true,
            ["friction"] = 1
          }
        },
        {
          id = 14,
          name = "",
          type = "",
          shape = "rectangle",
          x = 169,
          y = 119,
          width = 8,
          height = 8,
          rotation = 0,
          visible = true,
          properties = {
            ["density"] = 1000,
            ["dynamic"] = true,
            ["friction"] = 1
          }
        },
        {
          id = 15,
          name = "",
          type = "",
          shape = "rectangle",
          x = 116.5,
          y = 177,
          width = 11,
          height = 13,
          rotation = 0,
          visible = true,
          properties = {
            ["density"] = 1000,
            ["dynamic"] = true,
            ["friction"] = 1
          }
        }
      }
    },
    {
      type = "objectgroup",
      id = 3,
      name = "spawn",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      draworder = "topdown",
      properties = {},
      objects = {
        {
          id = 6,
          name = "player",
          type = "",
          shape = "rectangle",
          x = 30.6667,
          y = 37.3333,
          width = 24,
          height = 22,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "imagelayer",
      id = 4,
      name = "Image Layer 1",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      image = "map01.png",
      properties = {}
    },
    {
      type = "tilelayer",
      id = 2,
      name = "Tile Layer 1",
      x = 0,
      y = 0,
      width = 32,
      height = 16,
      visible = false,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 65, 66, 67, 66, 66, 68, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 129, 130, 131, 98, 98, 132, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 65, 66, 67, 161, 162, 162, 162, 162, 164, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 65, 66, 67, 66, 66, 67, 129, 130, 131, 193, 226, 227, 226, 226, 196, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 129, 130, 130, 130, 130, 131, 161, 162, 162, 225, 226, 227, 226, 226, 228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 161, 162, 162, 163, 162, 163, 225, 226, 227, 226, 227, 226, 227, 226, 228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 257, 258, 259, 258, 258, 259, 259, 258, 259, 258, 259, 258, 259, 258, 260, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 289, 290, 291, 290, 290, 291, 291, 290, 291, 290, 290, 291, 290, 291, 292, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    }
  }
}
