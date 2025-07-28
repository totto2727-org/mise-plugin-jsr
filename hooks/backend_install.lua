function PLUGIN:BackendInstall(ctx)
	local tool = ctx.tool
	local version = ctx.version
	local install_path = ctx.install_path

	-- Install the package directly using npm install
	local cmd = require("cmd")
	local deno_cmd = "deno install --global" .. tool .. "@" .. version
	cmd.exec(deno_cmd, { cwd = install_path })

	-- If we get here, the command succeeded
	return {}
end
