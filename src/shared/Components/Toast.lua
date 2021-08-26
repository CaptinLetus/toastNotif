local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Roact = require(ReplicatedStorage.Common.Roact)

local e = Roact.createElement

local Toast = Roact.Component:extend("Toast")

local ySize = 0.1

function Toast:init()

end

function Toast:render()
	return e("Frame", {
		Size = UDim2.fromScale(0.1, ySize),
		AnchorPoint = Vector2.new(0, 1),
		Position = UDim2.fromScale(0, 1 - (self.props.index - 1) * ySize),
		BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	}, {
		Title = e("TextLabel", {
			Text = self.props.title,
			Font = Enum.Font.SourceSansBold,
			Size = UDim2.fromScale(1, 0.2),
			BackgroundTransparency = 1,
			TextColor3 = Color3.fromRGB(255, 255, 255),
			TextScaled = true
		}),
		Text = e("TextLabel", {
			Text = self.props.text,
			Font = Enum.Font.SourceSans,
			Size = UDim2.fromScale(1, 0.7),
			Position = UDim2.fromScale(0, 0.3),
			BackgroundTransparency = 1,
			TextColor3 = Color3.fromRGB(255, 255, 255),
			TextScaled = true
		})
	})
end

return Toast