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
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
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
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'enricobacis/vim-airline-clock'
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
call plug#end()

let g:airline_theme='catppuccin'

let g:bullets_outline_levels = ['ROM', 'ABC', 'num', 'std-', 'std*', 'std+']

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
require("catppuccin").setup({
--transparent_background = true
    term_colors = true,
    color_overrides = {
		mocha = {
			rosewater = "#efc9c2",
			flamingo = "#ebb2b2",
			pink = "#f2a7de",
			mauve = "#b889f4",
			red = "#ea7183",
			maroon = "#ea838c",
			peach = "#f39967",
			yellow = "#eaca89",
			green = "#96d382",
			teal = "#78cec1",
			sky = "#91d7e3",
			sapphire = "#68bae0",
			blue = "#739df2",
			lavender = "#a0a8f6",
			text = "#b5c1f1",
			subtext1 = "#a6b0d8",
			subtext0 = "#959ec2",
			overlay2 = "#848cad",
			overlay1 = "#717997",
			overlay0 = "#63677f",
			surface2 = "#505469",
			surface1 = "#3e4255",
			surface0 = "#2c2f40",
			base = "#1a1c2a",
			mantle = "#141620",
			crust = "#0e0f16",
		},
	},
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = {
            enabled = true,
            indentscope_color = "",
        },
    }
})
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

require('render-markdown').setup({
-- Configure whether Markdown should be rendered by default or not
start_enabled = true,
-- Capture groups that get pulled from markdown
markdown_query = [[
(atx_heading [
    (atx_h1_marker)
    (atx_h2_marker)
    (atx_h3_marker)
    (atx_h4_marker)
    (atx_h5_marker)
    (atx_h6_marker)
    ] @heading)

(thematic_break) @dash

(fenced_code_block) @code

[
(list_marker_plus)
(list_marker_minus)
(list_marker_star)
] @list_marker

        (task_list_marker_unchecked) @checkbox_unchecked
        (task_list_marker_checked) @checkbox_checked

        (block_quote (block_quote_marker) @quote_marker)
        (block_quote (paragraph (inline (block_continuation) @quote_marker)))

        (pipe_table) @table
        (pipe_table_header) @table_head
        (pipe_table_delimiter_row) @table_delim
        (pipe_table_row) @table_row
        ]],
    -- Capture groups that get pulled from inline markdown
    inline_query = [[
    (code_span) @code
    ]],
-- The level of logs to write to file: vim.fn.stdpath('state') .. '/render-markdown.log'
-- Only intended to be used for plugin development / debugging
log_level = 'error',
-- Filetypes this plugin will run on
file_types = { 'markdown' },
-- Vim modes that will show a rendered view of the markdown file
-- All other modes will be uneffected by this plugin
render_modes = { 'n', 'c' },
-- Characters that will replace the # at the start of headings
-- headings = {"# ", "## ", "### ", "#### ", "##### ", "###### "}, 
headings = {"◨ ", "◨ ", "◨ ", "◨ ", "◨ ", "◨ " }, 
--headings = { '?? ', '?? ', '?? ', '?? ', '?? ', '?? ' },
-- Character to use for the horizontal break
dash = '—',
-- Character to use for the bullet points in lists
bullets = { '●', '○', '◆', '◇' },
checkbox = {
    -- Character that will replace the [ ] in unchecked checkboxes
    unchecked = '[  ]',
    -- Character that will replace the [x] in checked checkboxes
    checked = '[x]',
    },
    -- Character that will replace the > at the start of block quotes
    quote = '┃',
    -- See :h 'conceallevel' for more information about meaning of values
    conceal = {
        -- conceallevel used for buffer when not being rendered, get user setting
        default = vim.opt.conceallevel:get(),
        -- conceallevel used for buffer when being rendered
        rendered = 3,
        },
        -- Add a line above and below tables to complete look, ends up like a window
        fat_tables = true,
        -- Define the highlight groups to use when rendering various components
        highlights = {
            heading = {
                -- Background of heading line
                backgrounds = { 'DiffAdd', 'DiffChange', 'DiffDelete' },
                -- Foreground of heading character only
                foregrounds = {
                    'markdownH1',
                    'markdownH2',
                    'markdownH3',
                    'markdownH4',
                    'markdownH5',
                    'markdownH6',
                    },
                },
            -- Horizontal break
            dash = 'LineNr',
            -- Code blocks
            code = 'ColorColumn',
            -- Bullet points in list
            bullet = 'Normal',
            checkbox = {
                -- Unchecked checkboxes
                unchecked = '@markup.list.unchecked',
                -- Checked checkboxes
                checked = '@markup.heading',
                },
            table = {
                -- Header of a markdown table
                head = '@markup.heading',
                -- Non header rows in a markdown table
                row = 'Normal',
                },
            -- LaTeX blocks
            latex = '@markup.math',
            -- Quote character in a block quote
            quote = '@markup.quote',
            },
})


EOF

colorscheme catppuccin

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

inoremap jk <Esc>

"hi Normal guibg=NONE ctermbg=NONE
