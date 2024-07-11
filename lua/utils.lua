-- [[ Utilities ]]

local M = {}

-- Function to load properties from a file
M.loadProperties = function (filename)
    local properties = {}

    -- Open the file in read mode
    local filepath = vim.fn.stdpath('config') .. '/' .. filename
    local file = io.open(filepath, "r")
    if not file then
        return nil, "Could not open file " .. filepath
    end

    -- Read the file line by line
    for line in file:lines() do
        -- Remove any leading or trailing whitespace
        line = line:match("^%s*(.-)%s*$")

        -- Ignore empty lines and comments
        if line ~= "" and not line:match("^#") then
            -- Split the line into key and value
            local key, value = line:match("^(.-)=(.*)$")
            if key and value then
                -- Remove any leading or trailing whitespace from key and value
                key = key:match("^%s*(.-)%s*$")
                value = value:match("^%s*(.-)%s*$")
                -- Store the key-value pair in the table
                properties[key] = value
            end
        end
    end

    -- Close the file
    file:close()

    return properties
end

return M
