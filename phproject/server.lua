function isPlayerInTeam(player, team)
    assert(isElement(player) and getElementType(player) == "player", "Bad argument 1 @ isPlayerInTeam [player expected, got " .. tostring(player) .. "]")
    assert((not team) or type(team) == "string" or (isElement(team) and getElementType(team) == "team"), "Bad argument 2 @ isPlayerInTeam [nil/string/team expected, got " .. tostring(team) .. "]")
    return getPlayerTeam(player) == (type(team) == "string" and getTeamFromName(team) or (type(team) == "userdata" and team or (getPlayerTeam(player) or true)))
end

local teams = { 
createTeam ( "Team Blue", 0, 0, 255 ), 
createTeam ( "Team Red", 255, 0, 0 ) 
} 

local objects = { 
	{1215},
	--{-1371.96558, -193.38557, 14.14619},
} 


local teams = { 
	[1] = createTeam ( "Hiders", 0, 0, 255 ), 
	[2] = createTeam ( "Finders", 255, 0, 0 ) 
} 

local positions = {
	{-1365.89111, -189.19150, 14.14844},
	{-1371.96558, -193.38557, 14.14619},
	--{-1373.19714, -203.59787, 14.14844},
	--{-1365.96912, -212.79893, 14.14844},
	--{-1361.35229, -218.62790, 14.14844},
	--{-1359.94897, -207.50658, 14.14844},
	--{-1365.31140, -207.51169, 14.14844},
	--{-1363.82971, -200.98711, 14.14844},
}
--
started = 0
stopped = 1
--

function systemLoading (player)
	--
	if stopped == 1 then
		
		setElementAlpha (player, 255)
		outputChatBox("Loading Prop Hunt Game", localPlayer)
		outputDebugString("[INFO] Loading Prop Hunt Game")
		teamHiders = createTeam("Hiders", 255, 255, 0)
		teamFinders = createTeam("Finders", 255, 255, 0)
	--
		
		local rnd = math.random( 1, #positions )
		local objrnd = math.random (1, #objects)
		obj = createObject ( objects[objrnd][1] , positions[rnd][1], positions[rnd][2], positions[rnd][3] ) 
		local x1, y1, z1 = getElementPosition( obj )
		--local teams = { 
		--[1] = createTeam ( "Team Blue", 0, 0, 255 ), 
		--[2] = createTeam ( "Team Red", 255, 0, 0 ) 
		--}
       -- for k,v in ipairs(getElementsByType('player')) do 
		--	setPlayerTeam(v, teams[math.random(1,#teams])) 
       -- end 
		objCol = createColCircle( x1, y1, 5 )
		--obj2 = createObject ( 1319 , -1370.46692, -191.28694, 14.14619) 
		--local x2, y2, z2 = getElementPosition( obj )
		--objCol2 = createColCircle( x2, y2, 5 )
		--objCol3 = createColCircle( x1, y1, 5 )
		--obj3 = createObject ( objects[objrnd][1] , positions[rnd][1], positions[rnd][2], positions[rnd][3] ) 
		--local x3, y3, z3 = getElementPosition( obj )
		--objCol4 = createColCircle( x1, y1, 5 )
		--obj4 = createObject ( objects[objrnd][1] , positions[rnd][1], positions[rnd][2], positions[rnd][3] ) 
		--local x4, y4, z4 = getElementPosition( obj )
		--objCol5 = createColCircle( x1, y1, 5 )
		--obj5 = createObject ( objects[objrnd][1] , positions[rnd][1], positions[rnd][2], positions[rnd][3] ) 
		--local x5, y5, z5 = getElementPosition( obj )
		--objCol6 = createColCircle( x1, y1, 5 )
		--obj6 = createObject ( objects[objrnd][1] , positions[rnd][1], positions[rnd][2], positions[rnd][3] ) 
		--local x6, y6, z6 = getElementPosition( obj )
		stopped = 0
		started = 1
	else
		outputChatBox("Theres a game being played, please wait for play", localPlayer)
	end
end
addCommandHandler("startgm", systemLoading)

function systemStoping (player)
	if started == 1 then
	--
		outputChatBox("Stopping Prop Hunt Game", localPlayer)
		outputDebugString("[INFO] Stoping Prop Hunt Game")
	--
		destroyElement( obj )
		destroyElement( obj2 )
		setElementAlpha (player, 255)
		destroyElement( objCol )
		stopped = 1
		started = 0
	else
		outputChatBox("Theres no game to stop!", localPlayer)
	end
end
addCommandHandler("stopgm", systemStoping)

function onpWasted(player)
	destroyElement( obj2 )
end
addEventHandler("onPlayerWasted", root, onpWasted)

function Spawn()
    setElementAlpha (source, 255)
end
addEventHandler("onPlayerSpawn", root, Spawn) 

function changeMorph( button, state, player ) -- Add the function
    if button == "left" and state == "down" then
		local x, y, z = getElementPosition( player )
		--if isPlayerInTeam(player, "Hiders") then
		if isElementWithinColShape ( player, objCol ) then
			obj2 = createObject ( 1215 , 0, 0, 0 ) 
			setTimer(function()
				setElementAlpha (player, 100)
				setTimer(function()
					setElementAlpha (player, 30)	
					attachElements (obj2,player, 0, 0, 0-0.4 )
					setElementAlpha(obj2, 100)
					setTimer(function()
						setElementAlpha (player, 0)
						setElementAlpha(obj2, 255)
					end, 3000, 1)
				end, 3000, 1)
			end, 50, 1)
		end
		--end
    end
end
addEventHandler( "onElementClicked", root, changeMorph )

addCommandHandler("gmtypes",
function()
	outputChatBox("----------!Types of Gamemodes!---------", 255, 255, 255, false)
	outputChatBox("1.- Smaller Objects-Road Objects", 255, 255, 255, false)
end)