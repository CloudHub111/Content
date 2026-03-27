game:GetService("ReplicatedStorage")
local v_u_1 = game:GetService("TweenService")
local v_u_2 = game:GetService("RunService")
local v_u_3 = game:GetService("Players")
require(game.ReplicatedStorage.Modules.AnimationUtil)
local v_u_4 = require(game.ReplicatedStorage.Modules.WeaponData)
local v_u_5 = require(game.ReplicatedStorage.Modules.Flags)
local v_u_6 = require(game.ReplicatedStorage.Modules.Net)
local v_u_7 = require(game.ReplicatedStorage.Modules.Part.GetBoundingBoxCustom)
local v_u_8 = require(game.ReplicatedStorage.Modules.Part.GetCornersOfPart)
local v_u_9 = {}
local v_u_10 = game.Players.LocalPlayer
local v_u_11 = workspace.Enemies
local v_u_12 = workspace.Characters
local v_u_13 = require(game.ReplicatedStorage.Util.WrapHighlight)
local v_u_14 = v_u_2:IsServer()
local v_u_15 = {}
local v_u_16 = nil
local v_u_17 = nil
task.defer(function()
	-- upvalues: (ref) v_u_16, (ref) v_u_17, (copy) v_u_15, (copy) v_u_6
	v_u_16 = require(game.ReplicatedStorage.Util)
	v_u_17 = require(script.Particle)
	v_u_15.RegisterHitEvent = v_u_6:RemoteEvent("RegisterHit", true)
	v_u_15.ReceivedHit = v_u_6:RemoteEvent("ReceivedHit")
end)
function v_u_9.GetPureWeaponName(_, p18)
	return string.lower(string.gsub(p18, "%s", ""))
end
function v_u_9.GetComboPaddingTime(_)
	return 0.3
end
function v_u_9.GetDefaultAOEDelay(_)
	return 0.35
end
function v_u_9.GetAttackCancelMultiplier(_)
	return 0.8
end
local v_u_19 = require(game.ReplicatedStorage.Util.IsTransformed)
function v_u_9.HasRigEquipped(_, p20)
	-- upvalues: (copy) v_u_19
	if p20:FindFirstChild("HumanoidRootPart") and p20.HumanoidRootPart:FindFirstChild("Buddha") then
		return false
	else
		return v_u_19(p20, false, false)
	end
end
function v_u_9.CanAttack(_, p21, p22)
	-- upvalues: (copy) v_u_9
	if (_G.tapCooldown or 0) > os.clock() then
		return
	else
		local v23
		if p21 then
			v23 = p21:FindFirstChildWhichIsA("Humanoid")
		else
			v23 = p21
		end
		if v23 and v23.Health > 0 then
			local v24 = p21:FindFirstChild("Stun")
			local v25 = p21:FindFirstChild("Busy")
			if v23.Sit and (p22 == "Sword" or (p22 == "Melee" or p22 == "Gun")) then
				return
			elseif (not v24 or v24.Value <= 0) and not (v25 and v25.Value) then
				if not v_u_9:HasRigEquipped(p21) then
					return true
				end
			end
		else
			return
		end
	end
end
function v_u_9.IsVulnerable(_, p26)
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	if p26 then
		local v27
		if p26 then
			v27 = p26:FindFirstChildWhichIsA("Humanoid")
		else
			v27 = p26
		end
		local v28 = v27.Health > 0
		if v_u_2:IsServer() then
			local v29 = _G.getWrappedPlayer(v_u_3:GetPlayerFromCharacter(p26))
			if v29 and v29:dodging() then
				return false
			end
		end
		return v28
	end
end
function v_u_9.GetRigOfHitPart(_, p30)
	-- upvalues: (copy) v_u_11, (copy) v_u_12
	local v31 = p30:FindFirstAncestorWhichIsA("Tool")
	if v31 then
		return v31.Parent
	end
	for _, v32 in { v_u_11, v_u_12 } do
		for _, v33 in v32:GetChildren() do
			if p30:IsDescendantOf(v33) then
				return v33
			end
		end
	end
end
local v_u_34 = v_u_17
local v_u_35 = v_u_16
local v_u_36 = {}
local v_u_37 = false
local v_u_38 = nil
for _, v39 in {
	"RightUpperArm",
	"RightLowerArm",
	"RightHand",
	"RightUpperLeg",
	"RightLowerLeg",
	"RightFoot",
	"LeftUpperArm",
	"LeftLowerArm",
	"LeftHand",
	"LeftUpperLeg",
	"LeftLowerLeg",
	"LeftFoot",
	"UpperTorso",
	"LowerTorso",
	"Head",
	"ModelHitbox"
} do
	v_u_36[v39] = true
end
function removeFromTableBackwards(p40, p41)
	while true do
		local v42 = table.find(p40, p41)
		if v42 then
			table.remove(p40, v42)
		end
		if not v42 then
			return
		end
	end
end
function v_u_9.GetHitDetectionParams(_)
	-- upvalues: (ref) v_u_37, (ref) v_u_38, (copy) v_u_12, (copy) v_u_11
	if v_u_37 then
		return v_u_38
	end
	v_u_38 = OverlapParams.new()
	v_u_38.FilterType = Enum.RaycastFilterType.Include
	v_u_38.FilterDescendantsInstances = { v_u_12, v_u_11 }
	v_u_37 = true
	return v_u_38
end
local v_u_43 = {}
function v_u_9.ToggleLoadMovesetAnims(_, p44, p45, p46)
	-- upvalues: (copy) v_u_9, (copy) v_u_43, (ref) v_u_35
	for v47, v48 in p45.WeaponType == "Gun" and p45.Moveset or p45.Moveset.Basic do
		local v49
		if p45.Moveset.Basic then
			v49 = v_u_9:GetPureWeaponName(p45.Name) .. "-basic" .. v47
		else
			v49 = v_u_9:GetPureWeaponName(p45.Name) .. "-" .. v47
		end
		if p46 then
			if not v_u_43[p44] then
				v_u_43[p44] = {}
			end
			local v50 = v48.Looped
			local v51 = v_u_35.Anims:Get(p44.Parent, v48.AnimationId)
			if v51 then
				v51._Object.Name = v49
				if string.match(v49, "Idle") then
					v51._Object.Looped = true
				else
					v51._Object.Looped = v50
					v51._Object.Priority = Enum.AnimationPriority.Action
					v51._Object:SetAttribute("SpeedMult", v48.SpeedMult)
				end
				v_u_43[p44][v49] = v51
			end
		elseif v_u_43[p44] then
			local v52 = v_u_43[p44][v49]
			if v52 then
				v52:Stop()
				if typeof(v52) == "Instance" then
					v52:Destroy()
				else
					v52.Animation:Destroy()
				end
			end
			v_u_43[p44][v49] = nil
			if not next(v_u_43[p44]) then
				v_u_43[p44] = nil
			end
		end
	end
end
function v_u_9.GetMovesetAnimCache(_, p53)
	-- upvalues: (copy) v_u_43
	return v_u_43[p53]
end
function v_u_9.GetLoadedAnimsFor(_, p54, p55)
	-- upvalues: (copy) v_u_9
	local v56 = v_u_9:GetPureWeaponName(p54)
	local v57 = {}
	local v58 = v_u_9:GetMovesetAnimCache(p55)
	if v58 then
		for v59, v60 in v58 do
			local v61, v62 = string.match(v59, "(.+)-(.+)")
			if v61 == v56 then
				v57[v62] = v60
			end
		end
	end
	return v57
end
function v_u_9.AttackStart(_, p63, p_u_64)
	-- upvalues: (copy) v_u_9, (copy) v_u_11, (copy) v_u_10, (ref) v_u_35
	if p63 and p63.Parent then
		local v_u_65 = p63.Parent:FindFirstChild("Humanoid")
		local v_u_66
		if v_u_65 then
			v_u_66 = v_u_65.RootPart
		else
			v_u_66 = v_u_65
		end
		local v_u_67
		if v_u_66 then
			v_u_67 = v_u_66.Parent
		else
			v_u_67 = v_u_66
		end
		if v_u_67 then
			local v_u_68 = require(game.ReplicatedStorage.Effect)
			local v_u_69 = v_u_67:FindFirstChild("EquippedWeapon")
			local v70 = v_u_9:GetWeaponName(v_u_69 or p63)
			local v_u_71 = v_u_9:GetPureWeaponName(v70)
			local v_u_72 = v_u_9:GetWeaponData(v70)
			local v73 = v_u_72.Moveset
			local v74 = v73.Basic
			local v75 = ("Couldn\'t find the \'Basic\' moveset for %*"):format(v70)
			assert(v74, v75)
			local v_u_76 = v73.Basic[p_u_64]
			local v77 = v_u_72.VFXDelay or v_u_76.VFXDelay
			local v78 = v_u_67:IsDescendantOf(v_u_11)
			if v_u_69 then
				for _, v_u_79 in v_u_69:GetDescendants() do
					if v_u_79:IsA("Trail") and v_u_71 ~= "dragontalon" then
						v_u_79.Enabled = true
					elseif v_u_79.Name == "HitEffect" and v_u_79:IsA("ParticleEmitter") then
						task.delay(v77 or 0.25, function()
							-- upvalues: (copy) v_u_79
							v_u_79:Emit(v_u_79:GetAttribute("EmitCount") or 1)
						end)
					end
				end
				local v80 = v_u_10
				if v80 then
					v80 = v_u_67 ~= v_u_10.Character
				end
				if v78 or v80 then
					task.delay(0.75, function()
						-- upvalues: (copy) v_u_69
						for _, v81 in v_u_69:GetDescendants() do
							if v81:IsA("Trail") then
								v81.Enabled = false
							end
						end
					end)
				end
			end
			if v_u_71 == "superhuman" or v_u_71 == "godhuman" then
				task.delay(0.25, function()
					-- upvalues: (copy) v_u_68, (copy) v_u_67, (copy) v_u_71
					v_u_68.new("Chop.Punch"):play({
						["Character"] = v_u_67,
						["God"] = v_u_71 == "godhuman"
					})
				end)
			elseif v_u_71 == "divineart" then
				task.defer(function()
					-- upvalues: (copy) v_u_68, (copy) v_u_66, (copy) p_u_64
					local v82 = {
						["hrp"] = v_u_66,
						["index"] = p_u_64
					}
					v_u_68.new("Angel.M1"):play(v82)
				end)
			elseif v_u_71 == "flail" then
				task.delay(0.3, function()
					-- upvalues: (copy) v_u_68, (copy) v_u_67
					local v83 = {
						["Character"] = v_u_67,
						["God"] = true
					}
					v_u_68.new("Chop.Punch"):play(v83)
				end)
			elseif v_u_71 == "dragontalon" then
				task.defer(function()
					-- upvalues: (copy) v_u_68, (copy) v_u_66, (copy) p_u_64
					task.delay(0.25, function()
						-- upvalues: (ref) v_u_68, (ref) v_u_66, (ref) p_u_64
						local v84 = {
							["Root"] = v_u_66,
							["Index"] = p_u_64
						}
						v_u_68.new("DragonTalon.M1"):play(v84)
					end)
				end)
			elseif v_u_71 == "sanguineart" then
				task.defer(function()
					-- upvalues: (copy) v_u_68, (copy) v_u_66, (copy) p_u_64
					local v85 = {
						["Root"] = v_u_66,
						["Combo"] = p_u_64
					}
					v_u_68.new("Ghoul.M1"):play(v85)
				end)
			elseif v_u_71 == "sharkmankarate" then
				task.defer(function()
					-- upvalues: (copy) v_u_68, (copy) v_u_67, (copy) v_u_65, (copy) p_u_64
					local v86 = {
						["Character"] = v_u_67,
						["Humanoid"] = v_u_65,
						["Combo"] = p_u_64
					}
					v_u_68.new("Sharkman2.M1"):play(v86)
				end)
			elseif v_u_71 == "fishmankarate" then
				task.defer(function()
					-- upvalues: (copy) v_u_68, (copy) v_u_67, (copy) v_u_65, (copy) p_u_64
					local v87 = {
						["Character"] = v_u_67,
						["Humanoid"] = v_u_65,
						["Combo"] = p_u_64
					}
					v_u_68.new("WaterKungfu.M1"):play(v87)
				end)
			elseif v_u_71 == "anchor" then
				task.defer(function()
					-- upvalues: (copy) v_u_69, (copy) p_u_64, (ref) v_u_35, (copy) v_u_67, (ref) v_u_10
					local v88 = Instance.new("Animation")
					v88.AnimationId = "rbxassetid://14798724768"
					local v89 = Instance.new("Animation")
					v89.AnimationId = "rbxassetid://14798726082"
					local v90 = Instance.new("Animation")
					v90.AnimationId = "rbxassetid://14798728487"
					local v91 = Instance.new("Animation")
					v91.AnimationId = "rbxassetid://14798729807"
					v_u_69.Right.Anchor.AnimationController:LoadAnimation(({
						v88,
						v89,
						v90,
						v91
					})[p_u_64]):Play()
					task.delay(0.2, function()
						-- upvalues: (ref) v_u_35, (ref) v_u_67
						v_u_35.Sound:Play("SwordSwing", v_u_67.HumanoidRootPart)
					end)
					if p_u_64 == 4 and v_u_67 == v_u_10.Character then
						task.delay(0.2, function()
							-- upvalues: (ref) v_u_35, (ref) v_u_67
							v_u_35.BodyMover.new(v_u_67):Create("BodyVelocity", {
								["Velocity"] = v_u_67.HumanoidRootPart.CFrame.lookVector * 100,
								["Duration"] = 0.15
							})
						end)
					end
				end)
			end
			local v92 = v_u_76.PushDelay
			local v_u_93 = v_u_76.PushForce
			if v92 or v_u_93 then
				task.delay(v92 or 0.2, function()
					-- upvalues: (ref) v_u_35, (copy) v_u_67, (copy) v_u_66, (copy) v_u_93
					v_u_35.BodyMover.new(v_u_67):Create("BodyVelocity", {
						["Velocity"] = v_u_66.CFrame.LookVector * v_u_93,
						["Duration"] = 0.15
					})
				end)
			end
			task.delay(v92 or 0.2, function()
				-- upvalues: (ref) v_u_35, (copy) v_u_72, (copy) v_u_66
				v_u_35.Sound:Play(v_u_72.SwingSound or "SwordSwing", v_u_66)
			end)
			local v94 = v_u_76.AOEDelay
			local v_u_95 = v_u_76.AOEDistanceFromCharacter
			if (v94 or v_u_95) and not v_u_76.CustomAOEVFX then
				task.delay(v94 or v_u_9:GetDefaultAOEDelay(), function()
					-- upvalues: (ref) v_u_35, (copy) v_u_66, (copy) v_u_95, (ref) v_u_11, (copy) v_u_76, (copy) v_u_68, (copy) v_u_67
					local v96 = v_u_35.Ray
					local v97 = v_u_66.CFrame
					local v98 = -(v_u_95 or 7.5)
					local v99, v100 = v96(v97 * Vector3.new(0, 0, v98), Vector3.new(0, -4, 0), { workspace.Characters, v_u_11 })
					if v99 and not v_u_76.CustomAOEEffect then
						local v101 = {
							["Character"] = v_u_67,
							["PreviousPosition"] = nil,
							["Position"] = v100
						}
						v_u_68.new("Rubber.Transformed.Axe"):play(v101)
					end
				end)
			end
		end
	else
		return
	end
end
function v_u_9.CanCharacterMeleeAoe(_, p102)
	if p102 then
		p102 = p102:FindFirstChild("HumanoidRootPart")
	end
	if p102 then
		p102 = p102:FindFirstChild("Buddha")
	end
	return p102 and 10 or 1
end
local v_u_111 = coroutine.create(function()
	-- upvalues: (copy) v_u_15
	local v109, v110 = pcall(function()
		-- upvalues: (ref) v_u_15
		repeat
			task.wait()
		until v_u_15.RegisterHitEvent
		local v103 = game.Players.LocalPlayer.UserId
		local v104 = tostring(v103):sub(2, 4)
		local v105 = coroutine.running
		local v106 = v104 .. tostring(v105()):sub(11, 15)
		v_u_15.RegisterHitEvent:FireServer(v106)
		while true do
			local v107, v108 = coroutine.yield()
			v_u_15.RegisterHitEvent:FireServer(v107, v108, nil, v106)
		end
	end)
	if not v109 then
		warn(v110)
	end
end)
if not v_u_14 then
	function _G.checkHits() end
	function _G.SendHitsToServer(...)
		-- upvalues: (copy) v_u_111
		_G.checkHits(...)
		coroutine.resume(v_u_111, ...)
	end
	coroutine.resume(v_u_111)
end
local v_u_112 = {}
local function v_u_121(p113, p114, p115, p116, p117)
	-- upvalues: (copy) v_u_14, (copy) v_u_112, (copy) v_u_5, (copy) v_u_111, (copy) v_u_15, (copy) v_u_9
	if v_u_14 then
		require(game.ServerScriptService.Services.CombatService):RegisterHit(p113, p115)
	else
		if p117 then
			for _, v118 in pairs(p117) do
				local v119 = v_u_112
				table.insert(v119, v118)
			end
			local v120 = v_u_112
			table.insert(v120, { p114, p115 })
		end
		if p113 == true then
			if #v_u_112 > 0 then
				if v_u_5.COMBAT_REMOTE_THREAD then
					coroutine.resume(v_u_111, table.remove(v_u_112, 1)[2], v_u_112)
				else
					v_u_15.RegisterHitEvent:FireServer(table.remove(v_u_112, 1)[2], v_u_112)
				end
			end
			table.clear(v_u_112)
		end
		if p113 ~= true then
			v_u_9:ApplyDamageHighlight(p114, p113, p116.Name, p116.WeaponType, p115)
		end
	end
end
function v_u_9.GetAttackAngle(_, p122, p123)
	local v124 = p122.HumanoidRootPart.CFrame.LookVector:Dot((p123.HumanoidRootPart.Position - p122.HumanoidRootPart.Position).unit)
	return math.acos(v124)
end
function v_u_9.RunHitDetection(_, p125, p126, p127)
	-- upvalues: (copy) v_u_3, (copy) v_u_9, (copy) v_u_11, (copy) v_u_36, (copy) v_u_121, (copy) v_u_5, (copy) v_u_7, (copy) v_u_8, (ref) v_u_38, (copy) v_u_14, (copy) v_u_15
	local v_u_128 = p125.Parent
	local v_u_129 = v_u_3:GetPlayerFromCharacter(v_u_128)
	local v_u_130 = v_u_128.HumanoidRootPart
	local v131 = v_u_128.UpperTorso
	local v132 = v_u_128.RightFoot
	local v133 = v_u_128.Humanoid
	local v134 = v_u_128:FindFirstChild("EquippedWeapon") or v_u_9:GetEquippedWeaponTool(v_u_128)
	local v135 = v_u_9:GetWeaponName(v134)
	local v_u_136 = v_u_9:GetWeaponData(v135)
	local v137 = v_u_136.WeaponType == "Melee"
	local v_u_138 = v134:IsDescendantOf(v_u_11)
	if v_u_138 then
		v_u_138 = not v_u_128:FindFirstChild("Summoner")
	end
	local v139 = v_u_128:FindFirstChild("Summoner")
	local v140 = v_u_136.Moveset.Basic
	local v141 = ("Couldn\'t find the \'Basic\' moveset for %*"):format(v135)
	assert(v140, v141)
	if v140[p126].AOEDelay ~= nil then
		return
	end
	local v142 = {}
	if v137 then
		for _, v143 in v_u_128:GetChildren() do
			if v143:HasTag("WeaponHitbox") or v143:HasTag("Blade") then
				table.insert(v142, v143)
			end
		end
	end
	for _, v144 in v134:GetDescendants() do
		if v144:HasTag("WeaponHitbox") or v144:HasTag("Blade") then
			table.insert(v142, v144)
		end
	end
	local v_u_145 = {}
	local v_u_146 = {}
	local v_u_147 = v_u_9:CanCharacterMeleeAoe(v_u_128)
	local function v158(p148)
		-- upvalues: (ref) v_u_9, (ref) v_u_36, (copy) v_u_128, (copy) v_u_129, (copy) v_u_136, (copy) v_u_130, (copy) v_u_138, (copy) v_u_146, (copy) v_u_147, (copy) v_u_145, (ref) v_u_121
		local v149 = nil
		local v150 = nil
		for _, v151 in p148 do
			local v152 = v_u_9:GetRigOfHitPart(v151)
			if v152 then
				if v_u_36[v151.Name] then
					local v153 = v152:FindFirstChild("Summoner")
					local v154 = v_u_128:FindFirstChild("Summoner")
					if (not v154 or v152 ~= v154.Value.Character) and (not v_u_129 or (not v153 or v153.Value ~= v_u_129)) then
						if v_u_136.ValidateFrontHits then
							local _ = v_u_130.CFrame.Position
							local _ = v152.PrimaryPart.CFrame.Position
							if v_u_9:GetAttackAngle(v_u_128, v152) <= 1.3 then
								goto l12
							end
						else
							::l12::
							if (not v_u_138 or (not v152:IsDescendantOf(workspace.Enemies) or (v154 or v153))) and (v152 ~= v_u_128 and v_u_9:IsVulnerable(v152)) then
								if v149 then
									if v_u_147 > #v_u_146 and (v151.Parent ~= v149 and not table.find(v_u_146, v151.Parent)) then
										local v155 = v_u_145
										table.insert(v155, { v152, v151 })
										local v156 = v_u_146
										table.insert(v156, v152)
									end
								else
									local v157 = v_u_146
									table.insert(v157, v152)
									v150 = v151
									v149 = v152
								end
							end
						end
					end
				end
			else
				warn("No rig found for hit part:", v151)
			end
		end
		if v149 then
			v_u_121(v_u_128, v149, v150, v_u_136, v_u_145)
		end
		return v149, v150
	end
	local v_u_159 = nil
	local v_u_160
	if v_u_5.NEW_COMBAT_SYSTEM_VISUALIZE_HITBOXES then
		v_u_160 = Instance.new("Part")
		v_u_160.Name = "BroadphaseHitboxPart"
		v_u_160.BrickColor = BrickColor.new("Bright red")
		v_u_160.Transparency = 0.8
		v_u_160.CanCollide = false
		v_u_160.CanTouch = false
		v_u_160.CanQuery = false
		v_u_160.Anchored = true
		v_u_160.Parent = workspace
	else
		v_u_160 = nil
	end
	local v161 = v_u_128.HumanoidRootPart:FindFirstChild("Buddha2")
	local v162 = (v161 or v_u_128.HumanoidRootPart:FindFirstChild("Buddha")) and true or false
	local v163 = v_u_130.Size.Y * 0.5 + v133.HipHeight + 0.5
	local v164 = p127._Object.Length
	local v165 = 0
	local v166 = nil
	local v167 = {}
	while v165 < v164 and (p127._Object.IsPlaying and not v166) do
		v165 = v165 + task.wait()
		if v134 and not v134:IsDescendantOf(workspace) then
			break
		end
		if v165 >= 0.13 then
			local v168 = v_u_130.CFrame
			local v169 = v168.Position
			local v170 = v131.Size.X
			local v171 = v168 * Vector3.new(v170, 0, 0)
			local v172 = v165 / v164
			local v173 = math.clamp(v172, 0, 1)
			local _ = v173 * v163
			local v174 = v132.Position
			local v175 = v132.Size.Y * 0.5
			local v176 = v174 - Vector3.new(0, v175, 0)
			local v177 = v169.X
			local v178 = v176.Y
			local v179 = v169.Z
			local v180 = v171:Lerp(Vector3.new(v177, v178, v179), v173)
			local v181, v182 = v_u_7(v142)
			local v183 = v_u_8({
				["CFrame"] = v181,
				["Size"] = v182
			})
			local v184 = { v171, v180, unpack(v183) }
			for v185 = #v167, #v167 + 1 - 30, -1 do
				local v186 = v167[v185]
				if v186 then
					for _, v187 in v186 do
						local v188 = v168 * v187
						table.insert(v184, v188)
					end
				end
			end
			local v189 = {}
			for _, v190 in v183 do
				table.insert(v189, v168:ToObjectSpace(v190))
			end
			table.insert(v167, v189)
			local v191, v192 = v_u_7(v184)
			local v193 = v191 * (v168 - v169)
			local v194 = v_u_130:GetAttribute("CharacterSizeScaleNumber") or 1
			local v195 = v192 * (1 / math.clamp(v194, 1, 999))
			local v196
			if v_u_138 then
				v196 = not v139
			else
				v196 = v_u_138
			end
			if v196 then
				v195 = v195 * 0.5
			end
			local v197 = v_u_130.Size * (v_u_130:GetAttribute("HrpSizeScale") or 1)
			if v162 then
				if v137 then
					v195 = Vector3.new(10.625, 7.5, 10) * v197.Y / 2
					local v198 = v_u_136.HitboxMagnitude
					if v198 then
						v195 = v195 * (1 + (v198 - 2) * 0.1)
					end
					if v161 then
						v195 = v195 * Vector3.new(1, 1, 0.875)
					end
					v193 = v_u_130.CFrame * CFrame.new(0, -v195.Y * 0.125, -v195.Z / 3.25)
				else
					local v199 = v195.X
					local v200 = v197.Y * 4
					local v201 = v195.Y
					local v202 = math.max(v200, v201)
					local v203 = v195.Z
					v195 = Vector3.new(v199, v202, v203)
				end
			end
			if v_u_160 then
				v_u_160.CFrame = v193
				v_u_160.Size = v195
			end
			local v204 = workspace:GetPartBoundsInBox(v193, v195, v_u_38)
			if v162 and v137 == false then
				local v205 = Vector3.new(10.625, 7.5, 10) * v197.Y / 2
				local v206 = v_u_136.HitboxMagnitude
				if v206 then
					v205 = v205 * (1 + (v206 - 2) * 0.1)
				end
				if v161 then
					v205 = v205 * Vector3.new(1, 1, 0.875)
				end
				local v207 = v_u_130.CFrame * CFrame.new(0, -v205.Y * 0.125, -v205.Z / 3.25)
				if v_u_5.NEW_COMBAT_SYSTEM_VISUALIZE_HITBOXES and not v_u_159 then
					v_u_159 = Instance.new("Part")
					v_u_159.Name = "BroadphaseHitboxPart"
					v_u_159.BrickColor = BrickColor.new("Bright red")
					v_u_159.Transparency = 0.8
					v_u_159.CanCollide = false
					v_u_159.CanTouch = false
					v_u_159.CanQuery = false
					v_u_159.Anchored = true
					v_u_159.CFrame = v207
					v_u_159.Size = v205
					v_u_159.Parent = workspace
				end
				if v_u_159 then
					v_u_159.CFrame = v207
					v_u_159.Size = v205
				end
				for _, v208 in pairs(workspace:GetPartBoundsInBox(v207, v205, v_u_38)) do
					table.insert(v204, v208)
				end
			end
			local v209
			v166, v209 = v158(v204)
			if v166 then
				local v210 = v_u_3:GetPlayerFromCharacter(v166)
				if v_u_14 and v210 then
					local v211 = v209.Position
					for _, v212 in v_u_3:GetPlayers() do
						local v213 = v212.Character
						if v212 ~= v_u_129 and (v213 and (v213:GetPivot().Position - v211).Magnitude <= 300) then
							v_u_15.ReceivedHit:FireClient(v210, v166, v213, v_u_136.Name, v_u_136.WeaponType, v209)
						end
					end
				end
			end
			if not v162 or v137 == false then
				for _, v214 in v142 do
					local v215 = v214.Size
					local v216
					if v196 then
						v216 = v215 * 0.5
					else
						local v217 = v_u_136.HitboxMagnitude
						if v217 then
							v215 = v215 + Vector3.new(1, 1, 1) * v217
						end
						if v137 then
							v215 = v215 + Vector3.new(2, 2, 2)
						end
						if v_u_128.HumanoidRootPart:FindFirstChild("Buddha2") then
							v215 = v215 * 1.5
						elseif v_u_128.HumanoidRootPart:FindFirstChild("Buddha") then
							v215 = v215 * 1.2
						end
						local v218 = v215.X
						local v219 = math.max(3, v218)
						local v220 = v215.Y
						local v221 = math.max(3, v220)
						local v222 = v215.Z
						local v223 = math.max(3, v222)
						v216 = Vector3.new(v219, v221, v223)
					end
					if v_u_5.NEW_COMBAT_SYSTEM_VISUALIZE_HITBOXES then
						local v_u_224 = Instance.new("Part")
						v_u_224.BrickColor = BrickColor.new("Bright red")
						v_u_224.Transparency = 0.5
						v_u_224.CanCollide = false
						v_u_224.CanTouch = false
						v_u_224.CanQuery = false
						v_u_224.Anchored = true
						v_u_224.CFrame = v214.CFrame
						v_u_224.Size = v216
						v_u_224.Parent = workspace
						task.delay(0, function()
							-- upvalues: (copy) v_u_224
							v_u_224:Destroy()
						end)
					end
					local v225
					v166, v225 = v158((workspace:GetPartBoundsInBox(v214.CFrame, v216, v_u_38)))
					if v166 then
						local v226 = v_u_3:GetPlayerFromCharacter(v166)
						if v_u_14 and v226 then
							local v227 = v225.Position
							for _, v228 in v_u_3:GetPlayers() do
								local v229 = v228.Character
								if v228 ~= v_u_129 and (v229 and (v229:GetPivot().Position - v227).Magnitude <= 300) then
									v_u_15.ReceivedHit:FireClient(v226, v166, v229, v_u_136.Name, v_u_136.WeaponType, v225)
								end
							end
						end
						break
					end
				end
			end
		end
	end
	if v_u_129 == game.Players.LocalPlayer then
		v_u_121(true)
	end
	if v_u_5.NEW_COMBAT_SYSTEM_VISUALIZE_HITBOXES then
		task.delay(0.1, function()
			-- upvalues: (ref) v_u_160
			v_u_160:Destroy()
		end)
		if v_u_159 then
			task.delay(0.1, function()
				-- upvalues: (ref) v_u_159
				v_u_159:Destroy()
			end)
		end
	end
end
function v_u_9.GetWeaponData(_, p230)
	-- upvalues: (copy) v_u_9, (copy) v_u_4
	for _, v231 in {
		p230,
		v_u_9:GetPureWeaponName(p230),
		string.gsub(p230, "%s", ""),
		string.lower(p230),
		string.lower(p230:sub(1, 1)) .. p230:sub(2, #p230),
		string.upper(p230:sub(1, 1)) .. p230:sub(2, #p230)
	} do
		local v232 = v_u_4[v231]
		if v232 then
			return v232
		end
	end
end
function v_u_9.GetWeaponName(_, p233)
	return p233:GetAttribute("WeaponName") or p233.Name
end
function v_u_9.GetWeaponModel(_, p234, p235)
	-- upvalues: (copy) v_u_9
	local v236 = v_u_9:GetPureWeaponName(p235)
	for _, v237 in p234:GetChildren() do
		if v_u_9:GetPureWeaponName(v237.Name) == v236 then
			return v237
		end
	end
end
function v_u_9.GetEquippedWeaponTool(_, p238)
	for _, v239 in p238:GetChildren() do
		if v239:IsA("Tool") and (v239:HasTag("MeleeTool") or v239:HasTag("GunTool")) then
			return v239
		end
	end
end
function v_u_9.CreateShootAngles(_, p240)
	if p240.NoSpread then
		return {
			{
				["Angle"] = CFrame.Angles(0, 0, 0)
			}
		}
	end
	local v_u_241 = {}
	local v_u_242 = Random.new(p240.Seed)
	local v243 = p240.BulletSpreadCount or 7
	local v_u_244 = p240.BulletSpreadDegree or 12
	local function v253()
		-- upvalues: (copy) v_u_242, (copy) v_u_244, (copy) v_u_241
		local v245 = v_u_242:NextNumber(-v_u_244 / 2, v_u_244 / 2)
		local v246 = math.rad(v245)
		local v247 = v_u_242:NextNumber(-v_u_244 / 2, v_u_244 / 2)
		local v248 = math.rad(v247)
		local v249 = v_u_242:NextNumber(-v_u_244 / 2, v_u_244 / 2)
		local v250 = math.rad(v249)
		local v251 = v_u_241
		local v252 = {
			["Angle"] = CFrame.Angles(v246, v248, v250)
		}
		table.insert(v251, v252)
	end
	if p240.BulletSpreadCount == 1 then
		v253()
		return v_u_241
	end
	local v254 = {
		["Angle"] = CFrame.Angles(0, 0, 0)
	}
	table.insert(v_u_241, v254)
	for _ = 1, v243 - 1 do
		v253()
	end
	return v_u_241
end
function v_u_9.GetToolOfWeaponType(_, p255, p256)
	-- upvalues: (copy) v_u_3
	local v257 = v_u_3:GetPlayerFromCharacter(p255)
	if v257 then
		for _, v258 in v257.Backpack:GetChildren() do
			if v258:IsA("Tool") and v258:GetAttribute("WeaponType") == p256 then
				return v258
			end
		end
	end
	local v259 = p255:FindFirstChildWhichIsA("Tool")
	if v259 and v259:GetAttribute("WeaponType") == p256 then
		return v259
	end
end
function v_u_9.PlayMeleeHitParticles(_, p_u_260, p_u_261, p_u_262)
	-- upvalues: (copy) v_u_9, (ref) v_u_34
	task.defer(function()
		-- upvalues: (copy) p_u_261, (copy) p_u_260, (ref) v_u_9, (copy) p_u_262, (ref) v_u_34
		local v263 = p_u_261 and p_u_261.Position or p_u_260:GetPivot().Position
		local v264 = v_u_9:GetWeaponData(p_u_262)
		v_u_34.play("Hit", v263, v264)
	end)
end
function v_u_9.ApplyDamageHighlight(_, p265, p266, p267, p268, p269, _)
	-- upvalues: (copy) v_u_9, (copy) v_u_3, (copy) v_u_11, (copy) v_u_1, (copy) v_u_13
	if v_u_9:HasRigEquipped(p265) then
		return
	else
		local v270 = v_u_3:GetPlayerFromCharacter(p265)
		local v271 = v_u_3:GetPlayerFromCharacter(p266)
		if v270 or v271 then
			if not (v270 and (v271 and _G.InSafeZone)) then
				if v270 then
					if v270:GetAttribute("PvpDisabled") then
						return
					end
					if v270:GetAttribute("KenActive") then
						local v272 = v270:GetAttribute("KenDodgesLeft") or 0
						local v273 = v270:GetAttribute("LastKenDodge") or 0
						local v274 = tick() - v273 <= 0.4
						if v272 > 0 or v274 then
							return
						end
					end
				end
				local v275
				if p266 and p266:IsDescendantOf(v_u_11) then
					v275 = p266
				else
					v275 = nil
				end
				local v276
				if p265 and p265:IsDescendantOf(v_u_11) then
					v276 = p265
				else
					v276 = nil
				end
				local v277 = v275 and v275:GetAttribute("Level")
				if not v277 then
					if v276 then
						v277 = v276:GetAttribute("Level")
					else
						v277 = v276
					end
				end
				local v278 = v275 and v275:GetAttribute("IsBoss")
				if not v278 then
					if v276 then
						v278 = v276:GetAttribute("IsBoss")
					else
						v278 = v276
					end
				end
				local v279
				if v271 then
					v279 = v271:FindFirstChild("Data")
				else
					v279 = v271
				end
				local v280
				if v270 then
					v280 = v270:FindFirstChild("Data")
				else
					v280 = v270
				end
				local v281 = v279 and v279.Level.Value or (v275 and v277 and v277 or 1)
				local v282 = v280 and v280.Level.Value or v276 and v277
				local v283 = (v281 / 175) ^ 1.5
				local v284 = math.floor(v283) * 2
				local v285 = nil
				if v271 then
					local v286 = v_u_9:GetToolOfWeaponType(p266, "Melee")
					if v286 then
						v285 = v286:GetAttribute("WeaponName")
					end
				elseif v275 then
					v285 = v275:GetAttribute("WeaponName")
				end
				local v287 = v_u_9:GetToolOfWeaponType(p265, "Demon Fruit")
				if p268 == "Melee" or (p268 == "Sword" or p268 == "Gun") then
					if v287 and (v287.Name == "Rubber-Rubber" and (p268 == "Melee" and (v279 and v285 == "Electro"))) then
						return
					end
					if v287 and (v287.Name == "Blade-Blade" and p268 == "Sword") and (v275 and not v278 or not v275) then
						if v275 and v277 <= v282 - v284 or not v275 then
							return
						end
					elseif v287 and (v287.Name == "Rubber-Rubber" and p268 == "Gun") and (v275 and not v278 or not v275) then
						if v275 and v277 <= v282 - v284 or not v275 then
							return
						end
					elseif v287 and (v287:FindFirstChild("Logia") and not p266:GetAttribute("BusoEnabled")) then
						if v275 and v277 <= v282 - v284 or not v275 then
							return
						end
					elseif v287 and (v287:FindFirstChild("LogiaDough") and (v270 and (v270:GetAttribute("KenActive") and not p266:GetAttribute("BusoEnabled")))) and (v275 and v277 <= v282 - v284 or not v275) then
						return
					end
				end
				if v270 or (p265:GetAttribute("FruitType") ~= "Logia" or p266:GetAttribute("BusoEnabled")) then
					if p268 ~= "Gun" then
						v_u_9:PlayMeleeHitParticles(p265, p269, p267)
					end
					local v_u_288 = p265:FindFirstChildOfClass("Highlight")
					if v_u_288 then
						if v_u_288:GetAttribute("__FillColor") then
							local v289 = {
								["FillColor"] = Color3.fromRGB(138, 0, 0)
							}
							v_u_1:Create(v_u_288, TweenInfo.new(0.2), v289):Play()
							task.delay(0.2, function()
								-- upvalues: (ref) v_u_1, (copy) v_u_288
								v_u_1:Create(v_u_288, TweenInfo.new(0.2), {
									["FillColor"] = v_u_288:GetAttribute("__FillColor")
								}):Play()
							end)
						end
						return true
					end
					local v_u_290 = v_u_13(script.DamageHighlight):Clone()
					v_u_290.Parent = p265
					v_u_1:Create(v_u_290, TweenInfo.new(0.2), {
						["FillTransparency"] = 0.5
					}):Play()
					task.delay(0.2, function()
						-- upvalues: (ref) v_u_1, (copy) v_u_290
						v_u_1:Create(v_u_290, TweenInfo.new(0.2), {
							["FillTransparency"] = 1
						}):Play()
						task.wait(0.2)
						v_u_290:Destroy()
					end)
					return true
				end
			end
		else
			return
		end
	end
end
function v_u_9.IsGunReloading(_, p291)
	-- upvalues: (copy) v_u_14
	if v_u_14 then
		return not p291.Enabled or (p291:GetAttribute("IsReloading") or p291:GetAttribute("UnequipAutoReloading"))
	else
		return not p291.Enabled or (p291:GetAttribute("IsReloading_Client") or p291:GetAttribute("UnequipAutoReloading"))
	end
end
local v_u_292 = RaycastParams.new()
v_u_292.FilterType = Enum.RaycastFilterType.Exclude
v_u_292.FilterDescendantsInstances = { workspace._WorldOrigin, workspace.Characters, v_u_11 }
local v_u_293 = RaycastParams.new()
v_u_293.FilterType = Enum.RaycastFilterType.Exclude
function v_u_9.GetTargetPosition(_, p294, p295, p296, p297)
	-- upvalues: (copy) v_u_293, (copy) v_u_292
	debug.profilebegin("GetTargetPosition")
	local v298 = p296 or (1 / 0)
	local v299 = p295 - p294
	if v298 < v299.Magnitude then
		p295 = p294 + v299.Unit * v298
	end
	if p297 then
		v_u_293.FilterDescendantsInstances = { workspace._WorldOrigin, p297 }
	end
	local v300 = workspace:Raycast(p294, p295 - p294, p297 and v_u_293 or v_u_292)
	if v300 then
		p295 = v300.Position
	end
	debug.profileend()
	return p295
end
return v_u_9
