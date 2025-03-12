- Title: Lua Conditional Logic
-- Description: Practice if-else statements for decision making.

local x = 7

-- 1. Basic if-else:
if x > 5 then
    -- this block executes if condition is true
    result = "x is greater than 5"
else
    -- this block executes if condition is false
    result = "x is not greater than 5"
end

-- 2. Else-if (elseif in Lua) for multiple conditions:
local y = 0
if y < 0 then
    result2 = "y is negative"
elseif y == 0 then
    result2 = "y is zero"
else
    result2 = "y is positive"
end

-- Note: Lua uses `==` for equality and `~=` for "not equal" (not `!=`) ([A whistle stop tour of Lua. | Cookbook](https://cookbook_ao.g8way.io/concepts/lua.html#:~:text=,than%20their%20more%20common%20names)).
-- Indentation isn't required by Lua, but it improves readability.
-- We'll return the results as a table to see both outcomes:
return {result, result2}