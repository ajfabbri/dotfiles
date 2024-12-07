-- java-only key mappings
-- quickassist
vim.keymap.set('n', '<leader>cq', function()
  vim.lsp.buf.code_action({
    context = { only = { 'quickassist' } },
    apply = true,
  })
end)
-- refactor.assign.field
vim.keymap.set('n', '<leader>craf', function()
  vim.lsp.buf.code_action({
    context = { only = { 'refactor.assign.field' } },
    apply = true,
  })
end)
-- refactor.assign.variable
vim.keymap.set('n', '<leader>crav', function()
  vim.lsp.buf.code_action({
    context = { only = { 'refactor.assign.variable' } },
    apply = true,
  })
end)
-- refactor.change.signature
vim.keymap.set('n', '<leader>crc', function()
  vim.lsp.buf.code_action({
    context = { only = { 'refactor.change.signature' } },
    apply = true,
  })
end)
-- refactor.extract.constant
vim.keymap.set('n', '<leader>crec', function()
  vim.lsp.buf.code_action({
    context = { only = { 'refactor.extract.constant' } },
    apply = true,
  })
end)
-- refactor.extract.field
vim.keymap.set('n', '<leader>cref', function()
  vim.lsp.buf.code_action({
    context = { only = { 'refactor.extract.field' } },
    apply = true,
  })
end)
-- refactor.extract.function
vim.keymap.set('n', '<leader>creu', function()
  vim.lsp.buf.code_action({
    context = { only = { 'refactor.extract.function' } },
    apply = true,
  })
end)
-- refactor.extract.interface
vim.keymap.set('n', '<leader>crei', function()
  vim.lsp.buf.code_action({
    context = { only = { 'refactor.extract.interface' } },
    apply = true,
  })
end)
-- refactor.extract.variable
vim.keymap.set('n', '<leader>crev', function()
  vim.lsp.buf.code_action({
    context = { only = { 'refactor.extract.variable' } },
    apply = true,
  })
end)
-- refactor.introduce.parameter
vim.keymap.set('n', '<leader>crip', function()
  vim.lsp.buf.code_action({
    context = { only = { 'refactor.introduce.parameter' } },
    apply = true,
  })
end)
-- refactor.move
vim.keymap.set('n', '<leader>crm', function()
  vim.lsp.buf.code_action({
    context = { only = { 'refactor.move' } },
    apply = true,
  })
end)
-- source.generate
vim.keymap.set('n', '<leader>cg', function()
  vim.lsp.buf.code_action({
    context = { only = { 'source.generate' } },
    apply = true,
  })
end)
-- source.generate.accessors
vim.keymap.set('n', '<leader>cga', function()
  vim.lsp.buf.code_action({
    context = { only = { 'source.generate.accessors' } },
    apply = true,
  })
end)
-- source.generate.constructors
vim.keymap.set('n', '<leader>cgc', function()
  vim.lsp.buf.code_action({
    context = { only = { 'source.generate.constructors' } },
    apply = true,
  })
end)
-- source.generate.delegateMethods
vim.keymap.set('n', '<leader>cgd', function()
  vim.lsp.buf.code_action({
    context = { only = { 'source.generate.delegateMethods' } },
    apply = true,
  })
end)
-- source.generate.finalModifiers
vim.keymap.set('n', '<leader>cgf', function()
  vim.lsp.buf.code_action({
    context = { only = { 'source.generate.finalModifiers' } },
    apply = true,
  })
end)
-- source.generate.hashCodeEquals
vim.keymap.set('n', '<leader>cgh', function()
  vim.lsp.buf.code_action({
    context = { only = { 'source.generate.hashCodeEquals' } },
    apply = true,
  })
end)
-- source.generate.toString
vim.keymap.set('n', '<leader>cgt', function()
  vim.lsp.buf.code_action({
    context = { only = { 'source.generate.toString' } },
    apply = true,
  })
end)
-- source.organizeImports
vim.keymap.set('n', '<leader>co', function()
  vim.lsp.buf.code_action({
    context = { only = { 'source.organizeImports' } },
    apply = true,
  })
end)
-- source.overrideMethods
vim.keymap.set('n', '<leader>com', function()
  vim.lsp.buf.code_action({
    context = { only = { 'source.overrideMethods' } },
    apply = true,
  })
end)
-- source.sortMembers
vim.keymap.set('n', '<leader>cs', function()
  vim.lsp.buf.code_action({
    context = { only = { 'source.sortMembers' } },
    apply = true,
  })
end)

