local M = {}

function M.setup()
	require('base16-colorscheme').setup {
		-- Background tones
		base00 = '#111415',          -- Default Background
		base01 = '#1d2022', -- Lighter Background (status bars)
		base02 = '#282a2c', -- Selection Background
		base03 = '#8a9297',          -- Comments, Invisibles
		-- Foreground tones
		base04 = '#c0c8cd', -- Dark Foreground (status bars)
		base05 = '#e1e2e4',       -- Default Foreground
		base06 = '#e1e2e4',       -- Light Foreground
		base07 = '#e1e2e4',    -- Lightest Foreground
		-- Accent colors
		base08 = '#ffb4ab',            -- Variables, XML Tags, Errors
		base09 = '#c6c2ea',         -- Integers, Constants
		base0A = '#b4cad6',        -- Classes, Search Background
		base0B = '#67d3ff',          -- Strings, Diff Inserted
		base0C = '#c6c2ea', -- Regex, Escape Chars
		base0D = '#67d3ff', -- Functions, Methods
		base0E = '#b4cad6', -- Keywords, Storage
		base0F = '#93000a',  -- Deprecated, Embedded Tags
	}

	-- LSP reference highlighting: use background instead of underline
	vim.api.nvim_set_hl(0, 'LspReferenceText', { bg = '#282a2c' })
	vim.api.nvim_set_hl(0, 'LspReferenceRead', { bg = '#282a2c' })
	vim.api.nvim_set_hl(0, 'LspReferenceWrite', { bg = '#323537', bold = true })

	-- Fix punctuation colors (use foreground color instead of red)
	vim.api.nvim_set_hl(0, 'Delimiter', { fg = '#c0c8cd' })
	vim.api.nvim_set_hl(0, 'Operator', { fg = '#e1e2e4' })
	vim.api.nvim_set_hl(0, '@punctuation', { fg = '#c0c8cd' })
	vim.api.nvim_set_hl(0, '@punctuation.delimiter', { fg = '#c0c8cd' })
	vim.api.nvim_set_hl(0, '@punctuation.bracket', { fg = '#c0c8cd' })
	vim.api.nvim_set_hl(0, '@punctuation.special', { fg = '#c0c8cd' })

	-- Fix variable colors (use normal foreground instead of red)
	vim.api.nvim_set_hl(0, 'Identifier', { fg = '#e1e2e4' })
	vim.api.nvim_set_hl(0, '@variable', { fg = '#e1e2e4' })
	vim.api.nvim_set_hl(0, '@variable.builtin', { fg = '#67d3ff', italic = true })
	vim.api.nvim_set_hl(0, '@variable.parameter', { fg = '#e1e2e4' })
	vim.api.nvim_set_hl(0, '@variable.member', { fg = '#e1e2e4' })

	-- Fix namespace/module colors (imports like stdx in Zig)
	vim.api.nvim_set_hl(0, '@namespace', { fg = '#67d3ff' })
	vim.api.nvim_set_hl(0, '@module', { fg = '#67d3ff' })
	vim.api.nvim_set_hl(0, 'TSNamespace', { fg = '#67d3ff' })

	-- Fix type and constant colors (better contrast)
	vim.api.nvim_set_hl(0, 'Type', { fg = '#b4cad6' })
	vim.api.nvim_set_hl(0, '@type', { fg = '#b4cad6' })
	vim.api.nvim_set_hl(0, '@type.builtin', { fg = '#b4cad6', italic = true })
	vim.api.nvim_set_hl(0, 'TSType', { fg = '#b4cad6' })
	vim.api.nvim_set_hl(0, 'Constant', { fg = '#c6c2ea' })
	vim.api.nvim_set_hl(0, '@constant', { fg = '#c6c2ea' })
	vim.api.nvim_set_hl(0, '@constant.builtin', { fg = '#c6c2ea', italic = true })
	vim.api.nvim_set_hl(0, 'TSConstant', { fg = '#c6c2ea' })

	-- LSP diagnostic colors (proper Material Design colors)
	vim.api.nvim_set_hl(0, 'DiagnosticError', { fg = '#ffb4ab' })
	vim.api.nvim_set_hl(0, 'DiagnosticWarn', { fg = '#c6c2ea' })
	vim.api.nvim_set_hl(0, 'DiagnosticInfo', { fg = '#67d3ff' })
	vim.api.nvim_set_hl(0, 'DiagnosticHint', { fg = '#b4cad6' })
	-- Virtual text
	vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextError', { fg = '#ffb4ab' })
	vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextWarn', { fg = '#c6c2ea' })
	vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextInfo', { fg = '#67d3ff' })
	vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextHint', { fg = '#b4cad6' })
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
