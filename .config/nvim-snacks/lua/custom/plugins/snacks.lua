return {
	'folke/snacks.nvim',
	priority = 1000,
	lazy = false,
	opts = {
		-- Dashboard configuration
		dashboard = {
			enabled = false,
			sections = {
				{ section = "header" },
				{ section = "keys",   gap = 1 },
				{ section = "startup" },
			},
			preset = {
				keys = {
					{ icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.picker.files()" },
					{ icon = " ", key = "n", desc = "New File", action = ":ene" },
					{ icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.picker.grep()" },
					{ icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.picker.oldfiles()" },
					{ icon = " ", key = "c", desc = "Config", action = ":lua Snacks.picker.files({cwd = vim.fn.stdpath('config')})" },
					{ icon = " ", key = "s", desc = "Restore Session", action = ':lua require("persistence").load()' },
					{ icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
					{ icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy" },
					{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
				},
			},
		},
		-- Notification system (replaces notify)
		notifier = {
			enabled = true,
			timeout = 3000,
			top_down = true,
			width = { min = 40, max = 0.4 },
			height = { min = 1, max = 0.6 },
			icons = {
				error = " ",
				warn = " ",
				info = " ",
				debug = " ",
				trace = " ",
			},
		},
		-- Indent guides (replaces mini.indentscope)
		indent = {
			enabled = true,
			only_current = false,
			only_scope = false,
			animate = {
				enabled = true,
				duration = 20,
				easing = "linear",
			},
			char = "│",
		},
		-- Git integration
		git = {
			enabled = true,
		},
		-- Statuscolumn
		statuscolumn = {
			enabled = true,
			left = { "mark", "sign" },
			right = { "fold", "git" },
			folds = {
				open = false,
				git_hl = false,
			},
			git = {
				patterns = { "GitSign", "MiniDiffSign" },
			},
			refresh = 50,
		},
		-- Buffer management
		bufdelete = {
			enabled = true,
		},
		-- Terminal
		terminal = {
			enabled = true,
			win = {
				position = "float",
				border = "rounded",
			},
		},
		-- Picker (enhanced telescope replacement)
		picker = {
			enabled = true,
			ui_select = true,
			formatters = {
				file = {
					filename_first = false,
				},
			},
			files = {
				layout = 'ivy',
				hidden = true,
			},
			layout = 'ivy',
			win = {
				input = {
					keys = {
						["<C-k>"] = { "history_prev", mode = { "i", "n" } },
						["<C-j>"] = { "history_next", mode = { "i", "n" } },
						["."] = { "toggle_hidden", mode = { 'i', 'n' } },
					},
				},
			},
		},
		-- Smooth scrolling
		scroll = {
			enabled = true,
			animate = {
				duration = { step = 15, total = 250 },
				easing = "linear",
			},
		},
		-- Words (LSP references navigation)
		words = {
			enabled = true,
			debounce = 200,
		},
		-- Input (better vim.ui.input)
		input = {
			icon = " ",
			enabled = true,
			icon_hl = "SnacksInputIcon",
			icon_pos = "left",
			prompt_pos = "title",
			win = { style = "input" },
			expand = true,
		},
		-- Scope (better text objects)
		scope = {
			enabled = true,
			treesitter = {
				enabled = true,
			},
		},
		-- Dim inactive windows/scopes
		dim = {
			enabled = false, -- Can be toggled with keymaps
		},
		-- Bigfile handling
		bigfile = {
			enabled = true,
			notify = true,
			size = 1.5 * 1024 * 1024, -- 1.5MB
		},
		-- Explorer (file tree)
		explorer = {
			enabled = true,
			replace_netrw = true,
			hijack_netrw_plug = true,
			jump = true,
			sources = { "filesystem" },
		},
		-- Animation library
		animate = {
			enabled = true,
		},
		-- Zen mode for distraction-free coding
		zen = {
			enabled = true,
		},
		-- Rename with LSP integration
		rename = {
			enabled = true,
		},
	},
	keys = {
		-- Dashboard
		{ "<leader>D",        function() Snacks.dashboard() end,                                                           desc = "Dashboard" },

		-- Notifications
		{ "<leader>n",        function() Snacks.notifier.show_history() end,                                               desc = "Notification History" },
		{ "<leader>dn",       function() Snacks.notifier.hide() end,                                                       desc = "Dismiss All Notifications" },

		-- Terminal (preserving original keymaps)
		{ "<leader>tt",       function() Snacks.terminal.toggle(nil, { win = { position = "bottom", height = 0.3 } }) end, desc = "Terminal (horizontal)" },
		{ "<leader>tv",       function() Snacks.terminal.toggle(nil, { win = { position = "right", width = 0.4 } }) end,   desc = "Terminal (vertical)" },
		-- { "<leader>tf", function() Snacks.terminal.toggle() end, desc = "Terminal (float)" },
		{ "<C-/>",            function() Snacks.terminal.toggle() end,                                                     desc = "Terminal (float)",         mode = { "n", "t" } },
		{ "<C-_>",            function() Snacks.terminal.toggle() end,                                                     desc = "Terminal (float)",         mode = { "n", "t" } },

		-- Buffer management (replacing bufferline keymaps)
		{ "q",                function() Snacks.bufdelete() end,                                                           desc = "Delete Buffer" },
		{ "<leader>bd",       function() Snacks.bufdelete() end,                                                           desc = "Delete Buffer" },
		{ "<leader>bo",       function() Snacks.bufdelete.other() end,                                                     desc = "Delete Other Buffers" },

		-- File explorer
		{ "<leader>e",        function() Snacks.explorer.toggle() end,                                                     desc = "Explorer" },
		{ "<leader>E",        function() Snacks.explorer.open() end,                                                       desc = "Explorer (cwd)" },

		-- Picker (replacing telescope keymaps)
		{ "<leader><leader>", function() Snacks.picker.files() end,                                                        desc = "Find Files" },
		{ "<leader>sg",       function() Snacks.picker.grep() end,                                                         desc = "Search by Grep" },
		{ "<leader>sw",       function() Snacks.picker.grep_word() end,                                                    desc = "Search current Word",      mode = { "n", "x" } },
		{ "<leader>sb",       function() Snacks.picker.buffers() end,                                                      desc = "Buffers" },
		{ "<leader>sh",       function() Snacks.picker.help() end,                                                         desc = "Search Help" },
		{ "<leader>sk",       function() Snacks.picker.keymaps() end,                                                      desc = "Search Keymaps" },
		{ "<leader>sc",       function() Snacks.picker.git_log() end,                                                      desc = "Git Commits" },
		{ "<leader>ss",       function() Snacks.picker.lsp_symbols() end,                                                  desc = "LSP Symbols" },
		{ "<leader>sd",       function() Snacks.picker.diagnostics() end,                                                  desc = "Diagnostics" },
		{ "<leader>sr",       function() Snacks.picker.resume() end,                                                       desc = "Resume Last Search" },
		{ "<leader>sn",       function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end,                      desc = "Search Neovim files" },
		{ "<C-A-p>",          function() Snacks.picker.oldfiles() end,                                                     desc = "Recent Files" },
		{ "<leader>/",        function() Snacks.picker.lines() end,                                                        desc = "Search in Buffer" },
		{ "<leader>s/",       function() Snacks.picker.grep({ grep_open_files = true }) end,                               desc = "Search in Open Files" },

		-- Git
		{ "<leader>gb",       function() Snacks.git.blame_line() end,                                                      desc = "Git Blame Line" },
		{ "<leader>gB",       function() Snacks.git.blame_file() end,                                                      desc = "Git Blame File" },
		{ "<leader>gf",       function() Snacks.picker.git_files() end,                                                    desc = "Git Files" },
		{ "<leader>gs",       function() Snacks.picker.git_status() end,                                                   desc = "Git Status" },
		{ "<leader>gl",       function() Snacks.git.open_log() end,                                                        desc = "Git Log" },
		{ "<leader>gd",       function() Snacks.git.open_diff() end,                                                       desc = "Git Diff" },
		{ "]h",               function() Snacks.git.next_hunk() end,                                                       desc = "Next Hunk" },
		{ "[h",               function() Snacks.git.prev_hunk() end,                                                       desc = "Previous Hunk" },

		-- LSP
		{ "gR",               function() Snacks.rename() end,                                                              desc = "Rename with LSP" },
		{ "<leader>R",        function() Snacks.rename.rename_file() end,                                                  desc = "Rename File" },

		-- Zen mode
		{ "<leader>z",        function() Snacks.zen() end,                                                                 desc = "Toggle Zen Mode" },
		{ "<leader>Z",        function() Snacks.zen.zoom() end,                                                            desc = "Toggle Zoom" },

		-- Dim
		{ "<leader>td",       function() Snacks.dim.toggle() end,                                                          desc = "Toggle Dim" },

		-- Debug/inspection
		{ "<leader>dd",       function() Snacks.debug.inspect() end,                                                       desc = "Inspect",                  mode = { "n", "x" } },
		{ "<leader>dD",       function() Snacks.debug.backtrace() end,                                                     desc = "Backtrace" },

		-- Scratch buffer
		{ "<leader>.",        function() Snacks.scratch() end,                                                             desc = "Toggle Scratch Buffer" },
		{ "<leader>S",        function() Snacks.scratch.select() end,                                                      desc = "Select Scratch Buffer" },

		-- Toggle features
		{ "<leader>ti",       function() Snacks.indent.toggle() end,                                                       desc = "Toggle Indent Guides" },
		{ "<leader>tw",       function() Snacks.words.toggle() end,                                                        desc = "Toggle Word Highlights" },
	},
	init = function()
		vim.api.nvim_create_autocmd("User", {
			pattern = "VeryLazy",
			callback = function()
				-- Setup some globals for debugging (lazy-loaded)
				_G.dd = function(...)
					Snacks.debug.inspect(...)
				end
				_G.bt = function()
					Snacks.debug.backtrace()
				end
				vim.print = _G.dd -- Override print to use snacks

				-- Toggle mappings
				Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>ts")
				Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>tw")
				Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>tl")
				Snacks.toggle.diagnostics():map("<leader>td")
				Snacks.toggle.line_number():map("<leader>tn")
				Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map(
					"<leader>tc")
				Snacks.toggle.treesitter():map("<leader>tT")
				Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>tb")
				if vim.lsp.inlay_hint then
					Snacks.toggle.inlay_hints():map("<leader>th")
				end
			end,
		})

		-- Auto-hide tabline when only one buffer
		vim.api.nvim_create_autocmd({ "BufAdd", "BufDelete" }, {
			callback = function()
				vim.schedule(function()
					pcall(function()
						vim.cmd("set showtabline=" .. (#vim.fn.getbufinfo({ buflisted = true }) > 1 and 2 or 0))
					end)
				end)
			end,
		})

		-- Setup vim.notify to use snacks
		vim.notify = function(msg, level, opts)
			return Snacks.notifier.notify(msg, level, opts)
		end
	end,
}
