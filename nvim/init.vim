""" Moonlight58 init.vim """

""" Vim-Plug
call plug#begin()

" Core (treesitter, nvim-lspconfig, nvim-cmp, nvim-telescope, nvim-lualine)
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'nvim-treesitter/playground'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'stevearc/aerial.nvim'

" Functionalities
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'mhinz/vim-signify'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-abolish'
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdcommenter'
Plug 'Yggdroot/indentLine'
Plug 'chrisbra/Colorizer'
Plug 'KabbAmine/vCoolor.vim'
Plug 'dkarter/bullets.vim'
Plug 'wellle/context.vim'
Plug 'antoinemadec/FixCursorHold.nvim'

" Functionalities - Python
Plug 'psf/black', { 'branch': 'stable' }
Plug 'heavenshell/vim-pydocstring'

" Aesthetics - Colorschemes
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'zaki/zazen'
Plug 'yuttie/hydrangea-vim'

" Aesthetics - Others
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-journal'

" Markdown Preview
Plug 'MeanderingProgrammer/render-markdown.nvim'
Plug 'echasnovski/mini.nvim'

" Discord Rich Presence
Plug 'andweeb/presence.nvim'

call plug#end()

""" Main Configurations
filetype plugin indent on
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent
set incsearch ignorecase smartcase hlsearch
set wildmode=longest,list,full wildmenu
set ruler laststatus=2 showcmd showmode
set list listchars=trail:»,tab:»-
set fillchars+=vert:\ 
set wrap breakindent
set encoding=utf-8
set textwidth=0
set hidden
set number
set title
set clipboard=unnamedplus   " using system clipboard

""" Filetype-Specific Configurations

" HTML, XML, Jinja
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType xml setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango inoremap {{ {{  }}<left><left><left>
autocmd FileType htmldjango inoremap {% {%  %}<left><left><left>
autocmd FileType htmldjango inoremap {# {#  #}<left><left><left>

" Markdown and Journal
autocmd FileType markdown setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType journal setlocal shiftwidth=2 tabstop=2 softtabstop=2

""" Coloring

" Functions and autocmds to run whenever changing colorschemes
function! TransparentBackground()
    highlight Normal guibg=NONE ctermbg=NONE
    highlight LineNr guibg=NONE ctermbg=NONE
    set fillchars+=vert:\│
    highlight WinSeparator gui=NONE guibg=NONE guifg=#444444 cterm=NONE ctermbg=NONE ctermfg=gray
    highlight VertSplit gui=NONE guibg=NONE guifg=#444444 cterm=NONE ctermbg=NONE ctermfg=gray
endfunction

" Use these colors for Pmenu, CmpPmenusBorder and TelescopeBorder when using dracula colorscheme
function! DraculaTweaks()
    " Pmenu colors when not using bordered windows
    highlight Pmenu guibg=#363948
    highlight PmenuSbar guibg=#363948
    " Completion/documentation Pmenu border color when using bordered windows
    highlight link CmpPmenuBorder NonText
    " Telescope borders
    highlight link TelescopeBorder Constant
endfunction

augroup MyColors
    autocmd!
    autocmd ColorScheme dracula call DraculaTweaks()
    "autocmd ColorScheme * call TransparentBackground() " uncomment if you are using a translucent terminal and you want nvim to use that
augroup END

color dracula
set termguicolors

""" Core plugin configuration (vim)

" Treesitter
augroup DraculaTreesitterSourcingFix
    autocmd!
    autocmd ColorScheme dracula runtime after/plugin/dracula.vim
    syntax on
augroup end

" nvim-cmp
set completeopt=menu,menuone,noselect

" signify
let g:signify_sign_add = '│'
let g:signify_sign_delete = '│'
let g:signify_sign_change = '│'
hi DiffDelete guifg=#ff5555 guibg=none

" indentLine
let g:indentLine_char = '▏'
let g:indentLine_defaultGroup = 'NonText'
" Disable indentLine from concealing json and markdown syntax (e.g. ```)
let g:vim_json_syntax_conceal = 0
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

" FixCursorHold for better performance
let g:cursorhold_updatetime = 100

" context.vim
let g:context_nvim_no_redraw = 1

" Neovim :Terminal
tmap <Esc> <C-\><C-n>
tmap <C-w> <Esc><C-w>
"tmap <C-d> <Esc>:q<CR>
autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert

" Python
let g:python3_host_prog = '~/.config/nvim/env/bin/python3'
let g:pydocstring_doq_path = '~/.config/nvim/env/bin/doq'

""" Core plugin configuration (lua)
lua << EOF
servers = {
    'pyright',
    --'tsserver', -- uncomment for typescript. See https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md for other language servers
}
require('treesitter-config')
require('nvim-cmp-config')
require('lspconfig-config')
require('telescope-config')
require('lualine-config')
require('nvim-tree-config')
require('diagnostics')

require('render-markdown').setup({
    -- You can customize the options here, for example:
    -- enabled = true,
    -- win_options = {
    --     conceallevel = { default = vim.o.conceallevel, rendered = 3 },
    --     concealcursor = { default = vim.o.concealcursor, rendered = '' },
    -- },
})

require('aerial').setup({
  on_attach = function(bufnr)
    vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', {buffer = bufnr})
    vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', {buffer = bufnr})
  end,
  layout = {
    default_direction = "prefer_right",
    placement = "edge",
  },
})

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    require("nvim-tree.api").tree.open()
  end
})

-- Find Replace string Project Wide Context
vim.api.nvim_create_user_command(
  'ProjectFindReplace',
  function(opts)
    local args = vim.split(opts.args, " ")

    if #args < 3 then
      print("Usage: :ProjectFindReplace <old> <new> <extension>")
      return
    end

    local old = args[1]
    local new = args[2]
    local ext = args[3]

    -- Escape literal dots in regex
    local old_escaped = old:gsub("([%.])", "\\%1")

    -- Build file glob
    local glob = "*." .. ext

    -- Run grep
    vim.cmd(string.format("grep %s -g '%s'", old, glob))

    -- Apply replacement across all matches
    vim.cmd(string.format("cfdo %%s/%s/%s/ge | update", old_escaped, new))

    print("Replacement done for *." .. ext)
  end,
  { nargs = "*" }
)



local function sort_c_functions(opts)
    local start_line, end_line

    -- If no range was provided, use the entire buffer
    if opts.range == 0 then
        start_line = 0
        end_line = vim.api.nvim_buf_line_count(0)
    else
        start_line = opts.line1 - 1
        end_line = opts.line2
    end

    local lines = vim.api.nvim_buf_get_lines(0, start_line, end_line, false)
    local blocks = {}
    local current = nil
    local brace_level = 0

    local function is_func_decl(line)
        return line:match("^%s*[%w_%*%s]+%s+[%w_]+%s*%(")
    end

    local function is_comment(line)
        if line:match("^%s*//") then return true end
        if line:match("^%s*/%*") then return true end
        if line:match("%*/%s*$") then return true end
        return false
    end

    -- Pull comment block above a function
    local function pull_comment_block(index)
        local comment_block = {}
        local i = index - 1

        while i >= 1 do
            local line = lines[i]
            if line:match("^%s*$") then
                table.insert(comment_block, 1, line)

            elseif is_comment(line) then
                table.insert(comment_block, 1, line)

                -- If block comment start found, keep going upward
                if line:match("^%s*/%*") then
                    -- Continue until block comment ends
                    i = i - 1
                    while i >= 1 and not lines[i]:match("%*/%s*$") do
                        table.insert(comment_block, 1, lines[i])
                        i = i - 1
                    end
                    if i >= 1 then
                        table.insert(comment_block, 1, lines[i])
                    end
                end

            else
                break
            end
            i = i - 1
        end

        return comment_block
    end

    local i = 1
    while i <= #lines do
        local line = lines[i]

        if not current and is_func_decl(line) then
            -- Pull the comment block ABOVE the function
            local comments = pull_comment_block(i)

            current = {
                header = line,
                body = {},
                full_block = comments,
            }

            for _, c in ipairs(comments) do
                table.insert(current.full_block, c)
            end
            table.insert(current.full_block, line)

            brace_level = select(2, line:gsub("{", ""))
                        - select(2, line:gsub("}", ""))

        elseif current then
            table.insert(current.full_block, line)
            brace_level = brace_level + select(2, line:gsub("{", ""))
                        - select(2, line:gsub("}", ""))

            if brace_level == 0 then
                table.insert(blocks, current)
                current = nil
            end
        end

        i = i + 1
    end

    -- Sort by function name (header line)
    table.sort(blocks, function(a, b)
        return a.header < b.header
    end)

    -- Rebuild output
    local out = {}
    for _, blk in ipairs(blocks) do
        vim.list_extend(out, blk.full_block)
        table.insert(out, "")
    end

    vim.api.nvim_buf_set_lines(0, start_line, end_line, false, out)
end

vim.api.nvim_create_user_command(
    "SortCFunctions",
    sort_c_functions,
    { range = true }
)

EOF


""" Custom Functions

" Trim Whitespaces
function! TrimWhitespace()
    let l:save = winsaveview()
    %s/\\\@<!\s\+$//e
    call winrestview(l:save)
endfunction

""" Custom Mappings (vim) (lua custom mappings are within individual lua config files)

" Core
let mapleader=","
nmap <leader>q :NvimTreeFindFileToggle<CR>
nmap \ <leader>q
nmap <leader>r :so ~/.config/nvim/init.vim<CR>
nmap <leader>t :call TrimWhitespace()<CR>
xmap <leader>a gaip*
nmap <leader>a gaip*
nmap <leader>h :RainbowParentheses!!<CR>
nmap <leader>j :set filetype=journal<CR>
nmap <leader>k :ColorToggle<CR>
nmap <leader>l :Limelight!!<CR>
xmap <leader>l :Limelight!!<CR>
nmap <silent> <leader><leader> :noh<CR>
nmap <Tab> :bnext<CR>
nmap <S-Tab> :bprevious<CR>
nmap <leader>$s <C-w>s<C-w>j:terminal<CR>:set nonumber<CR><S-a>
nmap <leader>$v <C-w>v<C-w>l:terminal<CR>:set nonumber<CR><S-a>
nmap <leader>o :AerialToggle!<CR>
nmap <leader>vt :vsplit<CR>

" Python
autocmd Filetype python nmap <leader>d <Plug>(pydocstring)
autocmd FileType python nmap <leader>p :Black<CR>

" Solidity (requires: npm install --save-dev prettier prettier-plugin-solidity)
autocmd Filetype solidity nmap <leader>p :0,$!npx prettier %<CR>

" Telescope mappings
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fc <cmd>Telescope colorscheme<cr>
nnoremap <leader>f/ <cmd>Telescope current_buffer_fuzzy_find<cr>

