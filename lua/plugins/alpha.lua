return {
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		dashboard.section.header.val = {
			[[ ███▄    █▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓]],
			[[ ██ ▀█   █▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒]],
			[[▓██  ▀█ ██▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░]],
			[[▓██▒  ▐▌██▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██ ]],
			[[▒██░   ▓██░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒]],
			[[░ ▒░   ▒ ▒░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░]],
			[[░ ░░   ░ ▒░░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░]],
			[[   ░   ░ ░   ░   ░ ░ ░ ▒       ░░   ▒  ░      ░   ]],
			[[         ░   ░  ░    ░          ░   ░         ░   ]],
		}

		dashboard.section.buttons.val = {
			dashboard.button("e", "New file", ":ene<BAR>startinsert<CR>"),
			dashboard.button("r", "Recent files", ":Telescope oldfiles<CR>"),
			dashboard.button("p", "Find file", ":Telescope find_files<CR>"),
			dashboard.button("f", "Find text", ":Telescope live_grep<CR>"),
			dashboard.button("b", "Open file system", ":Neotree filesystem toggle left<CR>"),
			dashboard.button("q", "Quit", ":qa<CR>"),
		}

		local function package_stats()
			-- copied from dashboard-nvim
			local lazy = require("lazy")

			local loaded = lazy.stats().loaded
			local count = lazy.stats().count
			local time = lazy.stats().startuptime

			return {
				loaded = loaded,
				count = count,
				time = time,
			}
		end

		local function footer()
			local stats = package_stats()

			return string.format("%d loaded / %d installed (%d ms)", stats.loaded, stats.count, stats.time)
		end

		dashboard.section.footer.val = footer()

		alpha.setup(dashboard.opts)
	end,
}
