---@type Base46Table
local M = {}

-- UI
M.base_30 = {
  white = "#c9c7cd",
  black = "#161617",
  darker_black = "#111111",
  black2 = "#27272a",
  one_bg = "#161617",
  one_bg2 = "#131314",
  one_bg3 = "#111111",
  grey = "#2a2a2c",
  grey_fg = "#3b3b3e",
  grey_fg2 = "#313134",
  light_grey = "#6c6874",
  red = "#c45570",
  baby_pink = "#d17286",
  pink = "#b882a5",
  line = "#1b1b1c",
  green = "#90b99f",
  vibrant_green = "#9dc6ac",
  nord_blue = "#6a8cbc",
  blue = "#6a8cbc",
  seablue = "#85b5ba",
  yellow = "#bc9781",
  sun = "#ebc4ad",
  purple = "#8787bf",
  dark_purple = "#b9aeda",
  teal = "#85b5ba",
  orange = "#c88477",
  cyan = "#85b5ba",
  statusline_bg = "#131314",
  lightbg = "#161617",
  pmenu_bg = "#27272a",
  folder_bg = "#6c6874",
}

-- Base16
M.base_16 = {
  base00 = "#111111", -- Default Background
  base01 = "#131314", -- Lighter Background
  base02 = "#27272a", -- Selection Background
  base03 = "#353539", -- Comments, Invisibles
  base04 = "#6c6874", -- Dark Foreground
  base05 = "#a8a7ae", -- Default Foreground, Caret, Delimiters, Operators
  base06 = "#b4b1ba", -- Light Foreground
  base07 = "#ffffff", -- Light Background
  base08 = "#c45570", -- Variables, XML Tags
  base09 = "#c88477", -- Integers, Boolean, Constants
  base0A = "#bc9781", -- Classes, Markup Bold
  base0B = "#90b99f", -- Strings, Inherited Class
  base0C = "#85b5ba", -- Support, Regular Expressions
  base0D = "#6a8cbc", -- Functions, Methods, Headings
  base0E = "#8787bf", -- Keywords, Storage, Selector
  base0F = "#b882a5", -- Deprecated, Embedded Language Tags
}

M.add_hl = {}

-- polish_hl com integração completa
M.polish_hl = {
  -- Grupos de highlight padrão
  syntax = {
    Comment = { fg = M.base_16.base03 },
    Constant = { fg = M.base_16.base05 },
    String = { fg = M.base_30.green },
    Character = { fg = M.base_30.green },
    Number = { fg = M.base_30.pink },
    Boolean = { fg = M.base_30.orange },
    Float = { fg = M.base_30.pink },
    Identifier = { fg = M.base_16.base05 },
    Function = { fg = M.base_30.blue },
    Statement = { fg = M.base_16.base05 },
    Conditional = { fg = M.base_30.blue },
    Repeat = { fg = M.base_30.purple },
    Label = { fg = M.base_30.purple },
    Operator = { fg = M.base_30.purple },
    Keyword = { fg = M.base_30.purple },
    Exception = { fg = M.base_30.purple },
    PreProc = { fg = M.base_30.red },
    Include = { fg = M.base_30.purple },
    Define = { fg = M.base_30.red },
    Macro = { fg = M.base_30.red },
    PreCondit = { fg = M.base_30.red },
    Type = { fg = M.base_30.yellow },
    StorageClass = { fg = M.base_30.yellow },
    Structure = { fg = M.base_30.red },
    Special = { fg = M.base_30.blue },
    SpecialChar = { fg = M.base_30.yellow },
    Typedef = { fg = M.base_30.yellow },
    Tag = { fg = M.base_30.yellow },
    SpecialComment = { fg = M.base_16.base04 },
    Debug = { fg = M.base_30.yellow },
    Delimiter = { fg = M.base_30.blue },
    Error = { fg = M.base_30.orange },
    Todo = { fg = M.base_30.yellow },
  },

  treesitter = {
    -- Annotations & Attributes
    ["@annotation"] = { fg = M.base_16.base0E },
    ["@attribute"] = { fg = M.base_16.base0E },

    -- Literals
    ["@boolean"] = { fg = M.base_16.base09 },
    ["@character"] = { fg = M.base_16.base0B },
    ["@character.special"] = { fg = M.base_16.base0C },

    -- Comments
    ["@comment"] = { fg = M.base_16.base03 },
    ["@comment.error"] = { fg = M.base_30.red },
    ["@comment.hint"] = { fg = M.base_30.cyan },
    ["@comment.info"] = { fg = M.base_30.purple },
    ["@commnet.note"] = { fg = M.base_30.cyan },
    ["@comment.todo"] = { fg = M.base_30.blue },
    ["@comment.warning"] = { fg = M.base_30.yellow },

    -- Constants
    ["@constant"] = { fg = M.base_16.base09 },
    ["@constant.builtin"] = { fg = M.base_16.base09 },

    -- Constructors
    ["@constructor"] = { fg = M.base_16.base06 },
    ["@constructor.tsx"] = { fg = M.base_30.blue },
    ["@constructor.javascript"] = { fg = M.base_30.red },

    -- Namespaces & Parameters
    ["@namespace"] = { fg = M.base_30.red, italic = true },
    ["@parameter"] = { fg = M.base_30.pink },

    -- Operators & Punctuation
    ["@operator"] = { fg = M.base_30.purple },
    ["@property"] = { fg = M.base_30.yellow },
    ["@punctuation"] = { fg = M.base_16.base06 },
    ["@punctuation.delimiter"] = { fg = M.base_16.base06 },
    ["@punctuation.bracket"] = { fg = M.base_16.base06 },
    ["@punctuation.special"] = { fg = M.base_16.base06 },

    -- Strings
    ["@string.documentation"] = { fg = M.base_30.green },
    ["@string.regex"] = { fg = M.base_30.purple },
    ["@string.escape"] = { fg = M.base_30.pink },

    -- Tags
    ["@symbol"] = { fg = M.base_30.yellow },
    ["@tag"] = { fg = M.base_30.red },
    ["@tag.attribute"] = { fg = M.base_30.purple, italic = true },
    ["@tag.delimiter"] = { fg = M.base_16.base06 },
    ["@tag.tsx"] = { fg = M.base_30.yellow },
    ["@tag.jsx"] = { fg = M.base_30.yellow },

    -- Types
    ["@type"] = { fg = M.base_16.base0A },
    ["@type.builtin"] = { fg = M.base_30.purple },
    ["@type.definition"] = { fg = M.base_16.base0A },

    -- Variables
    ["@variable"] = { fg = M.base_16.base05 },
    ["@variable.builtin"] = { fg = M.base_30.purple },
    ["@variable.parameter"] = { fg = M.base_30.pink },
    ["@variable.member"] = { fg = M.base_30.yellow },
    ["@variable.member.vue"] = { fg = M.base_30.purple },

    -- Functions
    ["@function"] = { fg = M.base_16.base0D },
    ["@function.builtin"] = { fg = M.base_16.base0D },
    ["@function.call"] = { fg = M.base_16.base0D },
    ["@function.macro"] = { fg = M.base_16.base0E },
    ["@function.method"] = { fg = M.base_16.base0D },
    ["@function.method.call"] = { fg = M.base_16.base0D },

    -- Keywords
    ["@keyword"] = { fg = M.base_30.purple },
    ["@keyword.conditional"] = { fg = M.base_16.base0E },
    ["@keyword.coroutine"] = { fg = M.base_30.purple },
    ["@keyword.debug"] = { fg = M.base_16.base08 },
    ["@keyword.clojure"] = { fg = M.base_30.baby_pink },
    ["@keyword.function"] = { fg = M.base_30.purple },
    ["@keyword.import"] = { fg = M.base_16.base0E },
    ["@keyword.operator"] = { fg = M.base_30.purple },
    ["@keyword.return"] = { fg = M.base_30.orange },
    ["@keyword.storage"] = { fg = M.base_16.base0E },

    -- Text formatting
    ["@text.underline"] = { underline = true },
    ["@text.strong"] = { bold = true },
    ["@text.strikethrough"] = { strikethrough = true },
    ["@text.italic"] = { italic = true },

    -- Modules
    ["@module"] = { fg = M.base_16.base0E },
    ["@module.builtin"] = { fg = M.base_30.purple },

    -- Markup (Markdown, etc)
    ["@markup.heading"] = { fg = M.base_16.base05, bold = true },
    ["@markup.heading.1"] = { fg = M.base_30.purple, bold = true },
    ["@markup.heading.1.marker"] = { fg = M.base_16.base03 },
    ["@markup.heading.2"] = { fg = M.base_30.blue, bold = true },
    ["@markup.heading.2.marker"] = { fg = M.base_16.base03 },
    ["@markup.heading.3"] = { fg = M.base_30.blue, bold = true },
    ["@markup.heading.3.marker"] = { fg = M.base_16.base03 },
    ["@markup.heading.4"] = { fg = M.base_30.blue, bold = true },
    ["@markup.heading.4.marker"] = { fg = M.base_16.base03 },
    ["@markup.heading.5"] = { fg = M.base_30.blue, bold = true },
    ["@markup.heading.5.marker"] = { fg = M.base_16.base03 },
    ["@markup.heading.6"] = { fg = M.base_30.blue, bold = true },
    ["@markup.heading.6.marker"] = { fg = M.base_16.base03 },
    ["@markup.link"] = { fg = M.base_16.base06 },
    ["@markup.link.label"] = { fg = M.base_30.orange },
    ["@markup.link.url"] = { fg = M.base_30.purple },
    ["@markup.list"] = { fg = M.base_16.base04, bold = true },
    ["@markup.list.checked"] = { fg = M.base_16.base04 },
    ["@markup.list.unchecked"] = { fg = M.base_16.base04 },
    ["@markup.raw.block"] = { fg = M.base_16.base04 },
    ["@markup.raw.delimiter"] = { fg = M.base_16.base04 },
    ["@markup.quote"] = { fg = M.base_16.base06 },
    ["@markup.list.checked.markdown"] = { fg = M.base_30.green },
    ["@markup.underline"] = { underline = true },
    ["@markup.strong"] = { bold = true },
    ["@markup.italic"] = { italic = true },
    ["@markup.strikethrough"] = { strikethrough = true },
  },

  -- BlinkCmp (autocompletação)
  blinkcmp = {
    BlinkCmpMenu = { bg = M.base_16.base00 },
    BlinkCmpMenuBorder = { fg = M.base_16.base02 },
    BlinkCmpMenuSelection = { bg = M.base_16.base02 },
    BlinkCmpLabel = { fg = M.base_16.base06 },
    BlinkCmpLabelDepricated = { fg = M.base_16.base06, strikethrough = true },
    BlinkCmpLabelMatch = { fg = M.base_30.blue, bold = true },
    BlinkCmpGhostText = { fg = M.base_16.base03 },
    BlinkCmpDoc = { bg = M.base_16.base00 },
    BlinkCmpDocBorder = { fg = M.base_16.base02 },
    BlinkCmpSignatureHelpBorder = { fg = M.base_16.base02 },
    BlinkCmpKind = { fg = M.base_16.base06 },
    BlinkCmpKindText = { fg = M.base_16.base06 },
    BlinkCmpKindFunction = { fg = M.base_30.red },
    BlinkCmpKindVariable = { fg = M.base_30.purple },
    BlinkCmpKindEnum = { fg = M.base_30.green },
    BlinkCmpKindSnippet = { fg = M.base_30.yellow },
    BlinkCmpKindField = { fg = M.base_30.pink },
    BlinkCmpKindConstant = { fg = M.base_30.orange },
    BlinkCmpKindMethod = { fg = M.base_30.cyan },
    BlinkCmpSource = { bg = M.base_16.base00 },
  },

  -- GitSigns
  git = {
    GitSignsAdd = { fg = M.base_30.green },
    GitSignsChange = { fg = M.base_30.yellow },
    GitSignsDelete = { fg = M.base_30.red },
  },

  -- WhichKey
  whichkey = {
    WhichKey = { fg = M.base_30.purple },
    WhichKeyDesc = { fg = M.base_16.base05 },
    WhichKeyGroup = { fg = M.base_30.blue },
    WhichKeyNormal = { bg = M.base_16.base00 },
    WhichKeySeparator = { fg = M.base_16.base03 },
  },

  devicons = {
    DevIconDefault = { fg = M.base_16.base05 },
  }
}

M.type = "dark"

-- Registrar tema
M = require("base46").override_theme(M, "obscure")

return M
