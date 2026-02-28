local M = {}

function M.setup()
	require('base16-colorscheme').setup {
		-- Background tones
		base00 = '#121414',          -- Default Background
		base01 = '#1f2020', -- Lighter Background (status bars)
		base02 = '#292a2a', -- Selection Background
		base03 = '#8c9292',          -- Comments, Invisibles
		-- Foreground tones
		base04 = '#c1c8c8', -- Dark Foreground (status bars)
		base05 = '#e3e2e2',       -- Default Foreground
		base06 = '#e3e2e2',       -- Light Foreground
		base07 = '#e3e2e2',    -- Lightest Foreground
		-- Accent colors
		base08 = '#ffb4ab',            -- Variables, XML Tags, Errors
		base09 = '#cac3db',         -- Integers, Constants
		base0A = '#bfc8c9',        -- Classes, Search Background
		base0B = '#b1cbcd',          -- Strings, Diff Inserted
		base0C = '#cac3db', -- Regex, Escape Chars
		base0D = '#b1cbcd', -- Functions, Methods
		base0E = '#bfc8c9', -- Keywords, Storage
		base0F = '#93000a',  -- Deprecated, Embedded Tags
	}
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
