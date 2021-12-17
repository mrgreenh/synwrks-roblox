--!strict
local Roact = require(game.ReplicatedStorage.Common.Roact)

local Tree = Roact.Component:extend("Tree")

function Tree:render()
	return Roact.createElement("Part", {
		Position = self.props.Position,
		Orientation = self.props.Orientation,
		Size = Vector3.new(15, 90, 10),
		Anchored = true,
	}, {
		Model = Roact.createElement("SpecialMesh", {
			MeshId = "rbxassetid://8274039999",
			Offset = Vector3.new(-5, -23, 0),
		}),
	})
end

return Tree
