local M = {}

function M.setup()
	require('base16-colorscheme').setup {
		-- Background tones
		base00 = '#101414',          -- Default Background
		base01 = '#1d2020', -- Lighter Background (status bars)
		base02 = '#272b2a', -- Selection Background
		base03 = '#889392',          -- Comments, Invisibles
		-- Foreground tones
		base04 = '#bec9c8', -- Dark Foreground (status bars)
		base05 = '#e0e3e2',       -- Default Foreground
		base06 = '#e0e3e2',       -- Light Foreground
		base07 = '#e0e3e2',    -- Lightest Foreground
		-- Accent colors
		base08 = '#ffb4ab',            -- Variables, XML Tags, Errors
		base09 = '#b2c8e8',         -- Integers, Constants
		base0A = '#b0cccb',        -- Classes, Search Background
		base0B = '#4ddad8',          -- Strings, Diff Inserted
		base0C = '#b2c8e8', -- Regex, Escape Chars
		base0D = '#4ddad8', -- Functions, Methods
		base0E = '#b0cccb', -- Keywords, Storage
		base0F = '#93000a',  -- Deprecated, Embedded Tags
	}

	-- LSP reference highlighting: use background instead of underline
	vim.api.nvim_set_hl(0, 'LspReferenceText', { bg = '#272b2a' })
	vim.api.nvim_set_hl(0, 'LspReferenceRead', { bg = '#272b2a' })
	vim.api.nvim_set_hl(0, 'LspReferenceWrite', { bg = '#323535', bold = true })

	-- Fix punctuation colors (use foreground color instead of red)
	vim.api.nvim_set_hl(0, 'Delimiter', { fg = '#bec9c8' })
	vim.api.nvim_set_hl(0, 'Operator', { fg = '#e0e3e2' })
	vim.api.nvim_set_hl(0, '@punctuation', { fg = '#bec9c8' })
	vim.api.nvim_set_hl(0, '@punctuation.delimiter', { fg = '#bec9c8' })
	vim.api.nvim_set_hl(0, '@punctuation.bracket', { fg = '#bec9c8' })
	vim.api.nvim_set_hl(0, '@punctuation.special', { fg = '#bec9c8' })

	-- Fix variable colors (use normal foreground instead of red)
	vim.api.nvim_set_hl(0, 'Identifier', { fg = '#e0e3e2' })
	vim.api.nvim_set_hl(0, '@variable', { fg = '#e0e3e2' })
	vim.api.nvim_set_hl(0, '@variable.builtin', { fg = '#4ddad8', italic = true })
	vim.api.nvim_set_hl(0, '@variable.parameter', { fg = '#e0e3e2' })
	vim.api.nvim_set_hl(0, '@variable.member', { fg = '#e0e3e2' })

	-- Fix namespace/module colors (imports like stdx in Zig)
	vim.api.nvim_set_hl(0, '@namespace', { fg = '#4ddad8' })
	vim.api.nvim_set_hl(0, '@module', { fg = '#4ddad8' })
	vim.api.nvim_set_hl(0, 'TSNamespace', { fg = '#4ddad8' })

	-- Fix type and constant colors (better contrast)
	vim.api.nvim_set_hl(0, 'Type', { fg = '#b0cccb' })
	vim.api.nvim_set_hl(0, '@type', { fg = '#b0cccb' })
	vim.api.nvim_set_hl(0, '@type.builtin', { fg = '#b0cccb', italic = true })
	vim.api.nvim_set_hl(0, 'TSType', { fg = '#b0cccb' })
	vim.api.nvim_set_hl(0, 'Constant', { fg = '#b2c8e8' })
	vim.api.nvim_set_hl(0, '@constant', { fg = '#b2c8e8' })
	vim.api.nvim_set_hl(0, '@constant.builtin', { fg = '#b2c8e8', italic = true })
	vim.api.nvim_set_hl(0, 'TSConstant', { fg = '#b2c8e8' })

	-- LSP diagnostic colors (proper Material Design colors)
	vim.api.nvim_set_hl(0, 'DiagnosticError', { fg = '#ffb4ab' })
	vim.api.nvim_set_hl(0, 'DiagnosticWarn', { fg = '#b2c8e8' })
	vim.api.nvim_set_hl(0, 'DiagnosticInfo', { fg = '#4ddad8' })
	vim.api.nvim_set_hl(0, 'DiagnosticHint', { fg = '#b0cccb' })
	-- Virtual text
	vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextError', { fg = '#ffb4ab' })
	vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextWarn', { fg = '#b2c8e8' })
	vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextInfo', { fg = '#4ddad8' })
	vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextHint', { fg = '#b0cccb' })
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
