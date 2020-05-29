local H = wesnoth.require "helper"

function wesnoth.micro_ais.wf_zone_guardian(cfg)
	if (cfg.action ~= 'delete') and (not cfg.id) and (not wml.get_child(cfg, "filter")) then
		H.wml_error("WF Zone Guardian [micro_ai] tag requires either id= key or [filter] tag")
	end
	local required_keys = { "[filter_location]" }
	local optional_keys = { "id", "[filter]", "[filter_location_enemy]", "station_x", "station_y" }
	local CA_parms = {
		ai_id = 'mai_wf_zone_guardian',
		{ ca_id = 'move', location = '~add-ons/Wild_Frontiers/ai/ca_wf_zone_guardian.lua', score = cfg.ca_score or 300000 }
	}
    return required_keys, optional_keys, CA_parms
end

function wesnoth.micro_ais.wf_loiter_guardian(cfg)
	if (cfg.action ~= 'delete') and (not cfg.id) and (not wml.get_child(cfg, "filter")) then
		H.wml_error("WF Loiter Guardian [micro_ai] tag requires either id= key or [filter] tag")
	end
	local required_keys = { "stationary", "[filter_location]" }
	local optional_keys = { "id", "[filter]" }
	local CA_parms = {
		ai_id = 'mai_wf_loiter_guardian',
		{ ca_id = 'move', location = '~add-ons/Wild_Frontiers/ai/ca_wf_loiter_guardian.lua', score = cfg.ca_score or 100100 }
	}
    return required_keys, optional_keys, CA_parms
end
