local M = {}

function M.setup()
	require('base16-colorscheme').setup {
		-- Background tones
		base00 = '#131314',          -- Default Background
		base01 = '#201f20', -- Lighter Background (status bars)
		base02 = '#2a2a2a', -- Selection Background
		base03 = '#8f9195',          -- Comments, Invisibles
		-- Foreground tones
		base04 = '#c5c6cb', -- Dark Foreground (status bars)
		base05 = '#e5e2e2',       -- Default Foreground
		base06 = '#e5e2e2',       -- Light Foreground
		base07 = '#e5e2e2',    -- Lightest Foreground
		-- Accent colors
		base08 = '#ffb4ab',            -- Variables, XML Tags, Errors
		base09 = '#d1c2d0',         -- Integers, Constants
		base0A = '#c5c6cb',        -- Classes, Search Background
		base0B = '#c0c7d2',          -- Strings, Diff Inserted
		base0C = '#d1c2d0', -- Regex, Escape Chars
		base0D = '#c0c7d2', -- Functions, Methods
		base0E = '#c5c6cb', -- Keywords, Storage
		base0F = '#93000a',  -- Deprecated, Embedded Tags
	}

	-- LSP reference highlighting: use background instead of underline
	vim.api.nvim_set_hl(0, 'LspReferenceText', { bg = '#2a2a2a' })
	vim.api.nvim_set_hl(0, 'LspReferenceRead', { bg = '#2a2a2a' })
	vim.api.nvim_set_hl(0, 'LspReferenceWrite', { bg = '#353535', bold = true })

	-- Fix punctuation colors (use foreground color instead of red)
	vim.api.nvim_set_hl(0, 'Delimiter', { fg = '#c5c6cb' })
	vim.api.nvim_set_hl(0, 'Operator', { fg = '#e5e2e2' })
	vim.api.nvim_set_hl(0, '@punctuation', { fg = '#c5c6cb' })
	vim.api.nvim_set_hl(0, '@punctuation.delimiter', { fg = '#c5c6cb' })
	vim.api.nvim_set_hl(0, '@punctuation.bracket', { fg = '#c5c6cb' })
	vim.api.nvim_set_hl(0, '@punctuation.special', { fg = '#c5c6cb' })

	-- Fix variable colors (use normal foreground instead of red)
	vim.api.nvim_set_hl(0, 'Identifier', { fg = '#e5e2e2' })
	vim.api.nvim_set_hl(0, '@variable', { fg = '#e5e2e2' })
	vim.api.nvim_set_hl(0, '@variable.builtin', { fg = '#c0c7d2', italic = true })
	vim.api.nvim_set_hl(0, '@variable.parameter', { fg = '#e5e2e2' })
	vim.api.nvim_set_hl(0, '@variable.member', { fg = '#e5e2e2' })

	-- Fix namespace/module colors (imports like stdx in Zig)
	vim.api.nvim_set_hl(0, '@namespace', { fg = '#c0c7d2' })
	vim.api.nvim_set_hl(0, '@module', { fg = '#c0c7d2' })
	vim.api.nvim_set_hl(0, 'TSNamespace', { fg = '#c0c7d2' })

	-- Fix type and constant colors (better contrast)
	vim.api.nvim_set_hl(0, 'Type', { fg = '#c5c6cb' })
	vim.api.nvim_set_hl(0, '@type', { fg = '#c5c6cb' })
	vim.api.nvim_set_hl(0, '@type.builtin', { fg = '#c5c6cb', italic = true })
	vim.api.nvim_set_hl(0, 'TSType', { fg = '#c5c6cb' })
	vim.api.nvim_set_hl(0, 'Constant', { fg = '#d1c2d0' })
	vim.api.nvim_set_hl(0, '@constant', { fg = '#d1c2d0' })
	vim.api.nvim_set_hl(0, '@constant.builtin', { fg = '#d1c2d0', italic = true })
	vim.api.nvim_set_hl(0, 'TSConstant', { fg = '#d1c2d0' })

	-- LSP diagnostic colors (proper Material Design colors)
	vim.api.nvim_set_hl(0, 'DiagnosticError', { fg = '#ffb4ab' })
	vim.api.nvim_set_hl(0, 'DiagnosticWarn', { fg = '#d1c2d0' })
	vim.api.nvim_set_hl(0, 'DiagnosticInfo', { fg = '#c0c7d2' })
	vim.api.nvim_set_hl(0, 'DiagnosticHint', { fg = '#c5c6cb' })
	-- Virtual text
	vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextError', { fg = '#ffb4ab' })
	vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextWarn', { fg = '#d1c2d0' })
	vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextInfo', { fg = '#c0c7d2' })
	vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextHint', { fg = '#c5c6cb' })
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
