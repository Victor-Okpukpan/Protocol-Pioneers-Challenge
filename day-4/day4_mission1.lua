-- Title: Token Contract Initialization
-- Description: Set up initial state variables for the token (name, ticker, balances, etc.).

-- 1. Basic token parameters:
if not Balances then 
    Balances = { [ao.id] = 1000000 }   -- Give the contract creator (Owner) an initial supply of 1,000,000 units.
end
if Name ~= "VictorTheOracle" then Name = "VictorTheOracle" end        -- Token name (change "MyToken" as desired)
if Ticker ~= "VTO" then Ticker = "VTO" end            -- Token symbol/ticker
if Denomination ~= 0 then Denomination = 0 end        -- Smallest unit (0 means indivisible token, or use 8 for cents etc.)

-- (The above pattern ensures we don't overwrite these if they are already set, following persistent state practice ([Building a Token in ao | Cookbook](https://cookbook_ao.g8way.io/guides/aos/token.html#:~:text=local%20json%20%3D%20require))】.)

-- 2. Optionally, include a token logo or other metadata:
if not Logo then Logo = nil end  -- could store an Arweave TXID of an image, for example.

-- Now our state has:
-- Balances: a table mapping account IDs to token balances (initialized with all supply to Owner's process ID).
-- Name, Ticker, Denomination, Logo: metadata about the token.