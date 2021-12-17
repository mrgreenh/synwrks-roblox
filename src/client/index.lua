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
		UIPart = Roact.createElement("Part", {
			Size = Vector3.new(21, 8, 0.1),
			Position = Vector3.new(-2.5, 4.5, -10),
			Orientation = Vector3.new(0, 180, 0),
		}, {
			GuiSurface = Roact.createElement("SurfaceGui", {
				CanvasSize = Vector2.new(800, 400),
				SizingMode = "FixedSize",
			}, {
				Counter = Roact.createElement(Counter),
			}),
		}),
		Tree = Roact.createElement(Forest, {
			treeCount = 20,
		}),
	})

	Roact.mount(tree3D, game.Workspace.Baseplate, "index3D")
end
