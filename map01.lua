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
  nextlayerid = 10,
  nextobjectid = 28,
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
      type = "imagelayer",
      id = 6,
      name = "background",
      visible = true,
      opacity = 1,
      offsetx = -0.166667,
      offsety = -40.5,
      image = "assets/parallax_forest_pack/parallax_forest_pack/layers/parallax-forest-back-trees.png",
      properties = {
        ["offsetx"] = 0.97,
        ["offsety"] = 0.97
      }
    },
    {
      type = "imagelayer",
      id = 8,
      name = "background2",
      visible = true,
      opacity = 1,
      offsetx = 1.33333,
      offsety = -37.6667,
      image = "assets/parallax_forest_pack/parallax_forest_pack/layers/parallax-forest-middle-trees.png",
      properties = {
        ["offsetx"] = 0.9,
        ["offsety"] = 0.95
      }
    },
    {
      type = "imagelayer",
      id = 7,
      name = "front",
      visible = true,
      opacity = 1,
      offsetx = 1.16667,
      offsety = -39,
      image = "assets/parallax_forest_pack/parallax_forest_pack/layers/parallax-forest-front-trees.png",
      properties = {
        ["offsetx"] = 0.5,
        ["offsety"] = 0.9
      }
    },
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
          x = 0.5,
          y = 192.5,
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
          x = 163.022,
          y = 160.033,
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
            { x = 5.66667, y = 58.3333 },
            { x = 5.54444, y = -4.97778 },
            { x = 59.5, y = -13 },
            { x = 100.5, y = -35.5 },
            { x = 133, y = -62.5 },
            { x = 147.833, y = -85.3333 },
            { x = 169.833, y = -110.333 },
            { x = 228, y = -126 },
            { x = 228.833, y = 59.1667 }
          },
          properties = {}
        },
        {
          id = 12,
          name = "",
          type = "",
          shape = "rectangle",
          x = 166.5,
          y = 150.864,
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
          y = 133.955,
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
          x = 168.091,
          y = 125.727,
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
          x = 115.591,
          y = 179.182,
          width = 11,
          height = 13,
          rotation = 0,
          visible = true,
          properties = {
            ["categories"] = 2,
            ["density"] = 1000,
            ["dynamic"] = true,
            ["friction"] = 1
          }
        },
        {
          id = 17,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0.833333,
          y = 63.75,
          width = 31.3333,
          height = 130.167,
          rotation = 0,
          visible = true,
          properties = {
            ["friction"] = 0.2
          }
        },
        {
          id = 22,
          name = "",
          type = "",
          shape = "polygon",
          x = 200.667,
          y = 128.667,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 55.3333, y = 0 },
            { x = 55, y = -16 },
            { x = -2, y = -15 }
          },
          properties = {}
        },
        {
          id = 23,
          name = "",
          type = "",
          shape = "rectangle",
          x = 269.667,
          y = 65,
          width = 55.3333,
          height = 22,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 24,
          name = "",
          type = "",
          shape = "rectangle",
          x = 336,
          y = 20,
          width = 46.6667,
          height = 20.3333,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 25,
          name = "",
          type = "",
          shape = "rectangle",
          x = 144,
          y = 80.3333,
          width = 19.3333,
          height = 14,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 26,
          name = "",
          type = "",
          shape = "rectangle",
          x = 97,
          y = 70.3333,
          width = 11.6667,
          height = 23,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 27,
          name = "",
          type = "",
          shape = "rectangle",
          x = 59.6667,
          y = 30,
          width = 13.3333,
          height = 24,
          rotation = 0,
          visible = true,
          properties = {}
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
          x = 65.1667,
          y = 96.8333,
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
      id = 9,
      name = "Image Layer 4",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      image = "map01.png",
      properties = {}
    }
  }
}
