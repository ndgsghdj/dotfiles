-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/nikolawinata/.cache/nvim/packer_hererocks/2.1.1727870382/share/lua/5.1/?.lua;/Users/nikolawinata/.cache/nvim/packer_hererocks/2.1.1727870382/share/lua/5.1/?/init.lua;/Users/nikolawinata/.cache/nvim/packer_hererocks/2.1.1727870382/lib/luarocks/rocks-5.1/?.lua;/Users/nikolawinata/.cache/nvim/packer_hererocks/2.1.1727870382/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/nikolawinata/.cache/nvim/packer_hererocks/2.1.1727870382/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["bullets.vim"] = {
    loaded = true,
    path = "/Users/nikolawinata/.local/share/nvim/site/pack/packer/start/bullets.vim",
    url = "https://github.com/bullets-vim/bullets.vim"
  },
  catppuccin = {
    loaded = true,
    path = "/Users/nikolawinata/.local/share/nvim/site/pack/packer/start/catppuccin",
    url = "https://github.com/catppuccin/nvim"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/nikolawinata/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["codi.vim"] = {
    loaded = true,
    path = "/Users/nikolawinata/.local/share/nvim/site/pack/packer/start/codi.vim",
    url = "https://github.com/metakirby5/codi.vim"
  },
  ["colorful-winsep.nvim"] = {
    loaded = true,
    path = "/Users/nikolawinata/.local/share/nvim/site/pack/packer/start/colorful-winsep.nvim",
    url = "https://github.com/nvim-zh/colorful-winsep.nvim"
  },
  ["conform.nvim"] = {
    config = { "\27LJ\2\n®\2\0\0\5\0\14\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\f\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\3=\3\r\2B\0\2\1K\0\1\0\21formatters_by_ft\1\0\1\21formatters_by_ft\0\15javascript\1\3\1\0\14prettierd\rprettier\21stop_after_first\2\trust\1\2\1\0\frustfmt\15lsp_format\rfallback\vpython\1\3\0\0\nisort\nblack\blua\1\0\4\15javascript\0\vpython\0\trust\0\blua\0\1\2\0\0\vstylua\nsetup\fconform\frequire\0" },
    loaded = true,
    path = "/Users/nikolawinata/.local/share/nvim/site/pack/packer/start/conform.nvim",
    url = "https://github.com/stevearc/conform.nvim"
  },
  ["dartlang-snippets"] = {
    loaded = true,
    path = "/Users/nikolawinata/.local/share/nvim/site/pack/packer/start/dartlang-snippets",
    url = "https://github.com/natebosch/dartlang-snippets"
  },
  ["devicon-colorscheme.nvim"] = {
    loaded = true,
    path = "/Users/nikolawinata/.local/share/nvim/site/pack/packer/start/devicon-colorscheme.nvim",
    url = "https://github.com/dgox16/devicon-colorscheme.nvim"
  },
  ["dressing.nvim"] = {
    loaded = true,
    path = "/Users/nikolawinata/.local/share/nvim/site/pack/packer/start/dressing.nvim",
    url = "https://github.com/stevearc/dressing.nvim"
  },
  ["executor.nvim"] = {
    loaded = true,
    path = "/Users/nikolawinata/.local/share/nvim/site/pack/packer/start/executor.nvim",
    url = "https://github.com/google/executor.nvim"
  },
  ["flutter-tools.nvim"] = {
    loaded = true,
    path = "/Users/nikolawinata/.local/share/nvim/site/pack/packer/start/flutter-tools.nvim",
    url = "https://github.com/akinsho/flutter-tools.nvim"
  },
  ["glow.nvim"] = {
    loaded = true,
    path = "/Users/nikolawinata/.local/share/nvim/site/pack/packer/start/glow.nvim",
    url = "https://github.com/ellisonleao/glow.nvim"
  },
  ["gruvbox.nvim"] = {
    loaded = true,
    path = "/Users/nikolawinata/.local/share/nvim/site/pack/packer/start/gruvbox.nvim",
    url = "https://github.com/ellisonleao/gruvbox.nvim"
  },
  ["happy_hacking.vim"] = {
    loaded = true,
    path = "/Users/nikolawinata/.local/share/nvim/site/pack/packer/start/happy_hacking.vim",
    url = "https://github.com/yorickpeterse/happy_hacking.vim"
  },
  ["here.term"] = {
    loaded = true,
    path = "/Users/nikolawinata/.local/share/nvim/site/pack/packer/start/here.term",
    url = "https://github.com/jaimecgomezz/here.term"
  },
  ["image_preview.nvim"] = {
    loaded = true,
    path = "/Users/nikolawinata/.local/share/nvim/site/pack/packer/start/image_preview.nvim",
    url = "https://github.com/adelarsq/image_preview.nvim"
  },
  ["img-paste.vim"] = {
    loaded = true,
    path = "/Users/nikolawinata/.local/share/nvim/site/pack/packer/start/img-paste.vim",
    url = "https://github.com/img-paste-devs/img-paste.vim"
  },
  ["incline.nvim"] = {
    loaded = true,
    path = "/Users/nikolawinata/.local/share/nvim/site/pack/packer/start/incline.nvim",
    url = "https://github.com/b0o/incline.nvim"
  },
  ["kanagawa.nvim"] = {
    loaded = true,
    path = "/Users/nikolawinata/.local/share/nvim/site/pack/packer/start/kanagawa.nvim",
    url = "https://github.com/rebelot/kanagawa.nvim"
  },
  ["lsp-zero.nvim"] = {
    loaded = true,
    path = "/Users/nikolawinata/.local/share/nvim/site/pack/packer/start/lsp-zero.nvim",
    url = "https://github.com/VonHeikemen/lsp-zero.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/Users/nikolawinata/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/nikolawinata/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["mini.tabline"] = {
    loaded = true,
    path = "/Users/nikolawinata/.local/share/nvim/site/pack/packer/start/mini.tabline",
    url = "https://github.com/echasnovski/mini.tabline"
  },
  ["notion.nvim"] = {
    loaded = true,
    path = "/Users/nikolawinata/.local/share/nvim/site/pack/packer/start/notion.nvim",
    url = "https://github.com/Al0den/notion.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/Users/nikolawinata/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/Users/nikolawinata/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/Users/nikolawinata/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/Users/nikolawinata/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    loaded = true,
    path = "/Users/nikolawinata/.local/share/nvim/site/pack/packer/start/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/nikolawinata/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-lua-script"] = {
    loaded = true,
    path = "/Users/nikolawinata/.local/share/nvim/site/pack/packer/start/nvim-lua-script",
    url = "https://github.com/amarakon/nvim-lua-script"
  },
  ["nvim-nio"] = {
    loaded = true,
    path = "/Users/nikolawinata/.local/share/nvim/site/pack/packer/start/nvim-nio",
    url = "https://github.com/nvim-neotest/nvim-nio"
  },
  ["nvim-surround"] = {
    loaded = true,
    path = "/Users/nikolawinata/.local/share/nvim/site/pack/packer/start/nvim-surround",
    url = "https://github.com/kylechui/nvim-surround"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/nikolawinata/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-unfocused-cursor"] = {
    loaded = true,
    path = "/Users/nikolawinata/.local/share/nvim/site/pack/packer/start/nvim-unfocused-cursor",
    url = "https://github.com/amarakon/nvim-unfocused-cursor"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/nikolawinata/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["oil.nvim"] = {
    loaded = true,
    path = "/Users/nikolawinata/.local/share/nvim/site/pack/packer/start/oil.nvim",
    url = "https://github.com/stevearc/oil.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/nikolawinata/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["pastify.nvim"] = {
    loaded = true,
    path = "/Users/nikolawinata/.local/share/nvim/site/pack/packer/start/pastify.nvim",
    url = "https://github.com/TobinPalmer/pastify.nvim"
  },
  ["peek.nvim"] = {
    config = { "\27LJ\2\n¡\1\0\0\6\0\n\0\0266\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0006\3\0\0'\5\1\0B\3\2\0029\3\a\0034\4\0\0B\0\4\0016\0\3\0009\0\4\0009\0\5\0'\2\b\0006\3\0\0'\5\1\0B\3\2\0029\3\t\0034\4\0\0B\0\4\1K\0\1\0\nclose\14PeekClose\topen\rPeekOpen\29nvim_create_user_command\bapi\bvim\nsetup\tpeek\frequire\0" },
    loaded = true,
    path = "/Users/nikolawinata/.local/share/nvim/site/pack/packer/start/peek.nvim",
    url = "https://github.com/toppair/peek.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/nikolawinata/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["presenting.nvim"] = {
    loaded = true,
    path = "/Users/nikolawinata/.local/share/nvim/site/pack/packer/start/presenting.nvim",
    url = "https://github.com/sotte/presenting.nvim"
  },
  pywal = {
    loaded = true,
    path = "/Users/nikolawinata/.local/share/nvim/site/pack/packer/start/pywal",
    url = "https://github.com/AlphaTechnolog/pywal.nvim"
  },
  ["render-markdown.nvim"] = {
    loaded = true,
    path = "/Users/nikolawinata/.local/share/nvim/site/pack/packer/start/render-markdown.nvim",
    url = "https://github.com/MeanderingProgrammer/render-markdown.nvim"
  },
  ["seoul256.nvim"] = {
    loaded = true,
    path = "/Users/nikolawinata/.local/share/nvim/site/pack/packer/start/seoul256.nvim",
    url = "https://github.com/shaunsingh/seoul256.nvim"
  },
  ["startup.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fstartup\frequire\0" },
    loaded = true,
    path = "/Users/nikolawinata/.local/share/nvim/site/pack/packer/start/startup.nvim",
    url = "https://github.com/startup-nvim/startup.nvim"
  },
  ["telescope-file-browser.nvim"] = {
    loaded = true,
    path = "/Users/nikolawinata/.local/share/nvim/site/pack/packer/start/telescope-file-browser.nvim",
    url = "https://github.com/nvim-telescope/telescope-file-browser.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/nikolawinata/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["tester.nvim"] = {
    loaded = true,
    path = "/Users/nikolawinata/.local/share/nvim/site/pack/packer/start/tester.nvim",
    url = "https://github.com/Al0den/tester.nvim"
  },
  ["tex-conceal.vim"] = {
    loaded = true,
    path = "/Users/nikolawinata/.local/share/nvim/site/pack/packer/start/tex-conceal.vim",
    url = "https://github.com/KeitaNakamura/tex-conceal.vim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/Users/nikolawinata/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["transparent.nvim"] = {
    loaded = true,
    path = "/Users/nikolawinata/.local/share/nvim/site/pack/packer/start/transparent.nvim",
    url = "https://github.com/xiyaowong/transparent.nvim"
  },
  ["true-zen.nvim"] = {
    loaded = true,
    path = "/Users/nikolawinata/.local/share/nvim/site/pack/packer/start/true-zen.nvim",
    url = "https://github.com/Pocco81/true-zen.nvim"
  },
  ultisnips = {
    loaded = true,
    path = "/Users/nikolawinata/.local/share/nvim/site/pack/packer/start/ultisnips",
    url = "https://github.com/SirVer/ultisnips"
  },
  ["unicode.vim"] = {
    loaded = true,
    path = "/Users/nikolawinata/.local/share/nvim/site/pack/packer/start/unicode.vim",
    url = "https://github.com/chrisbra/unicode.vim"
  },
  ["vim-gotham"] = {
    loaded = true,
    path = "/Users/nikolawinata/.local/share/nvim/site/pack/packer/start/vim-gotham",
    url = "https://github.com/whatyouhide/vim-gotham"
  },
  ["vim-markdown-toc"] = {
    loaded = true,
    path = "/Users/nikolawinata/.local/share/nvim/site/pack/packer/start/vim-markdown-toc",
    url = "https://github.com/mzlogin/vim-markdown-toc"
  },
  ["vim-table-mode"] = {
    loaded = true,
    path = "/Users/nikolawinata/.local/share/nvim/site/pack/packer/start/vim-table-mode",
    url = "https://github.com/dhruvasagar/vim-table-mode"
  },
  vimtex = {
    loaded = true,
    path = "/Users/nikolawinata/.local/share/nvim/site/pack/packer/start/vimtex",
    url = "https://github.com/lervag/vimtex"
  },
  ["wal.vim"] = {
    loaded = true,
    path = "/Users/nikolawinata/.local/share/nvim/site/pack/packer/start/wal.vim",
    url = "https://github.com/dylanaraps/wal.vim"
  },
  ["xcodebuild.nvim"] = {
    loaded = true,
    path = "/Users/nikolawinata/.local/share/nvim/site/pack/packer/start/xcodebuild.nvim",
    url = "https://github.com/wojciech-kulik/xcodebuild.nvim"
  },
  ["yawnc.nvim"] = {
    loaded = true,
    path = "/Users/nikolawinata/.local/share/nvim/site/pack/packer/start/yawnc.nvim",
    url = "https://github.com/sonjiku/yawnc.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: conform.nvim
time([[Config for conform.nvim]], true)
try_loadstring("\27LJ\2\n®\2\0\0\5\0\14\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\f\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\3=\3\r\2B\0\2\1K\0\1\0\21formatters_by_ft\1\0\1\21formatters_by_ft\0\15javascript\1\3\1\0\14prettierd\rprettier\21stop_after_first\2\trust\1\2\1\0\frustfmt\15lsp_format\rfallback\vpython\1\3\0\0\nisort\nblack\blua\1\0\4\15javascript\0\vpython\0\trust\0\blua\0\1\2\0\0\vstylua\nsetup\fconform\frequire\0", "config", "conform.nvim")
time([[Config for conform.nvim]], false)
-- Config for: peek.nvim
time([[Config for peek.nvim]], true)
try_loadstring("\27LJ\2\n¡\1\0\0\6\0\n\0\0266\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0006\3\0\0'\5\1\0B\3\2\0029\3\a\0034\4\0\0B\0\4\0016\0\3\0009\0\4\0009\0\5\0'\2\b\0006\3\0\0'\5\1\0B\3\2\0029\3\t\0034\4\0\0B\0\4\1K\0\1\0\nclose\14PeekClose\topen\rPeekOpen\29nvim_create_user_command\bapi\bvim\nsetup\tpeek\frequire\0", "config", "peek.nvim")
time([[Config for peek.nvim]], false)
-- Config for: startup.nvim
time([[Config for startup.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fstartup\frequire\0", "config", "startup.nvim")
time([[Config for startup.nvim]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'markdown-preview.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType vim-plug ++once lua require("packer.load")({'markdown-preview.nvim'}, { ft = "vim-plug" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
