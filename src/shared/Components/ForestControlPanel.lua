--!strict
local Roact = require(game.ReplicatedStorage.Common.Roact)

local ForestControlPanel = Roact.Component:extend("ForestControlPanel")

function ForestControlPanel:render()
	return Roact.createElement("Frame", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = Color3.new(0, 0, 1),
	}, {
		MoreButton = Roact.createElement("TextButton", {
			Size = UDim2.new(0.33, 0, 1, 0),
			Text = "Mo' trees!",
			[Roact.Event.Activated] = function()
				self.props.setTreeCount(self.props.treeCount + 1)
			end,
		}),
		Value = Roact.createElement("TextLabel", {
			Size = UDim2.new(0.33, 0, 1, 0),
			Position = UDim2.new(0.33, 0, 0, 0),
			Text = tostring(self.props.treeCount),
		}),
		LessButton = Roact.createElement("TextButton", {
			Size = UDim2.new(0.33, 0, 1, 0),
			Position = UDim2.new(0.66, 0, 0, 0),
			Text = "Let's make some paper!",
			[Roact.Event.Activated] = function()
				self.props.setTreeCount(self.props.treeCount - 1)
			end,
		}),
	})
end

return ForestControlPanel
