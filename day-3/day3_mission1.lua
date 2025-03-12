-- Title: Interacting with Other Processes
-- Description: Learn how one AO process can send messages to another.

-- If you want to have two contracts talk to each other, you need separate processes.
-- Let's simulate this by starting a second AOS process:
--   Open a new terminal and run:  aos 
-- This gives you a new process with its own ao.id (you'll see a different prompt, e.g., Inbox:0 for the new process).

-- Note the process ID of the second process (found in the welcome text or by typing `ao.id` at its prompt).

-- From your first process, you can now send a message to the second process by using its ID:
local targetId = "x_6ftP4M9CSjcZeqHXj6BFgbV9aDft8pYPHe_QXAC3E"
Send({ Target = targetId, Data = "ping" })
-- If the second process is running the ping-pong handler from Day 2, it should respond with "pong".
-- Check the second process's Inbox to see the "ping" and its Outbox for the "pong".

-- You have just sent a cross-process message. This is how contracts interact: by sending messages to each other's IDs.
-- In contract code, you would use ao.send({...}) similarly to send messages out.