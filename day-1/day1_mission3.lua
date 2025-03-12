-- Title: Lua Loops
-- Description: Learn to repeat actions using while and for loops.

-- 1. While loop example: increment a counter
local n = 0
while n < 5 do                    -- while condition is true, do the loop body
    n = n + 1                     -- increment n by 1
end
-- After this loop, n should be 5 (loop ran 5 times).

-- 2. Numeric for loop example: summing numbers 1 through 5
local sum = 0
for i = 1, 5 do                   -- for i from 1 to 5 (inclusive)
    sum = sum + i
end
-- After this loop, sum = 15 (1+2+3+4+5).

-- 3. Generic for (pairs) loop example: iterating a table's key-value pairs
local tbl = {foo = "bar", baz = "qux"}
local concatenated = ""
for key, value in pairs(tbl) do   -- iterate through all key-value pairs in tbl
    concatenated = concatenated .. key .. ":" .. value .. " "
end
-- After loop, concatenated might be "foo:bar baz:qux " (order not guaranteed in a table).

return {n = n, sum = sum, concatenated = concatenated}