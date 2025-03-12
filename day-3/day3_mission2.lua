-- Title: Persistent State Management
-- Description: Ensure your contract's state variables persist when updating code.

-- When you loaded new code in Day 2 (like redefining handlers), you might have noticed we used patterns like:
if not PingCount then PingCount = 0 end   -- initialize only if not already se ([Building a Token in ao | Cookbook](https://cookbook_ao.g8way.io/guides/aos/token.html#:~:text=local%20json%20%3D%20require))】

-- This is important. If you simply did `PingCount = 0`, every time you reload the contract code, you'd reset the counter to 0!
-- The `if not ... then ... end` check ensures that if the variable already exists in state, we leave it intact.

-- Task: Apply this principle to all your state variables.
-- For example, if you plan to have a table or any variable that should carry over across code reloads:
if not MyTable then MyTable = {} end
-- This way, MyTable won't be reinitialized if it already exists.

-- In summary, always guard your initial state definitions to avoid wiping persistent data on upgrades.
-- (You saw this in the token initialization code as well, where balances were only set if not presen ([Building a Token in ao | Cookbook](https://cookbook_ao.g8way.io/guides/aos/token.html#:~:text=local%20json%20%3D%20require))】.)