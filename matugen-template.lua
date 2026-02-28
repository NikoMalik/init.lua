local M = {}

function M.setup()
	require('base16-colorscheme').setup {
		-- Background tones
		base00 = '{{colors.surface.default.hex}}',          -- Default Background
		base01 = '{{colors.surface_container.default.hex}}', -- Lighter Background (status bars)
		base02 = '{{colors.surface_container_high.default.hex}}', -- Selection Background
		base03 = '{{colors.outline.default.hex}}',          -- Comments, Invisibles
		-- Foreground tones
		base04 = '{{colors.on_surface_variant.default.hex}}', -- Dark Foreground (status bars)
		base05 = '{{colors.on_surface.default.hex}}',       -- Default Foreground
		base06 = '{{colors.on_surface.default.hex}}',       -- Light Foreground
		base07 = '{{colors.on_background.default.hex}}',    -- Lightest Foreground
		-- Accent colors
		base08 = '{{colors.error.default.hex}}',            -- Variables, XML Tags, Errors
		base09 = '{{colors.tertiary.default.hex}}',         -- Integers, Constants
		base0A = '{{colors.secondary.default.hex}}',        -- Classes, Search Background
		base0B = '{{colors.primary.default.hex}}',          -- Strings, Diff Inserted
		base0C = '{{colors.tertiary_fixed_dim.default.hex}}', -- Regex, Escape Chars
		base0D = '{{colors.primary_fixed_dim.default.hex}}', -- Functions, Methods
		base0E = '{{colors.secondary_fixed_dim.default.hex}}', -- Keywords, Storage
		base0F = '{{colors.error_container.default.hex}}',  -- Deprecated, Embedded Tags
	}

	-- LSP reference highlighting: use background instead of underline
	vim.api.nvim_set_hl(0, 'LspReferenceText', { bg = '{{colors.surface_container_high.default.hex}}' })
	vim.api.nvim_set_hl(0, 'LspReferenceRead', { bg = '{{colors.surface_container_high.default.hex}}' })
	vim.api.nvim_set_hl(0, 'LspReferenceWrite', { bg = '{{colors.surface_container_highest.default.hex}}', bold = true })

	-- Fix punctuation colors (use foreground color instead of red)
	vim.api.nvim_set_hl(0, 'Delimiter', { fg = '{{colors.on_surface_variant.default.hex}}' })
	vim.api.nvim_set_hl(0, 'Operator', { fg = '{{colors.on_surface.default.hex}}' })
	vim.api.nvim_set_hl(0, '@punctuation', { fg = '{{colors.on_surface_variant.default.hex}}' })
	vim.api.nvim_set_hl(0, '@punctuation.delimiter', { fg = '{{colors.on_surface_variant.default.hex}}' })
	vim.api.nvim_set_hl(0, '@punctuation.bracket', { fg = '{{colors.on_surface_variant.default.hex}}' })
	vim.api.nvim_set_hl(0, '@punctuation.special', { fg = '{{colors.on_surface_variant.default.hex}}' })

	-- LSP diagnostic colors (proper Material Design colors)
	vim.api.nvim_set_hl(0, 'DiagnosticError', { fg = '{{colors.error.default.hex}}' })
	vim.api.nvim_set_hl(0, 'DiagnosticWarn', { fg = '{{colors.tertiary.default.hex}}' })
	vim.api.nvim_set_hl(0, 'DiagnosticInfo', { fg = '{{colors.primary.default.hex}}' })
	vim.api.nvim_set_hl(0, 'DiagnosticHint', { fg = '{{colors.secondary.default.hex}}' })
	-- Virtual text
	vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextError', { fg = '{{colors.error.default.hex}}' })
	vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextWarn', { fg = '{{colors.tertiary.default.hex}}' })
	vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextInfo', { fg = '{{colors.primary.default.hex}}' })
	vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextHint', { fg = '{{colors.secondary.default.hex}}' })
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
