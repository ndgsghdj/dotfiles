require("lsp")
-- Set up package manager
vim.cmd [[packadd packer.nvim]]
require('packer').startup(function(use)
    -- Plugins
    use 'wbthomason/packer.nvim'
    use { 'iamcco/markdown-preview.nvim', run = 'cd app && npm install', ft = {'markdown', 'vim-plug'} }
    use 'SirVer/ultisnips'
    use 'lervag/vimtex'
    use 'KeitaNakamura/tex-conceal.vim'
    use 'dhruvasagar/vim-table-mode'
    use 'mzlogin/vim-markdown-toc'
    use 'shaunsingh/seoul256.nvim'
    use 'bullets-vim/bullets.vim'
    use 'whatyouhide/vim-gotham'
    use 'yorickpeterse/happy_hacking.vim'
    use 'nvim-lua/plenary.nvim'
    use 'stevearc/dressing.nvim'
    use 'akinsho/flutter-tools.nvim'
    use 'natebosch/dartlang-snippets'
    use 'folke/tokyonight.nvim'
    use { 'nvim-telescope/telescope.nvim', tag = '0.1.6' }
    use 'ellisonleao/glow.nvim'
    use 'MunifTanjim/nui.nvim'
    use 'google/executor.nvim'
    use 'nvim-treesitter/nvim-treesitter'
    use 'TobinPalmer/pastify.nvim'
    use 'img-paste-devs/img-paste.vim'
    use 'Al0den/tester.nvim'
    use 'Al0den/notion.nvim'
    use 'sotte/presenting.nvim'
    use 'amarakon/nvim-lua-script'
    use 'amarakon/nvim-unfocused-cursor'
    use 'stevearc/oil.nvim'
    use 'chrisbra/unicode.vim'
    use 'mfussenegger/nvim-dap'
    use 'nvim-neotest/nvim-nio'
    use 'rcarriga/nvim-dap-ui'
    use 'wojciech-kulik/xcodebuild.nvim'
    use 'windwp/nvim-autopairs'
    use 'nvim-tree/nvim-web-devicons'
    use 'b0o/incline.nvim'
    use 'Pocco81/true-zen.nvim'
    use 'dgox16/devicon-colorscheme.nvim'
    use 'nvim-zh/colorful-winsep.nvim'
    use { 'AlphaTechnolog/pywal.nvim', as = 'pywal' }
    use 'nvim-lualine/lualine.nvim'
    use 'xiyaowong/transparent.nvim'
    use 'dylanaraps/wal.vim'
    use 'sonjiku/yawnc.nvim'
    use 'echasnovski/mini.tabline'
    use 'metakirby5/codi.vim'
    use 'MeanderingProgrammer/render-markdown.nvim'
    use 'jaimecgomezz/here.term'
    use({
        "stevearc/conform.nvim",
        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    lua = { "stylua" },
                    -- Conform will run multiple formatters sequentially
                    python = { "isort", "black" },
                    -- You can customize some of the format options for the filetype (:help conform.format)
                    rust = { "rustfmt", lsp_format = "fallback" },
                    -- Conform will run the first available formatter
                    javascript = { "prettierd", "prettier", stop_after_first = true },
                },
            })
        end,
    })
    use {
        "startup-nvim/startup.nvim",
        requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim", "nvim-telescope/telescope-file-browser.nvim"},
        config = function()
            require"startup".setup()
        end
    }
    use 'adelarsq/image_preview.nvim'
    use({
        "kylechui/nvim-surround",
    })
    use { "catppuccin/nvim", as = "catppuccin" }
    use { "ellisonleao/gruvbox.nvim" }
    use "rebelot/kanagawa.nvim"
    use({'VonHeikemen/lsp-zero.nvim', branch = 'v4.x'})
    use({'neovim/nvim-lspconfig'})
    use({'hrsh7th/nvim-cmp'})
    use({'hrsh7th/cmp-nvim-lsp'})
    use({
        "toppair/peek.nvim",
        config = function()
            require("peek").setup()
            vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
            vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
        end,
        app = 'browser',
        build = "deno task --quiet build:fast",
    })
end)

-- Settings
vim.opt.spelllang = 'en_gb'
vim.opt.spell = true
vim.g.tex_flavor = 'latex'
vim.g.vimtex_view_method = 'zathura'
vim.g.vimtex_quickfix_mode = 0
vim.g.tex_conceal = 'abdmg'
vim.g.mkdp_markdown_css = '/Users/nikolawinata/.config/nvim/customStyle.css'
vim.g.mkdp_highlight_css = '/Users/nikolawinata/.cache/wal/colors.css'
vim.g.bullets_outline_levels = { 'ROM', 'ABC', 'num', 'std-', 'std*', 'std+' }
vim.g.table_mode_corner = '|'
vim.g.UltiSnipsExpandTrigger = '<Tab>'
vim.g.UltiSnipsJumpForwardTrigger = '<Tab>'
vim.g.UltiSnipsJumpBackwardTrigger = '<S-Tab>'
vim.g.UltiSnipsSnippetDirectories = { os.getenv('HOME') .. '/.vim/UltiSnips' }
vim.g.python_host_prog = '/Users/nikolawinata/venvs/.nvim-venv/bin/python'
vim.g.python3_host_prog = '/Users/nikolawinata/venvs/.nvim-venv/bin/python'
vim.g.bullets_set_mappings = 1
vim.g.mdip_imgdir = vim.fn.expand('%:r')
vim.g.mapleader = ','
vim.g.localmapleader = ','
-- Configuration here, or leave empty to use defaults
-- Configuration here, or leave empty to use defaults
-- Configuration here, or leave empty to use defaults

-- Line and tab settings
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.lbr = true
vim.opt.tw = 500
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ai = true
vim.opt.si = true
vim.opt.wrap = true

vim.g.neovide_padding_top = 5
vim.g.neovide_padding_bottom = 5
vim.g.neovide_padding_right = 5
vim.g.neovide_padding_left = 5

vim.g.neovide_transparency = 0.7
vim.g.neovide_window_blurred = true

-- Colors
vim.cmd('colorscheme pywal')
vim.cmd('highlight Conceal ctermbg=none')

-- Key mappings
vim.api.nvim_set_keymap('n', '<leader>n', ':NERDTreeFocus<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-n>', ':NERDTree<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-t>', ':NERDTreeToggle<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-f>', ':NERDTreeFind<CR>', { noremap = true })
vim.api.nvim_set_keymap('x', '<leader>a', '<Plug>(coc-codeaction-selected)', {})
vim.api.nvim_set_keymap('n', '<leader>a', '<Plug>(coc-codeaction-selected)', {})
vim.api.nvim_set_keymap('n', '<leader>av', ':lua AddVocabFromLine()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ra', ':TableModeRealign<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>Telescope help_tags<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>ni', ':e $NOTES_DIR/index.md<CR>:cd $NOTES_DIR<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>p', '<Plug>MarkdownPreview', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-A>', '<C-O>yiW<End>=<C-R>=<C-R>0<CR>', { noremap = true, silent = true })

-- Functions
function AddVocabFromLine()
    local line = vim.fn.getline('.')
    local matchlist = vim.fn.matchlist(line, '\\v\\|\\s*\\|\\s*(\\d+)\\s*\\|\\s*([^|]+)\\s*\\|\\s*([^|]+)\\s*\\|\\s*([^|]+)\\s*\\|')
    if #matchlist == 0 then
        print('No match found')
        return
    end

    local phrase, pinyin, meaning = matchlist[2], matchlist[3], matchlist[4]
    local cmd = 'vocab -a "' .. phrase .. '" "' .. pinyin .. '" "' .. meaning .. '"'
    vim.fn.system(cmd)
    print('Added: ' .. phrase .. ' (' .. pinyin .. ') - ' .. meaning)
end

vim.api.nvim_create_user_command('AddVocabFromLine', AddVocabFromLine, {})
vim.api.nvim_set_keymap('n', '<leader>av', ':AddVocabFromLine<CR>', { noremap = true })

-- Plugin configurations
require('lualine').setup({ theme = 'yawnc' })
require('pywal').setup()
require('transparent').setup()
require('devicon-colorscheme').setup({
    colors = {
        blue = "#89b4fa",
        cyan = "#74c7ec",
        green = "#a6e3a1",
        magenta = "#eba0ac",
        orange = "#fab387",
        purple = "#cba6f7",
        red = "#f38ba8",
        white = "#f5e0dc",
        yellow = "#f9e2af",
        bright_blue = "#89dceb",
        bright_cyan = "#99c9ce",
        bright_green = "#9dc6ac",
        bright_magenta = "#ecaad6",
        bright_orange = "#ffae9f",
        bright_purple = "#b9aeda",
        bright_red = "#f591b2",
        bright_yellow = "#f0c5a9",
    }
})
require('true-zen').setup()
require('tester').setup()
require('notion').setup()
require('nvim-autopairs').setup()
require('executor').setup({})
require('glow').setup()
require('presenting').setup({})
require('unfocused-cursor').setup()
require('oil').setup({
    default_file_explorer = true,
    skip_confirm_for_simple_edits = true,
    view_options = {
        show_hidden = true,
        natural_order = true,
        is_always_hidden = function(name, _) return name == '..' or name == '.git' end
    },
    win_options = { wrap = true }
})
require("startup").setup({theme = "dashboard"}) -- put theme name here
require("image_preview").setup({})
require("nvim-surround").setup({})
require("flutter-tools").setup({})
