timeToDie = 60000 --| 60 seconds until the player will die after taking cyanide           

--------------------------------------------
-- DO NOT TOUCH BELOW--
Citizen.CreateThread(function()
RequestAnimDict('mp_suicide')
while not HasAnimDictLoaded('mp_suicide') do
    Wait(150)
end
RequestAnimDict('move_m@drunk@verydrunk')
while not HasAnimDictLoaded('move_m@drunk@verydrunk') do
    Wait(150)
end
RequestAnimDict('drunk_fall_over')
while not HasAnimDictLoaded('drunk_fall_over') do
    Wait(150)
end
end)

ped = GetPlayerPed(-1)

-----------------------------------------------------------------
--															   --
--             NON ESX CODE                                    --
--															   --
-----------------------------------------------------------------
RegisterCommand('cyanide', function(source, args)
cyanide()    
end, false)


function cyanide()
ped = GetPlayerPed(-1)
print("has Taking cyanide")

ClearPedTasksImmediately(ped)

TaskPlayAnim(ped, "mp_suicide", "pill", 8.0, 1.0, -1, 2, 0, false,false,true)
Citizen.Wait(5000)
ClearPedTasksImmediately(ped)

RequestAnimSet("move_m@drunk@slightlydrunk")
      while not HasAnimSetLoaded("move_m@drunk@slightlydrunk") do
        Citizen.Wait(0)
      end

      SetPedMovementClipset(ped, "move_m@drunk@slightlydrunk", true)
	  print("walk drunk")
Citizen.Wait(timeToDie /2 -5000) -- Start effects of the poison

 RequestAnimSet("move_m@drunk@verydrunk")
      while not HasAnimSetLoaded("move_m@drunk@verydrunk") do
        Citizen.Wait(0)
      end

      SetPedMovementClipset(ped, "move_m@drunk@verydrunk", true)
	  print("walk drunk")
      SetTimecycleModifier("spectator5")


Citizen.Wait(timeToDie) 
SetEntityHealth(ped, 0)

if GetEntityHealth(ped, 0) then
ResetPedMovementClipset(ped)
        ClearTimecycleModifier()
		end
	end