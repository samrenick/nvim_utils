function _G.dump(...)
    local objects = vim.tbl_map(vim.inspect, {...})
    print(unpack(objects))
end

snippets = {
    lpad = " '0') || lpad(stops.unique_id_no::text, 8, '0') AS stop_uid",
    sprintf = "sprintf('%03s%08s', $co_num, $line['stop_uid'])" 
}

function searchSnippets(input)
    for key, val in pairs(snippets) do
        if string.find(key, input) then
            return(val)
        end
    end
end

function getSnippet()
    snip = searchSnippets(vim.api.nvim_eval('expand("<cword>")'))
    if snip ~= nil then
        vim.api.nvim_set_current_line(snip)
    end
end

vim.api.nvim_set_keymap('n', '<leader>f', '<cmd>lua getSnippet()<CR>', {noremap = true})

--examples
--lpad
--sprintf
