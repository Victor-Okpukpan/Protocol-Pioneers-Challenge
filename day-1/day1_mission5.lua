-- Title: Lua Tables (Data Structures)
-- Description: Learn about Lua's single data structure (tables) for lists and key-value maps.

-- 1. Creating a table like an array:
local fruits = {"apple", "banana", "cherry"}   -- list of fruits
-- Lua tables can act like arrays. IMPORTANT: Lua indexing starts at 1 (not 0)! ([A whistle stop tour of Lua. | Cookbook](https://cookbook_ao.g8way.io/concepts/lua.html#:~:text=,a%20new%20named%20key%20to))

-- Accessing elements:
local firstFruit = fruits[1]    -- "apple"
local count = #fruits           -- # gives the length of an array table; here 3 ([A whistle stop tour of Lua. | Cookbook](https://cookbook_ao.g8way.io/concepts/lua.html#:~:text=return%20,a%20new%20named%20key%20to))

-- 2. Tables as dictionaries (key-value pairs):
local person = { name = "Alice", age = 30 }
-- Keys can be strings (as above) or other types. We can add new keys:
person.location = "Earth"       -- using dot syntax to add a new field (equivalent to person["location"] = "Earth")

-- 3. Nested tables:
person.favoriteColors = {"red", "green", "blue"}
-- We now have person.favoriteColors as a table of strings.

-- 4. Iterating an array table:
for i = 1, #fruits do
    print(fruits[i])           -- This will print each fruit. In AO, you might use ao.Dump to print tables nicely.
end

-- 5. Iterating a key-value table:
for key, value in pairs(person) do
    print(key, value)          -- prints each key and its value in person (order not guaranteed)
end

-- Returning a table:
return person