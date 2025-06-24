vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

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
vim.keymap.set('n', '<leader>s', ':%s//<left>')
vim.keymap.set('v', '<leader>s', ':s//<left>')
vim.keymap.set('n', '<CR>', ':nohlsearch<CR><CR>')
vim.keymap.set('n', '<leader>h', ':silent! !tmux popup -d "#{pane_current_path}" -xC -yC -w80\\% -h80\\% -E >/dev/null 2>&1<CR>')
vim.keymap.set('n', '<leader>v', ':silent! !tmux split-window -v -p 20 >/dev/null 2>&1<CR>')
vim.keymap.set('n', '<leader>y', ':silent! !tmux split-window -h -p 40 "yazi ." >/dev/null 2>&1<CR>')
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<C-j>', '<C-d>zz')
vim.keymap.set('i', 'jk', '<ESC>')
vim.keymap.set({ 'n', 'i' }, '<C-s>', '<cmd>w<CR>', { desc = 'General save file' })

vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set('n', '\\', '<cmd>:vsplit <CR>', { desc = 'Vertical Split' })
vim.keymap.set('n', '|', ':split<CR>', { desc = 'Horizontal Split' })
vim.api.nvim_create_autocmd({ 'InsertEnter' }, {
  callback = function()
    vim.o.relativenumber = false
    vim.o.number = true
  end,
})
vim.api.nvim_create_autocmd({ 'InsertLeave' }, {
  callback = function()
    vim.o.relativenumber = true
    vim.o.number = true
  end,
})

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

-- Don't show the mode, since it's already in the status line
vim.o.showmode = false

vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- Save undo history
vim.o.undofile = true
vim.o.smoothscroll = true
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
vim.o.scrolloff = 2
vim.o.tabstop = 4
vim.o.ttyfast = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.lazyredraw = true
vim.o.expandtab = false
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.breakindent = true
vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.confirm = false
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
  'NMAC427/guess-indent.nvim', -- Detect tabstop and shiftwidth automatically

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
        delay = 1000,
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
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
      require('telescope').setup {
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }

      -- Enable Telescope extensions if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

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
      vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })

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

  -- LSP Plugins
  {
    -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
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

          -- Rename the variable under your cursor.
          --  Most Language Servers support renaming across files, etc.
          map('grn', vim.lsp.buf.rename, '[R]e[n]ame')

          -- Execute a code action, usually your cursor needs to be on top of an error
          -- or a suggestion from your LSP for this to activate.
          map('gra', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })

          -- Find references for the word under your cursor.
          map('grr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

          -- Jump to the implementation of the word under your cursor.
          --  Useful when your language has ways of declaring types without an actual implementation.
          map('gri', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

          -- Jump to the definition of the word under your cursor.
          --  This is where a variable was first declared, or where a function is defined, etc.
          --  To jump back, press <C-t>.
          map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

          -- WARN: This is not Goto Definition, this is Goto Declaration.
          --  For example, in C this would take you to the header.
          map('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

          -- Fuzzy find all the symbols in your current document.
          --  Symbols are things like variables, functions, types, etc.
          map('gO', require('telescope.builtin').lsp_document_symbols, 'Open Document Symbols')

          -- Fuzzy find all the symbols in your current workspace.
          --  Similar to document symbols, except searches over your entire project.
          map('gW', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Open Workspace Symbols')

          -- Jump to the type of the word under your cursor.
          --  Useful when you're not sure what type a variable is and you want to see
          --  the definition of its *type*, not where it was *defined*.
          map('grt', require('telescope.builtin').lsp_type_definitions, '[G]oto [T]ype Definition')

          -- This function resolves a difference between neovim nightly (version 0.11) and stable (version 0.10)
          ---@param client vim.lsp.Client
          ---@param method vim.lsp.protocol.Method
          ---@param bufnr? integer some lsp support methods only in specific files
          ---@return boolean
          local function client_supports_method(client, method, bufnr)
            if vim.fn.has 'nvim-0.11' == 1 then
              return client:supports_method(method, bufnr)
            else
              return client.supports_method(method, { bufnr = bufnr })
            end
          end

          -- The following two autocommands are used to highlight references of the
          -- word under your cursor when your cursor rests there for a little while.
          --    See `:help CursorHold` for information about when this is executed
          --
          -- When you move your cursor, the highlights will be cleared (the second autocommand).
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

          -- The following code creates a keymap to toggle inlay hints in your
          -- code, if the language server you are using supports them
          --
          -- This may be unwanted, since they displace some of your code
          if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
            map('<leader>th', function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
            end, '[T]oggle Inlay [H]ints')
          end
        end,
      })

      -- Diagnostic Config
      -- See :help vim.diagnostic.Opts
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

      local on_attach = function(_, bufnr)
        -- Enable completion triggered by <c-x><c-o>
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
        -- Mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local bufopts = { noremap = true, silent = true, buffer = bufnr }
        -- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
        -- vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
        -- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
        vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help, bufopts)
        -- vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
        -- vim.keymap.set("n", "rn", vim.lsp.buf.rename, bufopts)
        -- vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
      end

      local capabilities = require('blink.cmp').get_lsp_capabilities()
      local lspconfig = require 'lspconfig'
      local lspconfigs = require 'lspconfig.configs'

      local servers = {
        clangd = {
          cmd = { 'clangd' },
          -- init_options = {
          --   fallbackFlags = { "-DUNIT_TESTING" },
          -- },
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

        zls = {
          filetypes = { 'zig', 'zon', 'zir' },
          cmd = { '/home/niko/.local/bin/zls' },
          settings = {
            enable_build_on_save = true,
            semantic_tokens = 'partial',

            zig_exe_path = '/home/niko/.local/bin/zls',
          },
        },
        -- pyright = {},
        rust_analyzer = {
          cmd = { 'rust-analyzer' },
          filetypes = { 'rust' },
          settings = {
            ['rust-analyzer'] = {
              checkOnSave = { command = 'clippy' },
            },
          },
        },
        docker_compose_language_service = {},
        dockerls = {},

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

      for server, config in pairs(servers) do
        lspconfig[server].setup(vim.tbl_deep_extend('force', {
          capabilities = capabilities,
          on_attach = on_attach,
        }, config))
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
        nix = { 'alejandra' },
        json = { 'biome' },
        jsonc = { 'biome' },
        rust = { 'rustfmt' },
        yaml = { 'yamlfmt' },
        proto = { 'buf format' },
        c = { 'clang-format' },
        cpp = { 'clang-format' },
        markdown = { 'marksman' },
        zig = { 'zig fmt' },
      },
      formatters = {
        sleek = {
          command = 'sleek',
          args = { '$FILENAME' },
        },

        ['clang-format'] = {
          prepend_args = {
            '-style={IndentWidth: 4, TabWidth: 4,  PackConstructorInitializers: Never, SortIncludes: false,ColumnLimit: 0}',
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
    dependencies = {
      -- Snippet Engine
      {
        'L3MON4D3/LuaSnip',
        version = '2.*',
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

      fuzzy = { implementation = 'lua' },

      signature = { enabled = true },
    },
  },

  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  {

    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'rose-pine/neovim',
    priority = 1000,
    name = 'rose-pine',
    config = function()
      vim.cmd 'colorscheme rose-pine-moon'
    end,
  },
  -- {
  --   'rose-pine/neovim',
  --   priority = 1000,
  --   config = function()
  --     ---@diagnostic disable-next-line: missing-fields
  --     require('rose-pine').setup {
  --       -- Disable italics
  --       styles = {
  --         bold = true,
  --         italic = false,
  --         keywords = { italic = false },
  --         functions = { italic = false },
  --         conditionals = { italic = false },
  --         loops = { italic = false },
  --         variables = { italic = false },
  --         comments = { italic = false },
  --       },
  --       -- Make background transparent/disabled
  --       disable_background = true,
  --     }
  --
  --     -- Load the colorscheme
  --     vim.cmd.colorscheme 'rose-pine'
  --
  --     -- Set background to pure black for general UI
  --     vim.cmd [[highlight Normal guibg=#000000]]
  --     vim.cmd [[highlight NormalFloat guibg=#000000]]
  --     vim.cmd [[highlight NormalNC guibg=#000000]]
  --
  --     -- Set Telescope elements to have black background
  --     vim.cmd [[highlight TelescopeNormal guibg=#000000]]
  --     vim.cmd [[highlight TelescopePrompt guibg=#000000]]
  --     vim.cmd [[highlight TelescopeResults guibg=#000000]]
  --     -- vim.cmd [[highlight TelescopePromptBorder guibg=#000000 guifg=#000000]]
  --     -- vim.cmd [[highlight TelescopeResultsBorder guibg=#000000 guifg=#000000]]
  --     -- vim.cmd [[highlight TelescopePreviewBorder guibg=#000000 guifg=#000000]]
  --     -- vim.cmd [[highlight TelescopePreviewTitle guibg=#000000]]
  --     -- vim.cmd [[highlight TelescopePromptTitle guibg=#000000]]
  --     -- vim.cmd [[highlight TelescopeResultsTitle guibg=#000000]]
  --     -- vim.cmd [[highlight TelescopeSelection guibg=#101010]] -- Slightly lighter for selection
  --     -- vim.cmd [[highlight TelescopePreviewNormal guibg=#000000]]
  --   end,
  -- },

  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
      --  - ci'  - [C]hange [I]nside [']quote
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
            local location = statusline.section_location { trunc_width = 140 }
            local filename = statusline.section_filename { trunc_width = 140 }
            local filetype = vim.bo.filetype
            return statusline.combine_groups {
              { hl = 'MiniStatuslineDevinfo', strings = { git, diagnostics } },
              '%<',
              { hl = 'MiniStatuslineFilename', strings = { filename } },
              '%=',
              { hl = 'MiniStatuslineFileinfo', strings = { fileinfo, filetype } },
              { hl = 'MiniStatuslineDevinfo', strings = { location } },
            }
          end,
        },
      }
      -- set use_icons to true if you have a Nerd Font
      statusline.setup { use_icons = vim.g.have_nerd_font }

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
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
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
