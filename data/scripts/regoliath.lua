function enable_regoliath()
	
    log("Regoliath event has been activated.")
end

script.on_game_event("event_REGOLIATH_DECISION_CONFIRM_CM", false, enable_regoliath)

script.on_game_event("event_REGOLIATH_DECISION_RANDOM_CM", false, function()
	math.randomseed(os.time())
	if (math.random() < 0.5) then enable_regoliath() end
end)

script.on_game_event("event_REGOLIATH_UPGRADE_CM", false, function()
	local shields = Hyperspace.ships.player:GetSystem(0)
	local weapons = Hyperspace.ships.player:GetSystem(3)
	shields.maxLevel=system.maxLevel+3
	shields:UpgradeSystem(3)
	weapons.maxLevel=system.maxLevel+3
	weapons:UpgradeSystem(3)
end)
