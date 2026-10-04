local sourceUrl = "https://raw.githubusercontent.com/afsdgaGSDGAGSgaags/suslibrary/2532e79381a3a658ad17a06a1152b30b2975bbe1/YSLUILibrary.lua"

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
