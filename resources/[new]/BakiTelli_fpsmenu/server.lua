CreateThread(function() 
	RegisterCommand(Config.Command, function (src)
        Ping = GetPlayerPing(src)
        TriggerClientEvent("BakiTelli:fpsmenu:open",src,Ping)
	end)	
end)