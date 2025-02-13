vim.opt.colorcolumn = "80"

local imported, flutter_tools = pcall(require, "flutter-tools")
if (not imported) then
  return
end

flutter_tools.setup({
  fvm = true,
  debugger = {
    enabled = true,
    run_via_dap = true,
  },
  lsp = {
    settings = {
      showTodos = true,
      renameFilesWithClasses = "always",
      completeFunctionCalls = true,
      enableSnippets = true,
      updateImportsOnRename = true,
      lineLength = 80,
      analysisExcludedFolders = {
        ".bin/**",
        "lib/generated/**",
        "lib/**.g.dart",
        "lib/**.freezed.dart",
      },
    },
  },
})

flutter_tools.setup_project({
  {
    name = "Development",
    flavor = "dev",
    target = "lib/main.dart",
    -- dart_define_from_file = ".dart_define.json",
    pre_run_callback = nil,
  },
  {
    name = "Production",
    flavor = "prod",
    target = "lib/main.dart",
    -- dart_define_from_file = ".dart_define.json",
    pre_run_callback = nil,
  },
})
