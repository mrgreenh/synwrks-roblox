--!strict
local Roact = require(game.ReplicatedStorage.Common.Roact)

local Tree = Roact.Component:extend("Tree")

function Tree:render()
	return Roact.createElement("Part", {
		Position = Vector3.new(-19, 0, -50),
		Orientation = Vector3.new(0, 180, 0),
		Size = Vector3.new(15, 90, 10),
	}, {
		Model = Roact.createElement("SpecialMesh", {
			MeshId = "rbxassetid://8274039999",
			Offset = Vector3.new(-5, -23, 0),
		}),
	})
end

return Tree
