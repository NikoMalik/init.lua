local M = {}

function M.setup()
	require('base16-colorscheme').setup {
		-- Background tones
		base00 = '#141316',          -- Default Background
		base01 = '#201f22', -- Lighter Background (status bars)
		base02 = '#2b292c', -- Selection Background
		base03 = '#928f98',          -- Comments, Invisibles
		-- Foreground tones
		base04 = '#c9c5ce', -- Dark Foreground (status bars)
		base05 = '#e5e1e5',       -- Default Foreground
		base06 = '#e5e1e5',       -- Light Foreground
		base07 = '#e5e1e5',    -- Lightest Foreground
		-- Accent colors
		base08 = '#ffb4ab',            -- Variables, XML Tags, Errors
		base09 = '#ecb8d3',         -- Integers, Constants
		base0A = '#c9c4d7',        -- Classes, Search Background
		base0B = '#c8c1ed',          -- Strings, Diff Inserted
		base0C = '#ecb8d3', -- Regex, Escape Chars
		base0D = '#c8c1ed', -- Functions, Methods
		base0E = '#c9c4d7', -- Keywords, Storage
		base0F = '#93000a',  -- Deprecated, Embedded Tags
	}

	-- LSP reference highlighting: use background instead of underline
	vim.api.nvim_set_hl(0, 'LspReferenceText', { bg = '#2b292c' })
	vim.api.nvim_set_hl(0, 'LspReferenceRead', { bg = '#2b292c' })
	vim.api.nvim_set_hl(0, 'LspReferenceWrite', { bg = '#353437', bold = true })

	-- Fix punctuation colors (use foreground color instead of red)
	vim.api.nvim_set_hl(0, 'Delimiter', { fg = '#c9c5ce' })
	vim.api.nvim_set_hl(0, 'Operator', { fg = '#e5e1e5' })
	vim.api.nvim_set_hl(0, '@punctuation', { fg = '#c9c5ce' })
	vim.api.nvim_set_hl(0, '@punctuation.delimiter', { fg = '#c9c5ce' })
	vim.api.nvim_set_hl(0, '@punctuation.bracket', { fg = '#c9c5ce' })
	vim.api.nvim_set_hl(0, '@punctuation.special', { fg = '#c9c5ce' })

	-- Fix variable colors (use normal foreground instead of red)
	vim.api.nvim_set_hl(0, 'Identifier', { fg = '#e5e1e5' })
	vim.api.nvim_set_hl(0, '@variable', { fg = '#e5e1e5' })
	vim.api.nvim_set_hl(0, '@variable.builtin', { fg = '#c8c1ed', italic = true })
	vim.api.nvim_set_hl(0, '@variable.parameter', { fg = '#e5e1e5' })
	vim.api.nvim_set_hl(0, '@variable.member', { fg = '#e5e1e5' })

	-- Fix namespace/module colors (imports like stdx in Zig)
	vim.api.nvim_set_hl(0, '@namespace', { fg = '#c8c1ed' })
	vim.api.nvim_set_hl(0, '@module', { fg = '#c8c1ed' })
	vim.api.nvim_set_hl(0, 'TSNamespace', { fg = '#c8c1ed' })

	-- Fix type and constant colors (better contrast)
	vim.api.nvim_set_hl(0, 'Type', { fg = '#c9c4d7' })
	vim.api.nvim_set_hl(0, '@type', { fg = '#c9c4d7' })
	vim.api.nvim_set_hl(0, '@type.builtin', { fg = '#c9c4d7', italic = true })
	vim.api.nvim_set_hl(0, 'TSType', { fg = '#c9c4d7' })
	vim.api.nvim_set_hl(0, 'Constant', { fg = '#ecb8d3' })
	vim.api.nvim_set_hl(0, '@constant', { fg = '#ecb8d3' })
	vim.api.nvim_set_hl(0, '@constant.builtin', { fg = '#ecb8d3', italic = true })
	vim.api.nvim_set_hl(0, 'TSConstant', { fg = '#ecb8d3' })

	-- LSP diagnostic colors (proper Material Design colors)
	vim.api.nvim_set_hl(0, 'DiagnosticError', { fg = '#ffb4ab' })
	vim.api.nvim_set_hl(0, 'DiagnosticWarn', { fg = '#ecb8d3' })
	vim.api.nvim_set_hl(0, 'DiagnosticInfo', { fg = '#c8c1ed' })
	vim.api.nvim_set_hl(0, 'DiagnosticHint', { fg = '#c9c4d7' })
	-- Virtual text
	vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextError', { fg = '#ffb4ab' })
	vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextWarn', { fg = '#ecb8d3' })
	vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextInfo', { fg = '#c8c1ed' })
	vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextHint', { fg = '#c9c4d7' })
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
