local M = {}

function M.setup()
	require('base16-colorscheme').setup {
		-- Background tones
		base00 = '#121316',          -- Default Background
		base01 = '#1e2022', -- Lighter Background (status bars)
		base02 = '#292a2d', -- Selection Background
		base03 = '#8d9198',          -- Comments, Invisibles
		-- Foreground tones
		base04 = '#c3c6cf', -- Dark Foreground (status bars)
		base05 = '#e3e2e5',       -- Default Foreground
		base06 = '#e3e2e5',       -- Light Foreground
		base07 = '#e3e2e5',    -- Lightest Foreground
		-- Accent colors
		base08 = '#ffb4ab',            -- Variables, XML Tags, Errors
		base09 = '#e3b9e7',         -- Integers, Constants
		base0A = '#bcc7d9',        -- Classes, Search Background
		base0B = '#aac9f1',          -- Strings, Diff Inserted
		base0C = '#e3b9e7', -- Regex, Escape Chars
		base0D = '#aac9f1', -- Functions, Methods
		base0E = '#bcc7d9', -- Keywords, Storage
		base0F = '#93000a',  -- Deprecated, Embedded Tags
	}

	-- LSP reference highlighting: use background instead of underline
	vim.api.nvim_set_hl(0, 'LspReferenceText', { bg = '#292a2d' })
	vim.api.nvim_set_hl(0, 'LspReferenceRead', { bg = '#292a2d' })
	vim.api.nvim_set_hl(0, 'LspReferenceWrite', { bg = '#333537', bold = true })

	-- Fix punctuation colors (use foreground color instead of red)
	vim.api.nvim_set_hl(0, 'Delimiter', { fg = '#c3c6cf' })
	vim.api.nvim_set_hl(0, 'Operator', { fg = '#e3e2e5' })
	vim.api.nvim_set_hl(0, '@punctuation', { fg = '#c3c6cf' })
	vim.api.nvim_set_hl(0, '@punctuation.delimiter', { fg = '#c3c6cf' })
	vim.api.nvim_set_hl(0, '@punctuation.bracket', { fg = '#c3c6cf' })
	vim.api.nvim_set_hl(0, '@punctuation.special', { fg = '#c3c6cf' })

	-- Fix variable colors (use normal foreground instead of red)
	vim.api.nvim_set_hl(0, 'Identifier', { fg = '#e3e2e5' })
	vim.api.nvim_set_hl(0, '@variable', { fg = '#e3e2e5' })
	vim.api.nvim_set_hl(0, '@variable.builtin', { fg = '#aac9f1', italic = true })
	vim.api.nvim_set_hl(0, '@variable.parameter', { fg = '#e3e2e5' })
	vim.api.nvim_set_hl(0, '@variable.member', { fg = '#e3e2e5' })

	-- Fix namespace/module colors (imports like stdx in Zig)
	vim.api.nvim_set_hl(0, '@namespace', { fg = '#aac9f1' })
	vim.api.nvim_set_hl(0, '@module', { fg = '#aac9f1' })
	vim.api.nvim_set_hl(0, 'TSNamespace', { fg = '#aac9f1' })

	-- Fix type and constant colors (better contrast)
	vim.api.nvim_set_hl(0, 'Type', { fg = '#bcc7d9' })
	vim.api.nvim_set_hl(0, '@type', { fg = '#bcc7d9' })
	vim.api.nvim_set_hl(0, '@type.builtin', { fg = '#bcc7d9', italic = true })
	vim.api.nvim_set_hl(0, 'TSType', { fg = '#bcc7d9' })
	vim.api.nvim_set_hl(0, 'Constant', { fg = '#e3b9e7' })
	vim.api.nvim_set_hl(0, '@constant', { fg = '#e3b9e7' })
	vim.api.nvim_set_hl(0, '@constant.builtin', { fg = '#e3b9e7', italic = true })
	vim.api.nvim_set_hl(0, 'TSConstant', { fg = '#e3b9e7' })

	-- LSP diagnostic colors (proper Material Design colors)
	vim.api.nvim_set_hl(0, 'DiagnosticError', { fg = '#ffb4ab' })
	vim.api.nvim_set_hl(0, 'DiagnosticWarn', { fg = '#e3b9e7' })
	vim.api.nvim_set_hl(0, 'DiagnosticInfo', { fg = '#aac9f1' })
	vim.api.nvim_set_hl(0, 'DiagnosticHint', { fg = '#bcc7d9' })
	-- Virtual text
	vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextError', { fg = '#ffb4ab' })
	vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextWarn', { fg = '#e3b9e7' })
	vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextInfo', { fg = '#aac9f1' })
	vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextHint', { fg = '#bcc7d9' })
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
