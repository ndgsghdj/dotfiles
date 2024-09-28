call plug#begin()
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'SirVer/ultisnips'
Plug 'lervag/vimtex'
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
Plug 'KeitaNakamura/tex-conceal.vim'
set conceallevel=1
let g:tex_conceal='abdmg'
hi Conceal ctermbg=none
Plug 'dhruvasagar/vim-table-mode'
Plug 'mzlogin/vim-markdown-toc'
" If you are using Vim-Plug
Plug 'shaunsingh/seoul256.nvim'
Plug 'tpope/vim-surround'
Plug 'bullets-vim/bullets.vim'
Plug 'whatyouhide/vim-gotham'
Plug 'yorickpeterse/happy_hacking.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-lua/plenary.nvim'
Plug 'stevearc/dressing.nvim' " optional for vim.ui.select
Plug 'akinsho/flutter-tools.nvim'
Plug 'natebosch/dartlang-snippets'
Plug 'folke/tokyonight.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.6' }
Plug 'ellisonleao/glow.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'google/executor.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'MeanderingProgrammer/markdown.nvim'
Plug 'wallpants/github-preview.nvim'
Plug 'TobinPalmer/pastify.nvim'
Plug 'img-paste-devs/img-paste.vim'
Plug 'Al0den/tester.nvim'
Plug 'Al0den/notion.nvim'
Plug 'sotte/presenting.nvim'
Plug 'amarakon/nvim-lua-script'
Plug 'amarakon/nvim-unfocused-cursor'
Plug 'stevearc/oil.nvim'
Plug 'chrisbra/unicode.vim'
Plug 'mfussenegger/nvim-dap'
Plug 'nvim-neotest/nvim-nio'
Plug 'rcarriga/nvim-dap-ui'
Plug 'wojciech-kulik/xcodebuild.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'nvim-tree/nvim-web-devicons' " Recommended (for coloured icons)
" Plug 'ryanoasis/vim-devicons' Icons without colours
Plug 'b0o/incline.nvim'
Plug 'Pocco81/true-zen.nvim'
Plug 'dgox16/devicon-colorscheme.nvim'
Plug 'nvim-zh/colorful-winsep.nvim'
Plug 'AlphaTechnolog/pywal.nvim', { 'as': 'pywal' }
Plug 'nvim-lualine/lualine.nvim'
Plug 'xiyaowong/transparent.nvim'
Plug 'dylanaraps/wal.vim'
Plug 'sonjiku/yawnc.nvim'
Plug 'echasnovski/mini.tabline'
Plug 'metakirby5/codi.vim'
call plug#end()

let g:mkdp_markdown_css = '/Users/nikolawinata/Documents/2024-Notes/markdown-preview.css'

let g:bullets_outline_levels = ['ROM', 'ABC', 'num', 'std-', 'std*', 'std+']
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Define a function to extract and add vocabulary
function! AddVocabFromLine()
    " Get the current line under the cursor
    let line = getline('.')

    " Extract the desired parts using regex
    let matchlist = matchlist(line, '\v\|\s*\|\s*(\d+)\s*\|\s*([^|]+)\s*\|\s*([^|]+)\s*\|\s*([^|]+)\s*\|')
    if len(matchlist) == 0
        echo "No match found"
        return
    endif

    let phrase = matchlist[2]
    let pinyin = matchlist[3]
    let meaning = matchlist[4]

    " Construct the shell command to add the vocabulary
    let cmd = 'vocab -a "' . phrase . '" "' . pinyin . '" "' . meaning . '"'

    " Execute the shell command
    call system(cmd)

    " Provide feedback to the user
    echo "Added: " . phrase . " (" . pinyin . ") - " . meaning
endfunction

" Create a command that calls the function
command! AddVocabFromLine call AddVocabFromLine()
nnoremap <leader>av :AddVocabFromLine<CR>
nnoremap <leader>ra :TableModeRealign<CR>

autocmd FileType markdown nmap <buffer><silent> <leader>v :call mdip#MarkdownClipboardImage()<CR>
" there are some defaults for image directory and image name, you can change them
let g:mdip_imgdir = expand('%:r')
" let g:mdip_imgname = 'image'

"set termguicolors
lua << EOF
require('lualine').setup({
    theme = 'yawnc'
})
require('pywal').setup()
require('transparent').setup()
require("devicon-colorscheme").setup({
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
    },
})
require("true-zen").setup({})
require("tester").setup()
require("notion").setup()
require("nvim-autopairs").setup({})
EOF
lua << EOF
require("executor").setup({})
require('glow').setup()
require('presenting').setup({})
require("unfocused-cursor").setup()
require("oil").setup(
    {
        default_file_explorer = true,
        skip_confirm_for_simple_edits = true,
        view_options = {
          show_hidden = true,
          natural_order = true,
          is_always_hidden = function(name, _)
            return name == '..' or name == '.git'
          end,
        },
        win_options = {
          wrap = true,
        }
    }
)
-- require("catppuccin").setup({
    -- transparent_background = true,
    -- flavour = "mocha",
      -- no_bold = true,
      -- no_italic = true,
      -- no_underline = true,
      -- color_overrides = {
        -- mocha = {
          -- base = "#11111b",
          -- mantle = "#11111b",
          -- crust = "#11111b",
        -- },
      -- },
      -- integrations = {
        -- cmp = true,
        -- gitsigns = true,
        -- indent_blankline = {
          -- enabled = true,
        -- },
        -- lsp_trouble = true,
        -- mason = true,
        -- native_lsp = {
          -- enabled = true,
        -- },
        -- noice = true,
        -- telescope = {
          -- enabled = true,
        -- },
        -- treesitter = true,
        -- which_key = true,
      -- },
      -- custom_highlights = function(colors)
        -- return {
          -- CurSearch = { bg = colors.yellow },
          -- CursorLineNr = { fg = colors.subtext0 },
          -- CmpBorder = { fg = colors.subtext0, bg = colors.base },
          -- Pmenu = { fg = colors.text, bg = colors.base },
          -- PmenuSel = { fg = colors.text, bg = colors.surface0 },
          -- LuaLineDiffAdd = { fg = colors.subtext0 },
          -- LuaLineDiffChange = { fg = colors.subtext0 },
          -- LuaLineDiffDelete = { fg = colors.subtext0 },
        -- }
  -- end,
    -- }
-- )
require("flutter-tools").setup({})
require("github-preview").setup({
})

require'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all" (the five listed parsers should always be installed)
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    -- List of parsers to ignore installing (or "all")
    ignore_install = { "javascript" },

    ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
    -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

    highlight = {
        enable = true,

        -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
        -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
        -- the name of the parser)
        -- list of language that will be disabled
        disable = { "c", "rust" },
        -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
        disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
            end
            end,

            -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
            -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
            -- Using this option may slow down your editor, and you may see some duplicate highlights.
            -- Instead of true it can also be a list of languages
            additional_vim_regex_highlighting = false,
            },
}

--require('render-markdown').setup({ latex = { enabled = false } })
require('mini.tabline').setup()


EOF

colorscheme pywal

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

let g:table_mode_corner='|'

xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" This code should go in your vimrc or init.vim
let g:UltiSnipsExpandTrigger       = '<Tab>'    " use Tab to expand snippets
let g:UltiSnipsJumpForwardTrigger  = '<Tab>'    " use Tab to move forward through tabstops
let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'  " use Shift-Tab to move backward through tabstops
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']

let mapleader = ","
setlocal spell
set spelllang=en_us

set number
set relativenumber

nmap <leader>p <Plug>MarkdownPreview
nmap <M-s> <Plug>MarkdownPreviewStop
nmap <C-p> <Plug>MarkdownPreviewToggle

" Go to index of notes and set working directory to my notes
nnoremap <leader>ni :e $NOTES_DIR/index.md<CR>:cd $NOTES_DIR<CR>

"inoremap $ $$<Esc>ha
"inoremap $$ $$$$<Left><Left>

let g:python_host_prog = "/Users/nikolawinata/venvs/.nvim-venv/bin/python"
let g:python3_host_prog = "/Users/nikolawinata/venvs/.nvim-venv/bin/python"

let g:bullets_set_mappings = 1

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
:noremap <leader>mm
    \ :s/ = .*//e<cr>
    \0y$
    \!!sed 's/mean/avg/;s/^/round(/;s/$/,3)/'<cr>
    \!!calc -p<cr>
    \Pa = <esc>hh
