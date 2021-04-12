function love.load()
	love.graphics.setDefaultFilter("nearest","nearest")

	-- landmasses
	brown_pos_x = {
	{1/32,21/32,1/32,21/32},
	{},
	{19/160,93/160,93/160},
	{7/80,31/80,57/80},
	{19/160,107/160,19/160,107/160},
	{19/160,107/160,19/160,107/160},
	{19/160,107/160,19/160,107/160},
	{3/40,7/16,3/8,4/5,3/8},
	{3/16,9/16,1/4,3/8},
	{3/16,9/16,1/4,5/16,7/16},
	{3/80,31/80,59/80,3/80,31/80,59/80},
	{3/80,31/80,59/80,3/80,31/80,59/80},
	{7/80,7/80,7/16,11/16,11/16},
	{1/40,1/20,17/40,3/4},
	{3/80,21/80,39/80,67/80,39/80,21/80},
	{3/80,11/40,11/40,11/40,41/80,13/16,13/16,13/16},
	{11/40,11/20,11/40,1/2,11/40,1/2,1/40,17/20},
	{1/40,23/40,1/160,19/80,7/8,1/40,23/40},
	{0.3,1/80,23/80,9/16,67/80},
	{1/160,31/160,113/160,1/160,15/32,143/160,79/160},
	{11/40,3/80,5/16,67/80,7/20},
	{3/32,19/32,1/40,1/40},
	{3/32,19/32,1/40,1/40}
	}

	brown_pos_y = {
	{3/40,3/40,17/24,17/24},
	{},
	{19/120,1/8,71/120},
	{43/120,13/40,13/40},
	{3/40,3/40,77/120,77/120},
	{3/40,3/40,77/120,77/120},
	{3/40,3/40,77/120,77/120},
	{5/12,1/30,1/3,1/3,4/5},
	{1/30,1/30,5/12,4/5},
	{1/30,1/30,1/3,37/60,4/5},
	{1/15,1/15,1/15,0.6,0.6,0.6},
	{1/15,1/15,1/15,0.6,0.6,0.6},
	{1/12,7/12,1/4,1/12,7/12},
	{3/4,1/6,1/12,1/12},
	{1/3,1/2,1/3,5/12,1/30,4/5},
	{5/12,1/20,5/12,47/60,1/3,1/20,1/3,47/60},
	{1/30,1/30,7/20,7/20,4/5,4/5,7/20,7/20},
	{1/60,1/60,5/12,5/12,5/12,49/60,49/60},
	{1/15,13/20,13/20,13/20,13/20},
	{1/30,1/30,1/30,5/12,11/30,5/12,4/5},
	{1/30,7/30,1/4,7/30,13/15},
	{1/3,1/3,0,4/5},
	{1/3,1/3,0,4/5}
	}

	brown_dimen = {
	{{5/16,13/60},{5/16,13/60},{5/16,13/60},{5/16,13/60}},
	{},
	{{9/40,41/60},{3/10,17/60},{3/10,17/60}},
	{{7/40,17/60},{1/5,7/20},{1/5,7/20}},
	{{17/80,17/60},{17/80,17/60},{17/80,17/60},{17/80,17/60}},
	{{17/80,17/60},{17/80,17/60},{17/80,17/60},{17/80,17/60}},
	{{17/80,17/60},{17/80,17/60},{17/80,17/60},{17/80,17/60}},
	{{1/8,1/6},{1/8,1/6},{1/4,1/3},{1/8,1/3},{1/4,1/6}},
	{{1/4,1/6},{1/4,1/6},{1/2,1/6},{1/4,1/6}},
	{{1/4,1/6},{1/4,1/6},{1/2,1/6},{1/4,1/6},{1/4,1/6}},
	{{9/40,1/3},{9/40,1/3},{9/40,1/3},{9/40,1/3},{9/40,1/3},{9/40,1/3}},
	{{9/40,1/3},{9/40,1/3},{9/40,1/3},{9/40,1/3},{9/40,1/3},{9/40,1/3}},
	{{9/40,1/3},{9/40,1/3},{1/8,0.5},{9/40,1/3},{9/40,1/3}},
	{{0.95,1/5},{0.3,1/3},{7/40,0.5},{7/40,0.5}},
	{{1/8,1/3},{1/8,1/6},{1/4,1/3},{1/8,1/6},{1/4,1/6},{51/80,1/6}},
	{{3/20,1/6},{3/20,1/6},{3/20,1/6},{3/20,1/6},{3/20,1/3},{3/20,1/6},{3/20,1/3},{3/20,1/6}},
	{{1/8,1/6},{1/8,1/6},{1/8,0.3},{9/40,0.3},{1/8,1/6},{9/40,1/6},{1/8,0.3},{1/8,0.3}},
	{{0.4,1/6},{0.4,1/6},{19/160,1/6},{21/40,1/6},{19/160,1/6},{0.4,1/6},{0.4,1/6}},
	{{2/5,1/4},{3/20,0.3},{3/20,0.3},{3/20,0.3},{3/20,0.3}},
	{{0.1,1/6},{3/8,1/6},{23/80,1/6},{3/8,1/6},{27/80,4/15},{0.1,1/6},{9/40,1/6}},
	{{9/20,0.1},{1/8,8/15},{3/8,0.5},{1/8,8/15},{0.3,0.1}},
	{{5/16,1/3},{5/16,1/3},{0.95,1/5},{0.95,1/5}},
	{{5/16,1/3},{5/16,1/3},{0.95,1/5},{0.95,1/5}}
	}
	
	-- bridges
	rail_pos_x = {
	{11/160,137/160,27/80,27/80},
	{},
	{27/80,27/80,111/160},
	{41/160,93/160,93/160},
	{3/16,59/80,13/40,13/40},
	{11/80,19/80,59/80,13/40,13/40},
	{11/80,19/80,59/80,13/40,13/40,13/40},
	{31/160,37/80,99/160,99/160,2/5,21/40},
	{11/40,13/20,69/160,2/5,21/40},
	{11/40,13/20,69/160,27/80,47/80},
	{41/160,97/160,9/80,0.4,21/40,41/160,97/160},
	{41/160,97/160,97/160,0.05,7/40,0.4,21/40,41/160,41/160,97/160,97/160},
	{9/80,17/80,61/80,49/160,49/160,49/160,49/160,89/160},
	{0.1,9/40,19/32,19/32,19/40,4/5},
	{5/32,5/32,61/160,23/80,23/40,41/80,51/80,117/160},
	{29/160,5/16,5/16,67/160,67/160,67/160,21/32,21/32,17/20,17/20},
	{63/160,0.3,23/40,0.3,41/80,51/80,63/160,23/160,23/160,23/32,23/32},
	{67/160,3/80,1/4,27/80,47/80,27/40,19/160,121/160,3/80,1/4,27/80,47/80,27/40,71/80,67/160},
	{7/20,23/40,5/32,5/32,69/160,69/160,113/160,113/160},
	{0.1,3/160,33/160,47/160,77/160,23/32,29/32,3/8,0.8,81/160,101/160},
	{7/20,37/80,23/40,5/32,5/32,5/32,5/32,109/160,109/160,109/160,2/5,21/40},
	{23/160,23/160,9/32,9/32,57/80,57/80,2/5},
	{23/160,23/160,57/80,57/80,2/5}
	}
	
	rail_pos_y = {
	{17/60,17/60,1/8,31/40},
	{},
	{23/120,17/24,2/5},
	{9/20,11/30,8/15},
	{7/20,7/20,1/6,11/15},
	{7/20,7/20,7/20,1/6,11/15},
	{7/20,7/20,7/20,1/6,2/3,0.8},
	{27/60,23/120,11/30,16/30,79/120,79/120},
	{23/120,23/120,2/30,23/40,23/40},
	{23/120,23/120,2/30,59/120,59/120},
	{11/60,11/60,47/120,47/120,47/120,43/60,43/60},
	{11/60,0.1,4/15,47/120,47/120,47/120,47/120,19/30,0.8,19/30,0.8},
	{49/120,49/120,49/120,7/60,47/60,17/60,37/60,17/60},
	{59/120,59/120,11/60,23/60,23/40,23/40},
	{11/30,8/15,8/15,79/120,79/120,23/120,23/120,9/20},
	{9/20,5/24,23/40,1/12,9/20,49/60,11/30,8/15,5/24,79/120},
	{1/15,23/120,23/120,77/120,77/120,77/120,5/6,11/30,8/15,11/30,8/15},
	{1/20,7/40,7/40,7/40,7/40,7/40,9/20,9/20,23/40,23/40,23/40,23/40,23/40,23/40,51/60},
	{37/120,37/120,2/3,5/6,2/3,5/6,2/3,5/6},
	{1/15,23/120,23/120,23/120,23/120,23/120,23/120,9/20,9/20,5/8,5/8},
	{1/8,1/8,1/8,11/40,47/120,61/120,5/8,0.3,9/20,0.6,89/120,89/120},
	{23/120,79/120,23/120,79/120,23/120,79/120,9/20},
	{23/120,79/120,23/120,79/120,9/20}
	}
	
	rail_dimen = {
	{{3/40,13/30},{3/40,13/30},{13/40,0.1},{13/40,0.1}},
	{},
	{{1/4,0.1},{1/4,0.1},{3/40,1/5}},
	{{11/80,0.1},{11/80,0.1},{11/80,0.1}},
	{{3/40,0.3},{3/40,0.3},{7/20,0.1},{7/20,0.1}},
	{{3/40,0.3},{3/40,0.3},{3/40,0.3},{7/20,0.1},{7/20,0.1}},
	{{3/40,0.3},{3/40,0.3},{3/40,0.3},{7/20,0.1},{7/20,0.1},{7/20,0.1}},
	{{19/80,0.1},{3/40,3/20},{19/80,0.1},{19/80,0.1},{3/40,3/20},{3/40,3/20}},
	{{3/40,7/30},{3/40,7/30},{11/80,0.1},{3/40,7/30},{3/40,7/30}},
	{{3/40,3/20},{3/40,3/20},{11/80,0.1},{3/40,2/15},{3/40,19/60}},
	{{11/80,0.1},{11/80,0.1},{3/40,13/60},{3/40,13/60},{3/40,13/60},{11/80,0.1},{11/80,0.1}},
	{{11/80,0.1},{11/80,0.1},{11/80,0.1},{3/40,13/60},{3/40,13/60},{3/40,13/60},{3/40,13/60},{11/80,0.1},{11/80,0.1},{11/80,0.1},{11/80,0.1}},
	{{3/40,11/60},{3/40,11/60},{3/40,11/60},{31/80,0.1},{31/80,0.1},{11/80,0.1},{11/80,0.1},{11/80,0.1}},
	{{3/40,4/15},{3/40,4/15},{13/80,0.1},{13/80,0.1},{3/40,11/60},{3/40,11/60}},
	{{27/80,0.1},{9/80,0.1},{9/80,0.1},{3/40,3/20},{3/40,3/20},{3/40,3/20},{3/40,3/20},{9/80,0.1}},
	{{0.1,0.1},{3/40,13/60},{3/40,13/60},{2/5,0.1},{0.1,0.1},{2/5,0.1},{13/80,0.1},{13/80,0.1},{3/40,2/15},{3/40,2/15}},
	{{13/80,0.1},{3/40,1/6},{3/40,1/6},{3/40,1/6},{3/40,1/6},{3/40,1/6},{9/80,0.1},{11/80,0.1},{11/80,0.1},{11/80,0.1},{11/80,0.1}},
	{{13/80,0.1},{3/40,1/4},{3/40,1/4},{3/40,1/4},{3/40,1/4},{3/40,1/4},{1/8,0.1},{1/8,0.1},{3/40,1/4},{3/40,1/4},{3/40,1/4},{3/40,1/4},{3/40,1/4},{3/40,1/4},{13/80,0.1}},
	{{3/40,29/60},{3/40,29/60},{11/80,0.1},{11/80,0.1},{11/80,0.1},{11/80,0.1},{11/80,0.1},{11/80,0.1}},
	{{0.1,0.1},{3/40,7/30},{3/40,7/30},{3/40,7/30},{3/40,11/60},{3/40,11/60},{3/40,7/30},{0.1,0.1},{0.1,0.1},{3/40,11/60},{3/40,11/60}},
	{{3/40,2/15},{3/40,2/15},{3/40,2/15},{13/80,0.1},{13/80,0.1},{13/80,0.1},{13/80,0.1},{13/80,0.1},{13/80,0.1},{13/80,0.1},{3/40,2/15},{3/40,2/15}},
	{{3/40,3/20},{3/40,3/20},{3/40,3/20},{3/40,3/20},{3/40,3/20},{3/40,3/20},{1/5,0.1}},
	{{3/40,3/20},{3/40,3/20},{3/40,3/20},{3/40,3/20},{1/5,0.1}}
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

	-- sounds
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
    }
end

function love.update(dt)
	-- play theme music before levels begin
	if level < 3 then
		sounds['theme']:play()
	end

	--play completion music when player beats the game
	if level == 23 and passed then
		sounds['completion']:play()
	end

	-- timer to prevent players from accidentally skipping starting page and instruction page
	if level < 3 and enforced_start_timer > 0 then
		enforced_start_timer = enforced_start_timer - dt
	end
	
	-- make the "Press Enter" prompt flash
	if enforced_start_timer <= 0 and level < 3 then
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
		start_pos = next_pos
		start_glow_dimen = next_glow_dimen
	end

	-- timer for displaying level number
	if level < 22 and level > 2 and level_timer	~= 0 then
		level_timer = level_timer - 0.5 * dt
		if level_timer < 0 then level_timer = 0 end
	end
	-- timer for displaying final level name
	if level == 22 and finallevel_timer ~= 0 then
		finallevel_timer = finallevel_timer - 0.2 * dt
		if finallevel_timer < 0 then finallevel_timer = 0 end
	end

	-- determining whether the player passed the level
	if bridge_counter == 0 then
		sounds['success']:play()
		passed = true
	end

	-- that final level
	if break1 and break2 then
		sounds['triumphant']:play()
		unlocked = true
	end
end


function love.draw()
	-- initialise height and width
	height = love.graphics.getHeight()
	width = love.graphics.getWidth()
	-- constant background colour (deep sea blue)
	love.graphics.setBackgroundColor(0.1,0.15,0.32)
	-- initalise relative font sizes
	tinyFont = love.graphics.newFont(1)
	smallFont = love.graphics.newFont("font.ttf",width*7/200)
	mediumFont = love.graphics.newFont("font.ttf",width*0.06)
	largeFont = love.graphics.newFont("font.ttf",width*3/40)

	-- title screen
	if level == 1 then
		-- title
		love.graphics.setColor(1,1,1)
		love.graphics.setFont(largeFont)
		love.graphics.printf("Konigs' Bridge",width*3/16,height*5/12,width*5/8,'center')
		-- prompt
		love.graphics.setFont(smallFont)
		love.graphics.setColor(1,1,1,1 - start_timer)
		love.graphics.printf("Press Enter",width*3/8,height*3/5,width*1/4,'center')

	-- instructions page
	elseif level == 2 then
		-- title
		love.graphics.setColor(1,1,1)
		love.graphics.setFont(largeFont)
		love.graphics.printf("How to Play?",width*1/8,height*1/12,width*3/4,'center')
		
		-- instructions
		love.graphics.setFont(smallFont)
	
		love.graphics.printf("- Tap on a landmass to pick your starting position at the start of each level",width*3/32,height*1/4,width*7/8,'left')

		love.graphics.printf("- Tap on a bridge to cross it",width*3/32,height*5/12,width*7/8,'left')

		love.graphics.printf("- You can't cross a bridge that has already been crossed",width*3/32,height*13/24,width*7/8,'left')

		love.graphics.printf("- Win by crossing all bridges",width*3/32,height*17/24,width*7/8,'left')
	
		-- prompt
		love.graphics.setFont(smallFont)
		love.graphics.setColor(1,1,1,1 - start_timer)
		love.graphics.printf("Press Enter",width*3/8,height*53/60,width*1/4,'center')
	end

-- create map features based on tables (rail_pos_x,rail_pos_y,rail_dimen,brown_pos_x,brown_pos_y,brown_dimen) in each level
	if level < 24 then
		-- bridges
		for a = 1,#rail_pos_x[level] do
			-- horizontal bridges
			if rail_dimen[level][a][2] == 0.1 then
				--railings
				love.graphics.setColor(0.4,0.4,0.4)
				love.graphics.rectangle("fill",rail_pos_x[level][a]*width,rail_pos_y[level][a]*height,rail_dimen[level][a][1]*width,rail_dimen[level][a][2]*height)
				-- roads
				love.graphics.setColor(0.1,0.1,0.1)
				love.graphics.rectangle("fill",rail_pos_x[level][a]*width,rail_pos_y[level][a]*height + 5,rail_dimen[level][a][1]*width,rail_dimen[level][a][2]*height - 10)

			-- vertical bridges
			elseif rail_dimen[level][a][1] == 3/40 then
				-- railings
				love.graphics.setColor(0.4,0.4,0.4)
				love.graphics.rectangle("fill",rail_pos_x[level][a]*width,rail_pos_y[level][a]*height,rail_dimen[level][a][1]*width,rail_dimen[level][a][2]*height)
				-- roads
				love.graphics.setColor(0.1,0.1,0.1)
				love.graphics.rectangle("fill",rail_pos_x[level][a]*width + 5,rail_pos_y[level][a]*height,rail_dimen[level][a][1]*width - 10,rail_dimen[level][a][2]*height)
			end
		end

		-- landmasses
		for b = 1,#brown_pos_x[level] do
			-- brown landmasses
			love.graphics.setColor(0.18,0.16,0.12)
			love.graphics.rectangle("fill",brown_pos_x[level][b]*width,brown_pos_y[level][b]*height,brown_dimen[level][b][1]*width,brown_dimen[level][b][2]*height)
			-- green landmasses
			love.graphics.setColor(0.2,0.4,0.1)
			love.graphics.rectangle("fill",brown_pos_x[level][b]*width + 5,brown_pos_y[level][b]*height + 5,brown_dimen[level][b][1]*width - 10,brown_dimen[level][b][2]*height - 10)
		end
	end

	-- highlight starting landmass
	if picked_landmass and ((level >= 3 and level < 22) or level == 23) then
		love.graphics.setColor(0.4,0.25,0.3)
		love.graphics.rectangle("fill",next_pos[1]*width + 5,next_pos[2]*height + 5,next_glow_dimen[1]*width - 10,next_glow_dimen[2]*height - 10)
	end

	-- level indicator
	if level >= 3 and level < 22 and level_timer > 0 then
		love.graphics.setFont(mediumFont)
		love.graphics.setColor(1,1,1,level_timer)
		love.graphics.printf("Level "..tostring(level-2),width*3/16,height*5/12,width*5/8,'center')
	elseif level == 22 and finallevel_timer > 0 then
		love.graphics.setFont(mediumFont)
		love.graphics.setColor(1,1,1,finallevel_timer)
		love.graphics.printf("Seven Bridges of Konigsberg",width*3/16,height*5/12,width*5/8,'center')
	end

	-- print completion percentage
	if level >= 3 and level < 22 and passed then
		love.graphics.setFont(mediumFont)
		love.graphics.setColor(1,1,1)
		love.graphics.printf(tostring(5*(level-2)).."% Completed",width*3/16,height*5/12,width*5/8,'center')
	elseif level == 23 and passed then
		love.graphics.setFont(mediumFont)
		love.graphics.setColor(1,1,1)
		love.graphics.printf("100% Completed",width*3/16,height*5/12,width*5/8,'center')
	end

	-- check memory usage
	love.graphics.setFont(tinyFont)
	love.graphics.setColor(1,1,1)
	love.graphics.print(collectgarbage('count'),10,10)
	
end

-- logic for incrementing level number
function love.keypressed(key,scancode,isrepeat)
	if key == "return" then 
		-- Player must pass current level to move onto the next
		if level >= 3 and passed then
			if level < 21 then
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
				sounds['new_level']:play()

			-- In preparation for Seven Bridges of Konigsberg
			if level == 21 then
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
				sounds['SBOK']:play()

		-- Unlock final level
			elseif level == 22 and unlocked then
				level = level + 1
				picked_landmass = false
				start_pos = {}
				start_glow_dimen = {}
				next_pos = {}
				next_glow_dimen = {}
				bridgecounter = 5
				passed = false
			end
		-- Allows player to just press Enter to move to next page
		elseif level < 3 and enforced_start_timer <= 0 then
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
	-- testing purposes
	if key == 'w' then
		passed = true
	end
end

-- mouse clicking
function love.mousepressed(x,y,button,istouch)
	
	-- mouse clicking on map features inside playable levels
	if button == 1 and ((level >= 3 and level < 22) or level == 23) and picked_landmass == false then
		-- pick starting landmass if player has not picked in new level
		for r = 1,#brown_pos_x[level] do
			if x >= brown_pos_x[level][r]*width + 5 and x <= brown_pos_x[level][r]*width + brown_dimen[level][r][1]*width - 5 
			and y >= brown_pos_y[level][r]*height + 5 and y <= brown_pos_y[level][r]*height + brown_dimen[level][r][2]*height - 5
			then
				next_pos = {brown_pos_x[level][r],brown_pos_y[level][r]}
				next_glow_dimen = brown_dimen[level][r]
				picked_landmass = true
				sounds['picked_starting_landmass']:play()
				break
			end
		end
	end

	-- tap on bridges only after starting landmass is picked
	if button == 1 and ((level >= 3 and level < 22) or level == 23) and picked_landmass then
		-- match bridge with area player taps on
		for d = 1,#rail_pos_x[level] do
			if x > rail_pos_x[level][d]*width + 5 and x < rail_pos_x[level][d]*width + rail_dimen[level][d][1]*width - 5
			and y > rail_pos_y[level][d]*height + 5 and y < rail_pos_y[level][d]*height + rail_dimen[level][d][2]*height - 5
			then

				-- if bridge is horizontal
				if rail_dimen[level][d][2] == 0.1 then
					-- check if starting x coordinate of bridge lies within highlighted landmass
					if rail_pos_x[level][d] == start_pos[1] + start_glow_dimen[1] then
						-- if it lies within highlighted landmass, highlight the landmass at the end of the bridge
						for e = 1,#brown_pos_x[level] do
							if rail_pos_x[level][d] + rail_dimen[level][d][1] == brown_pos_x[level][e]
							and rail_pos_y[level][d] > brown_pos_y[level][e] 
							and rail_pos_y[level][d] + rail_dimen[level][d][2] < brown_pos_y[level][e] + brown_dimen[level][e][2]
							then
								next_pos = {brown_pos_x[level][e],brown_pos_y[level][e]}
								next_glow_dimen = brown_dimen[level][e]
								rail_dimen[level][d] = {0,0}
								bridge_counter = bridge_counter - 1
								sounds['footsteps']:play()
								break
							end
						end
					-- if it doesn't lie within the highlighted landmass, highlight the landmass at the start of the bridge
					elseif rail_pos_x[level][d] + rail_dimen[level][d][1] == start_pos[1] then
						for f = 1,#brown_pos_x[level] do
							if rail_pos_x[level][d] == brown_pos_x[level][f] + brown_dimen[level][f][1]
							and rail_pos_y[level][d] > brown_pos_y[level][f]
							and rail_pos_y[level][d] + rail_dimen[level][d][2] < brown_pos_y[level][f] + brown_dimen[level][f][2]
							then
								next_pos = {brown_pos_x[level][f],brown_pos_y[level][f]}
								next_glow_dimen = brown_dimen[level][f]
								rail_dimen[level][d] = {0,0}
								bridge_counter = bridge_counter - 1
								sounds['footsteps']:play()
								break
							end
						end
					end

				-- if bridge is vertical
				elseif rail_dimen[level][d][1] == 3/40 then
					-- check if starting y coordinate of bridge lies within highlighted landmass
					if rail_pos_y[level][d] == start_pos[2] + start_glow_dimen[2] then
						-- if it lies within highlighted landmass, highlight the landmass at the end of the bridge
						for e = 1,#brown_pos_y[level] do
							if rail_pos_y[level][d] + rail_dimen[level][d][2] == brown_pos_y[level][e]
							and rail_pos_x[level][d] > brown_pos_x[level][e]
							and rail_pos_x[level][d] + rail_dimen[level][d][1] < brown_pos_x[level][e] + brown_dimen[level][e][1]
							then
								next_pos = {brown_pos_x[level][e],brown_pos_y[level][e]}
								next_glow_dimen = brown_dimen[level][e]
								rail_dimen[level][d] = {0,0}
								bridge_counter = bridge_counter - 1
								sounds['footsteps']:play()
								break
							end
						end
					-- if it doesn't lie within the highlighted landmass, highlight the landmass at the start of the bridge
					elseif rail_pos_y[level][d] + rail_dimen[level][d][2] == start_pos[2] then
						for f = 1,#brown_pos_y[level] do
							if rail_pos_y[level][d] == brown_pos_y[level][f] + brown_dimen[level][f][2]
							and rail_pos_x[level][d] > brown_pos_x[level][f]
							and rail_pos_x[level][d] + rail_dimen[level][d][1] < brown_pos_x[level][f] + brown_dimen[level][f][1]
							then
								next_pos = {brown_pos_x[level][f],brown_pos_y[level][f]}
								next_glow_dimen = brown_dimen[level][f]
								rail_dimen[level][d] = {0,0}
								bridge_counter = bridge_counter - 1
								sounds['footsteps']:play()
								break
							end
						end
					end
				end
			end
		end
	end

	-- breaking the bridges
	if level == 22 and button == 1 then
		if x >= rail_pos_x[level][3]*width + 5 and x <= rail_pos_x[level][3]*width + rail_dimen[level][3][1]*width - 5
		and y >= rail_pos_y[level][3]*height + 5 and y <= rail_pos_y[level][3]*height + rail_dimen[level][3][2]*height - 5
		then
			break1 = true
			sounds['crack']:play()
		end
		if x >= rail_pos_x[level][4]*width + 5 and x <= rail_pos_x[level][4]*width + rail_dimen[level][4][1]*width - 5
		and y >= rail_pos_y[level][4]*height + 5 and y <= rail_pos_y[level][4]*height + rail_dimen[level][4][2]*height - 5
		then
			break2 = true
			sounds['crack']:play()
		end
	end
end
