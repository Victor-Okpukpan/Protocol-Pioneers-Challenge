-- Title: Token Minting Handler
-- Description: Allow the contract owner to mint (create) new tokens.

Handlers.add(
    "mint",
    Handlers.utils.hasMatchingTag("Action", "Mint"),
    function(msg, env)
        assert(type(msg.Tags.Quantity) == "string", "Quantity is required!")
        local qty = tonumber(msg.Tags.Quantity)
        assert(qty and qty > 0, "Quantity must be a positive number!")

        -- Only allow the Owner (contract creator) to mint new tokens:
        if msg.From == Owner then
            -- Increase the balance of the owner by the minted amount:
            if not Balances[Owner] then Balances[Owner] = 0 end
            Balances[Owner] = Balances[Owner] + qty
        else
            -- Send an error message back if not authorized:
            ao.send({
                Target = msg.From,
                Tags   = { Action="Mint-Error", Error = "Only the Owner can mint new " .. Ticker .. " tokens!" }
            })
        end
    end
)