local cmp = require("cmp")
local lsp = require("lsp-zero")
local lspkind = require("lspkind")
local luasnip = require("luasnip")
local mappings = require("mappings")

lsp.preset("per-project")
lsp.ensure_installed({ "vimls", "sumneko_lua" })
lsp.set_preferences({ set_lsp_keymaps = false })

lsp.setup_servers({
	"pylsp",
	"sumneko_lua",
	on_attach = function(client)
		local caps = client.server_capabilities
		caps.document_formatting = false
		caps.range_formatting = true
	end,
})
lsp.nvim_workspace({ library = vim.api.nvim_get_runtime_file("", true) })

lsp.on_attach(function(client, buffer)
	local caps = client.server_capabilities

	mappings.add({ "K", vim.lsp.buf.hover, buffer = buffer, description = "Hover" })
	mappings.add({ "gi", vim.lsp.buf.implementation, buffer = buffer, "Goto implementation" })
	mappings.add({ "gr", vim.lsp.buf.references, buffer = buffer, description = "Goto references" })
	mappings.add({ "gd", vim.lsp.buf.definition, buffer = buffer, description = "Goto definition" })
	mappings.add({ "gD", vim.lsp.buf.declaration, buffer = buffer, description = "Goto declaration" })
	mappings.add({ "gt", vim.lsp.buf.type_definition, buffer = buffer, description = "Goto type definition" })
	mappings.add({
		"<C-h>",
		vim.lsp.buf.signature_help,
		buffer = buffer,
		modes = "i",
		description = "Signature help",
	})
	mappings.add({ "<Leader>cr", vim.lsp.buf.rename, buffer = buffer, description = "Rename" })
	mappings.add({ "<Leader>ca", vim.lsp.buf.code_action, buffer = buffer, description = "Code actions" })

	if caps.document_formatting then
		mappings.add({
			"<Leader>cf",
			function()
				local get_mark = vim.api.nvim_buf_get_mark
				if vim.api.nvim_get_mode().mode == "n" then
					vim.lsp.buf.format({ async = true })
				else
					local start_pos = get_mark(buffer, "<")
					local end_pos = get_mark(buffer, ">")
					vim.lsp.buf.format({ range = { start_pos, end_pos } })
				end
			end,
			buffer = buffer,
			modes = { "n", "v" },
			description = "Format Buffer/Region",
		})
	end

	-- Trouble
	mappings.add({
		"<Leader>cx",
		function()
			vim.cmd.TroubleToggle("document_diagnostics")
		end,
		buffer = buffer,
		description = "Document diagnostics",
	})
	mappings.add({
		"<Leader>cX",
		vim.cmd.TroubleToggle,
		buffer = buffer,
		description = "Workspace diagnostics",
	})
end)

lsp.setup_nvim_cmp({
	documentation = cmp.config.window.bordered(),
	formatting = {
		fields = { "kind", "abbr" },
		format = function(entry, vim_item)
			local kind = lspkind.cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
			local strings = vim.split(kind.kind, "%s", { trimempty = true })
			kind.kind = strings[1]
			return kind
		end,
	},
	mapping = {
		["<Return>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.confirm()
			else
				fallback()
			end
		end),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				local entry = cmp.get_selected_entry()
				if not entry then
					cmp.select_next_item()
				else
					cmp.confirm()
				end
			elseif luasnip.jumpable(1) then
				luasnip.jump(1)
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	},
	sources = {
		{ name = "path" },
		{ name = "buffer" },
		{ name = "luasnip" },
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
	},
})

mappings.add({
	"<C-Space>",
	function()
		if cmp.visible() then
			cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
		else
			cmp.complete()
		end
	end,
	modes = { "i", "s" },
	description = "Open/cycle autocomplete",
})

lsp.setup()

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	update_in_insert = true,
	underline = true,
	severity_sort = false,
	float = false,
})
