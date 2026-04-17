local M = {}

function M.setup()
	require('base16-colorscheme').setup {
		-- Background tones
		base00 = '#15121a',          -- Default Background
		base01 = '#221e27', -- Lighter Background (status bars)
		base02 = '#2c2832', -- Selection Background
		base03 = '#968d9f',          -- Comments, Invisibles
		-- Foreground tones
		base04 = '#cdc3d6', -- Dark Foreground (status bars)
		base05 = '#e8e0ec',       -- Default Foreground
		base06 = '#e8e0ec',       -- Light Foreground
		base07 = '#e8e0ec',    -- Lightest Foreground
		-- Accent colors
		base08 = '#ffb4ab',            -- Variables, XML Tags, Errors
		base09 = '#ffade4',         -- Integers, Constants
		base0A = '#d5bbff',        -- Classes, Search Background
		base0B = '#d5bbff',          -- Strings, Diff Inserted
		base0C = '#ffade4', -- Regex, Escape Chars
		base0D = '#d5bbff', -- Functions, Methods
		base0E = '#d5bbff', -- Keywords, Storage
		base0F = '#93000a',  -- Deprecated, Embedded Tags
	}

	-- LSP reference highlighting: use background instead of underline
	vim.api.nvim_set_hl(0, 'LspReferenceText', { bg = '#2c2832' })
	vim.api.nvim_set_hl(0, 'LspReferenceRead', { bg = '#2c2832' })
	vim.api.nvim_set_hl(0, 'LspReferenceWrite', { bg = '#37333d', bold = true })

	-- Fix punctuation colors (use foreground color instead of red)
	vim.api.nvim_set_hl(0, 'Delimiter', { fg = '#cdc3d6' })
	vim.api.nvim_set_hl(0, 'Operator', { fg = '#e8e0ec' })
	vim.api.nvim_set_hl(0, '@punctuation', { fg = '#cdc3d6' })
	vim.api.nvim_set_hl(0, '@punctuation.delimiter', { fg = '#cdc3d6' })
	vim.api.nvim_set_hl(0, '@punctuation.bracket', { fg = '#cdc3d6' })
	vim.api.nvim_set_hl(0, '@punctuation.special', { fg = '#cdc3d6' })

	-- Fix variable colors (use normal foreground instead of red)
	vim.api.nvim_set_hl(0, 'Identifier', { fg = '#e8e0ec' })
	vim.api.nvim_set_hl(0, '@variable', { fg = '#e8e0ec' })
	vim.api.nvim_set_hl(0, '@variable.builtin', { fg = '#d5bbff', italic = true })
	vim.api.nvim_set_hl(0, '@variable.parameter', { fg = '#e8e0ec' })
	vim.api.nvim_set_hl(0, '@variable.member', { fg = '#e8e0ec' })

	-- Fix namespace/module colors (imports like stdx in Zig)
	vim.api.nvim_set_hl(0, '@namespace', { fg = '#d5bbff' })
	vim.api.nvim_set_hl(0, '@module', { fg = '#d5bbff' })
	vim.api.nvim_set_hl(0, 'TSNamespace', { fg = '#d5bbff' })

	-- Fix type and constant colors (better contrast)
	vim.api.nvim_set_hl(0, 'Type', { fg = '#d5bbff' })
	vim.api.nvim_set_hl(0, '@type', { fg = '#d5bbff' })
	vim.api.nvim_set_hl(0, '@type.builtin', { fg = '#d5bbff', italic = true })
	vim.api.nvim_set_hl(0, 'TSType', { fg = '#d5bbff' })
	vim.api.nvim_set_hl(0, 'Constant', { fg = '#ffade4' })
	vim.api.nvim_set_hl(0, '@constant', { fg = '#ffade4' })
	vim.api.nvim_set_hl(0, '@constant.builtin', { fg = '#ffade4', italic = true })
	vim.api.nvim_set_hl(0, 'TSConstant', { fg = '#ffade4' })

	-- LSP diagnostic colors (proper Material Design colors)
	vim.api.nvim_set_hl(0, 'DiagnosticError', { fg = '#ffb4ab' })
	vim.api.nvim_set_hl(0, 'DiagnosticWarn', { fg = '#ffade4' })
	vim.api.nvim_set_hl(0, 'DiagnosticInfo', { fg = '#d5bbff' })
	vim.api.nvim_set_hl(0, 'DiagnosticHint', { fg = '#d5bbff' })
	-- Virtual text
	vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextError', { fg = '#ffb4ab' })
	vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextWarn', { fg = '#ffade4' })
	vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextInfo', { fg = '#d5bbff' })
	vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextHint', { fg = '#d5bbff' })
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
