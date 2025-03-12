-- Title: State Query Handler
-- Description: Add a handler so users can query the current ping count.

-- We will handle a special message (e.g., Data = "stats") that asks for the PingCount.
Handlers.add(
    "stats_query",
    Handlers.utils.hasMatchingData("stats"),   -- trigger when message data is "stats"
    function(msg)
        ao.send({
            Target = msg.From,
            Data   = "PingCount is " .. tostring(PingCount)
        })
    end
)
-- This handler listens for "stats" requests and responds with the current PingCount value.
-- We use tostring() because PingCount is a number and Data expects a string.