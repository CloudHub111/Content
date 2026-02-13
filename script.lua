-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-13 00:37:48
-- Luau version 6, Types version 3
-- Time taken: 0.226095 seconds

local ReplicatedFirst = game:GetService("ReplicatedFirst")
local HttpService_upvr = game:GetService("HttpService")
local Ambassador_upvr = require(ReplicatedFirst.Ambassador)
local Variables_upvr = require(ReplicatedFirst.Variables)
local Network_upvr = require(ReplicatedFirst.Network)
local Shucky_upvr = require(ReplicatedFirst.Modules.Shucky)
local LocalPlayer_upvr = game.Players.LocalPlayer
Variables_upvr.inputs = {}
Variables_upvr.window = 0
Network_upvr.HookEvent("FireAnim", function(...) -- Line 24
	--[[ Upvalues[1]:
		[1]: Shucky_upvr (readonly)
	]]
	Shucky_upvr:PlayAnim(...)
end)
local var9_upvw
local Progression_upvr = require(game.ReplicatedFirst.Progression)
local CollectionService_upvr = game:GetService("CollectionService")
Network_upvr.HookEvent("JoinBattle", function(arg1, arg2, arg3) -- Line 29
	--[[ Upvalues[8]:
		[1]: Variables_upvr (readonly)
		[2]: Progression_upvr (readonly)
		[3]: Ambassador_upvr (readonly)
		[4]: var9_upvw (read and write)
		[5]: CollectionService_upvr (readonly)
		[6]: HttpService_upvr (readonly)
		[7]: Shucky_upvr (readonly)
		[8]: LocalPlayer_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	Variables_upvr.lastjoin = tick()
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [25] 18. Error Block 2 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [25] 18. Error Block 2 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [36] 25. Error Block 3 start (CF ANALYSIS FAILED)
	Variables_upvr.beathatred = Progression_upvr.PlayerHasFlag("DefeatHatred")
	-- KONSTANTERROR: [36] 25. Error Block 3 end (CF ANALYSIS FAILED)
end)
Network_upvr.HookEvent("Unbattle", function(arg1) -- Line 148
	--[[ Upvalues[4]:
		[1]: var9_upvw (read and write)
		[2]: LocalPlayer_upvr (readonly)
		[3]: Variables_upvr (readonly)
		[4]: Ambassador_upvr (readonly)
	]]
	if var9_upvw then
		var9_upvw:disconnect()
	end
	local TouchGui = LocalPlayer_upvr.PlayerGui:FindFirstChild("TouchGui")
	if TouchGui then
		TouchGui.Enabled = true
	end
	if LocalPlayer_upvr:FindFirstChild("RanAway") and not LocalPlayer_upvr.RanAway:GetAttribute("NiceMeme") then
		LocalPlayer_upvr.RanAway:SetAttribute("NiceMeme", true)
		if Variables_upvr.arena and Variables_upvr.arena:FindFirstChild("OEnemy") and Variables_upvr.arena.OEnemy.Value then
			Variables_upvr.arena.OEnemy.Value:SetAttribute("Inactive", false)
		end
	end
	Variables_upvr.btldeb = tick()
	if LocalPlayer_upvr:GetAttribute("Music") == "" then
		task.delay(0.3, function() -- Line 161
			--[[ Upvalues[2]:
				[1]: LocalPlayer_upvr (copied, readonly)
				[2]: Variables_upvr (copied, readonly)
			]]
			if LocalPlayer_upvr:GetAttribute("Music") == "" and 0.5 < tick() - (Variables_upvr.lastmute or 0) then
				LocalPlayer_upvr:SetAttribute("Music", Variables_upvr.owmusic)
			end
		end)
	else
		LocalPlayer_upvr:SetAttribute("Music", Variables_upvr.owmusic)
	end
	if Variables_upvr.arena and Variables_upvr.arena:GetAttribute("FreeRun") and not arg1 or Variables_upvr.arena and Variables_upvr.arena:GetAttribute("GoToSpawn") then
		local SpawnMeHere_2 = game.ReplicatedStorage:GetAttribute("SpawnMeHere")
		Ambassador_upvr.Fire("UpdateFlags")
		if SpawnMeHere_2 and Variables_upvr.chr and Variables_upvr.hrp then
			Variables_upvr.chr:PivotTo(CFrame.new(SpawnMeHere_2) * Variables_upvr.hrp.CFrame.Rotation)
		else
			Ambassador_upvr.Fire("SpawnMe")
		end
	end
	Variables_upvr.arena = nil
	Ambassador_upvr.Fire("BattleTime", false)
	Variables_upvr.ileft = tick()
	Variables_upvr.hrp.Anchored = false
	Ambassador_upvr.Fire("UpdateSpeed")
	Variables_upvr.inbattle = false
	Ambassador_upvr.Fire("UpdateFlags", true)
end)
Ambassador_upvr.HookEvent("PlaySFX", function(arg1, arg2) -- Line 187
	--[[ Upvalues[2]:
		[1]: Variables_upvr (readonly)
		[2]: Shucky_upvr (readonly)
	]]
	if not arg2 then
		local tbl_5_upvw = {}
	end
	local PFX_upvr = tbl_5_upvw.PFX
	local NM = tbl_5_upvw.NM
	local Delay = tbl_5_upvw.Delay
	local Bro_upvr = tbl_5_upvw.Bro
	local Amt = tbl_5_upvw.Amt
	if Amt then
	end
	if not NM or not Variables_upvr.arena.Positions[NM.."Center"] then
		if Bro_upvr then
			local PrimaryPart_3_upvr = Bro_upvr.PrimaryPart
		end
	end
	if PrimaryPart_3_upvr then
		local Position_2_upvr = PrimaryPart_3_upvr.Position
	end
	if PFX_upvr and Position_2_upvr and game.ReplicatedStorage.Particles:FindFirstChild(PFX_upvr) then
		local Impact_upvr = tbl_5_upvw.Impact
		local vector3_upvr = Vector3.new(0, tbl_5_upvw.OffsetY or 0, 0)
		local clamped_upvw = math.clamp(math.ceil(Amt / (tbl_5_upvw.Reduction or 1)), 1, 20)
		local Icon_upvr = tbl_5_upvw.Icon
		task.delay(Delay or 0, function() -- Line 195
			--[[ Upvalues[10]:
				[1]: Impact_upvr (readonly)
				[2]: PFX_upvr (readonly)
				[3]: Bro_upvr (readonly)
				[4]: Shucky_upvr (copied, readonly)
				[5]: Position_2_upvr (readonly)
				[6]: vector3_upvr (readonly)
				[7]: tbl_5_upvw (read and write)
				[8]: PrimaryPart_3_upvr (readonly)
				[9]: clamped_upvw (read and write)
				[10]: Icon_upvr (readonly)
			]]
			local var34
			if Impact_upvr then
				game.Workspace.Sounds[Impact_upvr]:Play()
			end
			local zero_vector3 = Vector3.new()
			local var36
			if var36 == "UseItem" then
				local function INLINED() -- Internal function, doesn't exist in bytecode
					var36 = Bro_upvr:GetAttribute("UseOffset")
					return var36
				end
				if not Bro_upvr or not INLINED() then
					var36 = zero_vector3
				end
				zero_vector3 = var36
			end
			var34 = Position_2_upvr + zero_vector3
			if tbl_5_upvw.OffsetIt then
				var34 = Vector3.new(0, 0.5, 3)
			else
				var34 = Vector3.new()
			end
			var34 = clamped_upvw
			Shucky_upvr:PlayParticle(PFX_upvr, var34 + vector3_upvr + var34, PrimaryPart_3_upvr, var34, Icon_upvr)
		end)
	end
	local Pitch_upvw = tbl_5_upvw.Pitch
	task.delay(math.max(0, (Delay or 0.82) - 0.82), function() -- Line 205
		--[[ Upvalues[2]:
			[1]: arg1 (readonly)
			[2]: Pitch_upvw (read and write)
		]]
		local var39 = arg1
		if var39 then
			var39 = game.Workspace.Sounds:FindFirstChild(arg1)
		end
		if var39 then
			local OrigPitch = var39:GetAttribute("OrigPitch")
			if not Pitch_upvw then
				Pitch_upvw = 1
			end
			if OrigPitch then
				var39.PlaybackSpeed = OrigPitch / Pitch_upvw
			end
			var39:Play()
		end
	end)
end)
Network_upvr.HookEvent("PlaySFX", function(...) -- Line 216
	--[[ Upvalues[1]:
		[1]: Ambassador_upvr (readonly)
	]]
	Ambassador_upvr.Fire("PlaySFX", ...)
end)
Variables_upvr.presstick = 0
Variables_upvr.numtargets = 1
Network_upvr.HookEvent("DoMove", function(arg1) -- Line 226
	--[[ Upvalues[5]:
		[1]: Variables_upvr (readonly)
		[2]: Shucky_upvr (readonly)
		[3]: LocalPlayer_upvr (readonly)
		[4]: Ambassador_upvr (readonly)
		[5]: Shucky_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [7] 5. Error Block 2 start (CF ANALYSIS FAILED)
	local User_7_upvr = arg1.User
	-- KONSTANTERROR: [7] 5. Error Block 2 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [438] 306. Error Block 317 start (CF ANALYSIS FAILED)
	local var214 = false
	local var215
	if not var214 then
		var215 = false
	end
	Variables_upvr.ignore = var215
	local var216
	if User_7_upvr and User_7_upvr:GetAttribute("NoCDmg") then
		var216 = true
	else
		var216 = false
	end
	if var214 and not var215 then
		Variables_upvr.window = 0.2
		if Variables_upvr.arena and Variables_upvr.arena:GetAttribute("Freeze") then
		else
			if arg1.atme and Variables_upvr.faker and Variables_upvr.faker:GetAttribute("CounterHurt") and not var216 then
				local var217 = Variables_upvr
				var217.window -= 0.02 * Variables_upvr.faker:GetAttribute("CounterHurt")
			elseif arg1.itsme then
				local var218
				if var218 then
					var218 = Variables_upvr.faker:GetAttribute("DWindow")
					if var218 then
						var218 = Variables_upvr
						var218.window *= 0.5
					end
					if User_7_upvr then
						var218 = User_7_upvr:GetAttribute("HitAround")
						if var218 then
							var218 = Variables_upvr
							var218.window *= 1.5
						end
					end
					var218 = User_7_upvr
					if var218 then
						var218 = User_7_upvr:GetAttribute("Timing")
					end
					if var218 then
						local var219 = Variables_upvr
						var219.window *= var218
					end
				end
			end
			if arg1.atme or arg1.itsme or Variables_upvr.faker then
				if Variables_upvr.faker:GetAttribute("HardMode") and arg1.atme then
					local var220 = Variables_upvr
					var220.window /= 2
				end
				if Variables_upvr.faker:GetAttribute("Thrills") and arg1.atme then
					local var221 = Variables_upvr
					var221.window /= 2
				end
				if LocalPlayer_upvr.UserId == game.ReplicatedStorage:GetAttribute("shallbecursed") then
					Variables_upvr.window = 0
				end
				local Focused_5 = Variables_upvr.faker.TurnStat:GetAttribute("Focused")
				if Focused_5 then
					local var223 = Variables_upvr
					var223.window *= 1 + Focused_5 * 0.2
				end
				local BigHead_3 = Variables_upvr.faker.TurnStat:GetAttribute("BigHead")
				if BigHead_3 then
					local var225 = Variables_upvr
					var225.window /= 1 + BigHead_3 * 0.5
				end
				if Variables_upvr.faker.TurnStat:GetAttribute("Defense2") and arg1.atme then
					local var226 = Variables_upvr
					var226.window *= 1.5
					-- KONSTANTWARNING: GOTO [673] #479
				end
				-- KONSTANTWARNING: GOTO [673] #479
			end
		end
	else
		Variables_upvr.window = 0
	end
	local Target_2 = arg1.Target
	if not Target_2 then
		Target_2 = arg1.User
	end
	local User_3 = arg1.User
	if not User_3 then
		User_3 = arg1.Target
	end
	if User_7_upvr then
		if User_7_upvr:GetAttribute("NoCDmg") then
			if not User_7_upvr:GetAttribute("Physical") then
				Variables_upvr.cameraname = "Camera"
				-- KONSTANTWARNING: GOTO [710] #504
			end
		end
	end
	Variables_upvr.cameraname = {Target_2.PrimaryPart, User_3.PrimaryPart}
	if User_7_upvr then
		if User_7_upvr:GetAttribute("ZoomTarget") then
			Variables_upvr.cameraname = {Target_2.PrimaryPart, Target_2.PrimaryPart}
		end
	end
	if User_7_upvr then
		if User_7_upvr:GetAttribute("Zoom") then
			Variables_upvr.cameraname[3] = User_7_upvr:GetAttribute("Zoom")
		end
	end
	if User_7_upvr then
		if User_7_upvr:GetAttribute("CameraY") then
			Variables_upvr.cameraname[4] = User_7_upvr:GetAttribute("CameraY")
		end
	end
	Variables_upvr.babymark = false
	Variables_upvr.presstick = 0
	Variables_upvr.cutit = nil
	Variables_upvr.atick = tick()
	Variables_upvr.atktype = "press"
	Variables_upvr.promptuheld = nil
	Variables_upvr.prompturele = nil
	Variables_upvr.bpos = nil
	if User_7_upvr then
		if User_7_upvr:GetAttribute("Anim2") then
			Shucky_upvr:PlayAnim(arg1.User, User_7_upvr:GetAttribute("Anim2"))
		end
	end
	if arg1.Anim then
		Shucky_upvr:PlayAnim(arg1.User, arg1.Anim)
		if arg1.Wep then
			local SOME_6_upvr = game.ReplicatedFirst.SpecificParticles:FindFirstChild(arg1.Wep.Name)
		end
		if SOME_6_upvr then
			task.spawn(function() -- Line 351
				--[[ Upvalues[2]:
					[1]: SOME_6_upvr (readonly)
					[2]: arg1 (readonly)
				]]
				local PrimaryPart_5 = arg1.User.PrimaryPart
				if PrimaryPart_5 then
					PrimaryPart_5 = arg1.User.PrimaryPart.Parent
				end
				require(SOME_6_upvr).act(PrimaryPart_5)
			end)
		end
		if game.ReplicatedStorage.Particles.Moves:FindFirstChild(arg1.Anim) and arg1.User and arg1.User.PrimaryPart then
			local clone_2 = game.ReplicatedStorage.Particles.Moves[arg1.Anim]:Clone()
			clone_2.CFrame = CFrame.new(arg1.User.PrimaryPart.Position - Vector3.new(0, 3 * arg1.User.PrimaryPart.Size.Y / 2 - clone_2.Size.Y / 2, 0)) * clone_2.CFrame.Rotation
			clone_2.Parent = game.Workspace.BattleDump
			clone_2.Work.Disabled = false
		end
	end
	SOME_6_upvr = arg1.WeldWhat
	if SOME_6_upvr then
		SOME_6_upvr = arg1.WeldTime
		if SOME_6_upvr then
			SOME_6_upvr = arg1.User
			if SOME_6_upvr then
				SOME_6_upvr = arg1.User:FindFirstChild("Model")
				if SOME_6_upvr then
					SOME_6_upvr = Ambassador_upvr.Fire
					SOME_6_upvr("EquipWep", arg1.User.Model, game.ReplicatedFirst.BaseVisuals[arg1.WeldWhat])
					SOME_6_upvr = task.delay
					SOME_6_upvr(arg1.WeldTime, function() -- Line 361
						--[[ Upvalues[2]:
							[1]: Ambassador_upvr (copied, readonly)
							[2]: arg1 (readonly)
						]]
						Ambassador_upvr.Fire("EquipWep", arg1.User.Model)
					end)
				end
			end
		end
	end
	SOME_6_upvr = Variables_upvr
	SOME_6_upvr.curmsg = nil
	SOME_6_upvr = Variables_upvr
	SOME_6_upvr.bofa = nil
	if User_7_upvr then
		SOME_6_upvr = User_7_upvr:GetAttribute("StartSFX")
		if SOME_6_upvr then
			SOME_6_upvr = Variables_upvr
			SOME_6_upvr.bofa = game.Workspace.Sounds[User_7_upvr:GetAttribute("StartSFX")]
		end
	end
	SOME_6_upvr = arg1.User
	if SOME_6_upvr then
		SOME_6_upvr = arg1.User.PrimaryPart
		local var236
		if SOME_6_upvr then
			var236 = "ATKSFX_"
			SOME_6_upvr = var236..arg1.User.Name..'_'..User_7_upvr.Name
			local var237 = SOME_6_upvr
			var236 = game.Workspace.Sounds:FindFirstChild(var237)
			if not var236 then
				var236 = arg1.User.PrimaryPart:FindFirstChild(User_7_upvr.Name)
			end
			if var236 and var236.Parent ~= game.Workspace.Sounds then
				var236.Parent = game.Workspace.Sounds
				var236.Name = var237
			end
			if var236 then
				Variables_upvr.bofa = var236
			end
		end
	end
	if User_7_upvr then
		var237 = User_7_upvr:GetAttribute("Bubble")
		if var237 then
			var237 = Ambassador_upvr.Fire
			var237("BubbleChat", arg1.User, User_7_upvr:GetAttribute("Bubble"), User_7_upvr:GetAttribute("NoTalkSFX"))
		end
	end
	if User_7_upvr then
		var237 = User_7_upvr:GetAttribute("Dialog")
		if var237 then
			var237 = Ambassador_upvr.Fire
			var237("Narrate", "•"..Shucky_upvr.getname(arg1.User)..' '..User_7_upvr:GetAttribute("Dialog"))
			-- KONSTANTWARNING: GOTO [1202] #843
		end
	end
	if User_7_upvr then
		var237 = User_7_upvr:GetAttribute("Dialog2")
		if var237 then
			var237 = Ambassador_upvr.Fire
			var237("Narrate", "•"..User_7_upvr:GetAttribute("Dialog2"))
			-- KONSTANTWARNING: GOTO [1202] #843
		end
	end
	var237 = User_7_upvr:GetAttribute("FakeName")
	local function INLINED_5() -- Internal function, doesn't exist in bytecode
		var237 = arg1.User:GetAttribute("FakeCall")
		return var237
	end
	if not var237 and (User_7_upvr.Name ~= "Call for Help" or not INLINED_5()) then
		var237 = arg1.Move
	end
	if arg1.Target then
		if arg1.Target.Name ~= arg1.User.Name then
			if not arg1.Targets then
				Ambassador_upvr.Fire("Narrate", "•"..Shucky_upvr.getname(arg1.User).." used "..var237.." on "..Shucky_upvr.getname(arg1.Target)..'!')
				-- KONSTANTWARNING: GOTO [1202] #843
			end
		end
	end
	Ambassador_upvr.Fire("Narrate", "•"..Shucky_upvr.getname(arg1.User).." used "..var237..'!')
	var237 = User_7_upvr
	if var237 then
		var237 = User_7_upvr:GetAttribute("Move")
		local var238 = var237
	end
	local var239 = User_7_upvr
	if var239 then
		var239 = User_7_upvr:GetAttribute("StartAt")
	end
	if var239 then
		task.delay(var239, function() -- Line 390
			--[[ Upvalues[2]:
				[1]: User_7_upvr (readonly)
				[2]: arg1 (readonly)
			]]
			local var241 = User_7_upvr
			if var241 then
				var241 = User_7_upvr:GetAttribute("StartFX")
			end
			local SOME_7 = game.ReplicatedStorage.Particles:FindFirstChild(var241)
			if SOME_7 then
				local clone_11 = SOME_7:Clone()
				clone_11.CFrame = arg1.User.PrimaryPart.CFrame
				clone_11.Work.Disabled = false
				clone_11.Parent = game.Workspace.BattleDump
			end
		end)
	end
	if var238 then
		Ambassador_upvr.Fire("Move_"..var238, arg1)
	end
	-- KONSTANTERROR: [438] 306. Error Block 317 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [1231] 868. Error Block 193 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [1231] 868. Error Block 193 end (CF ANALYSIS FAILED)
end)
function mortal(arg1, arg2, arg3, arg4) -- Line 405
	--[[ Upvalues[2]:
		[1]: LocalPlayer_upvr (readonly)
		[2]: Ambassador_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	local Target_3 = arg1.Target
	local Damage = arg1.Damage
	arg1.mortal = nil
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [12] 9. Error Block 2 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [12] 9. Error Block 2 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [15] 11. Error Block 3 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [15] 11. Error Block 3 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [78] 59. Error Block 17 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [78] 59. Error Block 17 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [53] 40. Error Block 18 start (CF ANALYSIS FAILED)
	-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [89.1618]
	if Color3.fromRGB(255, 150, 0) == 255 then
		-- KONSTANTWARNING: GOTO [90] #69
	end
	-- KONSTANTERROR: [53] 40. Error Block 18 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [90] 69. Error Block 16 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	do
		return arg1, "•"..Target_3.Name.." barely survived!", Color3.fromRGB(255, 150, 0)
	end
	-- KONSTANTERROR: [90] 69. Error Block 16 end (CF ANALYSIS FAILED)
end
function hurt(arg1, arg2, arg3) -- Line 428
	--[[ Upvalues[1]:
		[1]: Shucky_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 50 start (CF ANALYSIS FAILED)
	Shucky_upvr:StopAnim(arg1, "Dodge")
	Shucky_upvr:StopAnim(arg1, "Counter")
	Shucky_upvr:StopAnim(arg1, "Block")
	arg1:SetAttribute("BlockTimer", nil)
	if arg1.TurnStat:GetAttribute("Sleep") then
		if arg1:FindFirstChild("Model") and arg1.Model:FindFirstChild("Anims") and arg1.Model.Anims:FindFirstChild("SleepHurt") then
			Shucky_upvr:PlayAnim(arg1, "SleepHurt")
			-- KONSTANTWARNING: GOTO [163] #127
		end
	end
	if 0 < (arg1.TurnStat:GetAttribute("Defense") or 0) and arg1:FindFirstChild("Model") and arg1.Model:FindFirstChild("Anims") and arg1.Model.Anims:FindFirstChild("DefenseHurt") then
		Shucky_upvr:PlayAnim(arg1, "DefenseHurt")
		-- KONSTANTWARNING: GOTO [163] #127
	end
	-- KONSTANTERROR: [0] 1. Error Block 50 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [96] 74. Error Block 46 start (CF ANALYSIS FAILED)
	if arg1:GetAttribute("DefenselessV") and arg1:FindFirstChild("Model") and arg1.Model:FindFirstChild("Anims") and arg1.Model.Anims:FindFirstChild("DefenselessHurt") then
		Shucky_upvr:PlayAnim(arg1, "DefenselessHurt")
		-- KONSTANTWARNING: GOTO [163] #127
	end
	-- KONSTANTERROR: [96] 74. Error Block 46 end (CF ANALYSIS FAILED)
end
Ambassador_upvr.HookEvent("HurtABro", hurt)
local tbl_16_upvr = {
	Bomb = true;
	Rocket = true;
	["Rocket Boots"] = true;
	Sling = true;
}
function visualdmg(arg1, arg2, arg3, arg4, arg5, arg6) -- Line 465
	--[[ Upvalues[5]:
		[1]: tbl_16_upvr (readonly)
		[2]: HttpService_upvr (readonly)
		[3]: Shucky_upvr (readonly)
		[4]: Ambassador_upvr (readonly)
		[5]: LocalPlayer_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local Target_4 = arg1.Target
	local Damage_3 = arg1.Damage
	local User_6 = arg1.User
	local var272 = "enemyhit"
	if User_6 then
		if arg4 and arg4:GetAttribute("Visual") == "Ball" then
			var272 = "enemyballhit_"..User_6:GetAttribute("Ball")
		elseif arg4 and string.sub(arg4:GetAttribute("Visual") or "", 1, 5) == "Sword" and not arg4:GetAttribute("Independent") then
			var272 = "enemyswordhit_"..User_6:GetAttribute("Sword")
		end
	end
	if var272 ~= "enemyhit" or arg4 and arg4:GetAttribute("Visual") and tbl_16_upvr[arg4:GetAttribute("Visual")] or User_6 and User_6:GetAttribute("HitSounds") then
		for i, v in HttpService_upvr:JSONDecode(User_6:GetAttribute("HitSounds")), nil do
			if Target_4 and Target_4.PrimaryPart then
				Shucky_upvr:PlayParticle(v.."BadgeFX", Target_4.PrimaryPart.Position + Vector3.new(0, 0, 2))
			end
			game.Workspace.Sounds[v]:Play()
		end
	end
	local var273
	local function INLINED_8() -- Internal function, doesn't exist in bytecode
		var273 = var272
		return var273
	end
	if 0 < Damage_3 and (not arg2 or not INLINED_8()) then
		var273 = not arg2 and "bump"
	end
	if arg1.dodge == "super" then
	elseif arg1.dodge then
	elseif Damage_3 <= 0 and arg4 then
		i = "Move"
		if arg4:GetAttribute(i) == "Item" then
			i = "Revive"
			if arg4:GetAttribute(i) then
			else
			end
			-- KONSTANTWARNING: GOTO [149] #116
		end
	end
	var273 = var273
	if var273 == "guard" and Shucky_upvr.isdodgy(arg1.Target) then
		var273 = "dodge"
	end
	if arg1.mortal then
		var273 = "MortalDamage"
	end
	if arg4 and arg4:GetAttribute("Move") == "Item" and Damage_3 == 0 and not arg4:GetAttribute("GiveSP") then
		var273 = nil
	end
	if arg4 and arg4:GetAttribute("SoundOnHit") then
		v = "SoundOnHit"
		local SOME_4 = game.Workspace.Sounds:FindFirstChild(arg4:GetAttribute(v))
		if SOME_4 then
			SOME_4:Play()
		end
	end
	if arg1.status then
		i = arg1.status
		v = "Hit"
		if game.Workspace.Sounds:FindFirstChild(i..v) then
			var273 = arg1.status.."Hit"
		end
	end
	if var273 then
		if Target_4 and Target_4.PrimaryPart then
			local Position_3 = Target_4.PrimaryPart.Position
		end
		if var273 == "MortalDamage" and Position_3 then
			i = "MortalWound"
			v = Position_3
			Shucky_upvr:PlayParticle(i, v)
		end
		if var273 == "guard" and Position_3 then
			i = "Defend"
			v = Position_3
			Shucky_upvr:PlayParticle(i, v)
		end
		v = game
		i = v.Workspace
		i.Sounds[var273]:Play()
	end
	if not Target_4:GetAttribute("Player") and Damage_3 and 0 < Damage_3 then
		v = Target_4:GetAttribute("VHP") - Damage_3
		i = math.clamp(v, 0, Target_4:GetAttribute("MHP"))
		Target_4:SetAttribute("VHP", i)
	end
	if 0 < math.abs(Damage_3) then
		if 0 < Damage_3 and not arg5 then
			i = arg1.mortal
			hurt(Target_4, Damage_3, i)
		end
		if 0 < Damage_3 and Target_4 and Target_4.PrimaryPart then
			i = '-'
			v = Damage_3
			v = Target_4.PrimaryPart
			i = v.Position
			v = nil
			Ambassador_upvr.Fire("DMGNUM", i..v, i, v, Target_4, arg4)
		end
		if User_6 and User_6:FindFirstChild("TurnStat") and User_6.TurnStat:GetAttribute("Greed") and 0 < Damage_3 and Target_4 and Target_4.PrimaryPart then
			local function INLINED_9() -- Internal function, doesn't exist in bytecode
				i = arg4:GetAttribute("Damage")
				return i
			end
			if not arg4 or not INLINED_9() then
				i = 0
			end
			i = "losemoney"
			v = Target_4.PrimaryPart.Position
			Shucky_upvr:PlayParticle(i, v, math.clamp(Damage_3, 0, i))
		end
		if Target_4:GetAttribute("Player") and 0 < Damage_3 then
			i = LocalPlayer_upvr
			if Target_4.Name == i.Name then
			end
			i = Target_4.Name
			v = Damage_3
			Ambassador_upvr.Fire("ShakeDeez", i, v, 0.25)
		end
	end
	if arg3 ~= "" then
		i = nil
		v = arg6
		Ambassador_upvr.Fire("Narrate", arg3, i, v)
	end
end
function deepCopy(arg1) -- Line 524
	local module = {}
	for i_2, v_2 in arg1 do
		if type(v_2) == "table" then
			v_2 = deepCopy(v_2)
		end
		module[i_2] = v_2
	end
	return module
end
Ambassador_upvr.HookEvent("DamageNumber", function(arg1) -- Line 533
	--[[ Upvalues[5]:
		[1]: Ambassador_upvr (readonly)
		[2]: Shucky_upvr (readonly)
		[3]: Shucky_upvr (readonly)
		[4]: Variables_upvr (readonly)
		[5]: Network_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 133 start (CF ANALYSIS FAILED)
	local var281
	local function INLINED_10() -- Internal function, doesn't exist in bytecode
		var281 = game.ReplicatedStorage.Moves:FindFirstChild(arg1.Move):GetAttribute("Visual")
		return var281
	end
	if not game.ReplicatedStorage.Moves:FindFirstChild(arg1.Move) or not INLINED_10() then
		var281 = ""
	end
	Ambassador_upvr.Fire("VisualHit_"..var281, arg1)
	-- KONSTANTERROR: [0] 1. Error Block 133 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [42] 29. Error Block 6 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [42] 29. Error Block 6 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [45] 31. Error Block 7 start (CF ANALYSIS FAILED)
	var281 = arg1
	-- KONSTANTERROR: [45] 31. Error Block 7 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [49] 34. Error Block 8 start (CF ANALYSIS FAILED)
	var281 = nil
	arg1.Bruh = false
	-- KONSTANTERROR: [49] 34. Error Block 8 end (CF ANALYSIS FAILED)
end)
Network_upvr.HookEvent("DamageDeez", function(arg1) -- Line 691
	local var283
	local var284 = ""
	local var285
	if not arg1.status then
		local mortal_result1, mortal_result2, mortal_result3 = mortal(var285, var284, var285.shp, var283)
		var285 = mortal_result1
		var284 = mortal_result2
		var283 = mortal_result3
	end
	visualdmg(var285, not (arg1.Target:GetAttribute("Player") or false), var284, arg1.Wep, nil, var283)
end)
function repl(arg1) -- Line 703
	--[[ Upvalues[2]:
		[1]: Variables_upvr (readonly)
		[2]: Network_upvr (readonly)
	]]
	table.insert(Variables_upvr.inputs, arg1)
	Network_upvr.FireServer("Input", arg1)
end
local var290_upvw = 0
task.spawn(function() -- Line 710
	--[[ Upvalues[2]:
		[1]: Variables_upvr (readonly)
		[2]: var290_upvw (read and write)
	]]
	while true do
		task.wait(0.01)
		if Variables_upvr.faker and Variables_upvr.faker:GetAttribute("Blessed") and Variables_upvr.myturn and not Variables_upvr.itsme and Variables_upvr.arena and Variables_upvr.arena:GetAttribute("State") == "Attacking" and Variables_upvr.atktype == "press" then
			local var295
			if 0 < var295 then
				var295 = Variables_upvr.timehere
				if not var295 then
					var295 = Variables_upvr.impact
				end
				if var295 then
					local var296 = tick() - (Variables_upvr.atick or 0)
					if var295 - Variables_upvr.window <= var296 and var296 < var295 and 0.2 < tick() - var290_upvw then
						var290_upvw = tick()
						local tbl_3 = {'A'}
						if Variables_upvr.faker:FindFirstChild("TurnStat") and not Variables_upvr.faker.TurnStat:GetAttribute("Big") and not Variables_upvr.faker:GetAttribute("NoSG") and Variables_upvr.mymove and not Variables_upvr.mymove:GetAttribute("NoSG") then
							tbl_3 = {'B'}
						end
						repl(tbl_3)
					end
				end
			end
		end
	end
end)
local var299_upvw = 0
function input(arg1, arg2) -- Line 743
	--[[ Upvalues[2]:
		[1]: Variables_upvr (readonly)
		[2]: var299_upvw (read and write)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var310
	if Variables_upvr.myturn then
		var310 = Variables_upvr
		if var310.arena then
			var310 = Variables_upvr
			if var310.arena:GetAttribute("State") == "Attacking" then
				-- KONSTANTWARNING: GOTO [19] #15
			end
		end
	end
	do
		return
	end
	var310 = tick()
	local var311 = var310 - (Variables_upvr.atick or 0)
	var310 = Variables_upvr.timehere
	if not var310 then
		var310 = Variables_upvr.impact
	end
	if Variables_upvr.atktype == "press" then
		if var311 < var310 and arg2 == "down" then
			if tick() - Variables_upvr.presstick <= 0.2 then
				if 0.1 < tick() - Variables_upvr.presstick then
					game.Workspace.Sounds.Error:Play()
				end
				Variables_upvr.presstick = tick()
				return
			end
		end
		if Variables_upvr.window <= 0 then
			do
				return
			end
			-- KONSTANTWARNING: GOTO [136] #96
		end
	elseif Variables_upvr.atktype == "mash" then
		if Variables_upvr.filled and arg2 == "down" then
			if tick() - var299_upvw <= 0.05 then return end
			var299_upvw = tick()
			local var312 = Variables_upvr
			var312.filled += (16) * (Variables_upvr.window / 0.2)
			if 100 < Variables_upvr.filled then
				Variables_upvr.filled = 100
			end
		end
		return
	end
	if arg1 == 'A' then
		local var313
		if nil == "press" and arg2 == "down" then
			local var314 = nil
			if var314 then
				var314 = Variables_upvr.arena:GetAttribute("Freeze")
			end
			if var311 < var310 or var314 then
				if var310 - Variables_upvr.window <= var311 then
					local var315
					if var314 and not Variables_upvr.itsme then
						var315 = 'B'
					else
						var315 = 'A'
					end
					;({})[1] = var315
					var315 = Variables_upvr.faker
					if var315 then
						var315 = Variables_upvr.faker:FindFirstChild("TurnStat")
						if var315 then
							var315 = Variables_upvr.faker.TurnStat:GetAttribute("Big")
							if not var315 then
								var315 = Variables_upvr.faker:GetAttribute("NoSG")
								if not var315 then
									var315 = Variables_upvr.mymove
									if var315 then
										var315 = Variables_upvr.mymove:GetAttribute("NoSG")
										if not var315 then
											var315 = Variables_upvr.window / 2
											if var310 - var315 <= var311 and not Variables_upvr.itsme then
											end
										end
									end
								end
							end
						end
					end
					var315 = repl
					var315({'B'})
				else
					var315 = game.Workspace.Sounds
					var315.Error:Play()
				end
			end
			Variables_upvr.presstick = tick()
			return
		end
		if Variables_upvr.atktype == "hold" then
			if arg2 == "down" and Variables_upvr.holdfrom <= var311 and var311 <= Variables_upvr.holdfrom + Variables_upvr.holdtimeout then
				if Variables_upvr.promptuheld then
				else
					repl({'A', var311})
					Variables_upvr.promptuheld = var311
				end
			end
			if arg2 == "up" and Variables_upvr.promptuheld and var311 <= Variables_upvr.promptuheld + Variables_upvr.holdingtime then
				if Variables_upvr.prompturele then return end
				repl({"Aup", var311})
				Variables_upvr.prompturele = var311
			end
		end
	end
end
Ambassador_upvr.HookEvent("PromptTiming", function(arg1, arg2) -- Line 797
	--[[ Upvalues[3]:
		[1]: Variables_upvr (readonly)
		[2]: Ambassador_upvr (readonly)
		[3]: Shucky_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [8] 7. Error Block 3 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [8] 7. Error Block 3 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [16] 13. Error Block 4 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [16] 13. Error Block 4 end (CF ANALYSIS FAILED)
end)
Ambassador_upvr.HookEvent("ButtonA", function(arg1) -- Line 819
	input('A', arg1)
end)
Ambassador_upvr.HookEvent("ButtonB", function(arg1) -- Line 823
	input('A', arg1)
end)
Ambassador_upvr.HookEvent("ButtonZ", function(arg1) -- Line 827
	input('A', arg1)
end)
Ambassador_upvr.HookEvent("EquipWep", function(arg1, arg2, arg3, arg4) -- Line 832
	--[[ Upvalues[1]:
		[1]: Shucky_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [31] 23. Error Block 8 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [31] 23. Error Block 8 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [33] 25. Error Block 72 start (CF ANALYSIS FAILED)
	if not arg2 then
		-- KONSTANTERROR: [35] 27. Error Block 65 start (CF ANALYSIS FAILED)
		local clone_6 = arg2:clone()
		-- KONSTANTERROR: [35] 27. Error Block 65 end (CF ANALYSIS FAILED)
	end
	clone_6.Parent = arg1
	clone_6.Name = "Weapon"
	local any_GetScale_result1 = arg1:GetScale()
	Shucky_upvr.scaleit(clone_6, arg1)
	local var326
	if var326 then
		var326 = arg1:SetAttribute
		var326("LastSword", tick())
	end
	var326 = arg1:FindFirstChild("Head")
	if var326 then
		var326 = arg1.Head.LocalTransparencyModifier
		clone_6.LocalTransparencyModifier = var326
	end
	local function INLINED_11() -- Internal function, doesn't exist in bytecode
		var326 = arg1.Parent
		return var326
	end
	if not arg1 or not arg1.Parent or not arg1.Parent:IsA("Actor") or not INLINED_11() then
		var326 = arg1
	end
	if not var326:GetAttribute("WeldTo") or not arg1:FindFirstChild(var326:GetAttribute("WeldTo")) then
	end
	local var327
	if arg2:GetAttribute("Bruh") and not arg4 and var327 and var327.Name == "Gun" then
		var327 = nil
	end
	if arg2:GetAttribute("WeldTo") then
		var327 = arg1:FindFirstChild(arg2:GetAttribute("WeldTo"))
	end
	if var327 == nil then
		local Right_Arm = arg1:FindFirstChild("Right Arm")
		if not Right_Arm then
			Right_Arm = arg1.PrimaryPart
		end
		var327 = Right_Arm
	end
	Right_Arm = false
	local var329 = Right_Arm
	if clone_6:FindFirstChild("BWeld") then
		if arg1 and arg1.Parent and arg1.Parent:GetAttribute("Player") then
			clone_6.Name = arg2.Name
			clone_6.RWeld:Destroy()
			clone_6.BWeld.Part0 = arg1[clone_6:GetAttribute("BWeldTo") or "HumanoidRootPart"]
			clone_6.BWeld.Name = "RWeld"
			var329 = true
		else
			clone_6.BWeld:Destroy()
		end
	end
	if arg4 and clone_6:FindFirstChild("RWeld2") then
		clone_6.RWeld:Destroy()
		clone_6.RWeld2.Name = "RWeld"
	end
	clone_6.RWeld.C0 = CFrame.new(clone_6.RWeld.C0.Position * any_GetScale_result1) * clone_6.RWeld.C0.Rotation
	clone_6.RWeld.C1 = CFrame.new(clone_6.RWeld.C1.Position * any_GetScale_result1) * clone_6.RWeld.C1.Rotation
	if var329 then
	else
		clone_6.RWeld.Part0 = var327
		-- KONSTANTERROR: [33] 25. Error Block 72 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [251] 175. Error Block 51 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [251] 175. Error Block 51 end (CF ANALYSIS FAILED)
	end
end)
Ambassador_upvr.HookEvent("EndMove", function(arg1) -- Line 875
	--[[ Upvalues[2]:
		[1]: Variables_upvr (readonly)
		[2]: Network_upvr (readonly)
	]]
	if 0 < Variables_upvr.window or Variables_upvr.ignore then
		if Variables_upvr.myturn and Variables_upvr.arena and Variables_upvr.arena:GetAttribute("State") == "Attacking" and Variables_upvr.moveid == arg1.moveid then
			Network_upvr.FireServer("EndMove", arg1.moveid)
		end
	end
end)
Ambassador_upvr.HookEvent("BMoveTo", function(arg1, arg2) -- Line 881
	--[[ Upvalues[1]:
		[1]: Variables_upvr (readonly)
	]]
	if arg2 then
		if arg2:GetAttribute("Player") then
		end
		if Variables_upvr.bpos then
		end
		if arg2:GetAttribute("BallX") then
			local _ = Variables_upvr.bpos + Vector3.new(arg2:GetAttribute("BallX"), 0, 0)
		end
		local var333
		if arg2 and arg2:GetAttribute("MTB") then
			var333 += arg2:GetAttribute("MTB")
		end
		var333 *= arg1:GetAttribute("MyScale") or 1
		local Friendly_2 = arg2:GetAttribute("Friendly")
		if not Friendly_2 then
			Friendly_2 = arg2:GetAttribute("Player")
		end
		local Friendly = arg1:GetAttribute("Friendly")
		if not Friendly then
			Friendly = arg1:GetAttribute("Player")
		end
		if Friendly_2 == Friendly then
		end
		arg1:SetAttribute("LookV", arg1:GetAttribute("BattleLookV"))
		arg1:SetAttribute("Pos", arg2:GetAttribute("BattlePos") + Vector3.new(3, 0, 0))
	else
		arg1:SetAttribute("LookV", arg1:GetAttribute("BattleLookV"))
		arg1:SetAttribute("Pos", arg1:GetAttribute("BattlePos"))
	end
end)
Network_upvr.HookEvent("DamageNumber", function(arg1) -- Line 902
	--[[ Upvalues[1]:
		[1]: Ambassador_upvr (readonly)
	]]
	arg1.atme = false
	arg1.itsme = false
	Ambassador_upvr.Fire("DamageNumber", arg1)
end)
Network_upvr.HookEvent("ActItem", function(arg1) -- Line 908
	--[[ Upvalues[1]:
		[1]: Shucky_upvr (readonly)
	]]
	Shucky_upvr:ActItem(arg1)
end)
