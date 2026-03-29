local M = {}

function M.setup()
	require('base16-colorscheme').setup {
		-- Background tones
		base00 = '#121316',          -- Default Background
		base01 = '#1e2022', -- Lighter Background (status bars)
		base02 = '#282a2d', -- Selection Background
		base03 = '#8d9199',          -- Comments, Invisibles
		-- Foreground tones
		base04 = '#c3c7cf', -- Dark Foreground (status bars)
		base05 = '#e2e2e6',       -- Default Foreground
		base06 = '#e2e2e6',       -- Light Foreground
		base07 = '#e2e2e6',    -- Lightest Foreground
		-- Accent colors
		base08 = '#ffb4ab',            -- Variables, XML Tags, Errors
		base09 = '#d6bee4',         -- Integers, Constants
		base0A = '#bbc7db',        -- Classes, Search Background
		base0B = '#9ecaff',          -- Strings, Diff Inserted
		base0C = '#d6bee4', -- Regex, Escape Chars
		base0D = '#9ecaff', -- Functions, Methods
		base0E = '#bbc7db', -- Keywords, Storage
		base0F = '#93000a',  -- Deprecated, Embedded Tags
	}

	-- LSP reference highlighting: use background instead of underline
	vim.api.nvim_set_hl(0, 'LspReferenceText', { bg = '#282a2d' })
	vim.api.nvim_set_hl(0, 'LspReferenceRead', { bg = '#282a2d' })
	vim.api.nvim_set_hl(0, 'LspReferenceWrite', { bg = '#333538', bold = true })

	-- Fix punctuation colors (use foreground color instead of red)
	vim.api.nvim_set_hl(0, 'Delimiter', { fg = '#c3c7cf' })
	vim.api.nvim_set_hl(0, 'Operator', { fg = '#e2e2e6' })
	vim.api.nvim_set_hl(0, '@punctuation', { fg = '#c3c7cf' })
	vim.api.nvim_set_hl(0, '@punctuation.delimiter', { fg = '#c3c7cf' })
	vim.api.nvim_set_hl(0, '@punctuation.bracket', { fg = '#c3c7cf' })
	vim.api.nvim_set_hl(0, '@punctuation.special', { fg = '#c3c7cf' })

	-- Fix variable colors (use normal foreground instead of red)
	vim.api.nvim_set_hl(0, 'Identifier', { fg = '#e2e2e6' })
	vim.api.nvim_set_hl(0, '@variable', { fg = '#e2e2e6' })
	vim.api.nvim_set_hl(0, '@variable.builtin', { fg = '#9ecaff', italic = true })
	vim.api.nvim_set_hl(0, '@variable.parameter', { fg = '#e2e2e6' })
	vim.api.nvim_set_hl(0, '@variable.member', { fg = '#e2e2e6' })

	-- Fix namespace/module colors (imports like stdx in Zig)
	vim.api.nvim_set_hl(0, '@namespace', { fg = '#9ecaff' })
	vim.api.nvim_set_hl(0, '@module', { fg = '#9ecaff' })
	vim.api.nvim_set_hl(0, 'TSNamespace', { fg = '#9ecaff' })

	-- Fix type and constant colors (better contrast)
	vim.api.nvim_set_hl(0, 'Type', { fg = '#bbc7db' })
	vim.api.nvim_set_hl(0, '@type', { fg = '#bbc7db' })
	vim.api.nvim_set_hl(0, '@type.builtin', { fg = '#bbc7db', italic = true })
	vim.api.nvim_set_hl(0, 'TSType', { fg = '#bbc7db' })
	vim.api.nvim_set_hl(0, 'Constant', { fg = '#d6bee4' })
	vim.api.nvim_set_hl(0, '@constant', { fg = '#d6bee4' })
	vim.api.nvim_set_hl(0, '@constant.builtin', { fg = '#d6bee4', italic = true })
	vim.api.nvim_set_hl(0, 'TSConstant', { fg = '#d6bee4' })

	-- LSP diagnostic colors (proper Material Design colors)
	vim.api.nvim_set_hl(0, 'DiagnosticError', { fg = '#ffb4ab' })
	vim.api.nvim_set_hl(0, 'DiagnosticWarn', { fg = '#d6bee4' })
	vim.api.nvim_set_hl(0, 'DiagnosticInfo', { fg = '#9ecaff' })
	vim.api.nvim_set_hl(0, 'DiagnosticHint', { fg = '#bbc7db' })
	-- Virtual text
	vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextError', { fg = '#ffb4ab' })
	vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextWarn', { fg = '#d6bee4' })
	vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextInfo', { fg = '#9ecaff' })
	vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextHint', { fg = '#bbc7db' })
end

-- Register a signal handler for SIGUSR1 (matugen updates)
local signal = vim.uv.new_signal()
signal:start(
	'sigusr1',
	vim.schedule_wrap(function()
		package.loaded['colors.matugen'] = nil
		require('colors.matugen').setup()
	end)
)

return M
