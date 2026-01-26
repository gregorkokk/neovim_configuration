return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      local dap = require('dap')
      local dapui = require('dapui')

      -- Setup DAP UI
      dapui.setup()

      -- Setup virtual text
      require('nvim-dap-virtual-text').setup()

      -- Configure GDB adapter for ARM
      dap.adapters.gdb = {
        type = "executable",
        command = "arm-none-eabi-gdb",
        args = { "-i", "dap" }
      }

      -- Configuration for C/C++ embedded projects
      dap.configurations.c = {
        {
          name = "Launch TM4C123GXL",
          type = "gdb",
          request = "launch",
          program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/gcc/main.axf', 'file')
          end,
          cwd = "${workspaceFolder}",
          stopAtBeginOfMainSubprogram = false,
          setupCommands = {
            {
              text = "target extended-remote localhost:3333",
              description = "Connect to OpenOCD"
            },
            {
              text = "monitor reset halt",
              description = "Reset and halt target"
            },
            {
              text = "load",
              description = "Load program"
            },
          }
        },
      }

      -- Copy configuration for cpp files
      dap.configurations.cpp = dap.configurations.c

      -- Auto-open/close DAP UI
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      -- Keymaps
      vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = 'Toggle Breakpoint' })
      vim.keymap.set('n', '<leader>dc', dap.continue, { desc = 'Continue' })
      vim.keymap.set('n', '<leader>ds', dap.step_over, { desc = 'Step Over' })
      vim.keymap.set('n', '<leader>di', dap.step_into, { desc = 'Step Into' })
      vim.keymap.set('n', '<leader>do', dap.step_out, { desc = 'Step Out' })
      vim.keymap.set('n', '<leader>dr', dap.repl.open, { desc = 'Open REPL' })
      vim.keymap.set('n', '<leader>dt', dapui.toggle, { desc = 'Toggle DAP UI' })
    end,
  },
}
