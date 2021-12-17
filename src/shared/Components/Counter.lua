--!strict
local Roact = require(game.ReplicatedStorage.Common.Roact)

local Counter = Roact.Component:extend("Counter")

function Counter:init()
	self.state = {
		count = 0,
	}
end

function Counter:render()
	return Roact.createElement("Frame", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = Color3.new(0, 0, 1),
	}, {
		Button = Roact.createElement("TextButton", {
			Size = UDim2.new(0.5, 0, 1, 0),
			Text = "Clickme",
			[Roact.Event.Activated] = function()
				self:setState(function()
					return {
						count = self.state.count + 1,
					}
				end)
			end,
		}),
		Value = Roact.createElement("TextLabel", {
			Size = UDim2.new(0.5, 0, 1, 0),
			Position = UDim2.new(0.5, 0, 0, 0),
			Text = tostring(self.state.count),
		}),
	})
end

return Counter
