local M = {}

local function convert_uuid_to_hex(uuid)
  -- Remove hyphens from UUID string
  local without_dashes = uuid:gsub("-", "")
  return string.upper(without_dashes)
end

local function convert_hex_to_uuid(str)
  str = str:sub(3, 34)
  local result = str:sub(1, 8) ..
      "-" .. str:sub(9, 12) .. "-" .. str:sub(13, 16) .. "-" .. str:sub(17, 20) .. "-" .. str:sub(21, 32)
  return string.lower(result)
end


M.toggle = function()
  local current_word = vim.call('expand', '<cword>')
  local replaced_text = current_word
  if current_word:find('-') ~= nil then
    replaced_text = convert_uuid_to_hex(current_word)
  elseif current_word:find('^0x') ~= nil then
    replaced_text = convert_hex_to_uuid(current_word)
  else
    replaced_text = "0x" .. current_word
  end
  vim.cmd('normal ciw' .. replaced_text)
end

return M
