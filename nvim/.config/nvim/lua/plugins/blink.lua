return {
  "saghen/blink.cmp",
  opts = {
    keymap = {
      ["<Tab>"] = {
        function(cmp)
          if cmp.is_visible() then
            cmp.accept()
            return true
          end
        end,
        "fallback",
      },
    },
  },
}
