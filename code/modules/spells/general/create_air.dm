/spell/create_air
	name = "Create Air"
	desc = "Use your mental strength to literally tear a hole from this dimension to the next, letting things through..."

	charge_max = 200
	spell_flags = Z2NOCAST
	invocation = "none"
	invocation_type = SpI_NONE

	number_of_channels = 0
	time_between_channels = 200
	hud_state = "wiz_air"
	var/list/air_change = list("oxygen" = ONE_ATMOSPHERE)
	number_of_channels = 0

/spell/create_air/choose_targets()
	var/air = holder.return_air()
	if(air)
		return list(air)
	return null

/spell/create_air/cast(var/list/targets, var/mob/holder, var/channel_count)
	var/datum/gas_mixture/environment = targets[1]
	for(var/gas in air_change)
		environment.adjust_gas(gas, air_change[gas])