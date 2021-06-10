function love.load()
	menu = require "menu"

	-- fit all options into an a table
	deck1 = require "deck1"
	deck2 = require "deck2"
	deck3 = require "deck3"
	tutorial = require "tutorial"
	sbok = require "sbok"
	options = {deck1,deck2,deck3,tutorial,sbok}
	
	-- fun menu stuff
	option_fade_timer = 0
	hover = false
	hover_play = true
	deck1_passed = false
	deck2_passed = false
	deck3_passed = false
	reveal_secret = false
	game_completed = false
	
	-- game states
	gameState = 0 -- 0 refers to menu, 1 refers to options
	opState = 1 -- this determines which option to focus on
	
	-- gameplay timers
	prep_lvl_timer = 1
	lvl_indicator_timer = 1
	
	-- gameplay pieces
	lvl = 1
	picked_landmass = false
	rdc = {}
	draw = false -- boolean to decide when to draw
	drawn = false -- boolean to check if map has been drawn
	start_position = {}
	start_dimen = {}
	bridge_count = 0
	lives = 3
	
	--tutorial pieces
	tut_timer = 1
	tut_move = false
	tut_retried = false

	-- records
	time_taken = 0
	minutes = 0
	seconds = 0
	lives_used = 1

	-- fonts
	tinyFont = love.graphics.newFont(1)
	smallFont = love.graphics.newFont("font.ttf",34)
	mediumFont = love.graphics.newFont("font.ttf",52)
	largeFont = love.graphics.newFont("font.ttf",72)
	
	-- sounds
	ClairDeLune = love.audio.newSource('ClairDeLune.wav','static')
	click_sound = love.audio.newSource('click.wav','static')
	landmass_sound = love.audio.newSource('landmass.wav','static')
end


function love.update(dt)

	-- play theme music throughout
	ClairDeLune:play()
	
	-- get mouse position
	mousex,mousey = love.mouse.getPosition()
	
	-- stuff to do when at the menu
	if gameState == 0 then
		-- standardised beginning
		start_position = {}
		start_dimen = {}
		draw = false
		drawn = false
		picked_landmass = false
		lives = 3
		lvl = 1
		prep_lvl_timer = 1
		lvl_indicator_timer = 1
		-- make options flash
		if option_fade_timer < 1 then option_fade_timer = option_fade_timer + dt end
		if option_fade_timer > 1 then option_fade_timer = 1 end
	end

	-- for options
	if gameState == 1 then
		
		if opState <= 5 and not picked_landmass then
			-- make a copy of the bridge dimensions
			rdc = {}
			for s = 1,#options[opState]['rd'][lvl] do
				table.insert(rdc,options[opState]['rd'][lvl][s])
			end
			bridge_count = #rdc
			-- set wrong starting landmass for tutorial's final level
			if opState == 4 and lvl == 3 and not tut_retried then
				start_position = {options[opState]['bpx'][lvl][1],options[opState]['bpy'][lvl][1]}
				start_dimen = {options[opState]['bd'][lvl][1][1],options[opState]['bd'][lvl][1][2]}
				picked_landmass = true
				tut_retried = true
			end
			draw = true
		end
	
		-- for playable levels
		if opState <= 3 then
			-- keep track of time taken on decks
			if lives > 0 then
				time_taken = time_taken + dt
				minutes = math.floor(time_taken/60)
				seconds = math.floor(time_taken - minutes*60)
			end
			-- if you pass
			if bridge_count == 0 then
				-- wait a while before automatically moving onto next level
				if prep_lvl_timer > 0 then
					prep_lvl_timer = prep_lvl_timer - 3/4*dt
				end
				if prep_lvl_timer <= 0 then
					picked_landmass = false
					draw = false
					drawn = false
					start_position = {}
					start_dimen = {}
					prep_lvl_timer = 1
					lvl_indicator_timer = 1
					if lvl ~= #options[opState]['bpx'] then
						lvl = lvl + 1
					-- if you passed the final level, go back to menu
					else
						if opState == 1 then deck1_passed = true
						elseif opState == 2 then deck2_passed = true
						else deck3_passed = true end
						gameState = 0
						option_fade_timer = 0
					end
				end
			elseif lvl_indicator_timer > 0 then lvl_indicator_timer = lvl_indicator_timer - 2/3*dt end
		end
		-- for the tutorial
		if opState == 4 then
			if bridge_count == 0 and not tut_move then
				tut_timer = tut_timer - dt
			end
			if tut_timer <= 0 then tut_move = true end
			if tut_move then tut_timer = tut_timer + 1/2*dt end
		end
	end

	-- pass all levels and there's a secret in SBOK
	if deck1_passed and deck2_passed and deck3_passed then reveal_secret = true end
end


function love.draw()
	-- check memory usage
	love.graphics.setFont(tinyFont)
	love.graphics.setColor(0.1,0.15,0.32)
	love.graphics.print(collectgarbage('count'),10,10)

	-- constant background colour (deep sea blue)
	love.graphics.setBackgroundColor(0.1,0.15,0.32)
	
	-- draw the menu
	if gameState == 0 then
		-- bridges
		for a = 1,#menu['rpx'] do
			-- railings
			love.graphics.setColor(0.4,0.4,0.4)
			love.graphics.rectangle("fill",menu['rpx'][a],menu['rpy'][a],menu['rd'][a][1],menu['rd'][a][2])
			-- roads, drawn depending on the bridge's orientation
			love.graphics.setColor(0.1,0.1,0.1)
			-- horizontal bridges
			if menu['rd'][a][2] == 72 then
				love.graphics.rectangle("fill",menu['rpx'][a],menu['rpy'][a] + 5,menu['rd'][a][1],menu['rd'][a][2] - 10)
			-- vertical bridges
			elseif menu['rd'][a][1] == 72 then
				love.graphics.rectangle("fill",menu['rpx'][a] + 5,menu['rpy'][a],menu['rd'][a][1] - 10,menu['rd'][a][2])
			end
		end
		-- landmasses
		for b = 1,#menu['bpx'] do
			-- brown landmasses
			love.graphics.setColor(0.18,0.16,0.12)
			love.graphics.rectangle("fill",menu['bpx'][b],menu['bpy'][b],menu['bd'][b][1],menu['bd'][b][2])
			-- green landmasses
			love.graphics.setColor(0.2,0.4,0.1)
			love.graphics.rectangle("fill",menu['bpx'][b] + 5,menu['bpy'][b] + 5,menu['bd'][b][1] - 10,menu['bd'][b][2] - 10)
		end
		-- icons for options
		for c = 1,#menu['opx'] do
			-- white base for options
			love.graphics.setColor(0.7,0.7,0.7,option_fade_timer)
			love.graphics.rectangle("fill",menu['opx'][c],menu['opy'][c],menu['od'][c][1],menu['od'][c][2])
			-- grey base for options (brightness depends on position of the cursor)
			hover = mousex > menu['opx'][c] + 5 and mousex < menu['opx'][c] + menu['od'][c][1] - 5 and
				  mousey > menu['opy'][c] + 5 and mousey < menu['opy'][c] + menu['od'][c][2] - 5
			if hover then love.graphics.setColor(0.6,0.6,0.6,option_fade_timer)
			else love.graphics.setColor(0.4,0.4,0.4,option_fade_timer) end
			love.graphics.rectangle("fill",menu['opx'][c] + 5,menu['opy'][c] + 5,menu['od'][c][1] - 10,menu['od'][c][2] - 10)
		end
		-- green lights if players clears deck
		if deck1_passed then love.graphics.setColor(0.1,0.7,0.2,option_fade_timer) else love.graphics.setColor(0.9,0.1,0.3,option_fade_timer) end
		love.graphics.rectangle("fill",menu['opx'][1] - 50,menu['opy'][1] + 30,20,20)
		if deck2_passed then love.graphics.setColor(0.1,0.7,0.2,option_fade_timer) else love.graphics.setColor(0.9,0.1,0.3,option_fade_timer) end
		love.graphics.rectangle("fill",menu['opx'][2] - 50,menu['opy'][2] + 30,20,20)
		if deck3_passed then love.graphics.setColor(0.1,0.7,0.2,option_fade_timer) else love.graphics.setColor(0.9,0.1,0.3,option_fade_timer) end
		love.graphics.rectangle("fill",menu['opx'][3] - 50,menu['opy'][3] + 30,20,20)
		if game_completed then love.graphics.setColor(0.1,0.7,0.2,option_fade_timer) else love.graphics.setColor(0.9,0.1,0.3,option_fade_timer) end
		love.graphics.rectangle("fill",menu['opx'][5] - 50,menu['opy'][5] + 30,20,20)
		-- title
		love.graphics.setColor(1,1,1)
		love.graphics.setFont(largeFont)
		love.graphics.printf("Konigsberg",180,230,600,'center')
		-- option names
		love.graphics.setColor(0,0,0,option_fade_timer)
		love.graphics.setFont(mediumFont)
		love.graphics.printf("Deck #1",menu['opx'][1] + 10,menu['opy'][1] + 12,menu['od'][1][1],'center')
		love.graphics.printf("Deck #2",menu['opx'][2] + 10,menu['opy'][2] + 12,menu['od'][2][1],'center')
		love.graphics.printf("Deck #3",menu['opx'][3] + 10,menu['opy'][3] + 12,menu['od'][3][1],'center')
		love.graphics.printf("Tutorial",menu['opx'][4] + 10,menu['opy'][4] + 12,menu['od'][4][1],'center')
		love.graphics.printf("SBOK",menu['opx'][5] + 10,menu['opy'][5] + 12,menu['od'][5][1],'center')
		love.graphics.printf("Credits",menu['opx'][6] + 10,menu['opy'][6] + 12,menu['od'][6][1],'center')

	-- draw levels within the options
	elseif gameState == 1 then

		-- playable levels
		if opState <= 5 and draw then
			-- bridges
			for i = 1,#options[opState]['rpx'][lvl] do
				-- railings
				love.graphics.setColor(0.4,0.4,0.4)
				love.graphics.rectangle("fill",options[opState]['rpx'][lvl][i],
				options[opState]['rpy'][lvl][i],rdc[i][1],rdc[i][2])
				-- roads, drawn depending on the bridge's orientation
				love.graphics.setColor(0.1,0.1,0.1)
				-- horizontal bridges
				if rdc[i][2] == 72 then
					love.graphics.rectangle("fill",options[opState]['rpx'][lvl][i],
					options[opState]['rpy'][lvl][i] + 5,rdc[i][1],rdc[i][2] - 10)
				-- vertical bridges
				elseif rdc[i][1] == 72 then
					love.graphics.rectangle("fill",options[opState]['rpx'][lvl][i] + 5,
					options[opState]['rpy'][lvl][i],rdc[i][1] - 10,rdc[i][2])
				end
			end
			-- landmasses
			for j = 1,#options[opState]['bpx'][lvl] do
				-- brown landmasses
				love.graphics.setColor(0.18,0.16,0.12)
				love.graphics.rectangle("fill",options[opState]['bpx'][lvl][j],
				options[opState]['bpy'][lvl][j],options[opState]['bd'][lvl][j][1],options[opState]['bd'][lvl][j][2])
				-- green landmasses
				love.graphics.setColor(0.2,0.4,0.1)
				love.graphics.rectangle("fill",options[opState]['bpx'][lvl][j] + 5,
				options[opState]['bpy'][lvl][j] + 5,options[opState]['bd'][lvl][j][1] - 10,options[opState]['bd'][lvl][j][2] - 10)
			end
			-- highlight starting landmass
			if picked_landmass then
				love.graphics.setColor(0.4,0.25,0.3)
				love.graphics.rectangle("fill",start_position[1] + 5,start_position[2] + 5,start_dimen[1] - 10,start_dimen[2] - 10)
			end
			drawn = true -- change the boolean after map features are drawn

			-- deck stuff
			if opState <= 3 then
				love.graphics.setColor(1,1,1,0.8)
				love.graphics.setFont(smallFont)
				-- reminder for how to retry
				love.graphics.printf("backspace - retry",600,10,350,'right')
				-- timer
				love.graphics.printf(tostring(minutes)..":"..string.format("%02d",seconds),40,670,200,'left')

				love.graphics.setColor(1,1,1)

				-- lives indicator
				love.graphics.printf("Lives: "..tostring(lives),10,10,150,'left')
				
				love.graphics.setFont(mediumFont)
				-- if complete, represent the number of completed levels as a fraction
				if bridge_count == 0 then
					love.graphics.printf(tostring(lvl).."/"..tostring(#options[opState]['bpx']),380,320,200,'center')
				-- retry if fail
				elseif lives == 0 then
					love.graphics.printf(":(",430,280,100,'center')
					love.graphics.printf("Go back to menu",180,360,600,'center')
				end
				-- introduce level number
				if lvl_indicator_timer > 0 then
					love.graphics.setColor(1,1,1,lvl_indicator_timer)
					love.graphics.printf("Level "..tostring(lvl),380,320,200,'center')
				end

			-- tutorial stuff
			elseif opState == 4 then
				if lvl == 1 then
					love.graphics.setColor(1,1,1)
					love.graphics.setFont(mediumFont)
					love.graphics.printf("Game Pieces",300,70,360,'center')
					love.graphics.printf("__________",300,100,360,'center')
					love.graphics.printf("= Landmass",500,270,360,'left')
					love.graphics.printf("= Bridge",460,470,360,'left')
					-- brown landmass
					love.graphics.setColor(0.18,0.16,0.12)
					love.graphics.rectangle("fill",160,205,300,180)
					-- green landmass
					love.graphics.setColor(0.2,0.4,0.1)
					love.graphics.rectangle("fill",165,210,290,170)
					-- railings
					love.graphics.setColor(0.4,0.4,0.4)
					love.graphics.rectangle("fill",200,465,220,72)
					-- bridge
					love.graphics.setColor(0.1,0.1,0.1)
					love.graphics.rectangle("fill",200,470,220,62)
				end
				if lvl == 2 then
					love.graphics.setColor(1,1,1)
					love.graphics.setFont(mediumFont)
					love.graphics.printf("Cross each Bridge just once",50,70,860,'center')
					love.graphics.setFont(smallFont)
					love.graphics.printf("1) Click on a Landmass to start",100,440,760,'left')
					love.graphics.printf("2) Click on a Bridge to cross it",100,510,760,'left')
				end
				if lvl == 3 then
					love.graphics.setColor(1,1,1)
					love.graphics.setFont(mediumFont)
					love.graphics.printf("Cross all the Bridges",50,70,860,'center')
					love.graphics.setFont(smallFont)
					love.graphics.printf("Press \"Backspace\" to retry",100,520,760,'center')
				end
				if tut_move then
					love.graphics.setColor(1,1,1,tut_timer)
					love.graphics.setFont(smallFont)
					love.graphics.printf("Press \"Enter\"",230,630,500,'center')
				end

			-- sbok stuff
			elseif opState == 5 then
				-- reminder for how to retry
				love.graphics.setColor(1,1,1,0.8)
				love.graphics.setFont(smallFont)
				love.graphics.printf("backspace - retry",600,10,350,'right')
				-- 3 star completion
				if reveal_secret then 
					lvl = 2
					love.graphics.setColor(1,1,1)
					love.graphics.setFont(mediumFont)
					if bridge_count ~= 0 then love.graphics.printf("1945",280,320,400,'center')
					else
						love.graphics.printf("Game Complete",280,250,400,'center')
						love.graphics.printf("Time(Decks): "..tostring(minutes)..":"..string.format("%02d",seconds),200,320,560,'center')
						love.graphics.printf("Lives Used: "..tostring(lives_used),280,370,400,'center')
						game_completed = true
					end
				else
					love.graphics.setColor(1,1,1)
					love.graphics.setFont(mediumFont)
					love.graphics.printf("1736",280,320,400,'center')
				end
			end

		-- credits stuff
		elseif opState == 6 then
			love.graphics.setColor(1,1,1)
			-- thank you
			love.graphics.setFont(largeFont)
			love.graphics.printf("Thanks for playing my game!",80,100,800,'center')
			-- credits
			love.graphics.setFont(smallFont)
			love.graphics.printf("Code & Music",280,320,400,'center')
			love.graphics.printf("Lee Chih Jung (me)",280,360,400,'center')
			love.graphics.printf("Game Engine",280,440,400,'center')
			love.graphics.printf("LOVE2D",280,480,400,'center')
			love.graphics.printf("Font",280,560,400,'center')
			love.graphics.printf("04",280,600,400,'center')
		end

		love.graphics.setFont(smallFont)
		love.graphics.setColor(1,1,1,0.8)
		love.graphics.printf("m - menu",750,680,200,'right')
	end
end


function love.keypressed(key,scancode,isrepeat)
	-- retry
	if key == 'backspace' and gameState == 1 and picked_landmass and bridge_count ~= 0 and lives > 0 then
		if lives > 1 then
			picked_landmass = false
			rdc = {}
			for s = 1,#options[opState]['rd'][lvl] do
				table.insert(rdc,options[opState]['rd'][lvl][s])
			end
			bridge_count = #rdc
		end
		if opState <= 3 then
			lives = lives - 1
			lives_used = lives_used + 1
		end
	end	

	-- return to menu
	if key == 'm' and gameState == 1 then
		gameState = 0
	end

	-- tutorial move
	if key == 'return' and tut_move and gameState == 1 and opState == 4 then
		if lvl < 3 then lvl = lvl + 1
		else
			gameState = 0
			option_fade_timer = 0
		end
		tut_timer = 1
		tut_move = false
		tut_retried = false
		picked_landmass = false
	end
	
	-- quit game
	if key == 'escape' then
		love.event.quit()
	end
end


function love.mousepressed(x,y,button,istouch)
	-- choosing menu options
	if gameState == 0 and button == 1 and option_fade_timer == 1 then
		for a = 1,#menu['opx'] do
			if x >= menu['opx'][a] + 5 and x <= menu['opx'][a] + menu['od'][a][1] - 5
			and y >= menu['opy'][a] + 5 and y <= menu['opy'][a] + menu['od'][a][2] - 5 then
				click_sound:play()
				opState = a
				gameState = 1
				break
			end
		end
	end

-- gameplay mechanics

	-- picking starting landmass only after map features are drawn
	if gameState == 1 and opState <= 5 and not picked_landmass and drawn and lives > 0 and button == 1 then
		for r = 1,#options[opState]['bpx'][lvl] do
			if x >= options[opState]['bpx'][lvl][r] + 5 and x <= options[opState]['bpx'][lvl][r] + options[opState]['bd'][lvl][r][1] - 5
			and y >= options[opState]['bpy'][lvl][r] + 5 and y <= options[opState]['bpy'][lvl][r] + options[opState]['bd'][lvl][r][2] - 5 then
				landmass_sound:play()
				start_position = {options[opState]['bpx'][lvl][r],options[opState]['bpy'][lvl][r]}
				start_dimen = {options[opState]['bd'][lvl][r][1],options[opState]['bd'][lvl][r][2]}
				picked_landmass = true
				break
			end
		end
	end
	-- selecting bridges and changing the highlighted landmass
	if gameState == 1 and opState <= 5 and picked_landmass and button == 1 then
		for s = 1,#options[opState]['rpx'][lvl] do
			if x > options[opState]['rpx'][lvl][s] and x < options[opState]['rpx'][lvl][s] + rdc[s][1]
			and y > options[opState]['rpy'][lvl][s] and y < options[opState]['rpy'][lvl][s] + rdc[s][2] then
				-- horizontal bridge that has a starting y-coordinate within the highlighted landmass
				if rdc[s][2] == 72 and options[opState]['rpy'][lvl][s] > start_position[2] and options[opState]['rpy'][lvl][s] < start_position[2]+start_dimen[2] then
					-- check if starting x-coordinate of bridge lies on the end of the new landmass
					if options[opState]['rpx'][lvl][s] == start_position[1] + start_dimen[1] then
						-- highlight the landmass at the end of the bridge
						for t = 1,#options[opState]['bpx'][lvl] do
							if options[opState]['rpx'][lvl][s] + rdc[s][1] == options[opState]['bpx'][lvl][t]
							and options[opState]['rpy'][lvl][s] > options[opState]['bpy'][lvl][t]
							and options[opState]['rpy'][lvl][s] < options[opState]['bpy'][lvl][t] + options[opState]['bd'][lvl][t][2] then
								landmass_sound:play()
								start_position = {options[opState]['bpx'][lvl][t],options[opState]['bpy'][lvl][t]}
								start_dimen = {options[opState]['bd'][lvl][t][1],options[opState]['bd'][lvl][t][2]}
								rdc[s] = {0,0} -- remove bridge once crossed
								bridge_count = bridge_count - 1
								break
							end
						end
					-- check if ending x-coordinate of bridge lies on the start of the new landmass
					elseif options[opState]['rpx'][lvl][s] + rdc[s][1] == start_position[1] then
						-- highlight the landmass at the start of the bridge
						for t = 1,#options[opState]['bpx'][lvl] do
							if options[opState]['rpx'][lvl][s] == options[opState]['bpx'][lvl][t] + options[opState]['bd'][lvl][t][1]
							and options[opState]['rpy'][lvl][s] > options[opState]['bpy'][lvl][t]
							and options[opState]['rpy'][lvl][s] < options[opState]['bpy'][lvl][t] + options[opState]['bd'][lvl][t][2] then
								landmass_sound:play()
								start_position = {options[opState]['bpx'][lvl][t],options[opState]['bpy'][lvl][t]}
								start_dimen = {options[opState]['bd'][lvl][t][1],options[opState]['bd'][lvl][t][2]}
								rdc[s] = {0,0}
								bridge_count = bridge_count - 1
								break
							end
						end
					end
				-- vertical bridge that has a starting x-coordinate within the highlighted landmass
				elseif rdc[s][1] == 72 and options[opState]['rpx'][lvl][s] > start_position[1] and options[opState]['rpx'][lvl][s] < start_position[1] + start_dimen[1] then
					-- check if starting y-coordinate of bridge lies on the end of the new landmass
					if options[opState]['rpy'][lvl][s] == start_position[2] + start_dimen[2] then
						-- highlight the landmass at the end of the bridge
						for t = 1,#options[opState]['bpy'][lvl] do
							if options[opState]['rpy'][lvl][s] + rdc[s][2] == options[opState]['bpy'][lvl][t]
							and options[opState]['rpx'][lvl][s] > options[opState]['bpx'][lvl][t]
							and options[opState]['rpx'][lvl][s] < options[opState]['bpx'][lvl][t] + options[opState]['bd'][lvl][t][1] then
								landmass_sound:play()
								start_position = {options[opState]['bpx'][lvl][t],options[opState]['bpy'][lvl][t]}
								start_dimen = {options[opState]['bd'][lvl][t][1],options[opState]['bd'][lvl][t][2]}
								rdc[s] = {0,0}
								bridge_count = bridge_count - 1
								break
							end
						end
					-- check if ending y-coordinate of bridge lies on the start of the new landmass
					elseif options[opState]['rpy'][lvl][s] + rdc[s][2] == start_position[2] then
						-- highlight the landmass at the start of the bridge
						for t = 1,#options[opState]['bpy'][lvl] do
							if options[opState]['rpy'][lvl][s] == options[opState]['bpy'][lvl][t] + options[opState]['bd'][lvl][t][2]
							and options[opState]['rpx'][lvl][s] > options[opState]['bpx'][lvl][t]
							and options[opState]['rpx'][lvl][s] < options[opState]['bpx'][lvl][t] + options[opState]['bd'][lvl][t][1] then
								landmass_sound:play()
								start_position = {options[opState]['bpx'][lvl][t],options[opState]['bpy'][lvl][t]}
								start_dimen = {options[opState]['bd'][lvl][t][1],options[opState]['bd'][lvl][t][2]}
								rdc[s] = {0,0}
								bridge_count = bridge_count - 1
								break
							end
						end
					end
				end
			end
		end
	end							
end
