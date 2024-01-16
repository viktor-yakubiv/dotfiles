local function merge_tables(target, source)
	for key, value in pairs(source) do
		target[key] = value
	end
end

return merge_tables
