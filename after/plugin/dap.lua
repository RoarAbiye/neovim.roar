require("neodev").setup({
  library = { plugins = { "nvim-dap-ui" }, types = true },
})
require("dap-vscode-js").setup({
  -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
  -- debugger_path = "(runtimedir)/site/pack/packer/opt/vscode-js-debug", -- Path to vscode-js-debug installation.
  debugger_path = "/home/robel/.local/share/nvim/lazy/vscode-js-debug", -- Path to vscode-js-debug installation.
  -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
  adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
  -- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
  -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
  -- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
})

for _, language in ipairs({ "typescript", "javascript" }) do
  require("dap").configurations[language] = {
{
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
    },
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach",
      processId = require 'dap.utils'.pick_process,
      cwd = "${workspaceFolder}",
    },
    {
      type = "pwa-chrome",
      request = "launch",
      name = "Start Chrome with \"localhost\"",
      url = "http://localhost:3000",
      webRoot = "${workspaceFolder}",
      userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir"
    }
  }
end

-- Set keymaps to control the debugger
vim.keymap.set("n", "<F5>", require("dap").continue)
vim.keymap.set("n", "<F10>", require("dap").step_over)
vim.keymap.set("n", "<F11>", require("dap").step_into)
vim.keymap.set("n", "<F12>", require("dap").step_out)
vim.keymap.set("n", "<leader>b", require("dap").toggle_breakpoint)
vim.keymap.set("n", "<leader>B", function()
  require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
end)

require("nvim-dap-virtual-text").setup()
-- require("nvim-dap-virtual-text").setup {
--     enabled = true,                        -- enable this plugin (the default)
--     enabled_commands = true,               -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
--     highlight_changed_variables = true,    -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
--     highlight_new_as_changed = true,      -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
--     show_stop_reason = true,               -- show stop reason when stopped for exceptions
--     commented = true,                     -- prefix virtual text with comment string
--     only_first_definition = true,          -- only show virtual text at first definition (if there are multiple)
--     all_references = false,                -- show virtual text on all all references of the variable (not only definitions)
--     clear_on_continue = false,             -- clear virtual text on "continue" (might cause flickering when stepping)
--     --- A callback that determines how a variable is displayed or whether it should be omitted
--     --- @param variable Variable https://microsoft.github.io/debug-adapter-protocol/specification#Types_Variable
--     --- @param buf number
--     --- @param stackframe dap.StackFrame https://microsoft.github.io/debug-adapter-protocol/specification#Types_StackFrame
--     --- @param node userdata tree-sitter node identified as variable definition of reference (see `:h tsnode`)
--     --- @param options nvim_dap_virtual_text_options Current options for nvim-dap-virtual-text
--     --- @return string|nil A text how the virtual text should be displayed or nil, if this variable shouldn't be displayed
--     -- display_callback = function(variable, buf, stackframe, node, options)
--     --   if options.virt_text_pos == 'inline' then
--     --     return ' = ' .. variable.value
--     --   else
--     --     return variable.name .. ' = ' .. variable.value
--     --   end
--     -- end,
--     -- -- position of virtual text, see `:h nvim_buf_set_extmark()`, default tries to inline the virtual text. Use 'eol' to set to end of line
--     -- virt_text_pos = vim.fn.has 'nvim-0.10' == 1 and 'inline' or 'eol',
--
--     -- experimental features:
--     all_frames = false,                    -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
--     virt_lines = true,                    -- show virtual lines instead of virtual text (will flicker!)
--     virt_text_win_col = 70                -- position the virtual text at a fixed window column (starting from the first text column) ,
--                                            -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
-- }
