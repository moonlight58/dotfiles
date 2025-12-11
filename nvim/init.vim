"" Moonlight58 init.vim """

""" Vim-Plug
call plug#begin()

" Core (treesitter, nvim-lspconfig, nvim-cmp, nvim-telescope, nvim-lualine)
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'nvim-treesitter/playground'
Plug 'windwp/nvim-ts-autotag'
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
Plug 'norcalli/nvim-colorizer.lua'

" Functionalities - Python
Plug 'psf/black', { 'branch': 'stable' }
Plug 'heavenshell/vim-pydocstring'

" Aesthetics - colorschemes
Plug 'scottmckendry/cyberdream.nvim', { 'as': 'cyberdream' }
Plug 'rmehri01/onenord.nvim', { 'branch': 'main', 'as': 'onenord' }
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

" Cyberdream configuration
lua << EOF
require("cyberdream").setup({
    transparent = true,
    italic_comments = true,
    hide_fillchars = true,
    borderless_telescope = false,
})
EOF

" Load the theme
colorscheme onenord
set termguicolors

""" Core plugin configuration (vim)
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
require'colorizer'.setup()

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

require('nvim-ts-autotag').setup({
  opts = {
    -- Defaults
    enable_close = true, -- Auto close tags
    enable_rename = true, -- Auto rename pairs of tags
    enable_close_on_slash = false -- Auto close on trailing </
  }
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

    if opts.range == 0 then
        start_line = 0
        end_line = vim.api.nvim_buf_line_count(0)
    else
        start_line = opts.line1 - 1
        end_line = opts.line2
    end

    local lines = vim.api.nvim_buf_get_lines(0, start_line, end_line, false)
    local blocks = {}
    local i = 1
    local n = #lines

    local function is_func_decl(line)
        return line:match("^%s*[%w_%*%s]+%s+[%w_]+%s*%(")
    end

    while i <= n do
        local line = lines[i]

        -- Try detecting function header
        if is_func_decl(line) then
            -- Collect comment lines immediately above
            local header_start = i
            local comment_block = {}

            local j = i - 1
            while j >= 1 do
                local l = lines[j]

                if l:match("^%s*$") or l:match("^%s*//") or l:match("^%s*/%*") or l:match("%*/%s*$") then
                    table.insert(comment_block, 1, l)
                    header_start = j
                    j = j - 1
                else
                    break
                end
            end

            -- Now collect function body until matching braces
            local body = {}
            local brace_level = 0
            local found_brace = false

            -- Detect initial braces on header line
            do
                local opens = select(2, line:gsub("{", ""))
                local closes = select(2, line:gsub("}", ""))
                brace_level = brace_level + opens - closes
                if opens > 0 then found_brace = true end
            end

            table.insert(body, line)
            i = i + 1

            -- Continue until function body ends
            while i <= n do
                local l = lines[i]
                table.insert(body, l)

                local opens = select(2, l:gsub("{", ""))
                local closes = select(2, l:gsub("}", ""))
                brace_level = brace_level + opens - closes

                if opens > 0 then found_brace = true end

                if found_brace and brace_level == 0 then
                    break
                end

                i = i + 1
            end

            local full_block = {}
            vim.list_extend(full_block, comment_block)
            vim.list_extend(full_block, body)

            table.insert(blocks, {
                header = line,
                block = full_block,
            })

        end

        i = i + 1
    end

    -- If we found no functions, do nothing
    if #blocks == 0 then
        vim.notify("SortCFunctions: No functions found.", vim.log.levels.WARN)
        return
    end

    -- Sort blocks alphabetically by function header
    table.sort(blocks, function(a, b)
        return a.header < b.header
    end)

    -- Rebuild output
    local out = {}
    for _, blk in ipairs(blocks) do
        vim.list_extend(out, blk.block)
        table.insert(out, "")
    end

    -- Write sorted version back
    vim.api.nvim_buf_set_lines(0, start_line, end_line, false, out)
end

vim.api.nvim_create_user_command("SortCFunctions", sort_c_functions, { range = true })


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
nmap <S-Tab> :bprevious<CR>
nmap <Tab> :bnext<CR>
nmap <leader>$s <C-w>s<C-w>j:terminal<CR>:set nonumber<CR><S-a>
nmap <leader>$v <C-w>v<C-w>l:terminal<CR>:set nonumber<CR><S-a>
nmap <leader>a gaip*
nmap <leader>h :RainbowParentheses!!<CR>
nmap <leader>j :set filetype=journal<CR>
nmap <leader>k :ColorToggle<CR>
nmap <leader>l :Limelight!!<CR>
nmap <leader>o :AerialToggle!<CR>
nmap <leader>q :NvimTreeFindFileToggle<CR>
nmap <leader>r :so ~/.config/nvim/init.vim<CR>
nmap <leader>t :call TrimWhitespace()<CR>
nmap <leader>vt :vsplit<CR>
nmap <silent> <leader><leader> :noh<CR>
nmap \ <leader>q
xmap <leader>a gaip*
xmap <leader>l :Limelight!!<CR>

" Python
autocmd Filetype python nmap <leader>d <Plug>(pydocstring)
autocmd FileType python nmap <leader>p :Black<CR>
autocmd Filetype solidity nmap <leader>p :0,$!npx prettier %<CR>

" Telescope mappings
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fc <cmd>Telescope colorscheme<cr>
nnoremap <leader>f/ <cmd>Telescope current_buffer_fuzzy_find<cr>

