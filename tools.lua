function _G.dump(...)
    local objects = vim.tbl_map(vim.inspect, {...})
    print(unpack(objects))
end

snippets = {
    lpad = " '0') || lpad(stops.unique_id_no::text, 8, '0') AS stop_uid",
    sprintf = "sprintf('%03s%08s', $co_num, $line['stop_uid'])" 
}

function getSnippet(input)
    for key, val in pairs(snippets) do
        if string.find(key, input) then
            return(val)
        end
    end
end

snippetInput = vim.api.nvim_eval('expand("<cword>")')
dump(getSnippet(snippetInput))

--lpad
--sprintf