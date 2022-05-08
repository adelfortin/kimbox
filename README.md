## Table of Contents

- [Table of Contents](#table-of-contents)
  - [Installation](#installation)
  - [Color](#color)
  - [Options (Lua)](#options-lua)
  - [Support Filetype](#support-filetype)
  - [Support Plugin](#support-plugin)
  - [Thanks to](#thanks-to)

----

This started out as a fork of [Oceanic Material](https://github.com/glepnir/oceanic-material) theme with my custom [Kimbie Dark](https://marketplace.visualstudio.com/items?itemName=dnamsons.kimbie-dark-plus) colors, and turned into a [One Dark](https://github.com/navarasu/onedark.nvim) fork

![Kimbox](https://lmburns.com/gallery/media/large/kimbox-preview2.png)

Kimbox is a dark colorscheme for Neovim. There is builtin treesitter support.

The colors may look duller in the images provided, though they will not be whenever the colorscheme is actually loaded. I've noticed that many other colorschemes seem brighter than what their images show.

## Installation

- vim-plug
```vim
Plug 'lmburns/kimbox'

colorscheme kimbox
```

- Packer
```lua
-- require("kimbox").load() == colorscheme kimbox
use({ "lmburns/kimbox", config = [[require("kimbox").load()]] })
-- or
use({
  "lmburns/kimbox",
  config = function()
      require("kimbox").setup({
          -- options
      })
      require("kimbox").load()
    end
})
```

- Bufferline
```lua
-- Colors can be accessed with
local c = require("kimbox.bufferline").colors()

-- Theme itself
local t = require("kimbox.bufferline").theme()

require("bufferline").setup(
  -- configuration stuff
  highlights = require("kimbox.bufferline").theme()
)
```

- Lualine
```lua
-- Colors can be accessed with
local c = require("kimbox.lualine").colors()

-- Theme itself
local t = require("kimbox.lualine").theme()

require("lualine").setup(
  -- configuration stuff
  theme = 'kimbox' -- 'auto' also works as well
)
```

## Color

| #39260E                                                         | #291804                                                         | #EF1D55                                                         | #DC3958                                                         | #FF5813                                                         | #FF9500                                                         | #819C3B                                                         |
| --------------------------------------------------------------- | --------------------------------------------------------------- | --------------------------------------------------------------- | --------------------------------------------------------------- | --------------------------------------------------------------- | --------------------------------------------------------------- | --------------------------------------------------------------- |
| ![#39260E](https://via.placeholder.com/80/39260E/000000?text=+) | ![#291804](https://via.placeholder.com/80/291804/000000?text=+) | ![#EF1D55](https://via.placeholder.com/80/EF1D55/000000?text=+) | ![#DC3958](https://via.placeholder.com/80/DC3958/000000?text=+) | ![#FF5813](https://via.placeholder.com/80/FF5813/000000?text=+) | ![#FF9500](https://via.placeholder.com/80/FF9500/000000?text=+) | ![#819C3B](https://via.placeholder.com/80/819C3B/000000?text=+) |
| #7EB2B1                                                         | #4C96A8                                                         | #98676A                                                         | #A06469                                                         | #7F5D38                                                         | #A89984                                                         | #D9AE80                                                         |
| ![#7EB2B1](https://via.placeholder.com/80/7EB2B1/000000?text=+) | ![#4C96A8](https://via.placeholder.com/80/4C96A8/000000?text=+) | ![#98676A](https://via.placeholder.com/80/98676A/000000?text=+) | ![#A06469](https://via.placeholder.com/80/A06469/000000?text=+) | ![#7F5D38](https://via.placeholder.com/80/7F5D38/000000?text=+) | ![#A89984](https://via.placeholder.com/80/A89984/000000?text=+) | ![#D9AE80](https://via.placeholder.com/80/D9AE80/000000?text=+) |

## Options (Lua)

```lua
-- These options can also be set using:
vim.g.kimbox_config = {
  -- ...options from above
}

require("kimbox").setup({
  -- Main options --
  style = "ocean", -- choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
  -- medium: #231A0C
  -- ocean: #221A02
  -- medium: #231A0C
  -- deep: #0f111B
  -- darker:#291804

  -- TODO: Work on this
  toggle_style_key = "<Leader>ts",
  toggle_style_list = { "medium", "ocean", "vscode", "deep", "darker" }, -- or require("kimbox").bgs_list

  -- Used with popup menus (coc.nvim mainly) --
  popup = {
    background = false, -- use background color for pmenu
  },

  -- Plugins Related --
  diagnostics = {
    background = true, -- use background color for virtual text
  }

  -- General formatting --
  allow_bold = true,
  allow_italic = false,
  allow_underline = false,
  allow_undercurl = true,
  allow_reverse = false,

  transparent = false, -- don't set background
  term_colors = true, -- if true enable the terminal
  ending_tildes = false, -- show the end-of-buffer tildes


  -- Custom Highlights --
  colors = {}, -- Override default colors
  highlights = {}, -- Override highlight groups
  -- Plugins or languages that can be disabled
  -- View them with require("kimbox.highlights").{langs,plugins}
  disabled = {
      langs = {},
      plugins = {}
  },

  run_before = nil, -- Run a function before the colorscheme is loaded
  run_after = nil -- Run a function after the colorscheme is loaded
})

require("kimbox").load()
```

### Options (vimscript)

```vim
" an example
let g:kimbox_config = {
    \ 'allow_reverse': v:false,
    \ 'popup': {'background': v:false},
    \ 'transparent': v:false,
    \ 'allow_bold': v:true,
    \ 'toggle_style_list': [
    \   'medium',
    \   'ocean',
    \   'vscode',
    \   'deep',
    \   'darker'
    \ ],
    \ 'toggle_style_key': '<Leader>ts',
    \ 'colors': [],
    \ 'allow_italic': v:false,
    \ 'diagnostics': {'background': v:true},
    \ 'ending_tildes': v:false,
    \ 'allow_underline': v:false,
    \ 'toggle_style_index': 0,
    \ 'allow_undercurl': v:false,
    \ 'highlights': [],
    \ 'style': 'ocean',
    \ 'loaded': v:true,
    \ 'term_colors': v:true
\ }

colorscheme kimbox
```

### Overriding highlight groups

```lua
require("kimbox").setup({
  colors = {
    bright_orange = "#ff8800",    -- define a new color
    green = '#00ffaa',            -- redefine an existing color
  },
  highlights = {
    TSKeyword = {fg = '$green'},
    TSString = {fg = '$bright_orange', bg = '#00ff00', fmt = 'bold'},
    TSFunction = {fg = '#0000ff', sp = '$cyan', fmt = 'underline,italic'},
  }
})
```

## Filetype Support

Treesitter is preferred for most filetypes (not Zsh).
All of the following languages have been manually configured.

- Markdown
- Latex
- Javascript
- Typescript
- JavascriptReact TypescriptReact
- Dart
- CoffeeScript
- ObjectiveC
- Python
- Kotlin
- Scala
- Go
- Rust
- Swift
- PHP
- Ruby
- Haskell
- Perl
- Lua
- Teal
- Erlang
- Ocaml
- Elixir
- Clojure
- R
- Matlab
- Vimscript
- C/C++
- Bash/Dash
- Zsh
- Zig
- Dosini
- Makefile
- Json
- Yaml
- Toml
- Ron (Rust Object Notation)
- Git commit

## Plugin Support
- If any plugin is not supported and you would like for it to be, please let me know.

- [TreeSitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [Vimtex](https://github.com/lervag/vimtex)
- [Vim-Javascript](https://github.com/pangloss/vim-javascript)
- [yajs](https://github.com/othree/yajs.vim,)
- [vim-jsx-pretty](https://github.com/maxmellon/vim-jsx-pretty)
- [vim-typescript](https://github.com/leafgarland/typescript-vim)
- [yats](https:github.com/HerringtonDarkholme/yats.vim)
- [dart-lang](https://github.com/dart-lang/dart-vim-plugin)
- [vim-coffee-script](https://github.com/kchmck/vim-coffee-script)
- [python-syntax](https://github.com/vim-python/python-syntax,)
- [semshi](https://github.com/numirias/semshi,)
- [kotlin-vim](https://github.com/udalov/kotlin-vim)
- [vim-scala](https://github.com/derekwyatt/vim-scala)
- [rust.vim](https://github.com/rust-lang/rust.vim)
- [swift.vim](https://github.com/keith/swift.vim)
- [php.vim](https://github.com/StanAngeloff/php.vim)
- [vim-ruby](https://github.com/vim-ruby/vim-ruby)
- [haskell-vim](https://github.com/neovimhaskell/haskell-vim)
- [vim-perl](https://github.com/vim-perl/vim-perl)
- [vim-ocaml](https://github.com/rgrinberg/vim-ocaml)
- [vim-erlang-runtime](https://github.com/vim-erlang/vim-erlang-runtime)
- [vim-elixir](https://github.com/elixir-editors/vim-elixir)
- [vim-clojure-static](https://github.com/guns/vim-clojure-static)
- [Nvim-R](https://github.com/jalvesaq/Nvim-R)
- [vimwiki](https://github.com/vimwiki/vimwiki)
- [ron.vim](https://github.com/ron-rs/ron.vim)
- [LSP Diagnostics](https://neovim.io/doc/user/lsp.html)
- [LSP Trouble](https://github.com/folke/lsp-trouble.nvim)
- [LSP Saga](https://github.com/glepnir/lspsaga.nvim)
- [Coc.nvim](https://github.com/neoclide/coc.nvim)
- [Ale](https://github.com/dense-analysis/ale)
- [Neomake](https://github.com/neomake/neomake)
- [Vista.vim](https://github.com/liuchengxu/vista.vim)
- [NerdTree](https://github.com/preservim/nerdtree)
- [Coc-Explorer](https://github.com/weirongxu/coc-explorer)
- [NvimTree](https://github.com/kyazdani42/nvim-tree.lua)
- [Neogit](https://github.com/TimUntersberger/neogit)
- [Git Signs](https://github.com/lewis6991/gitsigns.nvim)
- [Git Gutter](https://github.com/airblade/vim-gitgutter)
- [DiffView](https://github.com/sindrets/diffview.nvim)
- [EasyMotion](https://github.com/easymotion/vim-easymotion)
- [Startify](https://github.com/mhinz/vim-startify)
- [Dashboard](https://github.com/glepnir/dashboard-nvim)
- [Floaterm](https://github.com/voldikss/vim-floaterm)
- [WhichKey](https://github.com/liuchengxu/vim-which-key)
- [Hop](https://github.com/phaazon/hop.nvim)
- [vim-sneak](https://github.com/justinmk/vim-sneak)
- [Lightspeed](https://github.com/ggandor/lightspeed.nvim)
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [Treesitter Rainbow](https://github.com/p00f/nvim-ts-rainbow)
- [Indent Blankline](https://github.com/lukas-reineke/indent-blankline.nvim)
- [Fern](https://github.com/lambdalisue/fern.vim)
- [Barbar](https://github.com/romgrk/barbar.nvim)
- [BufferLine](https://github.com/akinsho/nvim-bufferline.lua)
- [Lualine](https://github.com/hoob3rt/lualine.nvim)
- [Lightline](https://github.com/itchyny/lightline.vim)

### TODO
- Create some sort of documentation
- Create a precompiled version
- Allow changing of backgrounds with keybinding
- Allow disabling of languages

#### Language
- There is support for these file types; however, they haven't been specifically tailored to this theme
- Html
- Xml
- CSS
- SCSS
- Less
- Java

## Thanks to

- [glepnir/oceanic-material](https://github.com/glepnir/oceanic-material)
- [navarasu/onedark.nvim](https://github.com/navarasu/onedark.nvim)
