local modules = {
	'mappings',
	'pluginList',
	'options',
}

for i = 1, #modules do
	pcall(require, modules[i])
end
