local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Roact = require(ReplicatedStorage.Common.Roact)
local Toast = require(ReplicatedStorage.Common.Components.Toast)

local e = Roact.createElement

local currentToasts = {}

local function app()
	local toasts = {}

	for index,v in pairs(currentToasts) do
		toasts[v.id] = e(Toast, {
			index = index,
			title = v.title,
			text = v.text
		})
	end

	return e("ScreenGui", {}, {
		Roact.createFragment(toasts)
	})
end

local handle = Roact.mount(app(), Players.LocalPlayer.PlayerGui)

local function newToast(title, text)
	local thisId  = HttpService:GenerateGUID(false)

	table.insert(currentToasts, {
		id = thisId,
		title = title,
		text = text
	})

	Roact.update(handle, app())

	task.delay(3, function ()
		for i,v in pairs (currentToasts) do
			if v.id == thisId then
				table.remove(currentToasts, i)
				Roact.update(handle, app())
			end
		end
	end)
end

wait(2)

newToast("First", "sup")
wait(1)
newToast("Second", "ok boomer")