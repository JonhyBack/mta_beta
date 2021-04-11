------------------------------------------
-- 	 Painel Weapon Select style GTAV  	--
------------------------------------------
-- Desenvolvedor: Flavio - (#Flavio)	--
-- Arquivo: client.lua		        	--
-- Copyright 2016 (C) Flavio    		--
-- All rights reserved.					--
------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----- AJUSTAR PAINEL EM TODAS RESOLUÇÔES
local screenW,screenH = guiGetScreenSize()
local resW, resH = 1280, 1024
local x, y =  (screenW/resW), (screenH/resH)
----- FUNÇÔES
local root = getRootElement()
local painel2 = false
----- PAINEL DX
function dx()
    ------------------------------------------------------------------------------------------------------------------------
	local weapon = getPedWeapon ( getLocalPlayer() )
	local ammo = getPedAmmoInClip (localPlayer,getPedWeaponSlot(localPlayer))
    local ammo1 = getPedTotalAmmo (localPlayer,getPedWeaponSlot(localPlayer))
    local armaID = getPedWeapon(localPlayer)
	local nomearma = getWeaponNameFromID(armaID)
	------------------------------------------------------------------------------------------------------------------------
	-- MAO
	if ( weapon == 0 ) then	
	dxDrawImage(x*433, y*405, x*438, y*176, "gfx/wheel_selected.png", 90, 0, 0, tocolor(255, 255, 255, 255), false)
	dxDrawImage(x*433, y*405,x* 438, y*176, "gfx/wheel_current.png", 90, 0, 0, tocolor(255, 255, 255, 255), false)
	dxDrawBorderedText3(nomearma, x*625, y*395, x*687, y*413, tocolor(255, 255, 255, 255), x*1.00, "default-bold", "center", "center", false, false, false, false, false)
    dxDrawImage(x*545, y*603, x*206, y*107, "gfx/unarmed.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
    else
	dxDrawImage(x*433, y*405, x*438, y*176, "gfx/wheel_part.png", 90, 0, 0, tocolor(255, 255, 255, 255), false)
	dxDrawImage(x*545, y*603, x*206, y*107, "gfx/unarmed.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
	end
	------------------------------------------------------------------------------------------------------------------------
	-- DESERT
	if ( weapon == 24 ) then	
	dxDrawImage(x*433, y*405, x*438, y*176, "gfx/wheel_selected.png", 270, 0, 0, tocolor(255, 255, 255, 255), false)
	dxDrawImage(x*433, y*405, x*438, y*176, "gfx/wheel_current.png", 270, 0, 0, tocolor(255, 255, 255, 255), false)
	dxDrawBorderedText3(""..ammo.."/"..ammo1.."", x*610, y*340, x*688, y*358, tocolor(255, 255, 255, 255), x*1.00, "default-bold", "center", "center", false, false, false, false, false)
	dxDrawBorderedText3(nomearma, x*625, y*395, x*687, y*413, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
    dxDrawImage(x*541, y*265, x*218, y*109, "gfx/desert_eagle.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    -- PISTOLA
	elseif ( weapon == 22 ) then
	dxDrawImage(x*433, y*405, x*438, y*176, "gfx/wheel_selected.png", 270, 0, 0, tocolor(255, 255, 255, 255), false)
	dxDrawImage(x*433, y*405, x*438, y*176, "gfx/wheel_current.png", 270, 0, 0, tocolor(255, 255, 255, 255), false)
	dxDrawBorderedText3(""..ammo.."/"..ammo1.."", x*610, y*340, x*688, y*358, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
	dxDrawBorderedText3(nomearma, x*625, y*395, x*687, y*413, tocolor(255, 255, 255, 255), x*1.00, "default-bold", "center", "center", false, false, false, false, false)
    dxDrawImage(x*541, y*265, x*218, y*109, "gfx/pistol.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
	-- TAZER
	elseif ( weapon == 23 ) then
	dxDrawImage(x*433, y*405, x*438, y*176, "gfx/wheel_selected.png", 270, 0, 0, tocolor(255, 255, 255, 255), false)
	dxDrawImage(x*433, y*405, x*438, y*176, "gfx/wheel_current.png", 270, 0, 0, tocolor(255, 255, 255, 255), false)
	dxDrawBorderedText3(""..ammo.."/"..ammo1.."", x*610, y*340, x*688, y*358, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
	dxDrawBorderedText3(nomearma, x*625, y*395, x*687, y*413, tocolor(255, 255, 255, 255), x*1.00, "default-bold", "center", "center", false, false, false, false, false)
    dxDrawImage(x*541, y*265, x*218, y*109, "gfx/silenced_pistol.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    else
	dxDrawImage(x*433, y*405, x*438, y*176, "gfx/wheel_part.png", 270, 0, 0, tocolor(255, 255, 255, 255), false)
	end
	------------------------------------------------------------------------------------------------------------------------
	-- SNIPER
	if ( weapon == 33 ) then	
	dxDrawImage(x*433, y*405, x*438, y*176, "gfx/wheel_selected.png", 45, 0, 0, tocolor(255, 255, 255, 255), false)
	dxDrawImage(x*433, y*405, x*438, y*176, "gfx/wheel_current.png", 45, 0, 0, tocolor(255, 255, 255, 255), false)
	dxDrawBorderedText3(""..ammo.."/"..ammo1.."", x*719, y*629, x*797, y*647, tocolor(255, 255, 255, 255), x*1.00, "default-bold", "center", "center", false, false, false, false, false)
	dxDrawBorderedText3(nomearma, x*625, y*395, x*687, y*413, tocolor(255, 255, 255, 255), x*1.00, "default-bold", "center", "center", false, false, false, false, false)
    dxDrawImage(x*699, y*515, x*194, y*162, "gfx/rifle.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    -- RIFLE
	elseif ( weapon == 34 ) then
	dxDrawImage(x*433, y*405, x*438, y*176, "gfx/wheel_selected.png", 45, 0, 0, tocolor(255, 255, 255, 255), false)
	dxDrawImage(x*433, y*405, x*438, y*176, "gfx/wheel_current.png", 45, 0, 0, tocolor(255, 255, 255, 255), false)
	dxDrawBorderedText3(""..ammo.."/"..ammo1.."", x*719, y*629, x*797, y*647, tocolor(255, 255, 255, 255), x*1.00, "default-bold", "center", "center", false, false, false, false, false)
	dxDrawBorderedText3(nomearma, x*625, y*395, x*687, y*413, tocolor(255, 255, 255, 255), x*1.00, "default-bold", "center", "center", false, false, false, false, false)
    dxDrawImage(x*699, y*515, x*194, y*162, "gfx/sniper_rifle.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)    else
	dxDrawImage(x*433, y*405, x*438, y*176, "gfx/wheel_part.png", 45, 0, 0, tocolor(255, 255, 255, 255), false)
	end
	------------------------------------------------------------------------------------------------------------------------
	-- SMG
	if ( weapon == 29 ) then	
	dxDrawImage(x*433, y*405, x*438, y*176, "gfx/wheel_selected.png", 315, 0, 0, tocolor(255, 255, 255, 255), false)
	dxDrawImage(x*433, y*405, x*438, y*176, "gfx/wheel_current.png", 315, 0, 0, tocolor(255, 255, 255, 255), false)
	dxDrawBorderedText3(""..ammo.."/"..ammo1.."", x*737, y*393, x*815, y*411, tocolor(255, 255, 255, 255), x*1.00, "default-bold", "center", "center", false, false, false, false, false)
	dxDrawBorderedText3(nomearma, x*625, y*395, x*687, y*413, tocolor(255, 255, 255, 255), x*1.00, "default-bold", "center", "center", false, false, false, false, false)
    dxDrawImage(x*692, y*326, x*163, y*85, "gfx/mp5.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
	-- TEC-9
	elseif ( weapon == 32 ) then	
	dxDrawImage(x*433, y*405, x*438, y*176, "gfx/wheel_selected.png", 315, 0, 0, tocolor(255, 255, 255, 255), false)
	dxDrawImage(x*433, y*405, x*438, y*176, "gfx/wheel_current.png", 315, 0, 0, tocolor(255, 255, 255, 255), false)
	dxDrawBorderedText3(""..ammo.."/"..ammo1.."", x*737, y*393, x*815, y*411, tocolor(255, 255, 255, 255), x*1.00, "default-bold", "center", "center", false, false, false, false, false)
	dxDrawBorderedText3(nomearma, x*625, y*395, x*687, y*413, tocolor(255, 255, 255, 255), x*1.00, "default-bold", "center", "center", false, false, false, false, false)
    dxDrawImage(x*692, y*326, x*163, y*85, "gfx/tec_9.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
	-- UZI
	elseif ( weapon == 28 ) then	
	dxDrawImage(x*433, y*405, x*438, y*176, "gfx/wheel_selected.png", 315, 0, 0, tocolor(255, 255, 255, 255), false)
	dxDrawImage(x*433, y*405, x*438, y*176, "gfx/wheel_current.png", 315, 0, 0, tocolor(255, 255, 255, 255), false)
	dxDrawBorderedText3(""..ammo.."/"..ammo1.."", x*737, y*393, x*815, y*411, tocolor(255, 255, 255, 255), x*1.00, "default-bold", "center", "center", false, false, false, false, false)
	dxDrawBorderedText3(nomearma, x*625, y*395, x*687, y*413, tocolor(255, 255, 255, 255), x*1.00, "default-bold", "center", "center", false, false, false, false, false)
    dxDrawImage(x*692, y*326, x*163, y*85, "gfx/micro_uzi.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
	else
	dxDrawImage(x*433, y*405, x*438, y*176, "gfx/wheel_part.png", 315, 0, 0, tocolor(255, 255, 255, 255), false)
	end
	------------------------------------------------------------------------------------------------------------------------
	-- M4
	if ( weapon == 31 ) then	
	dxDrawImage(x*433, y*405, x*438, y*176, "gfx/wheel_selected.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
	dxDrawImage(x*433, y*405, x*438, y*176, "gfx/wheel_current.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
	dxDrawBorderedText3(""..ammo.."/"..ammo1.."", x*774, y*515, x*852, y*533, tocolor(255, 255, 255, 255), x*1.00, "default-bold", "center", "center", false, false, false, true, false)
	dxDrawBorderedText3(nomearma, x*625, 395, x*687, y*413, tocolor(255, 255, 255, 255), x*1.00, "default-bold", "center", "center", false, false, false, false, false)
	dxDrawImage(x*744, y*438, x*159, y*105, "gfx/m4.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
    -- AK 47
	elseif ( weapon == 30 ) then
	dxDrawImage(x*433, y*405, x*438, y*176, "gfx/wheel_selected.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
	dxDrawImage(x*433, y*405, x*438, y*176, "gfx/wheel_current.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
	dxDrawBorderedText3(""..ammo.."/"..ammo1.."", x*774, y*515, x*852, y*533, tocolor(255, 255, 255, 255), x*1.00, "default-bold", "center", "center", false, false, false, true, false)
	dxDrawBorderedText3(nomearma, x*625, y*395, x*687, y*413, tocolor(255, 255, 255, 255), x*1.00, "default-bold", "center", "center", false, false, false, false, false)
	dxDrawImage(x*744, y*438, x*159, y*105, "gfx/ak-47.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
    else	
	dxDrawImage(x*433, y*405, x*438, y*176, "gfx/wheel_part.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
	end
    ------------------------------------------------------------------------------------------------------------------------
	-- ESOPETAS
	if ( weapon == 26 ) then	
	dxDrawImage(x*433, y*405, x*438, y*176, "gfx/wheel_selected.png", 135, 0, 0, tocolor(255, 255, 255, 255), false)
	dxDrawImage(x*433, y*405, x*438, y*176, "gfx/wheel_current.png", 135, 0, 0, tocolor(255, 255, 255, 255), false)
	dxDrawBorderedText3(""..ammo.."/"..ammo1.."", x*509, y*620, x*587, y*638, tocolor(255, 255, 255, 255), x*1.00, "default-bold", "center", "center", false, false, false, false, false)
	dxDrawBorderedText3(nomearma, x*625, y*395, x*687, y*413, tocolor(255, 255, 255, 255), x*1.00, "default-bold", "center", "center", false, false, false, false, false)
	dxDrawImage(x*409, y*533, x*228, y*127, "gfx/sawn_off.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)    -- AK 47
	elseif ( weapon == 25 ) then
	dxDrawImage(x*433, y*405, x*438, y*176, "gfx/wheel_selected.png", 135, 0, 0, tocolor(255, 255, 255, 255), false)
	dxDrawImage(x*433, y*405, x*438, y*176, "gfx/wheel_current.png", 135, 0, 0, tocolor(255, 255, 255, 255), false)
	dxDrawBorderedText3(""..ammo.."/"..ammo1.."", x*509, y*620, x*587, y*638, tocolor(255, 255, 255, 255), x*1.00, "default-bold", "center", "center", false, false, false, false, false)
	dxDrawBorderedText3(nomearma, x*625, y*395, x*687, y*413, tocolor(255, 255, 255, 255), x*1.00, "default-bold", "center", "center", false, false, false, false, false)
	dxDrawImage(x*409, y*533, x*228, y*127, "gfx/shotgun.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
	elseif ( weapon == 27 ) then
	dxDrawImage(x*433, y*405, x*438, y*176, "gfx/wheel_selected.png", 135, 0, 0, tocolor(255, 255, 255, 255), false)
	dxDrawImage(x*433, y*405, x*438, y*176, "gfx/wheel_current.png", 135, 0, 0, tocolor(255, 255, 255, 255), false)
	dxDrawBorderedText3(""..ammo.."/"..ammo1.."", x*509, y*620, x*587, y*638, tocolor(255, 255, 255, 255), x*1.00, "default-bold", "center", "center", false, false, false, false, false)
	dxDrawBorderedText3(nomearma, x*625, y*395, x*687, y*413, tocolor(255, 255, 255, 255), x*1.00, "default-bold", "center", "center", false, false, false, false, false)
	dxDrawImage(x*409, y*533, x*228, y*127, "gfx/spas_12.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    else	
	dxDrawImage(x*433, y*405, x*438, y*176, "gfx/wheel_part.png", 135, 0, 0, tocolor(255, 255, 255, 255), false)
	end
    ------------------------------------------------------------------------------------------------------------------------
	-- ARMAS PESADAS
	if ( weapon == 37 ) then	
	dxDrawImage(x*433, y*405, x*438, y*176, "gfx/wheel_selected.png", 180, 0, 0, tocolor(255, 255, 255, 255), false)
	dxDrawImage(x*433, y*405, x*438, y*176, "gfx/wheel_current.png", 180, 0, 0, tocolor(255, 255, 255, 255), false)
	dxDrawBorderedText3(""..ammo.."/"..ammo1.."", x*452, y*515, x*530, y*533, tocolor(255, 255, 255, 255), x*1.00, "default-bold", "center", "center", false, false, false, false, false)
	dxDrawBorderedText3(nomearma, x*625, y*395, x*687, y*413, tocolor(255, 255, 255, 255), x*1.00, "default-bold", "center", "center", false, false, false, false, false)
	dxDrawImage(x*404, y*405, x*180, y*142, "gfx/flame_thrower.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
	elseif ( weapon == 36 ) then
	dxDrawImage(x*433, y*405, x*438, y*176, "gfx/wheel_selected.png", 180, 0, 0, tocolor(255, 255, 255, 255), false)
	dxDrawImage(x*433, y*405, x*438, y*176, "gfx/wheel_current.png", 180, 0, 0, tocolor(255, 255, 255, 255), false)
	dxDrawBorderedText3(""..ammo.."/"..ammo1.."", x*452, 515, x*530, 533, tocolor(255, 255, 255, 255), x*1.00, "default-bold", "center", "center", false, false, false, false, false)
	dxDrawBorderedText3(nomearma, x*625, 395, x*687, 413, tocolor(255, 255, 255, 255), x*1.00, "default-bold", "center", "center", false, false, false, false, false)
	dxDrawImage(x*404, y*405, x*180, y*142, "gfx/missile_launcher.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
	elseif ( weapon == 38 ) then
	dxDrawImage(x*433, y*405, x*438, y*176, "gfx/wheel_selected.png", 180, 0, 0, tocolor(255, 255, 255, 255), false)
	dxDrawImage(x*433, y*405, x*438, y*176, "gfx/wheel_current.png", 180, 0, 0, tocolor(255, 255, 255, 255), false)
	dxDrawBorderedText3(""..ammo.."/"..ammo1.."", x*452, 515, x*530, 533, tocolor(255, 255, 255, 255), x*1.00, "default-bold", "center", "center", false, false, false, false, false)
	dxDrawBorderedText3(nomearma, x*625, 395, x*687, 413, tocolor(255, 255, 255, 255), x*1.00, "default-bold", "center", "center", false, false, false, false, false)
	dxDrawImage(x*404, y*405, x*180, y*142, "gfx/minigun.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    elseif ( weapon == 35 ) then
	dxDrawImage(x*433, y*405, x*438, y*176, "gfx/wheel_selected.png", 180, 0, 0, tocolor(255, 255, 255, 255), false)
	dxDrawImage(x*433, y*405, x*438, y*176, "gfx/wheel_current.png", 180, 0, 0, tocolor(255, 255, 255, 255), false)
	dxDrawBorderedText3(""..ammo.."/"..ammo1.."", x*452, 515, x*530, 533, tocolor(255, 255, 255, 255), x*1.00, "default-bold", "center", "center", false, false, false, false, false)
	dxDrawBorderedText3(nomearma, x*625, 395, x*687, 413, tocolor(255, 255, 255, 255), x*1.00, "default-bold", "center", "center", false, false, false, false, false)
	dxDrawImage(x*404, y*405, x*180, y*142, "gfx/rpg.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
	else	
	dxDrawImage(x*433, y*405, x*438, y*176, "gfx/wheel_part.png", 180, 0, 0, tocolor(255, 255, 255, 255), false)
	end
	------------------------------------------------------------------------------------------------------------------------
	-- GRANADAS
	if ( weapon == 16 ) then	
	dxDrawImage(x*433, y*405, x*438, y*176, "gfx/wheel_selected.png", 225, 0, 0, tocolor(255, 255, 255, 255), false)
	dxDrawImage(x*433, y*405, x*438, y*176, "gfx/wheel_current.png", 225, 0, 0, tocolor(255, 255, 255, 255), false)
	dxDrawBorderedText3(""..ammo.."/"..ammo1.."", x*479, y*395, x*557, y*413, tocolor(255, 255, 255, 255), x*1.00, "default-bold", "center", "center", false, false, false, false, false)
	dxDrawBorderedText3(nomearma, x*625, y*395, x*687, y*413, tocolor(255, 255, 255, 255), x*1.00, "default-bold", "center", "center", false, false, false, false, false)
	dxDrawImage(x*455, y*309, x*154, y*123, "gfx/grenade.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
	elseif ( weapon == 18 ) then
	dxDrawImage(x*433, y*405, x*438, y*176, "gfx/wheel_selected.png", 225, 0, 0, tocolor(255, 255, 255, 255), false)
	dxDrawImage(x*433, y*405, x*438, y*176, "gfx/wheel_current.png", 225, 0, 0, tocolor(255, 255, 255, 255), false)
	dxDrawBorderedText3(""..ammo.."/"..ammo1.."", x*479, y*395, x*557, y*413, tocolor(255, 255, 255, 255), x*1.00, "default-bold", "center", "center", false, false, false, false, false)
	dxDrawBorderedText3(nomearma, x*625, y*395, x*687, y*413, tocolor(255, 255, 255, 255), x*1.00, "default-bold", "center", "center", false, false, false, false, false)
	dxDrawImage(x*455, y*309, x*154, y*123, "gfx/molotov.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
	elseif ( weapon == 17 ) then
	dxDrawImage(x*433, y*405, x*438, y*176, "gfx/wheel_selected.png", 225, 0, 0, tocolor(255, 255, 255, 255), false)
	dxDrawImage(x*433, y*405, x*438, y*176, "gfx/wheel_current.png", 225, 0, 0, tocolor(255, 255, 255, 255), false)
	dxDrawBorderedText3(""..ammo.."/"..ammo1.."", x*479, y*395, x*557, y*413, tocolor(255, 255, 255, 255), x*1.00, "default-bold", "center", "center", false, false, false, false, false)
	dxDrawBorderedText3(nomearma, x*625, y*395, x*687, y*413, tocolor(255, 255, 255, 255), x*1.00, "default-bold", "center", "center", false, false, false, false, false)
	dxDrawImage(x*455, y*309, x*154, y*123, "gfx/tear_gas.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
	else	
	dxDrawImage(x*433, y*405, x*438, y*176, "gfx/wheel_part.png", 225, 0, 0, tocolor(255, 255, 255, 255), false)
	end
    ------------------------------------------------------------------------------------------------------------------------
    for slot = 0, 12 do
	local weapon3 = getPedWeapon(localPlayer, slot)
	-- M4
	if ( weapon3 == 31 ) then	
	dxDrawImage(x*744, y*438, x*159, y*105, "gfx/m4.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
	-- AK 47
	elseif ( weapon3 == 30 ) then
	dxDrawImage(x*744, y*438, x*159, y*105, "gfx/ak-47.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
	end
	------------------------------------------------------------------------------------------------------------------------
	if ( weapon3 == 29 ) then
	dxDrawImage(x*692, y*326, x*163, y*85, "gfx/mp5.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
    elseif ( weapon3 == 32 ) then
	dxDrawImage(x*692, y*326, x*163, y*85, "gfx/tec_9.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
    elseif ( weapon3 == 28 ) then
	dxDrawImage(x*692, y*326, x*163, y*85, "gfx/micro_uzi.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
    end
    ------------------------------------------------------------------------------------------------------------------------
	if ( weapon3 == 24 ) then
	dxDrawImage(x*541, y*265, x*218, y*109, "gfx/desert_eagle.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
    elseif ( weapon3 == 22 ) then
    dxDrawImage(x*541, y*265, x*218, y*109, "gfx/pistol.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
    elseif ( weapon3 == 23 ) then
	dxDrawImage(x*541, y*265, x*218, y*109, "gfx/silenced_pistol.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
    end
	------------------------------------------------------------------------------------------------------------------------
	if ( weapon3 == 33 ) then
	dxDrawImage(x*699, y*515, x*194, y*162, "gfx/rifle.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
    elseif ( weapon3 == 34 ) then
    dxDrawImage(x*699, y*515, x*194, y*162, "gfx/sniper_rifle.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
    end
	------------------------------------------------------------------------------------------------------------------------
	if ( weapon3 == 26 ) then
	dxDrawImage(x*409, y*533, x*228, y*127, "gfx/sawn_off.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
    elseif ( weapon3 == 25 ) then
    dxDrawImage(x*409, y*533, x*228, y*127, "gfx/shotgun.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
    elseif ( weapon3 == 27 ) then
    dxDrawImage(x*409, y*533, x*228, y*127, "gfx/spas_12.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
	end
	
	if ( weapon3 == 37 ) then
    dxDrawImage(x*404, y*405, x*180, y*142, "gfx/flame_thrower.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
    elseif ( weapon3 == 36 ) then
    dxDrawImage(x*404, y*405, x*180, y*142, "gfx/missile_launcher.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
    elseif ( weapon3 == 38 ) then
    dxDrawImage(x*404, y*405, x*180, y*142, "gfx/minigun.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
	elseif ( weapon3 == 35 ) then
    dxDrawImage(x*404, y*405, x*180, y*142, "gfx/rpg.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
	end
	------------------------------------------------------------------------------------------------------------------------
	if ( weapon3 == 16 ) then
    dxDrawImage(x*455, y*309, x*154, y*123, "gfx/grenade.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
    elseif ( weapon3 == 18 ) then
    dxDrawImage(x*455, y*309, x*154, y*123, "gfx/molotov.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
    elseif ( weapon3 == 17 ) then
    dxDrawImage(x*455, y*309, x*154, y*123, "gfx/tear_gas.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
	end
	------------------------------------------------------------------------------------------------------------------------
end
    ------------------------------------------------------------------------------------------------------------------------
	--- MINIGUN
	if cursorPosition(x*404, y*405, x*171, y*142) then 
	dxDrawImage(x*433, y*405, x*438, y*176, "gfx/wheel_current.png", 180, 0, 0, tocolor(255, 255, 255, 255), false)
	local weapon = getPedWeapon ( getLocalPlayer(), 7 )
	if ( weapon > 0 ) then
	local ammor = getPedTotalAmmo ( getLocalPlayer(), 7 )
	local cli = getPedAmmoInClip (getLocalPlayer(), 7 )
	if ( ammor > 0 ) then
	dxDrawBorderedText3(""..cli.."/"..ammor.."", x*452, y*515, x*530, y*533, tocolor(255, 255, 255, 255), x*1.00, "default-bold", "center", "center", false, false, false, false, false)
	end
    end
	end
	------------------------------------------------------------------------------------------------------------------------
	--- AK-47
	if cursorPosition(x*744, y*438, x*159, y*105) then
	dxDrawImage(x*433, y*405, x*438, y*176, "gfx/wheel_current.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    local weapon = getPedWeapon ( getLocalPlayer(), 5 )
	if ( weapon > 0 ) then
	local ammor = getPedTotalAmmo ( getLocalPlayer(), 5 )
	local cli = getPedAmmoInClip (getLocalPlayer(), 5)
	if ( ammor > 0 ) then
	dxDrawBorderedText3(""..cli.."/"..ammor.."", x*774, y*515, x*852, y*533, tocolor(255, 255, 255, 255), x*1.00, "default-bold", "center", "center", false, false, false, false, false)
	end
    end
	end
    ------------------------------------------------------------------------------------------------------------------------
	--- MAO
	if cursorPosition(x*545, y*603, x*206, y*107) then 
	dxDrawImage(x*433, y*405, x*438, y*176, "gfx/wheel_current.png", 90, 0, 0, tocolor(255, 255, 255, 255), false)
	end
    ------------------------------------------------------------------------------------------------------------------------
	--- DESERT
	if cursorPosition(x*541, y*265, x*218, y*109) then 
	dxDrawImage(x*433, y*405, x*438, y*176, "gfx/wheel_current.png", 270, 0, 0, tocolor(255, 255, 255, 255), false)
	local weapon = getPedWeapon ( getLocalPlayer(), 2 )
	if ( weapon > 0 ) then
	local ammor = getPedTotalAmmo ( getLocalPlayer(), 2 )
	local cli = getPedAmmoInClip (getLocalPlayer(), 2)
	if ( ammor > 0 ) then
	dxDrawBorderedText3(""..cli.."/"..ammor.."", x*610, y*340, x*688, y*358, tocolor(255, 255, 255, 255), x*1.00, "default-bold", "center", "center", false, false, false, false, false)
	end
	end
	end
	------------------------------------------------------------------------------------------------------------------------	 
	--- UZI
	if cursorPosition(x*692, y*326, x*163, y*85) then 
	dxDrawImage(x*433, y*405, x*438, y*176, "gfx/wheel_current.png", 315, 0, 0, tocolor(255, 255, 255, 255), false)
	local weapon = getPedWeapon ( getLocalPlayer(), 4 )
	if ( weapon > 0 ) then
	local ammor = getPedTotalAmmo ( getLocalPlayer(), 4 )
	local cli = getPedAmmoInClip (getLocalPlayer(), 4 )
	if ( ammor > 0 ) then
    dxDrawBorderedText3(""..cli.."/"..ammor.."", x*737, y*393, x*815, y*411, tocolor(255, 255, 255, 255), x*1.00, "default-bold", "center", "center", false, false, false, false, false)
	end
	end
	end
	------------------------------------------------------------------------------------------------------------------------
	--- SNIPER
	if cursorPosition(x*699, y*515, x*194, y*162) then 
	dxDrawImage(x*433, y*405, x*438, y*176, "gfx/wheel_current.png", 45, 0, 0, tocolor(255, 255, 255, 255), false)
	local weapon = getPedWeapon ( getLocalPlayer(), 6 )
	if ( weapon > 0 ) then
	local ammor = getPedTotalAmmo ( getLocalPlayer(), 6 )
	local cli = getPedAmmoInClip (getLocalPlayer(), 6 )
	if ( ammor > 0 ) then
	dxDrawBorderedText3(""..cli.."/"..ammor.."", x*719, y*629, x*797, y*647, tocolor(255, 255, 255, 255), x*1.00, "default-bold", "center", "center", false, false, false, false, false)
	end
	end
	end
	------------------------------------------------------------------------------------------------------------------------
	--- 12
	if cursorPosition(x*409, y*533, x*228, y*127) then 
	dxDrawImage(x*433, y*405, x*438, y*176, "gfx/wheel_current.png", 135, 0, 0, tocolor(255, 255, 255, 255), false)
	local weapon = getPedWeapon ( getLocalPlayer(), 3 )
	if ( weapon > 0 ) then
	local ammor = getPedTotalAmmo ( getLocalPlayer(), 3 )
	local cli = getPedAmmoInClip (getLocalPlayer(), 3 )
	if ( ammor > 0 ) then
	dxDrawBorderedText3(""..cli.."/"..ammor.."", x*509, y*620, x*587, y*638, tocolor(255, 255, 255, 255), x*1.00, "default-bold", "center", "center", false, false, false, false, false)
	end
	end
	end
	------------------------------------------------------------------------------------------------------------------------
	--- GRANADAS
	if cursorPosition(x*443, y*338, x*163, y*85) then 
	dxDrawImage(x*433, y*405, x*438, y*176, "gfx/wheel_current.png", 225, 0, 0, tocolor(255, 255, 255, 255), false)
	local weapon = getPedWeapon ( getLocalPlayer(), 8 )
	if ( weapon > 0 ) then
	local ammor = getPedTotalAmmo ( getLocalPlayer(), 8 )
	local cli = getPedAmmoInClip (getLocalPlayer(), 8 )
	if ( ammor > 0 ) then
	dxDrawBorderedText3(""..cli.."/"..ammor.."", x*479, y*395, x*557, y*413, tocolor(255, 255, 255, 255), x*1.00, "default-bold", "center", "center", false, false, false, false, false)
	end
	end
	end
    ------------------------------------------------------------------------------------------------------------------------
end
--===============================================================================================================================================================================================================================
--===============================================================================================================================================================================================================================
function pistola (_,state)
if painel2 == true then
if state == "down" then
if isCursorOnElement (x*541, y*265, x*218, y*109) then
for slot = 0, 12 do
local weapon3 = getPedWeapon(localPlayer, slot)
if ( weapon3 == 24 ) then
triggerServerEvent("Pistolas",getLocalPlayer())
elseif ( weapon3 == 22 ) then
triggerServerEvent("Pistolas",getLocalPlayer())
elseif ( weapon3 == 23 ) then
triggerServerEvent("Pistolas",getLocalPlayer())
end
end
end
end
end
end
addEventHandler ("onClientClick", root, pistola)
--===============================================================================================================================================================================================================================
--===============================================================================================================================================================================================================================
function smgs (_,state)
if painel2 == true then
if state == "down" then
if isCursorOnElement (x*692, y*326, x*163, y*85) then
for slot = 0, 12 do
local weapon3 = getPedWeapon(localPlayer, slot)
if ( weapon3 == 29 ) then
triggerServerEvent("SMGS",getLocalPlayer())
elseif ( weapon3 == 28 ) then
triggerServerEvent("SMGS",getLocalPlayer())
elseif ( weapon3 == 32 ) then
triggerServerEvent("SMGS",getLocalPlayer())
end
end
end
end
end
end
addEventHandler ("onClientClick", root, smgs)
--===============================================================================================================================================================================================================================
--===============================================================================================================================================================================================================================
function fuzil (_,state)
if painel2 == true then
if state == "down" then
if isCursorOnElement (x*744, y*438, x*159, y*105) then
for slot = 0, 12 do
local weapon3 = getPedWeapon(localPlayer, slot)
if ( weapon3 == 31 ) then
triggerServerEvent("Fuzil",getLocalPlayer())
elseif ( weapon3 == 30 ) then
triggerServerEvent("Fuzil",getLocalPlayer())
end
end
end
end
end
end
addEventHandler ("onClientClick", root, fuzil)
--===============================================================================================================================================================================================================================
--===============================================================================================================================================================================================================================
function Sniper (_,state)
if painel2 == true then
if state == "down" then
if isCursorOnElement (x*699, y*515, x*194, y*162) then
for slot = 0, 12 do
local weapon3 = getPedWeapon(localPlayer, slot)
if ( weapon3 == 33 ) then
triggerServerEvent("Sniper",getLocalPlayer())
elseif ( weapon3 == 34 ) then
triggerServerEvent("Sniper",getLocalPlayer())
end
end
end
end
end
end
addEventHandler ("onClientClick", root, Sniper)
--===============================================================================================================================================================================================================================
--===============================================================================================================================================================================================================================
function Mao (_,state)
if painel2 == true then
if state == "down" then
if isCursorOnElement (x*545, y*603, x*206, y*107) then
for slot = 0, 12 do
local weapon3 = getPedWeapon(localPlayer, slot)
if ( weapon3 == 0 ) then
triggerServerEvent("Mao",getLocalPlayer())
end
end
end
end
end
end
addEventHandler ("onClientClick", root, Mao)
--===============================================================================================================================================================================================================================
--===============================================================================================================================================================================================================================
function Doze (_,state)
if painel2 == true then
if state == "down" then
if isCursorOnElement (x*409, y*533, x*228, y*127) then
for slot = 0, 12 do
local weapon3 = getPedWeapon(localPlayer, slot)
if ( weapon3 == 25 ) then
triggerServerEvent("Doze",getLocalPlayer())
elseif ( weapon3 == 26 ) then
triggerServerEvent("Doze",getLocalPlayer())
elseif ( weapon3 == 27 ) then
triggerServerEvent("Doze",getLocalPlayer())
end
end
end
end
end
end
addEventHandler ("onClientClick", root, Doze)
--===============================================================================================================================================================================================================================
--===============================================================================================================================================================================================================================
function Pesadas (_,state)
if painel2 == true then
if state == "down" then
if isCursorOnElement (x*404, y*405, x*171, y*142) then
for slot = 0, 12 do
local weapon3 = getPedWeapon(localPlayer, slot)
if ( weapon3 == 35 ) then
triggerServerEvent("Pesadas",getLocalPlayer())
elseif ( weapon3 == 36 ) then
triggerServerEvent("Pesadas",getLocalPlayer())
elseif ( weapon3 == 37 ) then
triggerServerEvent("Pesadas",getLocalPlayer())
elseif ( weapon3 == 38 ) then
triggerServerEvent("Pesadas",getLocalPlayer())
end
end
end
end
end
end
addEventHandler ("onClientClick", root, Pesadas)
--===============================================================================================================================================================================================================================
--===============================================================================================================================================================================================================================
function Granadas (_,state)
if painel2 == true then
if state == "down" then
if isCursorOnElement (x*455, y*309, x*154, y*123) then
for slot = 0, 12 do
local weapon3 = getPedWeapon(localPlayer, slot)
if ( weapon3 == 16 ) then
triggerServerEvent("Granadas",getLocalPlayer())
elseif ( weapon3 == 17 ) then
triggerServerEvent("Granadas",getLocalPlayer())
elseif ( weapon3 == 18 ) then
triggerServerEvent("Granadas",getLocalPlayer())
end
end
end
end
end
end
addEventHandler ("onClientClick", root, Granadas)
--===============================================================================================================================================================================================================================
--===============================================================================================================================================================================================================================
function abrir( key, keyState )
--if not isPedInVehicle ( localPlayer ) and isPedInVehicle ( localPlayer ) then
    if ( keyState == 'down' ) then
        addEventHandler ("onClientRender", root, dx)
		showCursor (true)
		som = playSound("sfx/effect.mp3")
		setGameSpeed(0.1)
		painel2 = true
		setElementData ( localPlayer, "shader", true )
        elseif ( keyState == 'up' ) then
        showCursor (false)
		setElementData ( localPlayer, "shader", false )
		stopSound(som)
		setGameSpeed(1)
		painel2 = false
		removeEventHandler ("onClientRender", root, dx)
   -- end
  end
end
bindKey( 'm', 'down', abrir )
bindKey( 'm', 'up', abrir )
--===============================================================================================================================================================================================================================
--===============================================================================================================================================================================================================================
function cursorPosition(x, y, w, h)
	if (not isCursorShowing()) then
		return false
	end
	local mx, my = getCursorPosition()
	local fullx, fully = guiGetScreenSize()
	cursorx, cursory = mx*fullx, my*fully
	if cursorx > x and cursorx < x + w and cursory > y and cursory < y + h then
		return true
	else
		return false
	end
end
--===============================================================================================================================================================================================================================
--===============================================================================================================================================================================================================================
local x,y = guiGetScreenSize()
function isCursorOnElement(x,y,w,h)
 local mx,my = getCursorPosition ()
 local fullx,fully = guiGetScreenSize()
 cursorx,cursory = mx*fullx,my*fully
 if cursorx > x and cursorx < x + w and cursory > y and cursory < y + h then
  return true
 else
  return false
 end
end
--===============================================================================================================================================================================================================================
--===============================================================================================================================================================================================================================
function dxDrawBorderedText3( text, x, y, w, h, color, scale, font, alignX, alignY, clip, wordBreak, postGUI )
    dxDrawText ( text, x - 2, y - 2, w - 2, h - 2, tocolor ( 0, 0, 0, 155 ), scale, font, alignX, alignY, clip, wordBreak, false ) -- black
    dxDrawText ( text, x + 2, y - 2, w + 2, h - 2, tocolor ( 0, 0, 0, 155 ), scale, font, alignX, alignY, clip, wordBreak, false )
    dxDrawText ( text, x - 2, y + 2, w - 2, h + 2, tocolor ( 0, 0, 0, 155 ), scale, font, alignX, alignY, clip, wordBreak, false )
    dxDrawText ( text, x + 2, y + 2, w + 2, h + 3, tocolor ( 0, 0, 0, 155 ), scale, font, alignX, alignY, clip, wordBreak, false )  
    dxDrawText ( text, x - 3, y, w - 3, h, tocolor ( 0, 0, 0, 155 ), scale, font, alignX, alignY, clip, wordBreak, false )
    dxDrawText ( text, x + 3, y, w + 3, h, tocolor ( 0, 0, 0, 155 ), scale, font, alignX, alignY, clip, wordBreak, false )
    dxDrawText ( text, x, y - 3, w, h - 3, tocolor ( 0, 0, 0, 155 ), scale, font, alignX, alignY, clip, wordBreak, false )
    dxDrawText ( text, x, y + 3, w, h + 3, tocolor ( 0, 0, 0, 155 ), scale, font, alignX, alignY, clip, wordBreak, false )   
    dxDrawText ( text, x, y, w, h, color, scale, font, alignX, alignY, clip, wordBreak, postGUI )
end
--===============================================================================================================================================================================================================================
--===============================================================================================================================================================================================================================