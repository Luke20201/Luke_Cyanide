timeToDie = 60000 --| 60 seconds until the player will die after taking cyanide
--------------------------------------------
-- DO NOT TOUCH BELOW--
--------------------------------------------
ped = PlayerPedID()
Citizen.CreateThread(function()		
	RequestAnimDict('mp_suicide')
	while not HasAnimDictLoaded('mp_suicide') do
    		Wait(150)
	end
		
	RequestAnimDict('move_m@drunk@verydrunk')
	while not HasAnimDictLoaded('move_m@drunk@verydrunk') do
    		Wait(150)
	end
		
	RequestAnimSet("move_m@drunk@slightlydrunk")
	while not HasAnimSetLoaded("move_m@drunk@slightlydrunk") do
		Wait(150)
	end
end)

RegisterCommand('cyanide', function(source, args)
	ClearPedTasksImmediately(ped)
	TaskPlayAnim(ped, "mp_suicide", "pill", 8.0, 1.0, -1, 2, 0, false,false,true)
	Citizen.Wait(5000)
	ClearPedTasksImmediately(ped)

      	SetPedMovementClipset(ped, "move_m@drunk@slightlydrunk", true)
	Citizen.Wait(timeToDie /2 -5000) -- Start effects of the poison

      	SetPedMovementClipset(ped, "move_m@drunk@verydrunk", true)
      	SetTimecycleModifier("spectator5") -- Drunk visual effects


	Citizen.Wait(timeToDie) 
	SetEntityHealth(ped, 0)

	if GetEntityHealth(ped, 0) then
		ResetPedMovementClipset(ped)
        	ClearTimecycleModifier()
		end
end, false)
