require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = "sonokai",
    component_separators = { left = "", right = ""},
    section_separators = { left = "", right = ""},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = true,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {"mode"},
    lualine_b = {"branch", "diff", "diagnostics"},
    lualine_c = {"filename", "b:coc_symbol_line_plain"},
    lualine_x = {"encoding", "fileformat", "filetype"},
    lualine_y = {"progress"},
    -- lualine_y = {'coc#status', 'b:coc_current_function'},
    lualine_z = {"location"}
  },
  -- inactive_sections = {
  --   lualine_a = {},
  --   lualine_b = {},
  --   lualine_c = {"filename"},
  --   lualine_x = {"location"},
  --   lualine_y = {},
  --   lualine_z = {}
  -- },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
})


--[[ require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "ayu_light",
		component_separators = {
			left = "",
			right = "",
		},
		section_separators = {
			left = "",
			right = "",
		},
		disabled_filetypes = {},
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = {
			"branch",
			"diff",
			{
				"diagnostics",
				diagnostics_color = {
					error = "DiagnosticError",
					warn = "DiagnosticWarn",
					info = "DiagnosticInfo",
					hint = "DiagnosticHint",
				},
			},
		},
		lualine_c = {
			{
				"filename",
				file_status = true,
				path = 2,
				shorting_target = 1000,
			},
		},
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
}) ]]
