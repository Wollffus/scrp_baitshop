-- created by RexshackGaming : Discord : https://discord.gg/8gNCwDpQPb
-- youtube channel : https://www.youtube.com/channel/UCikEgGfXO-HCPxV5rYHEVbA

local data = {}
TriggerEvent("redemrp_inventory:getData",function(call)
    data = call
end)

-- buy fishing rod
RegisterServerEvent('scrp_baitshop:buyrod')
AddEventHandler("scrp_baitshop:buyrod", function(price, item, lvl)
    TriggerEvent("redemrp:getPlayerFromId", source, function(user)
        local identifier = user.getIdentifier()
		local level = user.getLevel()
        if user.getMoney() >= price then
            if level >= lvl then
                user.removeMoney(price)
				TriggerClientEvent('give:weapon', source, item)
				TriggerClientEvent("redemrp_notification:start", source, "Rented a fishing rod!", 3, "success")
            else 
                TriggerClientEvent('redemrp_gunshop:alert', source, "You are not a high enough level!")
            end
        else
            TriggerClientEvent('redemrp_gunshop:alert', source, "You dont have enough money!")
        end
	end)
end)

-- buy bait
RegisterServerEvent('scrp_baitshop:buybait')
AddEventHandler("scrp_baitshop:buybait", function(price, item, lvl)
    TriggerEvent("redemrp:getPlayerFromId", source, function(user)
        local identifier = user.getIdentifier()
		local level = user.getLevel()
        if user.getMoney() >= price then
            if level >= lvl then
                user.removeMoney(price)
				local ItemData = data.getItem(source, item)
				print(ItemData.ItemAmount)
				ItemData.AddItem(1)
				TriggerClientEvent("redemrp_notification:start", source, "Bought Bait!", 3, "success")
            else 
                TriggerClientEvent('redemrp_gunshop:alert', source, "You are not a high enough level!")
            end
        else
            TriggerClientEvent('redemrp_gunshop:alert', source, "You dont have enough money!")
        end
	end)
end)
-- buy carrot
RegisterServerEvent('scrp_baitshop:buycarrot')
AddEventHandler("scrp_baitshop:buycarrot", function(price, item, lvl)
    TriggerEvent("redemrp:getPlayerFromId", source, function(user)
        local identifier = user.getIdentifier()
		local level = user.getLevel()
        if user.getMoney() >= price then
            if level >= lvl then
                user.removeMoney(price)
				local ItemData = data.getItem(source, item)
				print(ItemData.ItemAmount)
				ItemData.AddItem(1)
				TriggerClientEvent("redemrp_notification:start", source, "Bought Carrot!", 3, "success")
            else 
                TriggerClientEvent('redemrp_gunshop:alert', source, "You are not a high enough level!")
            end
        else
            TriggerClientEvent('redemrp_gunshop:alert', source, "You dont have enough money!")
        end
	end)
end)
-- sell small fish
RegisterServerEvent('scrp_baitshop:sellsmallfish')
AddEventHandler('scrp_baitshop:sellsmallfish', function()
    local _source = source
    TriggerEvent('redemrp:getPlayerFromId', _source, function(user)
        local ItemData = data.getItem(source, 'smallfish')
		print(ItemData.ItemAmount)
		local totalfish = (ItemData.ItemAmount)
		if totalfish >= 1 then
			local totalmoney = (totalfish * 2)
			local totalxp = (totalfish * 2)
			user.addMoney(totalmoney)
			user.addXP(totalxp)
            ItemData.RemoveItem(totalfish)
            TriggerClientEvent("redemrp_notification:start", _source, "You sold " ..totalfish.. " small fish, for " ..totalmoney.."$ | "..totalxp.."XP", 5)
		else
            TriggerClientEvent("redemrp_notification:start", _source, 'You dont have any small fish to sell', 5)
        end
    end)
end)

-- sell medium fish
RegisterServerEvent('scrp_baitshop:sellmediumfish')
AddEventHandler('scrp_baitshop:sellmediumfish', function()
    local _source = source
    TriggerEvent('redemrp:getPlayerFromId', _source, function(user)
        local ItemData = data.getItem(source, 'mediumfish')
		print(ItemData.ItemAmount)
		local totalfish = (ItemData.ItemAmount)
		if totalfish >= 1 then
			local totalmoney = (totalfish * 5)
			local totalxp = (totalfish * 5)
			user.addMoney(totalmoney)
			user.addXP(totalxp)
            ItemData.RemoveItem(totalfish)
            TriggerClientEvent("redemrp_notification:start", _source, "You sold " ..totalfish.. " medium fish, for " ..totalmoney.."$ | "..totalxp.."XP", 5)
		else
            TriggerClientEvent("redemrp_notification:start", _source, 'You dont have any medium fish to sell', 5)
        end
    end)
end)

-- sell large fish
RegisterServerEvent('scrp_baitshop:selllargefish')
AddEventHandler('scrp_baitshop:selllargefish', function()
    local _source = source
    TriggerEvent('redemrp:getPlayerFromId', _source, function(user)
        local ItemData = data.getItem(source, 'largefish')
		print(ItemData.ItemAmount)
		local totalfish = (ItemData.ItemAmount)
		if totalfish >= 1 then
			local totalmoney = (totalfish * 10)
			local totalxp = (totalfish * 10)
			user.addMoney(totalmoney)
			user.addXP(totalxp)
            ItemData.RemoveItem(totalfish)
            TriggerClientEvent("redemrp_notification:start", _source, "You sold " ..totalfish.. " large fish, for " ..totalmoney.."$ | "..totalxp.."XP", 5)
		else
            TriggerClientEvent("redemrp_notification:start", _source, 'You dont have any large fish to sell', 5)
        end
    end)
end)