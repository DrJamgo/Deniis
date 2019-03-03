return {
  version = "1.2",
  luaversion = "5.1",
  tiledversion = "1.2.1",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 64,
  height = 16,
  tilewidth = 16,
  tileheight = 16,
  nextlayerid = 13,
  nextobjectid = 54,
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
      offsetx = 0,
      offsety = -20,
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
      offsetx = 0,
      offsety = -20,
      image = "assets/parallax_forest_pack/parallax_forest_pack/layers/parallax-forest-middle-trees.png",
      properties = {
        ["offsetx"] = 0.8,
        ["offsety"] = 0.95
      }
    },
    {
      type = "imagelayer",
      id = 11,
      name = "background3",
      visible = true,
      opacity = 1,
      offsetx = 272,
      offsety = -20,
      image = "assets/parallax_forest_pack/parallax_forest_pack/layers/parallax-forest-middle-trees.png",
      properties = {
        ["offsetx"] = 0.8,
        ["offsety"] = 0.95
      }
    },
    {
      type = "imagelayer",
      id = 7,
      name = "front",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = -20,
      image = "assets/parallax_forest_pack/parallax_forest_pack/layers/parallax-forest-front-trees.png",
      properties = {
        ["offsetx"] = 0.6,
        ["offsety"] = 0.9
      }
    },
    {
      type = "imagelayer",
      id = 10,
      name = "front2",
      visible = true,
      opacity = 1,
      offsetx = 272,
      offsety = -20,
      image = "assets/parallax_forest_pack/parallax_forest_pack/layers/parallax-forest-front-trees.png",
      properties = {
        ["offsetx"] = 0.6,
        ["offsety"] = 0.9
      }
    },
    {
      type = "imagelayer",
      id = 12,
      name = "mapb",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = -20,
      image = "map01b.png",
      properties = {}
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
          id = 17,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0.333333,
          y = 62.25,
          width = 31.3333,
          height = 194.167,
          rotation = 0,
          visible = true,
          properties = {
            ["friction"] = 0.2
          }
        },
        {
          id = 24,
          name = "",
          type = "",
          shape = "rectangle",
          x = 281.746,
          y = 105.481,
          width = 121.188,
          height = 20.3333,
          rotation = 5.49047,
          visible = true,
          properties = {}
        },
        {
          id = 34,
          name = "",
          type = "",
          shape = "polygon",
          x = 31.6667,
          y = 160,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 48, y = 0 },
            { x = 53.3333, y = 3 },
            { x = 53.6667, y = 16.3333 },
            { x = 57.6667, y = 26 },
            { x = 67, y = 31.6667 },
            { x = 116, y = 31.6667 },
            { x = 127.667, y = 30.3333 },
            { x = 142.667, y = 25.3333 },
            { x = 151.333, y = 22 },
            { x = 161.333, y = 16.3333 },
            { x = 169.333, y = 12.3333 },
            { x = 183.697, y = 3.87878 },
            { x = 195.818, y = -1.75758 },
            { x = 205.667, y = -2.33333 },
            { x = 209.333, y = -0.333333 },
            { x = 214, y = 0.666667 },
            { x = 219.667, y = 0.666667 },
            { x = 231.333, y = 1 },
            { x = 239.333, y = -8 },
            { x = 239.667, y = -31.3333 },
            { x = 272.333, y = -32 },
            { x = 272.667, y = 96.3333 },
            { x = -0.333333, y = 96.3333 }
          },
          properties = {}
        },
        {
          id = 38,
          name = "",
          type = "",
          shape = "rectangle",
          x = 512,
          y = 8.16667,
          width = 6.69697,
          height = 126.924,
          rotation = 0,
          visible = true,
          properties = {
            ["density"] = 200,
            ["dynamic"] = true
          }
        },
        {
          id = 42,
          name = "",
          type = "",
          shape = "polygon",
          x = 608.182,
          y = 127.636,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 16.3636, y = -0.181818 },
            { x = 46.1818, y = -3.09091 },
            { x = 64.3636, y = -4.72727 },
            { x = 90.8182, y = -2.09091 },
            { x = 158.273, y = 15.7045 },
            { x = 239.205, y = 16.0227 },
            { x = 317.948, y = -2.1608 },
            { x = 320.252, y = -13.6368 },
            { x = 415.76, y = -21.8279 },
            { x = 415.985, y = 127.614 },
            { x = -9.18182, y = 127.864 }
          },
          properties = {}
        },
        {
          id = 44,
          name = "",
          type = "",
          shape = "polygon",
          x = 522,
          y = 136.421,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = -10.303, y = -17 },
            { x = -10.4015, y = -1.24067 },
            { x = -2.87491, y = -1.28612 },
            { x = -2.81215, y = -3.89843 },
            { x = 31.1667, y = -1.17087 },
            { x = 22.25, y = 54.0069 },
            { x = 15.25, y = 119.217 },
            { x = -137.5, y = 120.079 },
            { x = -138, y = 0.287271 }
          },
          properties = {}
        },
        {
          id = 45,
          name = "",
          type = "",
          shape = "polygon",
          x = 750.75,
          y = 96.25,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = -2.25, y = -2.25 },
            { x = 41.75, y = -2.75 },
            { x = 79.5, y = -10.75 },
            { x = 100.25, y = -17 },
            { x = 100, y = -29.5 },
            { x = 73, y = -17.75 },
            { x = 55, y = -12.75 },
            { x = 26.5, y = -22 },
            { x = 49.5, y = -8.75 },
            { x = 28.5, y = -6.75 }
          },
          properties = {}
        },
        {
          id = 46,
          name = "",
          type = "",
          shape = "polygon",
          x = 384.333,
          y = 78.6667,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 37, y = 4.66667 },
            { x = 63.3333, y = 5.66667 },
            { x = 63.3333, y = -6 },
            { x = 30.6667, y = -2 },
            { x = 17, y = -16.6667 },
            { x = 25.3333, y = -2 }
          },
          properties = {}
        },
        {
          id = 48,
          name = "",
          type = "",
          shape = "rectangle",
          x = 851,
          y = 0.166667,
          width = 35.8333,
          height = 79.8333,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 51,
          name = "",
          type = "",
          shape = "polygon",
          x = 31,
          y = 111.5,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 58, y = -10 },
            { x = 93.5, y = -20 },
            { x = 131, y = -37 },
            { x = 58, y = -16 },
            { x = 78.5, y = -33.5 },
            { x = 42, y = -14 },
            { x = -2, y = -12 }
          },
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
          x = 47.9167,
          y = 136.083,
          width = 16,
          height = 24,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 30,
          name = "",
          type = "creatures/stachli",
          shape = "rectangle",
          x = 830.667,
          y = 132.833,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "imagelayer",
      id = 9,
      name = "map",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = -20,
      image = "map01.png",
      properties = {}
    }
  }
}
