-- Title: Lua Functions and Error Handling
-- Description: Learn to write reusable functions and handle errors gracefully.

-- 1. Defining a function:
function greet(person)
    return "Hello, " .. person    -- returns a greeting string
end
-- Alternatively, Lua allows anonymous functions assigned to variables:
adder = function(a, b) return a + b end
-- (The above is equivalent to defining a function named 'adder'.) ([A whistle stop tour of Lua. | Cookbook](https://cookbook_ao.g8way.io/concepts/lua.html#:~:text=function%20greeting%28name%29%20return%20,name%20end))

-- 2. Calling functions:
local message = greet("world")    -- message = "Hello, world"
local sum = adder(2, 3)           -- sum = 5

-- 3. Error handling basics:
function safe_divide(a, b)
    assert(b ~= 0, "Division by zero!")   -- assert throws an error if condition is false
    return a / b
end

-- Using pcall to call a function safely (pcall = protected call):
local status, result = pcall(safe_divide, 10, 0)
-- pcall returns false and an error message if an error occurred ([Programming in Lua : 8.4](https://www.lua.org/pil/8.4.html#:~:text=If%20you%20need%20to%20handle,to%20encapsulate%20your%20code)) ([Programming in Lua : 8.4](https://www.lua.org/pil/8.4.html#:~:text=The%20,false%2C%20plus%20the%20error%20message)).
-- Here, safe_divide(10,0) would trigger the assert error "Division by zero!".
-- 'status' will be false, and 'result' will contain the error message.

-- 4. Handling the error result:
if not status then
    print("Error caught: " .. result)   -- In an AO contract, you might handle or log the error differently.
end

-- Try changing the second argument to a non-zero to see a successful division:
local ok, result2 = pcall(safe_divide, 10, 2)  -- should succeed, result2 = 5
return {status, result, ok, result2}