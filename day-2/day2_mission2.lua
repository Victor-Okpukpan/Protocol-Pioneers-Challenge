-- Title: Ping-Pong Message Handler
-- Description: Create a handler that listens for "ping" messages and replies with "pong".

-- We'll use the Handlers library to add an event handler.
Handlers.add(
    "pingpong",                            -- 1. Handler name (identifier)
    Handlers.utils.hasMatchingData("ping"),-- 2. Pattern: checks if incoming message Data == "ping" ([Creating a Pingpong Process in aos | Cookbook](https://cookbook_ao.g8way.io/guides/aos/pingpong.html#:~:text=1,pong))
    Handlers.utils.reply("pong")           -- 3. Handler function: automatically reply "pong" to sender ([Creating a Pingpong Process in aos | Cookbook](https://cookbook_ao.g8way.io/guides/aos/pingpong.html#:~:text=1,pong))
)
-- This single line sets up a basic "ping-pong" behavior:
-- - If a message with data "ping" arrives ([Creating a Pingpong Process in aos | Cookbook](https://cookbook_ao.g8way.io/guides/aos/pingpong.html#:~:text=1,pong)),
-- - The contract responds by sending "pong" back to the message sender.

-- Save this file (if editing externally) or, if in .editor, type .done to execute it.