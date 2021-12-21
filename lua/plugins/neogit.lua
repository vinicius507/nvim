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
})

local env = vim.env

if env['SSH_AGENT_PID'] then
	return
end

local job
ok, job = pcall(require, 'plenary.job')

local result = job
	:new({
		command = 'ssh-agent',
		args = { '-s' },
	})
	:sync()

if result and #result then
	for _, v in ipairs(result) do
		local key, value = v:match('^(.*)=(.*);%s+export.*$')
		if key and value then
			env[key] = value
		end
	end
end

result = job
	:new({
		command = 'ssh-add',
		args = { os.getenv('HOME') .. '/.ssh/id_ed25519' },
	})
	:sync()
