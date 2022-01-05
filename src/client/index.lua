local Roact = require(game.ReplicatedStorage.Common.Roact)
local Counter = require(game.ReplicatedStorage.Common.Components.Counter)
local Forest = require(game.ReplicatedStorage.Common.Components.Forest)

return function()
	Roact.setGlobalConfig({
		elementTracing = true,
	})

	local tree3D = Roact.createElement("Folder", {}, {
		SpawnLocation = Roact.createElement("SpawnLocation", {
			Transparency = 1,
			CanCollide = false,
		}),
		Counter = Roact.createElement(Counter),
		Forest = Roact.createElement(Forest, {
			treeCount = 20,
		}),
	})

	Roact.mount(tree3D, game.Workspace.Baseplate, "index3D")
end
