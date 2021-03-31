function _G.dump(...)
    local objects = vim.tbl_map(vim.inspect, {...})
    print(unpack(objects))
end

snippets = {
    lpad = {" '0') || lpad(stops.unique_id_no::text, 8, '0') AS stop_uid"},
    sprintf = {"sprintf('%03s%08s', $co_num, $line['stop_uid'])"} ,
    show_errors = {
        "ini_set('display_errors', '1');",
        "ini_set('display_startup_errors', '1');",
        "error_reporting(E_ALL);"
    }
}
dump(#snippets.show_errors)

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
        setSnippet(snip)
    end
end

function setSnippet(snip)
    currLine = vim.api.nvim_eval("line('.')")
    length = #snip
    -- vim.api.nvim_set_current_line(snip)
    -- dump(snip)
    vim.api.nvim_buf_set_lines(nil,currLine-1,currLine + length,false,snip)
end 

vim.api.nvim_set_keymap('n', '<leader>f', '<cmd>lua getSnippet()<CR>', {noremap = true})

--examples
--lpad
--sprintf
--show_errors
-- dump()
