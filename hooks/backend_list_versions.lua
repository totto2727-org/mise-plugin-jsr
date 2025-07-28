function string:split(delimiter)
	local result = {}
	local from = 1
	local delim_from, delim_to = string.find(self, delimiter, from)
	while delim_from do
		table.insert(result, string.sub(self, from, delim_from - 1))
		from = delim_to + 1
		delim_from, delim_to = string.find(self, delimiter, from)
	end
	table.insert(result, string.sub(self, from))
	return result
end

function PLUGIN:BackendListVersions(ctx)
	local json = require("json")
	local http = require("http")

	print(ctx.tool)
	local toolRepo = ctx.tool:split("/")
	for value in toolRepo do
		print(value)
	end
	local metaJSON = http.get({
		url = "https://jsr.io/" .. toolRepo[1] .. "/" .. toolRepo[2] .. "/meta.json",
	})

	local versionsJSON = json.decode(metaJSON.body)["versions"]
	local versions = {}

	for key, _ in pairs(versionsJSON) do
		table.insert(versions, key)
	end

	return { versions = versions }
end
