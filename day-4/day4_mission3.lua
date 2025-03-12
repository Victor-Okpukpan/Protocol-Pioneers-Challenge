-- Title: Token Transfer Handler
-- Description: Enable transferring tokens between accounts, with proper checks.

Handlers.add(
    "transfer",
    Handlers.utils.hasMatchingTag("Action", "Transfer"),
    function(msg)
        -- Input validation:
        assert(type(msg.Tags.Recipient) == "string", "Recipient is required!")
        assert(type(msg.Tags.Quantity) == "string", "Quantity is required!")
        local qty = tonumber(msg.Tags.Quantity)
        assert(qty and qty > 0, "Quantity must be a positive number!")

        local sender = msg.From
        local recipient = msg.Tags.Recipient

        -- Initialize balances for sender/recipient if not present:
        if not Balances[sender] then Balances[sender] = 0 end
        if not Balances[recipient] then Balances[recipient] = 0 end

        -- Perform the transfer if the sender has enough balance:
        if Balances[sender] >= qty then
            Balances[sender] = Balances[sender] - qty
            Balances[recipient] = Balances[recipient] + qty

            -- Notify sender and recipient of the transfer:
            ao.send({ Target = sender,    Tags = { Action="DebitNotice",  To=recipient, Amount=tostring(qty) } })
            ao.send({ Target = recipient, Tags = { Action="CreditNotice", From=sender,  Amount=tostring(qty) } })
        else
            -- Insufficient balance, inform the sender of failure:
            ao.send({ Target = sender, Tags = { Action="Transfer-Error", Error="Insufficient Balance!" } })
        end
    end
)