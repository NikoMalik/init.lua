local M = {}

function M.setup()
	require('base16-colorscheme').setup {
		-- Background tones
		base00 = '#141317',          -- Default Background
		base01 = '#211f24', -- Lighter Background (status bars)
		base02 = '#2b292e', -- Selection Background
		base03 = '#948e9b',          -- Comments, Invisibles
		-- Foreground tones
		base04 = '#cac4d1', -- Dark Foreground (status bars)
		base05 = '#e6e1e8',       -- Default Foreground
		base06 = '#e6e1e8',       -- Light Foreground
		base07 = '#e6e1e8',    -- Lightest Foreground
		-- Accent colors
		base08 = '#ffb4ab',            -- Variables, XML Tags, Errors
		base09 = '#ffaed9',         -- Integers, Constants
		base0A = '#ccc1e4',        -- Classes, Search Background
		base0B = '#cfbdff',          -- Strings, Diff Inserted
		base0C = '#ffaed9', -- Regex, Escape Chars
		base0D = '#cfbdff', -- Functions, Methods
		base0E = '#ccc1e4', -- Keywords, Storage
		base0F = '#93000a',  -- Deprecated, Embedded Tags
	}

	-- LSP reference highlighting: use background instead of underline
	vim.api.nvim_set_hl(0, 'LspReferenceText', { bg = '#2b292e' })
	vim.api.nvim_set_hl(0, 'LspReferenceRead', { bg = '#2b292e' })
	vim.api.nvim_set_hl(0, 'LspReferenceWrite', { bg = '#363439', bold = true })

	-- Fix punctuation colors (use foreground color instead of red)
	vim.api.nvim_set_hl(0, 'Delimiter', { fg = '#cac4d1' })
	vim.api.nvim_set_hl(0, 'Operator', { fg = '#e6e1e8' })
	vim.api.nvim_set_hl(0, '@punctuation', { fg = '#cac4d1' })
	vim.api.nvim_set_hl(0, '@punctuation.delimiter', { fg = '#cac4d1' })
	vim.api.nvim_set_hl(0, '@punctuation.bracket', { fg = '#cac4d1' })
	vim.api.nvim_set_hl(0, '@punctuation.special', { fg = '#cac4d1' })

	-- LSP diagnostic colors (proper Material Design colors)
	vim.api.nvim_set_hl(0, 'DiagnosticError', { fg = '#ffb4ab' })
	vim.api.nvim_set_hl(0, 'DiagnosticWarn', { fg = '#ffaed9' })
	vim.api.nvim_set_hl(0, 'DiagnosticInfo', { fg = '#cfbdff' })
	vim.api.nvim_set_hl(0, 'DiagnosticHint', { fg = '#ccc1e4' })
	-- Virtual text
	vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextError', { fg = '#ffb4ab' })
	vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextWarn', { fg = '#ffaed9' })
	vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextInfo', { fg = '#cfbdff' })
	vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextHint', { fg = '#ccc1e4' })
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
