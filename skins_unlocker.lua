--[[
IMPOSTER:
red_
blue
black
cyan
green
orange
pink
violet
white
yellow

NEW SKINS:
security
balloon
security
designer
dr_plague
mr_ulltimatum
--]]
local current_skin = 1

function floating_button(action)
    gg.setVisible(false)
    while true do
        if gg.isVisible() then
            break
        end
		
        gg.sleep(300)
    end

	
	if action == "revert_skin_values" then
		gg.setVisible(false)
		gg.setValues(revert)
		gg.clearResults()
		gg.toast("the values were reverted, now you can buy the skin.")
		floating_button("reopen_skins_menu")
	end
	
	if action == "reopen_skins_menu" then
		skins_menu()
	end
end

function unlock_skin(word)
	gg.setVisible(false)
	gg.clearResults()
	gg.setRanges(gg.REGION_ANONYMOUS)
	gg.searchNumber(";" .. word, gg.TYPE_WORD)
	count = gg.getResultCount()
	revert = gg.getResults(count)
    gg.editAll(0, gg.TYPE_WORD)
	gg.toast("refresh the page and select the buggy skin.")
    floating_button("revert_skin_values")
end

function choose_skin_menu(word)
	options = {"Back"}
	
	i = 0
	while i < #skins do
		i = i + 1
		options[#options + 1] = i .. ". " .. skins[i]
	end
	
	menu = gg.choice(options, nil, "Choose a skin")
	
	if menu == 1 then
		skins_menu()
	end
	
	i = 0
    while i ~= #skins do
        i = i + 1
		
		if menu == i + 1 then
			number = i
			
			current_skin = current_skin + 1
			unlock_skin(skins[i])
		end
    end
end

function skins_menu()
	if current_skin > 251 then
		current_skin = 251
	end
	
	skins = {"unknown", "neon", "robot", "orc", "barbarian", "skeleton_pirate", "netrunner", "cybercop", "future_ninja", "infection_fighter", "chief", "gunslinger", "sheriff", "gingerbread", "advanced_soldier", "alchemist", "supreme_lich", "donny_dark", "spark", "gum_beast", "cosmus", "captain_pixelgun", "portalius", "brave_fireman", "silent_survivor", "mad", "zombie_dude", "alpha_squad", "bravo_squad", "clan_legend", "super_mutant", "blockman", "confident_researcher", "raider", "aborigine", "werewolf", "pawn", "knight", "queen", "king", "legionary", "brave_knight", "amazon", "player_1", "joystick", "player_2", "secret_character", "final_boss", "ninja_robot", "city_fighter", "red_soldier", "blue_soldier", "digital_hero", "fearless_nun", "vampire_hunter", "enchanted_nutcracker", "good_yeti", "mouse_king", "krampus", "runaway_statue", "diligent_novice", "rubus", "colonist", "forgotten_astronaut", "alien_general", "strange_creature", "fluff", "cyber_hare", "humpty_dumpty", "bizarre_macho", "ninja_fox", "mysterious_warden", "mystic_merchant", "mermaid_princess", "kraken_cult_knight", "monster_from_the_deep", "scuba_diving_scout", "heavy_dive_suit", "elite_marine_ops", "aphrodite", "hermes", "ares", "zeus", "minotaurus", "insidious_hades", "lava_titan", "ice_titan", "rock_titan", "hercules", "community_manager", "game_designer", "programmer", "animator", "soundman", "project_manager", "bug_catcher", "splash", "vacation_girl", "dolphin_willy", "boy_with_duck", "undercover_agent", "agent_p", "agent_u", "agent_s", "agent_r", "spec_ops", "cyber_citizen", "cyber_girl", "med_paramedic", "arma_colonel", "hooligan_girl", "cyborg_boar", "cyborg_rhino", "bloq_director", "elite_police_drone", "benny", "ski_girl", "pilot", "twinkle", "caramel", "ice_dragon_shaman", "grumbler", "nimble_viking", "chubby_viking", "helga_the_breaker", "supreme_prophet", "thor", "loki", "fenrir", "odin", "valkyrie", "rocket_jumper", "super_pro", "noob", "campaign_girl", "lab_prototype", "policeman", "redneck", "don", "general_bullet", "bandits_leader", "mikhail_steel", "jason_drill", "professor_stone", "rocksy", "drilling_drone", "raptor", "triceratops", "shining_moon", "adventure_dog", "flat_boy", "amazing_robert_cat", "guns_bunny", "katty_pop", "blot", "red_skull", "skeptic_boy", "dance_queen", "blogger_girl", "virtual_blogger", "king_of_bros", "super_star_girl", "gamer_samurai", "modern_ninja", "super_hater", "pyramid_builder", "scarab_priest", "awakened_mummy", "anubis", "khepri", "shiny_ra", "cursed_pharaoh", "robotron", "mech_pilot_exo1", "mech_pilot_exo2", "spec_ops_tactical_mech", "heavy_siege_robot", "navy_tactical_suit", "secret_mech_prototype", "mecha_engineer", "far_future_loner", "chronos", "digital_gambler", "shiny", "froggy", "spiky", "flory", "infected_scientist", "supreme_space_parasite", "zombified_alien", "goliath", "zombie_clown", "desperate_lab_assistant", "madcap_girlie", "brave_priest", "viktor_grom", "sara_zoom", "front_man", "wildwood_creature", "forest_guardian", "dazzling_sage", "the_mirror", "summoned_snowman", "divided_santa", "wise_shogun", "mighty_shaman", "red_pan_dah", "deft_shinobi", "inquisitive_scientists", "armed_assistant", "storms_overlord", "super_bowl_player", "bubble_queen", "the_chosen_one", "the_empress", "royal_confidant", "sun_elf", "goblin_rogue", "troll_warchief", "edelonne_the_undead", "moon_elf", "light_paladin", "neptune", "moon", "earth", "the_sun", "the_everything", "ice_lich_king", "crystal_golem", "living_armor", "yellow_slicker", "sad_sally", "maniac_artist", "squad_captain", "moon_princess", "revived", "catcher_teen", "quirky_boy", "cat_maiden", "potions_master", "dark_mage_mimic", "school_ghost", "the_ancient_god", "ships_robot", "space_bounded_captain", "cosmo_conqueror", "ships_robot", "treasure_warden", "flying_dutchman", "snow_queen", "legendary_captain"}
	menu = gg.choice({"Unlock #" .. current_skin .. " (" .. skins[current_skin] .. ")", "Choose Skin", "Custom Skin", "Cancel"})
	
	if menu == 1 then
		current_skin = current_skin + 1
		unlock_skin(skins[current_skin])
	end
	
	if menu == 2 then
		choose_skin_menu()
	end
	
	if menu == 3 then
		typed = gg.prompt({"Type the value"}, {""}, {"text"})
		if typed ~= nil then
			unlock_skin(typed[1])
		end
	end
	
	if menu == 4 then
		os.exit()
	end
end

gg.toast("script by kyh#8317")
skins_menu()
