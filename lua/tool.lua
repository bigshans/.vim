local M = {}

function M.dump(o)
    if type(o) == 'table' then
        local s = '{ '
        for k, v in pairs(o) do
            if type(k) ~= 'number' then
                k = '"' .. k .. '"'
            end
            s = s .. '[' .. k .. '] = ' .. M.dump(v) .. ','
        end
        return s .. '} '
    else
        return tostring(o)
    end
end

function M.split(inputstr, sep)
    local _sep = sep
    if sep == nil then
        _sep = '%s'
    end
    local t = {}
    for str in string.gmatch(inputstr, '([^' .. _sep .. ']+)') do
        table.insert(t, str)
    end
    return t
end

return M
