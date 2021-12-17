--!strict
local Roact = require(game.ReplicatedStorage.Common.Roact)
local _ = require(game.ReplicatedStorage.Common.underscore)

local Tree = require(game.ReplicatedStorage.Common.Components.Tree)

local Forest = Roact.Component:extend("Forest")

local SPREAD = 180

function Forest:getCoordinates()
	math.randomseed(1)
	coordinates = {}
	for i = 1, self.props.treeCount do
		coordinates[i] = {
			Position = Vector3.new(math.random() * SPREAD - SPREAD / 2, 45, math.random() * SPREAD - SPREAD / 2),
			Orientation = Vector3.new(0, math.random() * 360 * math.pi, 0),
		}
	end
	return coordinates
end

function Forest:render()
	local trees = _.map(self:getCoordinates(), function(coordinate)
		return Roact.createElement(Tree, {
			Position = coordinate.Position,
			Orientation = coordinate.Orientation,
		})
	end)

	print(tostring(#trees))
	print(tostring(trees[1]))
	for k, v in pairs(trees[1]) do
		print(tostring(k) .. ": " .. tostring(trees[1][k]))
	end

	return Roact.createFragment(trees)
end

return Forest
