local current_id = ""
local index = 0

function floating_button()
    gg.setVisible(false)
    while true do
        if gg.isVisible() then
            break
        end
		
        gg.sleep(300)
    end

	unlock_wear_by_id(current_id)
end

function unlock_wear_by_id(id)
	if current_id ~= id then
		current_id = id
		index = 0
	end
	
	if index == 0 then
		gg.setRanges(gg.REGION_ANONYMOUS)
		gg.clearResults()
		gg.searchNumber(id, gg.TYPE_DWORD)
		count = gg.getResultCount()
		results = gg.getResults(count)
	end
	
	menu = gg.choice({"Try to unlock", "Back & Revert values"})
	
	if menu == 1 then
		index = index + 1
		
		i = 0
		while i < count do
			i = i + 1
			
			if i == index then
				results[i].value = reverse and id or 1
			else
				results[i].value = reverse and 1 or id
			end
		end
		
		gg.setValues(results)
		floating_button()
	end
	
	if menu == 2 then
		i = 0
		while i < count do
			i = i + 1
			
			results[i].value = id
		end
		
		gg.setValues(results)
		wear_ids_menu()
		index = 0
	end
end

function wear_ids_menu()
	ids = {"1623134894","98049195","1837995829","602414487","1163388406","136979639","1659869159","1868976371","578453393"}

	menu = gg.choice({"Custom", "Adamant Helmet (Hat)","Chest (Hat)","Berserk (Mask)","Dr Plague (Mask)","Anime Glasses (Mask)","Smart Bullet Bazooka (Mask)","Hepi (Mask)","Cloak of Night (Cape)","Manuvering Modules (Cape)"})

	if menu == 1 then
		prompt = gg.prompt({"Put your own id here", "Do reverse"}, {[1] = 'ex: 602414487', [2] = false}, {[1] = 'text', [2] = 'checkbox'})
		
		if prompt ~= nil then
			reverse = prompt[2]
			unlock_wear_by_id(prompt[1])
		end
	end
	
	i = 1
	while i < #ids + 1 do
		if menu == i + 1 then
			reverse = false
			unlock_wear_by_id(ids[i])
			break
		end
		
		i = i + 1
	end
end

gg.toast("script by kyh#8317")
wear_ids_menu()
