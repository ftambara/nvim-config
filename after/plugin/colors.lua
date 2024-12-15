function Color(color)
	color = color or 'gruvbox'
    require("gruvbox").setup({
        terminal_colors = true,
        contrast_dark = "hard",
        palette_overrides = {
            -- Set a black background
            dark0_hard = "#000000",
            dark0 = "#070707",
        }
    })

	vim.cmd.colorscheme(color)
end

Color()
