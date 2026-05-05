local M = {}

function M.setup()
	require('base16-colorscheme').setup {
		-- Background tones
		base00 = '#141316',          -- Default Background
		base01 = '#201f22', -- Lighter Background (status bars)
		base02 = '#2b292d', -- Selection Background
		base03 = '#948f99',          -- Comments, Invisibles
		-- Foreground tones
		base04 = '#cac4cf', -- Dark Foreground (status bars)
		base05 = '#e6e1e6',       -- Default Foreground
		base06 = '#e6e1e6',       -- Light Foreground
		base07 = '#e6e1e6',    -- Lightest Foreground
		-- Accent colors
		base08 = '#ffb4ab',            -- Variables, XML Tags, Errors
		base09 = '#efb8c8',         -- Integers, Constants
		base0A = '#cbc2dc',        -- Classes, Search Background
		base0B = '#cfbdff',          -- Strings, Diff Inserted
		base0C = '#efb8c8', -- Regex, Escape Chars
		base0D = '#cfbdff', -- Functions, Methods
		base0E = '#cbc2dc', -- Keywords, Storage
		base0F = '#93000a',  -- Deprecated, Embedded Tags
	}

	-- LSP reference highlighting: use background instead of underline
	vim.api.nvim_set_hl(0, 'LspReferenceText', { bg = '#2b292d' })
	vim.api.nvim_set_hl(0, 'LspReferenceRead', { bg = '#2b292d' })
	vim.api.nvim_set_hl(0, 'LspReferenceWrite', { bg = '#363438', bold = true })

	-- Fix punctuation colors (use foreground color instead of red)
	vim.api.nvim_set_hl(0, 'Delimiter', { fg = '#cac4cf' })
	vim.api.nvim_set_hl(0, 'Operator', { fg = '#e6e1e6' })
	vim.api.nvim_set_hl(0, '@punctuation', { fg = '#cac4cf' })
	vim.api.nvim_set_hl(0, '@punctuation.delimiter', { fg = '#cac4cf' })
	vim.api.nvim_set_hl(0, '@punctuation.bracket', { fg = '#cac4cf' })
	vim.api.nvim_set_hl(0, '@punctuation.special', { fg = '#cac4cf' })

	-- Fix variable colors (use normal foreground instead of red)
	vim.api.nvim_set_hl(0, 'Identifier', { fg = '#e6e1e6' })
	vim.api.nvim_set_hl(0, '@variable', { fg = '#e6e1e6' })
	vim.api.nvim_set_hl(0, '@variable.builtin', { fg = '#cfbdff', italic = true })
	vim.api.nvim_set_hl(0, '@variable.parameter', { fg = '#e6e1e6' })
	vim.api.nvim_set_hl(0, '@variable.member', { fg = '#e6e1e6' })

	-- Fix namespace/module colors (imports like stdx in Zig)
	vim.api.nvim_set_hl(0, '@namespace', { fg = '#cfbdff' })
	vim.api.nvim_set_hl(0, '@module', { fg = '#cfbdff' })
	vim.api.nvim_set_hl(0, 'TSNamespace', { fg = '#cfbdff' })

	-- Fix type and constant colors (better contrast)
	vim.api.nvim_set_hl(0, 'Type', { fg = '#cbc2dc' })
	vim.api.nvim_set_hl(0, '@type', { fg = '#cbc2dc' })
	vim.api.nvim_set_hl(0, '@type.builtin', { fg = '#cbc2dc', italic = true })
	vim.api.nvim_set_hl(0, 'TSType', { fg = '#cbc2dc' })
	vim.api.nvim_set_hl(0, 'Constant', { fg = '#efb8c8' })
	vim.api.nvim_set_hl(0, '@constant', { fg = '#efb8c8' })
	vim.api.nvim_set_hl(0, '@constant.builtin', { fg = '#efb8c8', italic = true })
	vim.api.nvim_set_hl(0, 'TSConstant', { fg = '#efb8c8' })

	-- LSP diagnostic colors (proper Material Design colors)
	vim.api.nvim_set_hl(0, 'DiagnosticError', { fg = '#ffb4ab' })
	vim.api.nvim_set_hl(0, 'DiagnosticWarn', { fg = '#efb8c8' })
	vim.api.nvim_set_hl(0, 'DiagnosticInfo', { fg = '#cfbdff' })
	vim.api.nvim_set_hl(0, 'DiagnosticHint', { fg = '#cbc2dc' })
	-- Virtual text
	vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextError', { fg = '#ffb4ab' })
	vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextWarn', { fg = '#efb8c8' })
	vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextInfo', { fg = '#cfbdff' })
	vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextHint', { fg = '#cbc2dc' })
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
