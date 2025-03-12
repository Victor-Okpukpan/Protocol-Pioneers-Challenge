-- Title: Adding State (Ping Counter)
-- Description: Modify the ping-pong contract to keep track of how many pings it has seen.

-- Let's add a state variable to count pings:
if not PingCount then       -- if PingCount is not already defined (nil)
    PingCount = 0           -- initialize PingCount as a global counter
end

-- Now, update the pingpong handler to use a custom function so we can increment the counter.
Handlers.add(
    "pingpong", 
    Handlers.utils.hasMatchingData("ping"), 
    function(msg)                   -- custom handler function, gets the incoming message as 'msg'
        PingCount = PingCount + 1   -- increment the counter for each "ping" received
        ao.send({
            Target = msg.From, 
            Data   = "pong " .. PingCount  -- reply with "pong <count>"
        })
    end
)
-- We've replaced Handlers.utils.reply with our own function to include PingCount.
-- Now the reply will be "pong 1", "pong 2", etc., incrementing each time a "ping" message comes in.