local component = function()
	local ok, devicons = pcall(require, 'nvim-web-devicons')
	if ok then
		local f_name, f_extension = vim.fn.expand('%:t'), vim.fn.expand('%:e')
		local icon = devicons.get_icon(f_name, f_extension) or ''
		local title = ''
		if f_name and f_name ~= '' then
			title = icon .. ' ' .. f_name
		else
			title = icon .. ' [No Name]'
		end
		return title
	else
		ok = vim.fn.exists('*WebDevIconsGetFileTypeSymbol')
		if ok ~= 0 then return vim.fn.WebDevIconsGetFileTypeSymbol() end
	end
end

return component
