local sourceUrl = "https://raw.githubusercontent.com/afsdgaGSDGAGSgaags/suslibrary/a924362fbc6fac0aad4840a790c4040efc97bb88/YSLUILibrary.lua"

if type(loadstring) ~= "function" then
	error("This example requires an environment that supports loadstring.")
end

local httpGet = game.HttpGet
local ok, source = pcall(function()
	return httpGet(game, sourceUrl)
end)
if not ok then
	error("Could not download the UI showcase: " .. tostring(source))
end

local chunk, compileError = loadstring(source, "YSL UI Library Showcase")
if not chunk then
	error("Could not compile the UI showcase: " .. tostring(compileError))
end

chunk()
