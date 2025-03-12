-- Title: Testing the Ping-Pong Contract
-- Description: Guidelines to test the contract's functionality in the AO shell.

-- 1. Ensure your contract code from Missions 2-4 is loaded in your AO process.
--    If you used .editor for each mission, it has been executed already. 
--    If you created separate files, use `.load <filename.lua>` in the AOS prompt to load them.

-- 2. Test the "ping" -> "pong" behavior:
Send({ Target = ao.id, Data = "ping" })
-- Check Inbox for response:
print(Inbox[#Inbox].Data)    -- should print "pong 1" on first ping.

-- 3. Test the counter increment:
Send({ Target = ao.id, Data = "ping" })   -- send a second ping
print(Inbox[#Inbox].Data)    -- now should be "pong 2".

-- 4. Test the "stats" query:
Send({ Target = ao.id, Data = "stats" })
print(Inbox[#Inbox].Data)    -- should report "PingCount is 2" (or current count).

-- 5. Try sending a message that doesn't match any handler:
Send({ Target = ao.id, Data = "hello" })
-- There should be no new response in Inbox, because no handler catches "hello".

-- Congrats! You've built and tested a stateful AO contract.