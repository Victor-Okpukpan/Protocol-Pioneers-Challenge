-- Title: Testing the Token Contract
-- Description: Load the contract and perform a series of tests for each feature.

-- 1. Load the token contract code into your AO process:
--    If you wrote everything in one file (token.lua), use:  .load token.lua
--    If multiple files, load initialization and all handlers (order shouldn't matter as long as state init runs first).

-- 2. Test Info query:
Send({ Target = ao.id, Tags = { Action="Info" } })
print(Inbox[#Inbox].Tags)   
-- Expected: You'll see a table of Tags with Name, Ticker, Denomination, etc., matching your token's inf ([Building a Token in ao | Cookbook](https://cookbook_ao.g8way.io/guides/aos/token.html#:~:text=Send%28,))】.

-- 3. Test Balance query (for your own account):
Send({ Target = ao.id, Tags = { Action="Balance" } })
print(Inbox[#Inbox].Tags.Balance)
-- Expected: It should show your balance (initial supply you set). For Owner, this might be "1000000".

-- 4. Test Transfer:
-- For this, you need another process ID to receive tokens. 
-- Open a second AOS process as earlier (Day 3) and note its ao.id (or use any Arweave wallet address as recipient).
local otherId = "x_6ftP4M9CSjcZeqHXj6BFgbV9aDft8pYPHe_QXAC3E"
Send({ 
    Target = ao.id, 
    Tags = { Action="Transfer", Recipient = otherId, Quantity = "5000" } 
})
-- This sends a request to transfer 5000 tokens to 'otherId'.
-- Check the Inbox of your process (should contain a DebitNotice) and the Inbox of the other process (should contain a CreditNotice ([Building a Token in ao | Cookbook](https://cookbook_ao.g8way.io/guides/aos/token.html#:~:text=if%20Balances%5Bmsg.From%5D%20,msg.Tags.Recipient%5D%20%2B%20qty)) ([Building a Token in ao | Cookbook](https://cookbook_ao.g8way.io/guides/aos/token.html#:~:text=,Error%20%3D%20%27Insufficient%20Balance%21%27))】.
-- Also, query balances to verify:
Send({ Target = ao.id, Tags = { Action="Balance", Target = otherId } })
print(Inbox[#Inbox].Tags.Balance)   -- should be 5000 for the otherId now.
Send({ Target = ao.id, Tags = { Action="Balance" } })
print(Inbox[#Inbox].Tags.Balance)   -- owner's balance should have decreased by 5000.

-- 5. Test insufficient balance:
Send({ Target = ao.id, Tags = { Action="Transfer", Recipient = otherId, Quantity = "999999999" } })
-- This is likely more than you have. The contract should respond with a Transfer-Error (check your Inbox for the error message).

-- 6. Test Mint (owner only):
Send({ Target = ao.id, Tags = { Action="Mint", Quantity = "10000" } })
-- As the owner, this should succeed (your balance increases by 10000).
-- If you try the same from the other process (not owner), it should get a Mint-Error in response.

-- 7. (Optional) Test the "Balances" dump:
Send({ Target = ao.id, Tags = { Action="Balances" } })
-- Expect a JSON string of the whole Balances table in your Inbox (could be large if many accounts).

-- You've now tested the creation, transfer, and querying of a token contract on AO!