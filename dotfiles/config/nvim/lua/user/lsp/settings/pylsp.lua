require("lfs")

function PylspConfig(env)
	return {
		settings = {
			pylsp = {
				plugins = {
					jedi = {
						environment = env,
					},
				},
			},
		},
	}
end

if lfs.attributes("./env", "mode") == "directory" then
	return PylspConfig("./env")
end
return PylspConfig("/")
