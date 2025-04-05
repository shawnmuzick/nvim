return {
	'rcarriga/nvim-notify',
	config = function ()
		return require('notify').setup(
			{
				background_colour = "NotifyBackground",
				fps = 30,
				icons = {
					DEBUG = "",
					ERROR = "",
					INFO = "",
					TRACE = "✎",
					WARN = ""
				},
				level = 2,
				minimum_width = 50,
				render = "default",
				stages = "static",
				time_formats = {
					notification = "%T",
					notification_history = "%FT%T"
				},
				timeout = 1000,
				top_down = true
			}
		)
	end
}
