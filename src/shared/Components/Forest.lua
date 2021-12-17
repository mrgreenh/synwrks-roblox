--!strict
local Roact = require(game.ReplicatedStorage.Common.Roact)
local _ = require(game.ReplicatedStorage.Common.underscore)

local Tree = require(game.ReplicatedStorage.Common.Components.Tree)
local ForestControlPanel = require(game.ReplicatedStorage.Common.Components.ForestControlPanel)

local Forest = Roact.Component:extend("Forest")

local SPREAD = 180

function Forest:init()
	self.state = {
		treeCount = self.props.treeCount,
	}
end

function Forest:setTreeCount(count)
	if count >= 0 then
		self:setState({
			treeCount = count,
		})
	end
end

function Forest:getCoordinates()
	math.randomseed(1)
	coordinates = {}
	for i = 1, self.state.treeCount do
		coordinates[i] = {
			Position = Vector3.new(math.random() * SPREAD - SPREAD / 2, 45, math.random() * SPREAD - SPREAD / 2 - 150),
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

	return Roact.createElement("Folder", {}, {
		ControlPanelAnchor = Roact.createElement("Part", {
			Size = Vector3.new(21, 8, 0.1),
			Position = Vector3.new(-2.5, 4.5, -50),
			Orientation = Vector3.new(0, 180, 0),
		}, {
			GuiSurface = Roact.createElement("SurfaceGui", {
				CanvasSize = Vector2.new(800, 400),
				SizingMode = "FixedSize",
			}, {
				ControlPanel = Roact.createElement(ForestControlPanel, {
					setTreeCount = function(count)
						self:setTreeCount(count)
					end,
					treeCount = self.state.treeCount,
				}),
			}),
		}),
		Trees = Roact.createFragment(trees),
	})
end

return Forest
