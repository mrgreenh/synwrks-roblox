local Roact = require(game.ReplicatedStorage.Common.Roact)
local Counter = require(game.ReplicatedStorage.Common.Components.Counter)
local Tree = require(game.ReplicatedStorage.Common.Components.Tree)

return function()
	Roact.setGlobalConfig({
		elementTracing = true,
	})

	local tree3D = Roact.createElement("Part", {
		Position = Vector3.new(-19, 0, -50),
		Orientation = Vector3.new(0, 180, 0),
		Size = Vector3.new(15, 90, 10),
	}, {
		Model = Roact.createElement("SpecialMesh", {
			MeshId = "rbxassetid://8274039999",
			Offset = Vector3.new(-5, -23, 0),
		}),
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
		Tree = Roact.createElement(Tree),
	})

	Roact.mount(tree3D, game.Workspace.Baseplate, "index3D")
end
