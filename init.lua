vim.g.loaded_gzip = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwSettings = 1
vim.g.loaded_netrwFileHandlers = 1
vim.g.loaded_node_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
local orig_notify = vim.notify
vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>1', function()
  require('bufferline').go_to_buffer(1)
end, { desc = 'buffer 1' })
vim.keymap.set('n', '<leader>2', function()
  require('bufferline').go_to_buffer(2)
end, { desc = 'buffer 2' })
vim.keymap.set('n', '<leader>3', function()
  require('bufferline').go_to_buffer(3)
end, { desc = 'buffer 3' })
vim.keymap.set('n', '<leader>4', function()
  require('bufferline').go_to_buffer(4)
end, { desc = 'buffer 4' })
vim.keymap.set('n', '<leader>5', function()
  require('bufferline').go_to_buffer(5)
end, { desc = 'buffer 5' })
vim.keymap.set('n', '<leader>6', function()
  require('bufferline').go_to_buffer(6)
end, { desc = 'buffer 6' })
vim.keymap.set('n', '<leader>7', function()
  require('bufferline').go_to_buffer(7)
end, { desc = 'buffer 7' })
vim.keymap.set('n', '<leader>8', function()
  require('bufferline').go_to_buffer(8)
end, { desc = 'buffer 8' })
vim.keymap.set('n', '<leader>9', function()
  require('bufferline').go_to_buffer(9)
end, { desc = 'buffer 9' })
vim.keymap.set('n', '<leader>bb', '<cmd>buffers<cr>:buffer<space>', { desc = '[B]uffer [B]y number' })
vim.keymap.set('n', '<Tab>', '<cmd>BufferLineCycleNext<cr>', { desc = 'Next buffer' })
vim.keymap.set('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<cr>', { desc = 'Prev buffer' })
vim.keymap.set('n', '<leader>bo', '<cmd>%bd|e#|bd#<cr>', { desc = '[B]uffer [O]nly (close others)' })
vim.keymap.set('n', '<C-c>', '<cmd>BufferLinePickClose<cr>', { desc = 'Close Current Buffer' })
vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeFocus<CR>', { desc = 'focus Neo-tree' })
vim.keymap.set('n', '<C-n>', '<cmd>NvimTreeToggle<CR>', { desc = 'nvimtree toggle window' })
vim.keymap.set('n', '<leader>ft', '<cmd>TodoTelescope<CR>', { desc = 'Find Todo' })
vim.g.maplocalleader = ' '
vim.o.winborder = 'rounded'
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- vim.o.autocomplete = true

-- -- auto close
-- local function is_modified_buffer_open(buffers)
--   for _, v in pairs(buffers) do
--     if v.name:match 'NvimTree_' == nil then
--       return true
--     end
--   end
--   return false
-- end
--
vim.api.nvim_create_autocmd('BufEnter', {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and vim.bo.filetype == 'NvimTree' then
      vim.cmd 'quit'
    end
  end,
})

--resize
vim.api.nvim_create_autocmd('VimResized', {
  group = vim.api.nvim_create_augroup('resize_splits', { clear = true }),
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd 'tabdo wincmd ='
    vim.cmd('tabnext ' .. current_tab)
  end,
})

local max_buffers = 9

local function trim_buffers()
  local buffers = vim.fn.getbufinfo { buflisted = 1 }
  if #buffers > max_buffers then
    for i = 1, #buffers - max_buffers do
      local buf = buffers[i]
      if vim.api.nvim_buf_get_option(buf.bufnr, 'modified') == false then
        vim.cmd('bwipeout ' .. buf.bufnr)
      end
    end
  end
end

vim.api.nvim_create_autocmd('BufAdd', {
  callback = trim_buffers,
})

vim.keymap.set('n', '<C-j>', ':m .+1<CR>==')
vim.keymap.set('n', '<C-k>', ':m .-2<CR>==')
vim.keymap.set('v', '<C-j>', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', '<C-k>', ":m '<-2<CR>gv=gv")
vim.keymap.set('i', 'jk', '<Esc>')
vim.keymap.set('n', '<C-a>', 'ggvG')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('i', '<C-s>', '<C-o>:w')
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-l>', '<C-w>l')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', ';', ':')
vim.keymap.set('n', 'j', 'gj', { silent = true })
vim.keymap.set('n', 'k', 'gk', { silent = true })
vim.keymap.set('n', '<CR>', ':nohlsearch<CR><CR>')
vim.keymap.set('n', '<leader>h', ':silent! !tmux popup -d "#{pane_current_path}" -xC -yC -w80\\% -h80\\% -E >/dev/null 2>&1<CR>')
vim.keymap.set('n', '<leader>v', ':silent! !tmux split-window -v -p 20 >/dev/null 2>&1<CR>')
-- vim.keymap.set('n', '<leader>v', function()
--   local cwd = vim.fn.expand '%:p:h'
--   vim.cmd('silent !tmux split-window -v -p 20 -c "' .. cwd .. '"')
-- end, { noremap = true, silent = true })

vim.keymap.set('n', '<leader>y', ':silent! !tmux split-window -h -p 40 "yazi ." >/dev/null 2>&1<CR>')
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<C-j>', '<C-d>zz')
vim.keymap.set('i', 'jk', '<ESC>')
vim.keymap.set({ 'n', 'i' }, '<C-s>', '<cmd>w<CR>', { desc = 'General save file' })

vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.api.nvim_create_user_command('JournalToday', function()
  local today = os.date '%Y-%m-%d'
  local path = string.format('~/notes/%s.md', today)
  vim.cmd('edit ' .. path)
end, {})
vim.keymap.set('n', '<leader>jn', ':JournalToday<CR>', { desc = 'Open today’s journal' })

-- vim.api.nvim_create_autocmd('BufEnter', {
--   callback = function(opts)
--     if vim.bo[opts.buf].filetype == 'markdown' then
--       vim.opt.conceallevel = 0
--     end
--   end,
-- })

vim.keymap.set('n', '\\', '<cmd>:vsplit <CR>', { desc = 'Vertical Split' })
vim.keymap.set('n', '|', ':split<CR>', { desc = 'Horizontal Split' })
-- vim.cmd.colorscheme 'dosbox' -- super great but a litle bit smoke
vim.cmd.colorscheme 'dangion'

vim.api.nvim_create_autocmd({ 'InsertEnter', 'InsertLeave' }, {
  callback = function(event)
    vim.o.relativenumber = event.event == 'InsertLeave'
    vim.o.number = true
  end,
})

local function interactive_replace()
  local mode = vim.fn.mode(1)
  local is_visual = mode:match '^[vV\022]'
  local start_pos, end_pos
  if is_visual then
    start_pos = vim.fn.getpos "'<"
    end_pos = vim.fn.getpos "'>"
    if start_pos[2] == 0 or end_pos[2] == 0 then
      vim.notify('Visual marks not set properly, aborting', vim.log.levels.ERROR)
      return
    end
    vim.notify('Visual mode detected, start: ' .. vim.inspect(start_pos) .. ', end: ' .. vim.inspect(end_pos), vim.log.levels.DEBUG)
  end

  vim.ui.input({ prompt = 'Yo! Enter what you want to replace: ' }, function(search)
    if not search or search == '' then
      vim.notify('Search canceled: string empty', vim.log.levels.WARN)
      return
    end
    vim.ui.input({ prompt = 'Enter new string (leave empty to delete): ' }, function(replace)
      if replace == nil then
        vim.notify('Replace canceled: string not entered', vim.log.levels.WARN)
        return
      end
      replace = replace or ''

      local cmd
      if is_visual then
        vim.cmd 'normal! gv'
        cmd = string.format("'<,'>s/%s/%s/g", vim.fn.escape(search, '/'), vim.fn.escape(replace, '/'))
      else
        cmd = string.format('%%s/%s/%s/g', vim.fn.escape(search, '/'), vim.fn.escape(replace, '/'))
      end
      local scope = is_visual and 'selected scope' or 'entire file'
      vim.notify('Performing replace in ' .. scope .. ': "' .. search .. '" → "' .. replace .. '"', vim.log.levels.INFO)

      local success, err = pcall(vim.cmd, cmd)
      if not success then
        vim.notify('Error during replace: ' .. tostring(err), vim.log.levels.ERROR)
      end
    end)
  end)
end

vim.keymap.set({ 'n', 'v' }, '<leader>rr', function()
  if vim.fn.mode(1):match '^[vV\022]' then
    vim.cmd 'normal! gv'
    vim.notify('Restored visual selection', vim.log.levels.DEBUG)
  end
  interactive_replace()
end, { desc = '[R]eplace [R]eplace String (scope or file)' })

vim.api.nvim_create_user_command('ReplaceString', interactive_replace, { desc = 'Interactive replace' })

vim.keymap.set('n', '<leader>[', function()
  vim.diagnostic.open_float(nil, { focusable = false })
end, { desc = 'LSP diagnostics float' })

-- vim.o.number = true
-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = false

-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
--vim.o.number = true
vim.o.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.o.mouse = 'a'
vim.o.wrap = true
vim.o.showbreak = '↪ '
vim.o.termguicolors = true

-- Don't show the mode, since it's already in the status line
vim.o.showmode = false

vim.opt.swapfile = false
vim.cmd 'setlocal conceallevel=0'
vim.o.list = false

vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- Save undo history
vim.o.undofile = true
vim.o.smoothscroll = false
vim.o.guicursor = ''

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
--
--  Notice listchars is set using `vim.opt` instead of `vim.o`.
--  It is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
--   See `:help lua-options`
--   and `:help lua-options-guide`
vim.o.list = false
-- vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'

-- Show which line your cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 5
vim.o.tabstop = 4
vim.o.ttyfast = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.lazyredraw = false
vim.o.expandtab = false
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.breakindent = true
vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.confirm = false
local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }
for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

-- [[ Configure and install plugins ]] ---------
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require('lazy').setup({
  defaults = { lazy = true },
  performance = {
    cache = {
      enabled = true,
    },
    rtp = {
      disabled_plugins = {
        '2html_plugin',
        'tohtml',
        'getscript',
        'getscriptPlugin',
        'gzip',
        'logipat',
        'netrw',
        'netrwPlugin',
        'netrwSettings',
        'netrwFileHandlers',
        'matchit',
        'tar',
        'tarPlugin',
        'rrhelper',
        'spellfile_plugin',
        'vimball',
        'vimballPlugin',
        'zip',
        'zipPlugin',
        'tutor',
        'rplugin',
        'syntax',
        'synmenu',
        'optwin',
        'compiler',
        'bugreport',
        'ftplugin',
        'netrwPlugin',
        'gzip',
        'tarPlugin',
        'tohtml',
        'tutor',
        'zipPlugin',
      },
    },
  },
  {
    'MagicDuck/grug-far.nvim',
    -- Note (lazy loading): grug-far.lua defers all it's requires so it's lazy by default
    -- additional lazy config to defer loading is not really needed...
    event = 'VeryLazy',
    keys = {
      {
        '<leader>Sr',
        "<cmd>lua require('grug-far').toggle_instance({ instanceName='far', staticTitle='Search and Replace' })<CR>",
        mode = { 'n', 'o', 'x' },
      },
      {
        '<leader>sr',
        function()
          require('grug-far').open { prefills = { paths = vim.fn.expand '%' } }
        end,
        desc = 'Find and Replace word in current file.',
      },
    },
    config = function()
      -- optional setup call to override plugin options
      -- alternatively you can set options with vim.g.grug_far = { ... }
      require('grug-far').setup {
        -- options, see Configuration section below
        -- there are no required options atm
      }
    end,
  },
  {
    'isakbm/gitgraph.nvim',
    opts = {
      git_cmd = 'git',
      symbols = {
        merge_commit = 'M',
        commit = '*',
      },
      format = {
        timestamp = '%H:%M:%S %d-%m-%Y',
        fields = { 'hash', 'timestamp', 'author', 'branch_name', 'tag' },
      },
      hooks = {
        on_select_commit = function(commit)
          print('selected commit:', commit.hash)
        end,
        on_select_range_commit = function(from, to)
          print('selected range:', from.hash, to.hash)
        end,
      },
    },
    keys = {
      {
        '<leader>gl',
        function()
          require('gitgraph').draw({}, { all = true, max_count = 5000 })
        end,
        desc = 'GitGraph - Draw',
      },
    },
  },

  'NMAC427/guess-indent.nvim', -- Detect tabstop and shiftwidth automatically
  {
    'nvim-tree/nvim-tree.lua',
    requires = { 'nvim-tree/nvim-web-devicons' },
    cmd = { 'NvimTreeToggle', 'NvimTreeFocus' },
    opts = {
      filters = { dotfiles = false, enable = false },
      disable_netrw = true,
      hijack_cursor = true,
      sync_root_with_cwd = true,
      update_focused_file = {
        enable = true,
        update_root = false,
      },
      actions = {
        open_file = {
          resize_window = true,
        },
      },
      view = {
        width = 30,
        side = 'left',
      },
      renderer = {
        root_folder_label = false,
        highlight_opened_files = 'name',
        highlight_git = true,
        indent_markers = { enable = true },
        icons = {
          glyphs = {
            default = '󰈚',
            folder = {
              default = '',
              empty = '',
              empty_open = '',
              open = '',
              symlink = '',
            },
            git = { unmerged = '' },
          },
        },
      },
    },
  },

  -- {
  --   'nvim-neo-tree/neo-tree.nvim',
  --   version = 'v3.x',
  --   dependencies = {
  --     'nvim-lua/plenary.nvim',
  --     'nvim-tree/nvim-web-devicons',
  --     'MunifTanjim/nui.nvim',
  --     's1n7ax/nvim-window-picker',
  --   },
  --   cmd = 'Neotree',
  --   keys = {
  --     { '<leader>e', '<cmd>Neotree toggle<CR>', desc = 'Toggle Neo-tree' },
  --   },
  --   opts = {
  --     action = 'show',
  --     hijack_netrw_behavior = 'disabled',
  --
  --     auto_close = true,
  --     show = true,
  --     popup_border_style = 'NC',
  --     close_if_last_window = true,
  --     sources = { 'filesystem', 'buffers', 'git_status' },
  --     window = {
  --       action = 'show',
  --       position = 'left',
  --       width = 30,
  --       mapping_options = {
  --         noremap = true,
  --         nowait = true,
  --       },
  --       mappings = {
  --         ['<cr>'] = 'open', -- Enter:open to edit
  --         ['<esc>'] = 'revert_preview', -- Esc: clsoe preview
  --         ['P'] = { 'toggle_preview', nowait = false }, -- P: preview
  --         ['r'] = 'rename',
  --         ['d'] = 'delete',
  --         ['m'] = 'move',
  --         ['c'] = 'copy_to_clipboard', -- c: copy
  --         ['|'] = 'split_with_window_picker', -- |: horizontal split
  --         ['\\'] = 'vsplit_with_window_picker', -- \: vertical split
  --       },
  --     },
  --     filesystem = {
  --       window = { mappings = { ['.'] = 'set_root' } },
  --       follow_current_file = { enabled = true },
  --       use_libuv_file_watcher = true,
  --       action = 'show',
  --       filtered_items = {
  --         visible = true,
  --         hide_dotfiles = false,
  --         hide_gitignored = true,
  --       },
  --       use_libuv_file_watcher = true,
  --     },
  --     buffers = {
  --       follow_current_file = { enabled = true },
  --       group_empty_dirs = true,
  --     },
  --     git_status = {
  --       window = { position = 'float' },
  --     },
  --   },
  --   config = function(_, opts)
  --     require('neo-tree').setup(opts)
  --   end,
  -- },
  {
    'OXY2DEV/markview.nvim',
    lazy = false,
    config = function()
      require('markview').setup {
        preview = { enable = false },
      }

      vim.keymap.set('n', '<leader>m', '<CMD>Markview<CR>', { desc = 'Toggles `markview` previews globally.' })
    end,
    dependencies = { 'saghen/blink.cmp' },
  },
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('bufferline').setup {
        options = {
          mode = 'buffers',
          themable = true,

          numbers = 'none',
          auto_close = false,

          close_command = 'bdelete! %d',
          right_mouse_command = 'bdelete! %d',
          left_mouse_command = 'buffer %d',

          indicator = {
            icon = '▎',
            style = 'icon',
          },

          buffer_close_icon = '󰅖',
          modified_icon = '● ',
          close_icon = ' ',
          left_trunc_marker = ' ',
          right_trunc_marker = ' ',

          max_name_length = 18,
          max_prefix_length = 15,
          truncate_names = true,
          tab_size = 18,

          diagnostics = 'nvim_lsp',
          diagnostics_update_on_event = true,

          diagnostics_indicator = function(count)
            return '(' .. count .. ')'
          end,

          offsets = {
            {
              filetype = 'NvimTree',
              text = 'File Explorer',
              text_align = 'left',
              separator = true,
            },
          },

          color_icons = true,
          show_buffer_icons = true,
          show_buffer_close_icons = true,
          show_close_icon = true,
          show_tab_indicators = true,

          persist_buffer_sort = true,
          move_wraps_at_ends = false,

          separator_style = 'slant',

          always_show_bufferline = true,
          auto_toggle_bufferline = true,

          hover = {
            enabled = true,
            delay = 200,
            reveal = { 'close' },
          },

          sort_by = 'insert_after_current',
        },
      }
    end,
  },
  -- {
  --   'romgrk/barbar.nvim',
  --   init = function()
  --     vim.g.barbar_auto_setup = false
  --   end,
  --   opts = {
  --     highlight_inactive_file_icons = true,
  --     hide = { extensions = false, inactive = false },
  --     focus_on_close = 'left',
  --     maximum_length = 9,
  --
  --     icons = {
  --       -- Configure the base icons on the bufferline.
  --       -- Valid options to display the buffer index and -number are `true`, 'superscript' and 'subscript'
  --       buffer_index = true,
  --       buffer_number = false,
  --
  --       button = '',
  --       -- Enables / disables diagnostic symbols
  --       diagnostics = {
  --         [vim.diagnostic.severity.ERROR] = { enabled = true, icon = 'ﬀ' },
  --         [vim.diagnostic.severity.WARN] = { enabled = false },
  --         [vim.diagnostic.severity.INFO] = { enabled = false },
  --         [vim.diagnostic.severity.HINT] = { enabled = true },
  --       },
  --       gitsigns = {
  --         added = { enabled = true, icon = '+' },
  --         changed = { enabled = true, icon = '~' },
  --         deleted = { enabled = true, icon = '-' },
  --       },
  --       filetype = {
  --         -- Sets the icon's highlight group.
  --         -- If false, will use nvim-web-devicons colors
  --         custom_colors = false,
  --
  --         -- Requires `nvim-web-devicons` if `true`
  --         enabled = false,
  --       },
  --
  --       -- Use a preconfigured buffer appearance— can be 'default', 'powerline', or 'slanted'
  --       preset = 'default',
  --       maximum_length = 25,
  --
  --       -- Configure the icons on the bufferline based on the visibility of a buffer.
  --       -- Supports all the base icon options, plus `modified` and `pinned`.
  --       alternate = { filetype = { enabled = false } },
  --       current = { buffer_index = true },
  --       inactive = { button = '×', buffer_index = true },
  --       visible = { modified = { buffer_number = false } },
  --     },
  --     auto_hide = true,
  --     -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
  --     animation = false,
  --     -- insert_at_start = true,
  --     -- …etc.
  --   },
  --   version = '^1.0.0', -- optional: only update when a new 1.x version is released
  -- },
  {
    'lewis6991/gitsigns.nvim',
    ft = { 'gitcommit', 'diff' },
    init = function()
      -- load gitsigns only when a git file is opened
      vim.api.nvim_create_autocmd({ 'BufRead' }, {
        group = vim.api.nvim_create_augroup('GitSignsLazyLoad', { clear = true }),
        callback = function()
          vim.fn.system('git -C ' .. '"' .. vim.fn.expand '%:p:h' .. '"' .. ' rev-parse')
          if vim.v.shell_error == 0 then
            vim.api.nvim_del_augroup_by_name 'GitSignsLazyLoad'
            vim.schedule(function()
              require('lazy').load { plugins = { 'gitsigns.nvim' } }
            end)
          end
        end,
      })
    end,
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '│' },
        delete = { text = '󰍵' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol',
        delay = 500,
        ignore_whitespace = false,
        virt_text_priority = 100,
        use_focus = true,
      },
      current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
      status_formatter = nil, -- Use default

      sign_priority = 6,
      preview_config = {
        border = 'single',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1,
      },
    },
    config = function(_, opts)
      require('gitsigns').setup(opts)
    end,
  },

  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    preset = 'helix',
    opts = {
      -- delay between pressing a key and opening which-key (milliseconds)
      -- this setting is independent of vim.o.timeoutlen
      delay = 0,
      icons = {
        -- set icon mappings to true if you have a Nerd Font
        mappings = vim.g.have_nerd_font,
        -- If you are using a Nerd Font: set icons.keys to an empty table which will use the
        -- default which-key.nvim defined Nerd Font icons, otherwise define a string table
        keys = vim.g.have_nerd_font and {} or {
          Up = '<Up> ',
          Down = '<Down> ',
          Left = '<Left> ',
          Right = '<Right> ',
          C = '<C-…> ',
          M = '<M-…> ',
          D = '<D-…> ',
          S = '<S-…> ',
          CR = '<CR> ',
          Esc = '<Esc> ',
          ScrollWheelDown = '<ScrollWheelDown> ',
          ScrollWheelUp = '<ScrollWheelUp> ',
          NL = '<NL> ',
          BS = '<BS> ',
          Space = '<Space> ',
          Tab = '<Tab> ',
          F1 = '<F1>',
          F2 = '<F2>',
          F3 = '<F3>',
          F4 = '<F4>',
          F5 = '<F5>',
          F6 = '<F6>',
          F7 = '<F7>',
          F8 = '<F8>',
          F9 = '<F9>',
          F10 = '<F10>',
          F11 = '<F11>',
          F12 = '<F12>',
        },
      },
    },
  },

  -- {
  --   'epwalsh/obsidian.nvim',
  --   version = '*',
  --   lazy = true,
  --   ft = 'markdown',
  --   dependencies = { 'nvim-lua/plenary.nvim' },
  --   opts = {
  --     workspaces = {
  --       {
  --         name = 'notes',
  --         path = '~/notes/',
  --       },
  --     },
  --
  --     {
  --       name = 'no-vault',
  --       path = function()
  --         -- alternatively use the CWD:
  --         -- return assert(vim.fn.getcwd())
  --         return assert(vim.fs.dirname(vim.api.nvim_buf_get_name(0)))
  --       end,
  --       overrides = {
  --         notes_subdir = vim.NIL, -- have to use 'vim.NIL' instead of 'nil'
  --         new_notes_location = 'current_dir',
  --         templates = {
  --           folder = vim.NIL,
  --         },
  --         disable_frontmatter = true,
  --       },
  --     },
  --
  --     ui = {
  --       enable = true, -- set to false to disable all additional syntax features
  --       update_debounce = 200, -- update delay after a text change (in milliseconds)
  --       max_file_length = 5000, -- disable UI features for files with more than this many lines
  --       -- Define how various check-boxes are displayed
  --       checkboxes = {
  --         -- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
  --         [' '] = { char = '󰄱', hl_group = 'ObsidianTodo' },
  --         ['x'] = { char = '', hl_group = 'ObsidianDone' },
  --         ['>'] = { char = '', hl_group = 'ObsidianRightArrow' },
  --         ['~'] = { char = '󰰱', hl_group = 'ObsidianTilde' },
  --         ['!'] = { char = '', hl_group = 'ObsidianImportant' },
  --
  --         -- You can also add more custom ones...
  --       },
  --
  --       -- Use bullet marks for non-checkbox lists.
  --       bullets = { char = '•', hl_group = 'ObsidianBullet' },
  --       external_link_icon = { char = '', hl_group = 'ObsidianExtLinkIcon' },
  --       -- Replace the above with this if you don't have a patched font:
  --       -- external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
  --       reference_text = { hl_group = 'ObsidianRefText' },
  --       highlight_text = { hl_group = 'ObsidianHighlightText' },
  --       tags = { hl_group = 'ObsidianTag' },
  --       block_ids = { hl_group = 'ObsidianBlockID' },
  --       hl_groups = {
  --         -- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
  --         ObsidianTodo = { bold = true, fg = '#f78c6c' },
  --         ObsidianDone = { bold = true, fg = '#89ddff' },
  --         ObsidianRightArrow = { bold = true, fg = '#f78c6c' },
  --         ObsidianTilde = { bold = true, fg = '#ff5370' },
  --         ObsidianImportant = { bold = true, fg = '#d73128' },
  --         ObsidianBullet = { bold = true, fg = '#89ddff' },
  --         ObsidianRefText = { underline = true, fg = '#c792ea' },
  --         ObsidianExtLinkIcon = { fg = '#c792ea' },
  --         ObsidianTag = { italic = true, fg = '#89ddff' },
  --         ObsidianBlockID = { italic = true, fg = '#89ddff' },
  --         ObsidianHighlightText = { bg = '#75662e' },
  --       },
  --     },
  --
  --     picker = {
  --       -- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', or 'mini.pick'.
  --       name = 'telescope.nvim',
  --       -- Optional, configure key mappings for the picker. These are the defaults.
  --       -- Not all pickers support all mappings.
  --       note_mappings = {
  --         -- Create a new note from your query.
  --         new = '<C-x>',
  --         -- Insert a link to the selected note.
  --         insert_link = '<C-l>',
  --       },
  --       tag_mappings = {
  --         -- Add tag(s) to current note.
  --         tag_note = '<C-x>',
  --         -- Insert a tag at the current location.
  --         insert_tag = '<C-l>',
  --       },
  --     },
  --     mappings = {},
  --     completion = {
  --       nvim_cmp = false,
  --     },
  --     templates = {
  --       folder = 'templates',
  --       date_format = '%Y-%m-%d',
  --     },
  --   },
  -- },

  {
    'nvim-telescope/telescope-file-browser.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
  },
  { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { -- If encountering errors, see telescope-fzf-native README for installation instructions
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },

      -- Useful for getting pretty icons, but requires a Nerd Font.
      { 'nvim-tree/nvim-web-devicons', enabled = true },
    },
    config = function()
      require('telescope').setup {
        sorting_strategy = 'ascending',
        layout_strategy = 'horizontal',
        layout_config = { preview_width = 0.6 },
        path_display = { 'truncate' },
        pickers = {
          find_files = {
            find_command = { 'fd', '--type', 'f', '--hidden', '--exclude=.git' },
            hidden = true,
          },
          live_grep = {
            additional_args = function()
              return { '--hidden' }
            end,
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = 'smart_case',
          },
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }

      -- Enable Telescope extensions if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')
      pcall(require('telescope').load_extension, 'file_browser')

      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>f', function()
        builtin.find_files {
          hidden = true,
        }
      end, { desc = '[F]ind [F]iles' })
      vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>ss.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
      vim.keymap.set('n', '<leader>gc', builtin.git_commits, { desc = 'Git Commits' })
      vim.keymap.set('n', '<leader>gfc', builtin.git_bcommits, { desc = 'Git File Commits' })

      vim.keymap.set('n', '<leader>/', builtin.live_grep, { desc = 'Search all files' })
      vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = 'Search files' })
      vim.keymap.set('n', '<leader>d', builtin.diagnostics, { desc = 'Show diagnostics' })

      -- It's also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[S]earch [/] in Open Files' })

      -- Shortcut for searching your Neovim configuration files
      vim.keymap.set('n', '<leader>sn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[S]earch [N]eovim files' })
    end,
  },

  {
    -- Main LSP Configuration
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Allows extra capabilities provided by blink.cmp
      'saghen/blink.cmp',
    },
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end
          map('grn', vim.lsp.buf.rename, '[R]e[n]ame')
          map('gra', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })
          map('grr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
          map('gri', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
          map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
          map('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
          map('gO', require('telescope.builtin').lsp_document_symbols, 'Open Document Symbols')
          map('gW', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Open Workspace Symbols')
          map('grt', require('telescope.builtin').lsp_type_definitions, '[G]oto [T]ype Definition')
          local function client_supports_method(client, method, bufnr)
            if vim.fn.has 'nvim-0.11' == 1 then
              return client:supports_method(method, bufnr)
            else
              return client.supports_method(method, { bufnr = bufnr })
            end
          end
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
            local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })
            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })
            vim.api.nvim_create_autocmd('LspDetach', {
              group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
              end,
            })
          end
          if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
            map('<leader>th', function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
            end, '[T]oggle Inlay [H]ints')
          end
        end,
      })
      vim.diagnostic.config {
        severity_sort = true,
        float = { border = 'rounded', source = 'if_many' },
        underline = { severity = vim.diagnostic.severity.ERROR },
        signs = vim.g.have_nerd_font and {
          text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.WARN] = '󰀪 ',
            [vim.diagnostic.severity.INFO] = '󰋽 ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
          },
        } or {},
        virtual_text = {
          source = 'if_many',
          spacing = 2,
          format = function(diagnostic)
            local diagnostic_message = {
              [vim.diagnostic.severity.ERROR] = diagnostic.message,
              [vim.diagnostic.severity.WARN] = diagnostic.message,
              [vim.diagnostic.severity.INFO] = diagnostic.message,
              [vim.diagnostic.severity.HINT] = diagnostic.message,
            }
            return diagnostic_message[diagnostic.severity]
          end,
        },
      }
      local on_attach = function(client, bufnr)
        -- vim.notify('LSP attached: ' .. client.name .. ' to buffer ' .. bufnr, vim.log.levels.DEBUG)
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
        local bufopts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
        vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help, bufopts)
      end
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      -- Ensure zig filetype detection
      local servers = {
        zls = {
          cmd = { 'zls' },
          filetypes = { 'zig', 'zon', 'zir' },
          settings = {
            zig_exe_path = '/usr/bin/zig',
            enable_build_on_save = true,
            semantic_tokens = 'partial',
          },
        },
        nix = {
          cmd = { 'nixd' },
          filetypes = { 'nix' },
          formatting = {
            command = { 'nixfmt' },
          },
        },
        clangd = {
          cmd = {
            'clangd',
            '--background-index',
            '--header-insertion=never',
          },
          filetypes = { 'c', 'cpp' },
          root_markers = {
            '.clangd',
            '.clang-tidy',
            '.clang-format',
            'compile_commands.json',
            'compile_flags.txt',
            'configure.ac',
            '.git',
          },
        },
        gopls = {
          cmd = { 'gopls' },
          settings = {
            gopls = {
              gofumpt = true,
              staticcheck = true,
              usePlaceholders = true,
              completeUnimported = true,
              analyses = {
                nilness = true,
                shadow = true,
                modernize = false,
              },
              hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
              },
            },
          },
        },
        rust_analyzer = {
          cmd = { 'rust-analyzer' },
          filetypes = { 'rust' },
          root_markers = { 'Cargo.toml', 'rust-project.json' },
          settings = {
            ['rust-analyzer'] = {
              rust = {
                sysroot = 'none',
              },
              cargo = {
                loadOutDirsFromCheck = true,
              },
            },
            checkOnSave = {
              allFeatures = false,
              command = 'clippy',
              extraArgs = { '--no-deps' },
            },
            procMacro = {
              enable = true,
              ignored = {
                ['async-trait'] = { 'async_trait' },
                ['napi-derive'] = { 'napi' },
                ['async-recursion'] = { 'async_recursion' },
              },
            },
          },
        },
        dockerls = {
          cmd = { 'docker-langserver', '--stdio' },
        },
        buf_ls = {
          cmd = { 'buf-language-server' },
          filetypes = { 'proto' },
        },
        lua_ls = {
          settings = {
            Lua = {
              completion = {
                callSnippet = 'Replace',
              },
              diagnostics = { disable = { 'missing-fields' } },
            },
          },
        },
      }
      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        'stylua', -- Used to format Lua code
      })

      vim.notify = function(msg, log_level, opts)
        if opts and opts.client_id then
          local client = vim.lsp.get_client_by_id(opts.client_id)
        end

        orig_notify(msg, log_level, opts)
      end

      for server, config in pairs(servers) do
        -- vim.notify('Configuring LSP server: ' .. server, vim.log.levels.DEBUG)
        vim.lsp.config(
          server,
          vim.tbl_deep_extend('force', {
            capabilities = capabilities,
            on_attach = on_attach,
          }, config)
        )
        -- vim.notify('Enabling LSP server: ' .. server, vim.log.levels.DEBUG)
        local success, err = pcall(vim.lsp.enable, server)
        if not success then
          vim.notify('Failed to enable ' .. server .. ': ' .. vim.inspect(err), vim.log.levels.ERROR)
        end
      end
    end,
  },

  { -- Autoformat
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },

    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        local disable_filetypes = {}
        if disable_filetypes[vim.bo[bufnr].filetype] then
          return nil
        else
          return {
            timeout_ms = 500,
            lsp_format = 'fallback',
          }
        end
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        go = { 'goimports', 'gofmt' },
        nix = { 'nixfmt' },
        json = { 'biome' },
        jsonc = { 'biome' },
        rust = { 'rustfmt' },
        yaml = { 'prettier' },
        asm = { 'asmfmt' }, -- go asm
        proto = { 'buf format' },
        c = { 'clang-format' },
        cpp = { 'clang-format' },
        markdown = { 'marksman' },
        zig = { 'zig fmt' },
        sql = { 'pgformatter' },
      },
      formatters = {
        pgformatter = {
          options = {
            function_case = 2,
            keyword_case = 2,
            spaces = 2,
            comma_break = true,
            comma_end = false,
          },
        },

        prettier = {
          options = {
            arrow_parens = 'always',
            bracket_spacing = true,
            bracket_same_line = false,
            embedded_language_formatting = 'auto',
            end_of_line = 'lf',
            html_whitespace_sensitivity = 'css',
            jsx_bracket_same_line = false,
            jsx_single_quote = false,
            print_width = 80,
            prose_wrap = 'preserve',
            quote_props = 'as-needed',
            semi = true,
            single_quote = false,
            tab_width = 2,
            trailing_comma = 'es5',
            use_tabs = false,
            stop_after_first = true,
          },
        },
        yamlfmt = {
          options = {
            indent = 2,
            line_ending = 'lf',
            keep_quotes = true,
          },
        },
        sleek = {
          command = 'sleek',
          args = { '$FILENAME' },
        },

        ['clang-format'] = {
          prepend_args = {
            '-style={IndentWidth: 4, TabWidth: 4,  PackConstructorInitializers: Never, SortIncludes: false,ColumnLimit: 0  }',
          },
        },
        goimports = {
          command = 'goimports',
        },
      },
    },
  },

  { -- Autocompletion
    'saghen/blink.cmp',
    event = 'VimEnter',
    version = '1.*',
    build = '...',
    dependencies = {
      -- Snippet Engine
      {
        'L3MON4D3/LuaSnip',
        version = 'v2.*',
        build = (function()
          -- Build Step is needed for regex support in snippets.
          -- This step is not supported in many windows environments.
          -- Remove the below condition to re-enable on windows.
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        opts = {},
      },
      'folke/lazydev.nvim',
    },
    --- @module 'blink.cmp'
    --- @type blink.cmp.Config
    opts = {
      keymap = {
        preset = 'super-tab', -- Use super-tab preset for <Tab> to accept
      },

      appearance = {
        -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'mono',
      },

      completion = {
        -- By default, you may press `<c-space>` to show the documentation.
        -- Optionally, set `auto_show = true` to show the documentation after a delay.
        documentation = { auto_show = true, auto_show_delay_ms = 500 },
      },

      sources = {
        default = { 'lsp', 'path', 'snippets', 'lazydev' },
        providers = {
          lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
        },
      },

      snippets = { preset = 'luasnip' },

      fuzzy = { implementation = 'rust' },

      signature = { enabled = true },
    },
  },
  {
    'pteroctopus/faster.nvim',
    opts = {
      -- Behaviour table contains configuration for behaviours faster.nvim uses
      behaviours = {
        -- Fast macro configuration controls disabling and enabling features when
        -- macro is executed
        fastmacro = {
          -- Behaviour can be turned on or off. To turn on set to true, otherwise
          -- set to false
          on = true,
          -- Table which contains names of features that will be disabled when
          -- macro is executed. Feature names can be seen in features table below.
          -- features_disabled can also be set to "all" and then all features that
          -- are on (on=true) are going to be disabled for this behaviour.
          -- Specificaly:
          -- * lualine plugin is disabled when macros are executed because
          -- if a recursive macro opens a buffer on every iteration this error will
          -- happen after 300-400 hundred iterations:
          -- `E5108: Error executing lua Vim:E903: Process failed to start: too many open files: "/usr/bin/git"`
          -- * mini.clue plugin is disabled when macros are executed because it breaks execution of some macros
          features_disabled = { 'lualine', 'mini_clue' },
        },
      },
      -- Feature table contains configuration for features faster.nvim will disable
      -- and enable according to rules defined in behaviours.
      -- Defined feature will be used by faster.nvim only if it is on (`on=true`).
      -- Defer will be used if some features need to be disabled after others.
      -- defer=false features will be disabled first and defer=true features last.
      features = {
        -- Neovim filetype plugin
        -- https://neovim.io/doc/user/filetype.html
        filetype = {
          on = true,
          defer = true,
        },
        -- Illuminate plugin
        -- https://github.com/RRethy/vim-illuminate
        illuminate = {
          on = true,
          defer = false,
        },
        -- Indent Blankline
        -- https://github.com/lukas-reineke/indent-blankline.nvim
        indent_blankline = {
          on = true,
          defer = false,
        },
        -- Neovim LSP
        -- https://neovim.io/doc/user/lsp.html
        lsp = {
          on = true,
          defer = false,
        },
        -- Lualine
        -- https://github.com/nvim-lualine/lualine.nvim
        lualine = {
          on = true,
          defer = false,
        },
        -- Neovim Pi_paren plugin
        -- https://neovim.io/doc/user/pi_paren.html
        matchparen = {
          on = true,
          defer = false,
        },
        -- Neovim syntax
        -- https://neovim.io/doc/user/syntax.html
        syntax = {
          on = true,
          defer = true,
        },
        -- Neovim treesitter
        -- https://neovim.io/doc/user/treesitter.html
        treesitter = {
          on = true,
          defer = false,
        },
        -- Neovim options that affect speed when big file is opened:
        -- swapfile, foldmethod, undolevels, undoreload, list
        vimopts = {
          on = true,
          defer = false,
        },
        -- Mini.clue
        -- https://github.com/nvim-mini/mini.clue
        mini_clue = {
          on = true,
          defer = false,
        },
      },
    },
  },

  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
      --  - ci'  - [C]hange [I]nside [']quote
      --  vi' - Select around
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()

      require('mini.pairs').setup {
        mappings = {
          ['('] = { action = 'open', pair = '()', neigh_pattern = '[^\\].' },
          [')'] = { action = 'close', pair = '()', neigh_pattern = '[^\\].' },
          ['{'] = { action = 'open', pair = '{}', neigh_pattern = '[^\\].' },
          ['}'] = { action = 'close', pair = '{}', neigh_pattern = '[^\\].' },
          ['['] = { action = 'open', pair = '[]', neigh_pattern = '[^\\].' },
          [']'] = { action = 'close', pair = '[]', neigh_pattern = '[^\\].' },
          ['"'] = { action = 'open', pair = '""', neigh_pattern = '[^\\].' },
          ['"'] = { action = 'close', pair = '""', neigh_pattern = '[^\\].' },
          ["'"] = { action = 'open', pair = "''", neigh_pattern = '[^\\].' },
          ["'"] = { action = 'close', pair = "''", neigh_pattern = '[^\\].' },
        },
      }

      local statusline = require 'mini.statusline'
      statusline.setup {
        content = {
          active = function()
            local git = statusline.section_git { trunc_width = 75 }
            local fileinfo = statusline.section_fileinfo { trunc_width = 120 }
            local diagnostics = statusline.section_diagnostics { trunc_width = 75 }
            -- local location = statusline.section_location { trunc_width = 140 }
            local filename = statusline.section_filename { trunc_width = 140 }
            -- local filetype = vim.bo.filetype
            return statusline.combine_groups {
              { hl = 'MiniStatuslineDevinfo', strings = { git, diagnostics } },
              '%<',
              { hl = 'MiniStatuslineFilename', strings = { filename } },
              '%=',
              -- { hl = 'MiniStatuslineFileinfo', strings = { fileinfo, filetype } },
              -- { hl = 'MiniStatuslineDevinfo', strings = { location } },
            }
          end,
        },
        use_icons = true,
      }

      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end

      require('mini.comment').setup {
        mappings = {
          comment = 'gc',
          comment_line = 'gcc',
          textobject = 'gc',
        },
      }
    end,

    --  Check out: https://github.com/echasnovski/mini.nvim
  },
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs', -- Sets main module to use for opts
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
    opts = {
      ensure_installed = {
        'bash',
        'c',
        'diff',
        'html',
        'lua',
        'luadoc',
        'markdown',
        'markdown_inline',
        'query',
        'vim',
        'vimdoc',
        'go',
        'zig',
        'cpp',
        'sql',
        'rust',
        'proto',
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = 'gnn', -- set to `false` to disable one of the mappings
          node_incremental = 'grn',
          scope_incremental = 'grc',
          node_decremental = 'grm',
        },
      },
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
        use_languagetree = true,
      },
      indent = { enable = true, disable = { 'ruby' } },
    },
  },
}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
