local ok, neogit = pcall(require, 'neogit')

if not ok then
	return
end

neogit.setup({
	disable_signs = false,
	disable_context_highlighting = false,
	disable_commit_confirmation = false,
	signs = {
		section = { '', '' },
		item = { '', '' },
		hunk = { '', '' },
	},
	integrations = {
		diffview = true,
	},
})

local job
ok, job = pcall(require, 'plenary.job')

local result = job
	:new({
		command = 'ssh-agent',
		args = { '-s' },
	})
	:sync()

local env = vim.env
if result and #result then
	for _, v in ipairs(result) do
		local key, value = v:match('^(.*)=(.*);%s+export.*$')
		if key and value then
			env[key] = value
		end
	end
end
