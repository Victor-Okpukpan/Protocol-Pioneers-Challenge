-- Title: Lua Variables and Basic Syntax
-- Description: Learn how to create and use variables, and perform simple operations.

-- 1. Defining a variable and doing arithmetic:
local a = 10          -- define a variable 'a' with value 10 (local means it's limited to this file or function)
local b = 5 + 3       -- you can do basic math (+, -, *, /, %) as expected; here b will be 8 ([A whistle stop tour of Lua. | Cookbook](https://cookbook_ao.g8way.io/concepts/lua.html#:~:text=,that%20Lua%20uses%20for%20modulus))
-- TIP: Lua uses `--` for comments, and variables are dynamically typed.

-- 2. Using variables:
local c = a * 2       -- c will be 20 since a is 10 ([A whistle stop tour of Lua. | Cookbook](https://cookbook_ao.g8way.io/concepts/lua.html#:~:text=,Handlers))
-- By convention, global variables in AO (accessible across handlers) start with a capital letter ([A whistle stop tour of Lua. | Cookbook](https://cookbook_ao.g8way.io/concepts/lua.html#:~:text=,Handlers)), 
-- while local variables (scoped) are lowercase. (This is a convention, not enforced by Lua.)

-- 3. Strings and concatenation:
local name = "AO"
local greeting = "Hello, " .. name    -- use .. to concatenate strings ([A whistle stop tour of Lua. | Cookbook](https://cookbook_ao.g8way.io/concepts/lua.html#:~:text=,..%20ao.id))
-- (In Lua, .. joins strings. greeting now is "Hello, AO")

-- 4. Outputting values:
-- In the AO console, simply writing an expression will output it. E.g., typing `a` would show its value ([Introduction | Cookbook](https://cookbook_ao.g8way.io/guides/aos/intro.html#:~:text=If%20you%20want%20to%20display,simply%20type%20the%20variable%20name)).
-- For now, we'll simulate output by returning a value (since this is a script file).
return greeting  -- this will return "Hello, AO" when run (in a script, `return` sends result to output)