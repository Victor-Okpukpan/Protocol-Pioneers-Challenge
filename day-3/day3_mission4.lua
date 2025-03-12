-- Title: Security Best Practices
-- Description: Important tips to secure AO smart contracts.

-- 1. Validate inputs and message data:
--    Always check that required message fields (Tags/Data) are present and of the correct format before using them.
--    E.g., use assertions or if-statements to guard against missing data:
--    assert(type(msg.Tags.Quantity) == "string", "Quantity is required!")  -- seen in token transfe ([Building a Token in ao | Cookbook](https://cookbook_ao.g8way.io/guides/aos/token.html#:~:text=assert%28type%28msg,%27string%27%2C%20%27Quantity%20is%20required))】.

-- 2. Use Owner (or other auth mechanisms) for restricted actions:
--    As we implemented, check msg.From == Owner for admin command ([Building a Token in ao | Cookbook](https://cookbook_ao.g8way.io/guides/aos/token.html#:~:text=Handlers,%27string%27%2C%20%27Quantity%20is%20required))】.
--    This prevents unauthorized users from performing sensitive operations.

-- 3. Principle of least privilege:
--    Only allow what is necessary in handlers. If a handler shouldn't be triggered by arbitrary users, include checks in its logic.

-- 4. Use ao.send (in contract code) vs Send:
--    In handlers, prefer ao.send because it returns the message object (helpful for logging or debugging ([FAQ | Cookbook](https://cookbook_ao.g8way.io/guides/aos/faq.html#:~:text=Send%20vs%20ao))】.
--    The `Send` function is a convenience in the CLI; `ao.send` is better in scripts.

-- 5. Test thoroughly:
--    Use various scenarios to ensure your contract handles unexpected or malicious inputs gracefully (no crashes, proper error messages).

-- Following these practices will make your contracts more robust and secure on the AO network.