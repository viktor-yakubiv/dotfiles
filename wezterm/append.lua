local function concat_tables(target, source)
	for _, value in pairs(source) do
		target[#target+1] = value
	end
end

return concat_tables
