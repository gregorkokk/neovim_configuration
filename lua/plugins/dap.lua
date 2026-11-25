return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "theHamsta/nvim-dap-virtual-text",   -- shows variable values inline next to your code
    "mfussenegger/nvim-dap-python",
    "williamboman/mason.nvim",
    "jay-babu/mason-nvim-dap.nvim",
  },
  config = function()
    local dap, dapui = require("dap"), require("dapui")

    dapui.setup()
    require("nvim-dap-virtual-text").setup()

    -- install adapters via mason; codelldb auto-wires, python is wired by dap-python below
    require("mason-nvim-dap").setup({
      ensure_installed = { "codelldb", "python" },
      automatic_installation = true,
      handlers = {
        function(config) require("mason-nvim-dap").default_setup(config) end,
        python = function() end,
      },
    })

    -- open/close the debug UI automatically with each session
    dap.listeners.before.launch.dapui_config = function() dapui.open() end
    dap.listeners.before.attach.dapui_config = function() dapui.open() end
    dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
    dap.listeners.before.event_exited.dapui_config = function() dapui.close() end

    -- Python: the adapter (debugpy) lives in mason's own venv, so project venvs don't need it.
    -- The debuggee runs in the nearest .venv above the file, so analog_system/ and
    -- digital_system/ each get their own venv (and can import torch etc.)
    local dap_python = require("dap-python")
    dap_python.setup(vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python")
    dap_python.resolve_python = function()
      local venv = vim.fs.find(".venv", { upward = true, type = "directory", path = vim.fn.expand("%:p:h") })[1]
      return venv and venv .. "/bin/python" or "python3"
    end

    -- C++: a launch config that asks for the compiled binary
    dap.configurations.cpp = {
      {
        name = "Launch (codelldb)",
        type = "codelldb",
        request = "launch",
        program = function()
          return vim.fn.input("Path to binary: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = {},
      },
    }
    dap.configurations.c = dap.configurations.cpp

    local map = vim.keymap.set
    map("n", "<leader>dc", dap.continue, { desc = "Debug: start / continue" })
    map("n", "<leader>dn", dap.step_over, { desc = "Debug: step over" })
    map("n", "<leader>di", dap.step_into, { desc = "Debug: step into" })
    map("n", "<leader>do", dap.step_out, { desc = "Debug: step out" })
    map("n", "<leader>db", dap.toggle_breakpoint, { desc = "Debug: breakpoint" })
    map("n", "<leader>dB", function()
      dap.set_breakpoint(vim.fn.input("Condition: "))
    end, { desc = "Debug: conditional breakpoint" })
    map("n", "<leader>dr", dap.repl.open, { desc = "Debug: REPL" })
    map("n", "<leader>du", dapui.toggle, { desc = "Debug: toggle UI" })
    map("n", "<leader>dt", dap.terminate, { desc = "Debug: terminate" })

  end,
}
