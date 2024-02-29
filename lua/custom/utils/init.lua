-- Stolen from Astronvim
local M = {}

function M.is_available(plugin)
  local lazy_config_avail, lazy_config = pcall(require, 'lazy.core.config')
  return lazy_config_avail and lazy_config.spec.plugins[plugin] ~= nil
end

--- Close a given buffer
---@param bufnr? number The buffer to close or the current buffer if not provided
---@param force? boolean Whether or not to foce close the buffers or confirm changes (default: false)
function M.close(bufnr, force)
  if not bufnr or bufnr == 0 then
    bufnr = vim.api.nvim_get_current_buf()
  end
  if M.is_available 'mini.bufremove' and M.is_valid(bufnr) and #vim.t.bufs > 1 then
    if not force and vim.api.nvim_get_option_value('modified', { buf = bufnr }) then
      local bufname = vim.fn.expand '%'
      local empty = bufname == ''
      if empty then
        bufname = 'Untitled'
      end
      local confirm = vim.fn.confirm(('Save changes to "%s"?'):format(bufname), '&Yes\n&No\n&Cancel', 1, 'Question')
      if confirm == 1 then
        if empty then
          return
        end
        vim.cmd.write()
      elseif confirm == 2 then
        force = true
      else
        return
      end
    end
    require('mini.bufremove').delete(bufnr, force)
  else
    local buftype = vim.api.nvim_get_option_value('buftype', { buf = bufnr })
    vim.cmd(('silent! %s %d'):format((force or buftype == 'terminal') and 'bdelete!' or 'confirm bdelete', bufnr))
  end
end

return M
