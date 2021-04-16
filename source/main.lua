function love.load()
	love.graphics.setDefaultFilter("nearest","nearest")
	
	-- landmasses
	brown_pos_x = {
	{30,630,30,630},
	{},
	{114,558,558},
	{84,372,684},
	{114,642,114,642},
	{114,642,114,642},
	{114,642,114,642},
	{72,420,360,768,360},
	{180,540,240,360},
	{180,540,240,300,420},
	{36,372,708,36,372,708},
	{36,372,708,36,372,708},
	{84,84,420,660,660},
	{24,48,408,720},
	{36,252,468,804,468,252},
	{36,264,264,264,492,780,780,780},
	{264,528,264,480,264,480,24,816},
	{24,552,6,228,840,24,552},
	{288,12,276,540,804},
	{6,186,678,6,450,858,474},
	{264,36,300,804,336},
	{90,570,24,24},
	{90,570,24,24}
	}

	brown_pos_y = {
	{54,54,510,510},
	{},
	{114,90,426},
	{258,234,234},
	{54,54,462,462},
	{54,54,462,462},
	{54,54,462,462},
	{300,24,240,240,576},
	{24,24,300,576},
	{24,24,240,444,576},
	{48,48,48,432,432,432},
	{48,48,48,432,432,432},
	{60,420,180,60,420},
	{540,120,60,60},
	{240,360,240,300,24,576},
	{300,36,300,564,240,36,240,564},
	{24,24,252,252,564,564,252,252},
	{12,12,300,300,300,588,588},
	{48,428,428,428,428},
	{24,24,24,300,264,300,576},
	{24,168,180,168,624},
	{240,240,0,576},
	{240,240,0,576}
	}

	brown_dimen = {
	{{300,156},{300,156},{300,156},{300,156}},
	{},
	{{216,492},{288,204},{288,204}},
	{{168,204},{192,252},{192,252}},
	{{204,204},{204,204},{204,204},{204,204}},
	{{204,204},{204,204},{204,204},{204,204}},
	{{204,204},{204,204},{204,204},{204,204}},
	{{120,120},{120,120},{240,240},{120,240},{240,120}},
	{{240,120},{240,120},{480,120},{240,120}},
	{{240,120},{240,120},{480,120},{240,120},{240,120}},
	{{216,240},{216,240},{216,240},{216,240},{216,240},{216,240}},
	{{216,240},{216,240},{216,240},{216,240},{216,240},{216,240}},
	{{216,240},{216,240},{120,360},{216,240},{216,240}},
	{{912,144},{288,240},{168,360},{168,360}},
	{{120,240},{120,120},{240,240},{120,120},{240,120},{612,120}},
	{{144,120},{144,120},{144,120},{144,120},{144,240},{144,120},{144,240},{144,120}},
	{{120,120},{120,120},{120,216},{216,216},{120,120},{216,120},{120,216},{120,216}},
	{{384,120},{384,120},{114,120},{504,120},{114,120},{384,120},{384,120}},
	{{384,180},{144,216},{144,216},{144,216},{144,216}},
	{{96,120},{360,120},{276,120},{360,160},{324,192},{96,120},{216,120}},
	{{432,72},{120,360},{360,360},{120,384},{288,72}},
	{{300,240},{300,240},{912,144},{912,144}},
	{{300,240},{300,240},{912,144},{912,144}}
	}
	
	-- bridges
	rail_pos_x = {
	{66,822,330,330},
	{},
	{330,330,666},
	{252,564,564},
	{180,708,318,318},
	{132,228,708,318,318},
	{132,228,708,318,318,318},
	{192,444,600,600,384,504},
	{264,624,420,384,504},
	{264,624,420,324,564},
	{252,588,108,384,504,252,588},
	{252,588,588,48,168,384,504,252,252,588,588},
	{108,204,732,300,300,300,300,540},
	{96,216,576,576,456,768},
	{156,156,372,276,552,492,612,708},
	{180,300,300,408,408,408,636,636,816,816},
	{384,288,552,288,492,612,384,144,144,696,696},
	{408,36,240,324,564,648,120,732,36,240,324,564,648,858,408},
	{336,552,156,156,420,420,684,684},
	{102,546,18,198,282,462,690,870,366,774,486,606},
	{336,444,552,156,156,156,156,660,660,660,384,504},
	{138,138,270,270,684,684,390},
	{138,138,684,684,390}
	}
	
	rail_pos_y = {
	{210,210,90,558},
	{},
	{138,510,294},
	{324,264,384},
	{258,258,120,528},
	{258,258,258,120,528},
	{258,258,258,120,480,576},
	{324,144,264,384,480,480},
	{144,144,48,420,420},
	{144,144,48,360,360},
	{132,132,288,288,288,516,516},
	{132,72,192,288,288,288,288,456,576,456,576},
	{300,300,300,84,564,204,444,204},
	{360,360,132,276,420,420},
	{264,384,384,480,480,144,144,324},
	{324,156,420,60,324,588,264,384,156,480},
	{48,144,144,468,468,468,600,264,384,264,384},
	{36,132,132,132,132,132,324,324,420,420,420,420,420,420,612},
	{228,228,440,560,440,560,440,560},
	{48,48,144,144,144,144,144,144,324,324,456,456},
	{96,96,96,198,282,366,450,216,324,432,540,540},
	{144,480,144,480,144,480,324},
	{144,480,144,480,324}
	}
	
	rail_dimen = {
	{{72,300},{72,300},{300,72},{300,72}},
	{},
	{{228,72},{228,72},{72,132}},
	{{120,72},{120,72},{120,72}},
	{{72,204},{72,204},{324,72},{324,72}},
	{{72,204},{72,204},{72,204},{324,72},{324,72}},
	{{72,204},{72,204},{72,204},{324,72},{324,72},{324,72}},
	{{168,72},{72,96},{168,72},{168,72},{72,96},{72,96}},
	{{72,156},{72,156},{120,72},{72,156},{72,156}},
	{{72,96},{72,96},{120,72},{72,84},{72,216}},
	{{120,72},{120,72},{72,144},{72,144},{72,144},{120,72},{120,72}},
	{{120,72},{120,72},{120,72},{72,144},{72,144},{72,144},{72,144},{120,72},{120,72},{120,72},{120,72}},
	{{72,120},{72,120},{72,120},{360,72},{360,72},{120,72},{120,72},{120,72}},
	{{72,180},{72,180},{144,72},{144,72},{72,120},{72,120}},
	{{312,72},{96,72},{96,72},{72,96},{72,96},{72,96},{72,96},{96,72}},
	{{84,72},{72,144},{72,144},{372,72},{84,72},{372,72},{144,72},{144,72},{72,84},{72,84}},
	{{144,72},{72,108},{72,108},{72,96},{72,96},{72,96},{96,72},{120,72},{120,72},{120,72},{120,72}},
	{{144,72},{72,168},{72,168},{72,168},{72,168},{72,168},{108,72},{108,72},{72,168},{72,168},{72,168},{72,168},{72,168},{72,168},{144,72}},
	{{72,200},{72,200},{120,72},{120,72},{120,72},{120,72},{120,72},{120,72}},
	{{84,72},{132,72},{72,156},{72,156},{72,156},{72,120},{72,120},{72,156},{84,72},{84,72},{72,120},{72,120}},
	{{72,84},{72,84},{72,84},{144,72},{144,72},{144,72},{144,72},{144,72},{144,72},{144,72},{72,84},{72,84}},
	{{72,96},{72,96},{72,96},{72,96},{72,96},{72,96},{180,72}},
	{{72,96},{72,96},{72,96},{72,96},{180,72}}
	}

	-- level counter
	level = 1

	-- gameplay variables
	start_pos = {}
	start_glow_dimen = {}
	next_pos = {}
	next_glow_dimen = {}
	bridge_counter = 3

	-- timers
	enforced_start_timer = 1
	level_timer = 1
	finallevel_timer = 1
	start_timer = 1

	-- game states
	start_dim = true
	picked_landmass = false
	passed = false
	break1 = false
	break2 = false
	unlocked = false

	-- fonts
	tinyFont = love.graphics.newFont(1)
	smallFont = love.graphics.newFont("font.ttf",34)
	mediumFont = love.graphics.newFont("font.ttf",58)
	largeFont = love.graphics.newFont("font.ttf",72)

	-- sounds
	sounds = {
		['Clair'] = love.audio.newSource('sounds/ClairDeLune.wav','stream')
	}
	
	--[[ sounds
	sounds = {
		['theme'] = love.audio.newSource('sounds/.wav','static'),
		['new_level'] = love.audio.newSource('sounds/.wav','static'),
		['picked_starting_landmass'] = love.audio.newSource('sounds/.wav','static'),
        ['footsteps'] = love.audio.newSource('sounds/footsteps.wav', 'static'),
        ['success'] = love.audio.newSource('sounds/.wav','static'),
		['SBOK'] = love.audio.newSource('sounds/.wav','static'),
        ['crack'] = love.audio.newSource('sounds/.wav', 'static'),
		['triumphant'] = love.audio.newSource('sounds/.wav','static'),
		['completion'] = love.audio.newSource('sounds/.wav','static')
    }]]
end

function love.update(dt)
	-- play theme music throughout
	sounds['Clair']:play()

	--[[ play completion music when player beats the game
	if level == 23 and passed then
		sounds['completion']:play()
	end]]

	-- timer to prevent players from accidentally skipping starting page and instruction page
	if level <= 2 and enforced_start_timer > 0 then
		enforced_start_timer = enforced_start_timer - dt
	end
	
	-- make the "Press Enter" prompt flash
	if enforced_start_timer <= 0 and level <= 2 then
		if start_dim and start_timer > 0 then
			start_timer = start_timer - dt
		end
		if start_timer <= 0 then
			start_dim = false
		end
		if start_dim == false then
			start_timer = start_timer + dt
		end
		if start_timer >= 1 then
			start_dim = true
		end
	end

	-- pass values from variables concerning next landmass to those of start landmass (reset with new starting position)
	if picked_landmass then
		start_pos[1] = next_pos[1]
		start_pos[2] = next_pos[2]
		start_glow_dimen[1] = next_glow_dimen[1]
		start_glow_dimen[2] = next_glow_dimen[2]
	end

	-- timer for displaying level number
	if level >= 3 and level <= #brown_pos_x - 2 and level_timer ~= 0 then
		level_timer = level_timer - 0.5 * dt
		if level_timer < 0 then level_timer = 0 end
	end
	-- timer for displaying final level name
	if level == #brown_pos_x - 1 and finallevel_timer ~= 0 then
		finallevel_timer = finallevel_timer - 0.2 * dt
		if finallevel_timer < 0 then finallevel_timer = 0 end
	end

	-- determining whether the player passed the level
	if bridge_counter == 0 then
		-- sounds['success']:play()
		passed = true
	end

	-- that final level
	if break1 and break2 then
		-- sounds['triumphant']:play()
		unlocked = true
	end
end


function love.draw()
	-- check memory usage
	love.graphics.setFont(tinyFont)
	love.graphics.setColor(0.1,0.15,0.32)
	love.graphics.print(collectgarbage('count'),10,10)

	-- constant background colour (deep sea blue)
	love.graphics.setBackgroundColor(0.1,0.15,0.32)

	-- title screen
	if level == 1 then
		-- title
		love.graphics.setColor(1,1,1)
		love.graphics.setFont(largeFont)
		love.graphics.printf("Konigs' Bridge",180,300,600,'center')
		-- prompt
		love.graphics.setFont(smallFont)
		love.graphics.setColor(1,1,1,1 - start_timer)
		love.graphics.printf("Press Enter",360,432,240,'center')

	-- instructions page
	elseif level == 2 then
		-- title
		love.graphics.setColor(1,1,1)
		love.graphics.setFont(largeFont)
		love.graphics.printf("How to Play?",120,60,720,'center')
		
		-- instructions
		love.graphics.setFont(smallFont)
	
		love.graphics.printf("- Tap on a landmass to pick your starting position at the start of each level",90,180,840,'left')

		love.graphics.printf("- Tap on a bridge to cross it",90,300,840,'left')

		love.graphics.printf("- You can't cross a bridge that has already been crossed",90,390,840,'left')

		love.graphics.printf("- Win by crossing all bridges",90,510,840,'left')
	
		-- prompt
		love.graphics.setFont(smallFont)
		love.graphics.setColor(1,1,1,1 - start_timer)
		love.graphics.printf("Press Enter",360,636,240,'center')
	end

-- create map features based on tables (rail_pos_x,rail_pos_y,rail_dimen,brown_pos_x,brown_pos_y,brown_dimen) in each level
	if level <= #brown_pos_x then
		-- bridges
		for a = 1,#rail_pos_x[level] do
			-- horizontal bridges
			if rail_dimen[level][a][2] == 72 then
				--railings
				love.graphics.setColor(0.4,0.4,0.4)
				love.graphics.rectangle("fill",rail_pos_x[level][a],rail_pos_y[level][a],rail_dimen[level][a][1],rail_dimen[level][a][2])
				-- roads
				love.graphics.setColor(0.1,0.1,0.1)
				love.graphics.rectangle("fill",rail_pos_x[level][a],rail_pos_y[level][a] + 5,rail_dimen[level][a][1],rail_dimen[level][a][2] - 10)

			-- vertical bridges
			elseif rail_dimen[level][a][1] == 72 then
				-- railings
				love.graphics.setColor(0.4,0.4,0.4)
				love.graphics.rectangle("fill",rail_pos_x[level][a],rail_pos_y[level][a],rail_dimen[level][a][1],rail_dimen[level][a][2])
				-- roads
				love.graphics.setColor(0.1,0.1,0.1)
				love.graphics.rectangle("fill",rail_pos_x[level][a] + 5,rail_pos_y[level][a],rail_dimen[level][a][1] - 10,rail_dimen[level][a][2])
			end
		end

		-- landmasses
		for b = 1,#brown_pos_x[level] do
			-- brown landmasses
			love.graphics.setColor(0.18,0.16,0.12)
			love.graphics.rectangle("fill",brown_pos_x[level][b],brown_pos_y[level][b],brown_dimen[level][b][1],brown_dimen[level][b][2])
			-- green landmasses
			love.graphics.setColor(0.2,0.4,0.1)
			love.graphics.rectangle("fill",brown_pos_x[level][b] + 5,brown_pos_y[level][b] + 5,brown_dimen[level][b][1] - 10,brown_dimen[level][b][2] - 10)
		end
	end

	-- highlight starting landmass
	if picked_landmass and ((level >= 3 and level <= #brown_pos_x - 2) or level == #brown_pos_x) then
		love.graphics.setColor(0.4,0.25,0.3)
		love.graphics.rectangle("fill",next_pos[1] + 5,next_pos[2] + 5,next_glow_dimen[1] - 10,next_glow_dimen[2] - 10)
	end

	-- level indicator
	if level >= 3 and level <= #brown_pos_x - 2 and level_timer > 0 then
		love.graphics.setFont(mediumFont)
		love.graphics.setColor(1,1,1,level_timer)
		love.graphics.printf("Level "..tostring(level-2),180,300,600,'center')
	elseif level == #brown_pos_x - 1 and finallevel_timer > 0 then
		love.graphics.setFont(mediumFont)
		love.graphics.setColor(1,1,1,finallevel_timer)
		love.graphics.printf("Seven Bridges of Konigsberg",180,300,600,'center')
	end

	-- print completion percentage
	if level >= 3 and level <= #brown_pos_x - 2 and passed then
		love.graphics.setFont(mediumFont)
		love.graphics.setColor(1,1,1)
		love.graphics.printf(tostring(5*(level-2)).."% Completed",180,300,600,'center')
	elseif level == #brown_pos_x and passed then
		love.graphics.setFont(mediumFont)
		love.graphics.setColor(1,1,1)
		love.graphics.printf("100% Completed",180,300,600,'center')
	end

end

-- logic for incrementing level number
function love.keypressed(key,scancode,isrepeat)
	if key == "return" then 
		-- Player must pass current level to move onto the next
		if level >= 3 and passed then
			if level <= #brown_pos_x - 3 then
				level = level + 1
				level_timer = 1
				picked_landmass = false
				start_pos = {}
				start_glow_dimen = {}
				next_pos = {}
				next_glow_dimen = {}
				bridge_counter = #rail_pos_x[level]
				passed = false
				-- sounds['new_level']:play()

			-- In preparation for Seven Bridges of Konigsberg
			elseif level == #brown_pos_x - 2 then
				level = level + 1
				finallevel_timer = 1
				level_timer = 1
				picked_landmass = false
				start_pos = {}
				start_glow_dimen = {}
				next_pos = {}
				next_glow_dimen = {}
				bridge_counter = #rail_pos_x[level]
				passed = false
				unlocked = false
				-- sounds['SBOK']:play()
			end
		-- Unlock final level
		elseif level == #brown_pos_x - 1 and unlocked then
			level = level + 1
			picked_landmass = false
			start_pos = {}
			start_glow_dimen = {}
			next_pos = {}
			next_glow_dimen = {}
			bridge_counter = 5
			passed = false
			
		-- Allows player to just press Enter to move to next page
		elseif level <= 2 and enforced_start_timer <= 0 then
			enforced_start_timer = 3
			start_timer = 1
			level = level + 1
			level_timer = 1
			picked_landmass = false
			start_pos = {}
			start_glow_dimen = {}
			next_pos = {}
			next_glow_dimen = {}
			passed = false
		end
	end
	
	-- quit game
	if key == 'escape' then
		love.event.quit()
	end

	-- testing purposes
	if key == 'w' then
		passed = true
	end
end

-- mouse clicking
function love.mousepressed(x,y,button,istouch)
	-- allows player to pick starting landmass
	if button == 1 and ((level >= 3 and level <= #brown_pos_x - 2) or level == #brown_pos_x) and picked_landmass == false then
		for r = 1,#brown_pos_x[level] do
			if x >= brown_pos_x[level][r] + 5 and x <= brown_pos_x[level][r] + brown_dimen[level][r][1] - 5 
			and y >= brown_pos_y[level][r] + 5 and y <= brown_pos_y[level][r] + brown_dimen[level][r][2] - 5
			then
				next_pos = {brown_pos_x[level][r],brown_pos_y[level][r]}
				next_glow_dimen = {brown_dimen[level][r][1],brown_dimen[level][r][2]}
				picked_landmass = true
				-- sounds['picked_starting_landmass']:play()
				break
			end
		end
	end

	-- tap on bridges only after starting landmass is picked
	if button == 1 and ((level >= 3 and level <= #brown_pos_x - 2) or level == #brown_pos_x) and picked_landmass then
		-- match bridge with area player taps on
		for d = 1,#rail_pos_x[level] do
			if x > rail_pos_x[level][d] and x < rail_pos_x[level][d] + rail_dimen[level][d][1]
			and y > rail_pos_y[level][d] and y < rail_pos_y[level][d] + rail_dimen[level][d][2]
			then
				-- if bridge is horizontal
				if rail_dimen[level][d][1] ~= 72 and rail_dimen[level][d][2] == 72
				-- check if starting and ending y coordinates of the bridge lie within the highlighted landmass
				and rail_pos_y[level][d] > start_pos[2] and rail_pos_y[level][d] + rail_dimen[level][d][2] < start_pos[2] + start_glow_dimen[2] then

					-- check if starting x coordinate of bridge lies within highlighted landmass
					if rail_pos_x[level][d] == start_pos[1] + start_glow_dimen[1] then
						
						-- if it lies within highlighted landmass, highlight the landmass at the end of the bridge
						for e = 1,#brown_pos_x[level] do
							if rail_pos_x[level][d] + rail_dimen[level][d][1] == brown_pos_x[level][e]
							and rail_pos_y[level][d] > brown_pos_y[level][e]
							and rail_pos_y[level][d] + rail_dimen[level][d][2] < brown_pos_y[level][e] + brown_dimen[level][e][2]
							then
								next_pos = {brown_pos_x[level][e],brown_pos_y[level][e]}
								next_glow_dimen = {brown_dimen[level][e][1],brown_dimen[level][e][2]}
								rail_dimen[level][d] = {0,0}
								bridge_counter = bridge_counter - 1
								-- sounds['footsteps']:play()
								break
							end
						end

					-- if starting x coordinate doesn't lie within the highlighted landmass, highlight the landmass at the start of the bridge
					elseif rail_pos_x[level][d] + rail_dimen[level][d][1] == start_pos[1] then
						for f = 1,#brown_pos_x[level] do
							if rail_pos_x[level][d] == brown_pos_x[level][f] + brown_dimen[level][f][1]
							and rail_pos_y[level][d] > brown_pos_y[level][f]
							and rail_pos_y[level][d] + rail_dimen[level][d][2] < brown_pos_y[level][f] + brown_dimen[level][f][2]
							then
								next_pos = {brown_pos_x[level][f],brown_pos_y[level][f]}
								next_glow_dimen = {brown_dimen[level][f][1],brown_dimen[level][f][2]}
								rail_dimen[level][d] = {0,0}
								bridge_counter = bridge_counter - 1
								-- sounds['footsteps']:play()
								break
							end
						end
					end

				-- if bridge is vertical
				elseif rail_dimen[level][d][1] == 72 and rail_dimen[level][d][2] ~= 72
				-- check if x starting and ending x coordinates of bridge lies within the highlighted landmass
				and rail_pos_x[level][d] > start_pos[1] and rail_pos_x[level][d] + rail_dimen[level][d][1] < start_pos[1] + start_glow_dimen[1] then

					-- check if starting y coordinate of bridge lies within highlighted landmass
					if rail_pos_y[level][d] == start_pos[2] + start_glow_dimen[2] then
						-- if it lies within highlighted landmass, highlight the landmass at the end of the bridge
						for e = 1,#brown_pos_y[level] do
							if rail_pos_y[level][d] + rail_dimen[level][d][2] == brown_pos_y[level][e]
							and rail_pos_x[level][d] > brown_pos_x[level][e]
							and rail_pos_x[level][d] + rail_dimen[level][d][1] < brown_pos_x[level][e] + brown_dimen[level][e][1]
							then
								next_pos = {brown_pos_x[level][e],brown_pos_y[level][e]}
								next_glow_dimen = {brown_dimen[level][e][1],brown_dimen[level][e][2]}
								rail_dimen[level][d] = {0,0}
								bridge_counter = bridge_counter - 1
								-- sounds['footsteps']:play()
								break
							end
						end

					-- if the starting y coordinate doesn't lie within the highlighted landmass, highlight the landmass at the start of the bridge
					elseif rail_pos_y[level][d] + rail_dimen[level][d][2] == start_pos[2] then
						for f = 1,#brown_pos_y[level] do
							if rail_pos_y[level][d] == brown_pos_y[level][f] + brown_dimen[level][f][2]
							and rail_pos_x[level][d] > brown_pos_x[level][f]
							and rail_pos_x[level][d] + rail_dimen[level][d][1] < brown_pos_x[level][f] + brown_dimen[level][f][1]
							then
								next_pos = {brown_pos_x[level][f],brown_pos_y[level][f]}
								next_glow_dimen = {brown_dimen[level][f][1],brown_dimen[level][f][2]}
								rail_dimen[level][d] = {0,0}
								bridge_counter = bridge_counter - 1
								-- sounds['footsteps']:play()
								break
							end
						end
					end
				end
			end
		end
	end

	-- breaking the bridges
	if button == 1 and level == #brown_pos_x - 1 then
		if x > rail_pos_x[level][3] + 5 and x < rail_pos_x[level][3] + rail_dimen[level][3][1] - 5
		and y > rail_pos_y[level][3] and y < rail_pos_y[level][3] + rail_dimen[level][3][2]
		then
			break1 = true
			-- sounds['crack']:play()
		end
		if x > rail_pos_x[level][4] + 5 and x < rail_pos_x[level][4] + rail_dimen[level][4][1] - 5
		and y > rail_pos_y[level][4] and y < rail_pos_y[level][4] + rail_dimen[level][4][2]
		then
			break2 = true
			-- sounds['crack']:play()
		end
	end
end
