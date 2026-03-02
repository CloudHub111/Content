local v_u_1 = {}
v_u_1.__index = v_u_1
game:GetService("Players")
local v_u_2 = game:GetService("RunService")
local v_u_3 = workspace.Gravity
local v_u_4 = script.Parent
local v_u_5 = {}
local v6 = {}
local v_u_7 = {}
local v_u_8 = {}
local v_u_9 = {
	["stackOverflow"] = 0,
	["debugInfo"] = 0,
	["functionSource"] = 0,
	["metatables"] = 0,
	["namecall"] = 0,
	["closures"] = 0,
	["environment"] = 0,
	["constants"] = 0,
	["stateDesync"] = 0
}
local v10 = game:GetService("ReplicatedFirst"):GetChildren()
local v_u_11 = v10[math.random(1, #v10)];
(function()
	-- upvalues: (copy) v_u_5
	for v12 = 1, 5 do
		v_u_5[v12] = math.random(1000000, 9999999)
	end
end)()
local v_u_13 = rawget
local _ = rawset
local v_u_14 = getmetatable
local _ = setmetatable
local v_u_15 = pcall
local v_u_16 = xpcall
local v_u_17 = type
local _ = next
local v_u_18 = pairs
local v_u_19 = ipairs
local v_u_20 = tostring
local _ = tonumber
local v_u_21 = debug.info
local _ = debug.traceback
local v_u_22 = task.spawn
local v_u_23 = task.wait
local v24 = task.delay
local _ = table.insert
local v_u_25 = table.concat
local v26 = table.clone
local v_u_27 = string.byte
local v_u_28 = string.char
local v_u_29 = string.find
local v_u_30 = string.format
local v_u_31 = math.random
local v_u_32 = math.floor
local v_u_33 = os.clock
v6.pcall = v_u_15
v6.xpcall = v_u_16
v6.type = v_u_17
v6.getmetatable = v_u_14
v6.debug_info = v_u_21
v_u_7[1] = "RenderStepped"
v_u_7[2] = "HumanoidRootPart"
v_u_7[3] = "Humanoid"
v_u_7[4] = 16379
v_u_7[5] = game
v_u_7[6] = workspace
v_u_8.game = game
v_u_8.workspace = workspace
v_u_8.pcall_type = v_u_17(v_u_15)
v_u_8.getmetatable_type = v_u_17(v_u_14)
local v_u_34 = true
v_u_15(function()
	-- upvalues: (copy) v_u_14, (ref) v_u_34
	v_u_14((newproxy(true))).__gc = function()
		-- upvalues: (ref) v_u_34
		v_u_34 = false
	end
end)
local v_u_35 = v26(v_u_5)
local function v_u_38()
	-- upvalues: (copy) v_u_19, (copy) v_u_5, (copy) v_u_35
	for v36, v37 in v_u_19(v_u_5) do
		if v37 ~= v_u_35[v36] then
			return false
		end
	end
	return true
end
local function v_u_40()
	-- upvalues: (copy) v_u_38
	local v39 = v_u_38
	if v39 then
		v39 = v_u_38()
	end
	return v39
end
v24(2.31, function()
	-- upvalues: (ref) v_u_40
	local v_u_41 = v_u_40
	v_u_40 = function()
		-- upvalues: (copy) v_u_41
		local v42 = v_u_41
		if v42 then
			v42 = v_u_41()
		end
		return v42
	end
end)
local function v_u_81()
	-- upvalues: (copy) v_u_16, (copy) v_u_21, (copy) v_u_15, (copy) v_u_29, (copy) v_u_20, (copy) v_u_9, (copy) v_u_17, (copy) v_u_14, (copy) v_u_31, (copy) v_u_13, (copy) v_u_18
	local v43 = {
		["stackOverflow"] = true,
		["debugInfo"] = true,
		["metatables"] = true,
		["namecall"] = true,
		["closures"] = true,
		["tableIntegrity"] = true
	}
	local v_u_44 = nil
	v_u_16(function()
		return game.AAAAAAA
	end, function()
		-- upvalues: (ref) v_u_44, (ref) v_u_21
		v_u_44 = v_u_21(2, "f")
	end)
	local v_u_45 = v_u_44
	local v46
	if v_u_45 then
		local v52, v53 = v_u_15(function()
			-- upvalues: (copy) v_u_45, (ref) v_u_15, (ref) v_u_29, (ref) v_u_20
			local function v_u_48(p47)
				-- upvalues: (ref) v_u_48, (ref) v_u_45
				if p47 < 16379 then
					return v_u_48(p47 + 1)
				else
					return v_u_45(workspace, "Name")
				end
			end
			local v49, v50 = v_u_15(v_u_48, 1)
			local v51 = not v49
			if v51 then
				v51 = v_u_29(v_u_20(v50), "stack overflow") ~= nil
			end
			return v51
		end)
		v46 = v52 and v53 and v53 or true
	else
		v46 = true
	end
	v43.stackOverflow = v46
	if v43.stackOverflow then
		v_u_9.stackOverflow = 0
	else
		local v54 = v_u_9
		v54.stackOverflow = v54.stackOverflow + 1
	end
	local v55 = v_u_15
	local v56
	if v55 then
		local v57
		v56, v57 = v_u_15(v_u_21, v55, "n")
		if v56 then
			v56 = v57 ~= nil
		end
	else
		v56 = true
	end
	if v56 then
		local v58 = v_u_17
		if v58 then
			local v59
			v56, v59 = v_u_15(v_u_21, v58, "n")
			if v56 then
				v56 = v59 ~= nil
			end
		else
			v56 = true
		end
	end
	v43.debugInfo = v56
	if v43.debugInfo then
		v_u_9.debugInfo = 0
	else
		local v60 = v_u_9
		v60.debugInfo = v60.debugInfo + 1
	end
	local v61, v62 = v_u_15(function()
		-- upvalues: (ref) v_u_14, (ref) v_u_17
		return v_u_17((v_u_14(game))) == "table"
	end)
	v43.metatables = v61 and (v62 or true) or v61
	if v43.metatables then
		v_u_9.metatables = 0
	else
		local v63 = v_u_9
		v63.metatables = v63.metatables + 1
	end
	local v67, v68 = v_u_15(function()
		-- upvalues: (ref) v_u_31, (ref) v_u_20
		local v64 = v_u_31(1000000, 9999999)
		local v65 = Instance.new("Folder")
		v65.Name = v_u_20(v64)
		local v66 = v65.Name
		v65:Destroy()
		return v66 == v_u_20(v64)
	end)
	v43.namecall = v67 and v68
	if v43.namecall then
		v_u_9.namecall = 0
	else
		local v69 = v_u_9
		v69.namecall = v69.namecall + 1
	end
	local v71, v72 = v_u_15(function()
		-- upvalues: (ref) v_u_31
		local v70 = v_u_31(1000000, 9999999)
		return v70 == v70
	end)
	v43.closures = v71 and v72
	if v43.closures then
		v_u_9.closures = 0
	else
		local v73 = v_u_9
		v73.closures = v73.closures + 1
	end
	local v76, v77 = v_u_15(function()
		-- upvalues: (ref) v_u_13
		local v74 = { 1, 2, 3 }
		local v75
		if v_u_13(v74, 1) == 1 then
			v75 = v74[2] == 2
		else
			v75 = false
		end
		return v75
	end)
	v43.tableIntegrity = v76 and v77
	if v43.tableIntegrity then
		v_u_9.tableIntegrity = 0
	else
		local v78 = v_u_9
		v78.tableIntegrity = v78.tableIntegrity + 1
	end
	local v79 = false
	for _, v80 in v_u_18(v_u_9) do
		if v80 >= 3 then
			v79 = true
			break
		end
	end
	return not v79, v43, v_u_9
end
function v_u_1.new(p82)
	-- upvalues: (copy) v_u_1
	local v83 = v_u_1
	local v84 = setmetatable({}, v83)
	v84.Player = p82
	return v84
end
function v_u_1.StartMonitoring(p85)
	-- upvalues: (copy) v_u_17, (copy) v_u_15, (copy) v_u_27, (copy) v_u_28, (copy) v_u_25, (copy) v_u_33, (copy) v_u_22, (copy) v_u_23, (ref) v_u_40, (copy) v_u_7, (copy) v_u_9, (copy) v_u_8, (copy) v_u_14, (copy) v_u_13, (copy) v_u_31, (copy) v_u_20, (ref) v_u_34, (copy) v_u_81, (copy) v_u_1, (copy) v_u_30, (copy) v_u_32, (copy) v_u_11, (copy) v_u_19, (copy) v_u_29, (copy) v_u_2, (copy) v_u_3, (copy) v_u_4, (copy) v_u_18
	local v_u_86 = p85.Player
	if not v_u_86:GetAttribute("Staff") then
		local v_u_87 = game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Hello")
		local v_u_88 = nil
		local v_u_89 = false
		v_u_87.OnClientEvent:Connect(function(p90)
			-- upvalues: (ref) v_u_17, (ref) v_u_88, (ref) v_u_89
			if p90 and (v_u_17(p90) == "table" and p90.k) then
				v_u_88 = ("Got a silver knuckle blade and a gold one").reverse(p90.k)
				v_u_89 = true
			end
		end)
		local v_u_91 = 0
		local v_u_92 = v_u_33()
		v_u_22(function()
			-- upvalues: (ref) v_u_23, (ref) v_u_15, (ref) v_u_40, (ref) v_u_7, (ref) v_u_9
			while v_u_23(2) do
				local v96, v97 = v_u_15(function()
					-- upvalues: (ref) v_u_40, (ref) v_u_15, (ref) v_u_7
					if not v_u_40() then
						return false
					end
					local v94, v95 = v_u_15(function()
						-- upvalues: (ref) v_u_7
						local v93
						if v_u_7[1] == "RenderStepped" and (v_u_7[2] == "HumanoidRootPart" and (v_u_7[3] == "Humanoid" and (v_u_7[4] == 16379 and v_u_7[5] == game))) then
							v93 = v_u_7[6] == workspace
						else
							v93 = false
						end
						return v93
					end)
					return v94 and v95 and true or false
				end)
				if v96 and v97 then
					v_u_9.constants = 0
				else
					local v98 = v_u_9
					v98.constants = v98.constants + 1
					if v_u_9.constants >= 3 then
						v_u_9.constants = 0
					end
				end
			end
		end)
		v_u_22(function()
			-- upvalues: (ref) v_u_23, (ref) v_u_15, (ref) v_u_40, (ref) v_u_7, (ref) v_u_8, (ref) v_u_17, (ref) v_u_14, (ref) v_u_13, (ref) v_u_9
			while v_u_23(10) do
				local v112, v113 = v_u_15(function()
					-- upvalues: (ref) v_u_15, (ref) v_u_40, (ref) v_u_7, (ref) v_u_8, (ref) v_u_17, (ref) v_u_14, (ref) v_u_13
					local v102, v103 = v_u_15(function()
						-- upvalues: (ref) v_u_40, (ref) v_u_15, (ref) v_u_7
						if not v_u_40() then
							return false
						end
						local v100, v101 = v_u_15(function()
							-- upvalues: (ref) v_u_7
							local v99
							if v_u_7[1] == "RenderStepped" and (v_u_7[2] == "HumanoidRootPart" and (v_u_7[3] == "Humanoid" and (v_u_7[4] == 16379 and v_u_7[5] == game))) then
								v99 = v_u_7[6] == workspace
							else
								v99 = false
							end
							return v99
						end)
						return v100 and v101 and true or false
					end)
					if not (v102 and v103) then
						return false
					end
					local v105, v106 = v_u_15(function()
						-- upvalues: (ref) v_u_8, (ref) v_u_15, (ref) v_u_17, (ref) v_u_14
						local v104
						if v_u_8.game == game and (v_u_8.workspace == workspace and v_u_17(v_u_15) == "function") then
							v104 = v_u_17(v_u_14) == "function"
						else
							v104 = false
						end
						return v104
					end)
					if not (v105 and v106) then
						return false
					end
					local v107, _ = v_u_15(function()
						-- upvalues: (ref) v_u_14, (ref) v_u_17
						return v_u_17((v_u_14(game))) == "table"
					end)
					if not (v107 or v107) then
						return false
					end
					local v110, v111 = v_u_15(function()
						-- upvalues: (ref) v_u_13
						local v108 = { 1, 2, 3 }
						local v109
						if v_u_13(v108, 1) == 1 then
							v109 = v108[2] == 2
						else
							v109 = false
						end
						return v109
					end)
					return v110 and v111 and true or false
				end)
				if v112 and v113 then
					v_u_9.environment = 0
				else
					local v114 = v_u_9
					v114.environment = v114.environment + 1
					if v_u_9.environment >= 3 then
						v_u_9.environment = 0
					end
				end
			end
		end)
		v_u_22(function()
			-- upvalues: (ref) v_u_23, (ref) v_u_15, (ref) v_u_40, (ref) v_u_7, (ref) v_u_8, (ref) v_u_17, (ref) v_u_14, (ref) v_u_13, (ref) v_u_31, (ref) v_u_20, (ref) v_u_34
			while v_u_23(30) do
				local v138, v139 = v_u_15(function()
					-- upvalues: (ref) v_u_15, (ref) v_u_40, (ref) v_u_7, (ref) v_u_8, (ref) v_u_17, (ref) v_u_14, (ref) v_u_13, (ref) v_u_31, (ref) v_u_20, (ref) v_u_34
					local v128, v129 = v_u_15(function()
						-- upvalues: (ref) v_u_15, (ref) v_u_40, (ref) v_u_7, (ref) v_u_8, (ref) v_u_17, (ref) v_u_14, (ref) v_u_13
						local v118, v119 = v_u_15(function()
							-- upvalues: (ref) v_u_40, (ref) v_u_15, (ref) v_u_7
							if not v_u_40() then
								return false
							end
							local v116, v117 = v_u_15(function()
								-- upvalues: (ref) v_u_7
								local v115
								if v_u_7[1] == "RenderStepped" and (v_u_7[2] == "HumanoidRootPart" and (v_u_7[3] == "Humanoid" and (v_u_7[4] == 16379 and v_u_7[5] == game))) then
									v115 = v_u_7[6] == workspace
								else
									v115 = false
								end
								return v115
							end)
							return v116 and v117 and true or false
						end)
						if not (v118 and v119) then
							return false
						end
						local v121, v122 = v_u_15(function()
							-- upvalues: (ref) v_u_8, (ref) v_u_15, (ref) v_u_17, (ref) v_u_14
							local v120
							if v_u_8.game == game and (v_u_8.workspace == workspace and v_u_17(v_u_15) == "function") then
								v120 = v_u_17(v_u_14) == "function"
							else
								v120 = false
							end
							return v120
						end)
						if not (v121 and v122) then
							return false
						end
						local v123, _ = v_u_15(function()
							-- upvalues: (ref) v_u_14, (ref) v_u_17
							return v_u_17((v_u_14(game))) == "table"
						end)
						if not (v123 or v123) then
							return false
						end
						local v126, v127 = v_u_15(function()
							-- upvalues: (ref) v_u_13
							local v124 = { 1, 2, 3 }
							local v125
							if v_u_13(v124, 1) == 1 then
								v125 = v124[2] == 2
							else
								v125 = false
							end
							return v125
						end)
						return v126 and v127 and true or false
					end)
					if not (v128 and v129) then
						return false
					end
					local v133, v134 = v_u_15(function()
						-- upvalues: (ref) v_u_31, (ref) v_u_20
						local v130 = v_u_31(1000000, 9999999)
						local v131 = Instance.new("Folder")
						v131.Name = v_u_20(v130)
						local v132 = v131.Name
						v131:Destroy()
						return v132 == v_u_20(v130)
					end)
					if not (v133 and v134) then
						return false
					end
					local v136, v137 = v_u_15(function()
						-- upvalues: (ref) v_u_31
						local v135 = v_u_31(1000000, 9999999)
						return v135 == v135
					end)
					return v136 and v137 and true or false
				end)
				if not (v138 and v139) then
					while true do

					end
				end
			end
		end)
		v_u_22(function()
			-- upvalues: (ref) v_u_23, (ref) v_u_81, (ref) v_u_15
			while v_u_23(15) do
				local v140, v_u_141, v_u_142 = v_u_81()
				if not v140 then
					local v_u_143 = game:GetService("HttpService")
					local _, _ = v_u_15(function()
						-- upvalues: (copy) v_u_143, (copy) v_u_141, (copy) v_u_142
						return v_u_143:JSONEncode({
							["results"] = v_u_141,
							["counts"] = v_u_142
						})
					end)
				end
			end
		end)
		local v_u_144 = 0
		game:GetService("ReplicatedStorage").Events.retrieveClientInfo.OnClientInvoke = function(p145)
			if p145 == "ClientFPS" then
				return 1 / game:GetService("RunService").RenderStepped:Wait()
			end
		end
		v_u_22(function()
			-- upvalues: (ref) v_u_23, (ref) v_u_144, (ref) v_u_15, (ref) v_u_40, (ref) v_u_7, (ref) v_u_9, (ref) v_u_1, (ref) v_u_89, (ref) v_u_88, (ref) v_u_91, (ref) v_u_30, (ref) v_u_33, (ref) v_u_32, (ref) v_u_27, (ref) v_u_28, (ref) v_u_25, (copy) v_u_87, (ref) v_u_92
			while v_u_23(1) do
				v_u_144 = v_u_144 + 1
				if v_u_144 % 10 == 0 then
					local v149, v150 = v_u_15(function()
						-- upvalues: (ref) v_u_40, (ref) v_u_15, (ref) v_u_7
						if not v_u_40() then
							return false
						end
						local v147, v148 = v_u_15(function()
							-- upvalues: (ref) v_u_7
							local v146
							if v_u_7[1] == "RenderStepped" and (v_u_7[2] == "HumanoidRootPart" and (v_u_7[3] == "Humanoid" and (v_u_7[4] == 16379 and v_u_7[5] == game))) then
								v146 = v_u_7[6] == workspace
							else
								v146 = false
							end
							return v146
						end)
						return v147 and v148 and true or false
					end)
					if not (v149 and v150) then
						local v151 = v_u_9
						v151.constants = v151.constants + 1
						if v_u_9.constants >= 3 then
							v_u_1.__index = v_u_1
							local v_u_152 = game:GetService("Players")
							local v_u_153 = game:GetService("RunService")
							game:GetService("Stats")
							local v_u_154 = workspace.Gravity
							local v_u_155 = script.Parent
							local v_u_156 = {
								["avgFPS"] = 60,
								["avgPing"] = 0,
								["deviceType"] = "Unknown",
								["lastLagSpike"] = 0,
								["consecutiveLowFPS"] = 0
							}
							local v_u_157 = {
								["characterSpawn"] = 5,
								["sessionStart"] = 10,
								["lagRecovery"] = 3
							}
							local v_u_158 = {
								["characterSpawnTime"] = 0,
								["sessionStartTime"] = 0,
								["lastLagSpikeTime"] = 0,
								["inGracePeriod"] = true
							}
							local v_u_159 = {
								"ADONIS_",
								"KOHL_",
								"HD_ADMIN_",
								"CMDR_",
								"NANOBLOX_"
							}
							local v_u_160 = {}
							local v161 = {}
							local v_u_162 = {}
							local v_u_163 = {}
							local v_u_164 = {
								["stackOverflow"] = 0,
								["debugInfo"] = 0,
								["functionSource"] = 0,
								["metatables"] = 0,
								["namecall"] = 0,
								["closures"] = 0,
								["environment"] = 0,
								["constants"] = 0,
								["stateDesync"] = 0
							}
							local v_u_165 = {}
							local v_u_166 = {
								["enableStackOverflow"] = true,
								["enableDebugInfo"] = true,
								["stackDepth"] = 16379,
								["minFPSForFullValidation"] = 30,
								["maxPingForFullValidation"] = 300
							}
							local v167 = game:GetService("ReplicatedFirst"):GetChildren()
							local v_u_168 = v167[math.random(1, #v167)];
							(function()
								-- upvalues: (copy) v_u_160
								for v169 = 1, 5 do
									v_u_160[v169] = math.random(1000000, 9999999)
								end
							end)()
							local v_u_170 = rawget
							local _ = rawset
							local v_u_171 = getmetatable
							local _ = setmetatable
							local v_u_172 = pcall
							local v_u_173 = xpcall
							local v_u_174 = type
							local _ = next
							local v_u_175 = pairs
							local v_u_176 = ipairs
							local v_u_177 = tostring
							local _ = tonumber
							local v_u_178 = debug.info
							local _ = debug.traceback
							local v_u_179 = task.spawn
							local v_u_180 = task.wait
							local v_u_181 = task.delay
							local _ = table.insert
							local v_u_182 = table.concat
							local v183 = table.clone
							local v_u_184 = ("Got a silver knuckle blade and a gold one").byte
							local v_u_185 = ("Got a silver knuckle blade and a gold one").char
							local v_u_186 = ("Got a silver knuckle blade and a gold one").find
							local v_u_187 = ("Got a silver knuckle blade and a gold one").format
							local v_u_188 = math.random
							local v_u_189 = math.floor
							local v_u_190 = os.clock
							v161.pcall = v_u_172
							v161.xpcall = v_u_173
							v161.type = v_u_174
							v161.getmetatable = v_u_171
							v161.debug_info = v_u_178
							local function v_u_196()
								-- upvalues: (copy) v_u_172, (copy) v_u_153, (copy) v_u_156, (copy) v_u_190, (copy) v_u_158, (copy) v_u_152
								local v191, v192 = v_u_172(function()
									-- upvalues: (ref) v_u_153
									return 1 / v_u_153.RenderStepped:Wait()
								end)
								if v191 and v192 then
									v_u_156.avgFPS = v_u_156.avgFPS * 0.9 + v192 * 0.1
									if v192 < 20 then
										local v193 = v_u_156
										v193.consecutiveLowFPS = v193.consecutiveLowFPS + 1
									else
										v_u_156.consecutiveLowFPS = 0
									end
									if v192 < 15 then
										v_u_156.lastLagSpike = v_u_190()
										v_u_158.lastLagSpikeTime = v_u_190()
									end
								end
								local v194, v195 = v_u_172(function()
									-- upvalues: (ref) v_u_152
									return v_u_152.LocalPlayer:GetNetworkPing() * 1000
								end)
								if v194 and v195 then
									v_u_156.avgPing = v_u_156.avgPing * 0.9 + v195 * 0.1
								end
							end
							local function v_u_200()
								-- upvalues: (copy) v_u_190, (copy) v_u_175, (copy) v_u_164, (copy) v_u_165, (copy) v_u_189
								local v197 = v_u_190()
								for v198, v199 in v_u_175(v_u_164) do
									if v199 > 0 and (v_u_165[v198] and v197 - v_u_165[v198] > 30) then
										v_u_164[v198] = v_u_189(v199 * 0.5)
										v_u_165[v198] = v197
									end
								end
							end
							v_u_162[1] = "RenderStepped"
							v_u_162[2] = "HumanoidRootPart"
							v_u_162[3] = "Humanoid"
							v_u_162[4] = 16379
							v_u_162[5] = game
							v_u_162[6] = workspace
							v_u_163.game = game
							v_u_163.workspace = workspace
							v_u_163.pcall_type = v_u_174(v_u_172)
							v_u_163.getmetatable_type = v_u_174(v_u_171)
							local function v_u_212(p_u_201)
								-- upvalues: (copy) v_u_166, (copy) v_u_190, (copy) v_u_158, (copy) v_u_157, (copy) v_u_156, (copy) v_u_172, (copy) v_u_186, (copy) v_u_177
								if not p_u_201 then
									return true
								end
								if v_u_166.enableStackOverflow then
									local v202 = v_u_190()
									if v202 - v_u_158.characterSpawnTime >= v_u_157.characterSpawn and (v202 - v_u_158.sessionStartTime >= v_u_157.sessionStart and v202 - v_u_158.lastLagSpikeTime >= v_u_157.lagRecovery) and (v_u_156.consecutiveLowFPS <= 10 and v_u_156.avgPing <= 500) then
										local v203 = v_u_166.stackDepth
										local v_u_204 = v_u_156.avgFPS < 30 and 8000 or v203
										local v210, v211 = v_u_172(function()
											-- upvalues: (ref) v_u_204, (copy) p_u_201, (ref) v_u_172, (ref) v_u_186, (ref) v_u_177
											local function v_u_206(p205)
												-- upvalues: (ref) v_u_204, (ref) v_u_206, (ref) p_u_201
												if p205 < v_u_204 then
													return v_u_206(p205 + 1)
												else
													return p_u_201(workspace, "Name")
												end
											end
											local v207, v208 = v_u_172(v_u_206, 1)
											local v209 = not v207
											if v209 then
												v209 = v_u_186(v_u_177(v208), "stack overflow") ~= nil
											end
											return v209
										end)
										return v210 and v211 and v211 or true
									end
								end
								return true
							end
							local v_u_213 = true
							v_u_172(function()
								-- upvalues: (copy) v_u_171, (ref) v_u_213
								v_u_171((newproxy(true))).__gc = function()
									-- upvalues: (ref) v_u_213
									v_u_213 = false
								end
							end)
							local v_u_214 = v183(v_u_160)
							local function v_u_217()
								-- upvalues: (copy) v_u_176, (copy) v_u_160, (copy) v_u_214
								for v215, v216 in v_u_176(v_u_160) do
									if v216 ~= v_u_214[v215] then
										return false
									end
								end
								return true
							end
							local function v_u_219()
								-- upvalues: (copy) v_u_217
								local v218 = v_u_217
								if v218 then
									v218 = v_u_217()
								end
								return v218
							end
							v_u_181(2.31, function()
								-- upvalues: (ref) v_u_219
								local v_u_220 = v_u_219
								v_u_219 = function()
									-- upvalues: (copy) v_u_220
									local v221 = v_u_220
									if v221 then
										v221 = v_u_220()
									end
									return v221
								end
							end)
							local function v_u_257()
								-- upvalues: (copy) v_u_190, (copy) v_u_158, (copy) v_u_157, (copy) v_u_156, (copy) v_u_164, (copy) v_u_173, (copy) v_u_178, (copy) v_u_212, (copy) v_u_165, (copy) v_u_172, (copy) v_u_166, (copy) v_u_174, (copy) v_u_171, (copy) v_u_188, (copy) v_u_177, (copy) v_u_170, (copy) v_u_175
								local v222 = v_u_190()
								if (v222 - v_u_158.characterSpawnTime < v_u_157.characterSpawn and true or (v222 - v_u_158.sessionStartTime < v_u_157.sessionStart and true or v222 - v_u_158.lastLagSpikeTime < v_u_157.lagRecovery)) and true or (v_u_156.consecutiveLowFPS > 10 and true or v_u_156.avgPing > 500) then
									return true, {}, v_u_164
								end
								local v223 = {
									["stackOverflow"] = true,
									["debugInfo"] = true,
									["metatables"] = true,
									["namecall"] = true,
									["closures"] = true,
									["tableIntegrity"] = true
								}
								local v_u_224 = nil
								v_u_173(function()
									return game.AAAAAAA
								end, function()
									-- upvalues: (ref) v_u_224, (ref) v_u_178
									v_u_224 = v_u_178(2, "f")
								end)
								v223.stackOverflow = v_u_212(v_u_224)
								if v223.stackOverflow then
									v_u_164.stackOverflow = 0
									v_u_165.stackOverflow = nil
								else
									v_u_164.stackOverflow = v_u_164.stackOverflow + 1
									v_u_165.stackOverflow = v_u_190()
								end
								local v225 = v_u_172
								local v226
								if v225 and v_u_166.enableDebugInfo then
									local v227 = v_u_190()
									if (v227 - v_u_158.characterSpawnTime < v_u_157.characterSpawn and true or (v227 - v_u_158.sessionStartTime < v_u_157.sessionStart and true or v227 - v_u_158.lastLagSpikeTime < v_u_157.lagRecovery)) and true or (v_u_156.consecutiveLowFPS > 10 and true or v_u_156.avgPing > 500) then
										v226 = true
									else
										local v228
										v226, v228 = v_u_172(v_u_178, v225, "n")
										if v226 then
											v226 = v228 ~= nil
										end
									end
								else
									v226 = true
								end
								if v226 then
									local v229 = v_u_174
									if v229 and v_u_166.enableDebugInfo then
										local v230 = v_u_190()
										if (v230 - v_u_158.characterSpawnTime < v_u_157.characterSpawn and true or (v230 - v_u_158.sessionStartTime < v_u_157.sessionStart and true or v230 - v_u_158.lastLagSpikeTime < v_u_157.lagRecovery)) and true or (v_u_156.consecutiveLowFPS > 10 and true or v_u_156.avgPing > 500) then
											v226 = true
										else
											local v231
											v226, v231 = v_u_172(v_u_178, v229, "n")
											if v226 then
												v226 = v231 ~= nil
											end
										end
									else
										v226 = true
									end
								end
								v223.debugInfo = v226
								if v223.debugInfo then
									v_u_164.debugInfo = 0
									v_u_165.debugInfo = nil
								else
									v_u_164.debugInfo = v_u_164.debugInfo + 1
									v_u_165.debugInfo = v_u_190()
								end
								local v232 = v_u_190()
								local v233
								if (v232 - v_u_158.characterSpawnTime < v_u_157.characterSpawn and true or (v232 - v_u_158.sessionStartTime < v_u_157.sessionStart and true or v232 - v_u_158.lastLagSpikeTime < v_u_157.lagRecovery)) and true or (v_u_156.consecutiveLowFPS > 10 and true or v_u_156.avgPing > 500) then
									v233 = true
								else
									local v234, v235 = v_u_172(function()
										-- upvalues: (ref) v_u_171, (ref) v_u_174
										return v_u_174((v_u_171(game))) == "table"
									end)
									v233 = v234 and (v235 or true) or v234
								end
								v223.metatables = v233
								if v223.metatables then
									v_u_164.metatables = 0
									v_u_165.metatables = nil
								else
									v_u_164.metatables = v_u_164.metatables + 1
									v_u_165.metatables = v_u_190()
								end
								local v236 = v_u_190()
								local v237
								if (v236 - v_u_158.characterSpawnTime < v_u_157.characterSpawn and true or (v236 - v_u_158.sessionStartTime < v_u_157.sessionStart and true or v236 - v_u_158.lastLagSpikeTime < v_u_157.lagRecovery)) and true or (v_u_156.consecutiveLowFPS > 10 and true or v_u_156.avgPing > 500) then
									v237 = true
								else
									local v241, v242 = v_u_172(function()
										-- upvalues: (ref) v_u_188, (ref) v_u_177
										local v238 = v_u_188(1000000, 9999999)
										local v239 = Instance.new("Folder")
										v239.Name = v_u_177(v238)
										local v240 = v239.Name
										v239:Destroy()
										return v240 == v_u_177(v238)
									end)
									v237 = v241 and v242
								end
								v223.namecall = v237
								if v223.namecall then
									v_u_164.namecall = 0
									v_u_165.namecall = nil
								else
									v_u_164.namecall = v_u_164.namecall + 1
									v_u_165.namecall = v_u_190()
								end
								local v243 = v_u_190()
								local v244
								if (v243 - v_u_158.characterSpawnTime < v_u_157.characterSpawn and true or (v243 - v_u_158.sessionStartTime < v_u_157.sessionStart and true or v243 - v_u_158.lastLagSpikeTime < v_u_157.lagRecovery)) and true or (v_u_156.consecutiveLowFPS > 10 and true or v_u_156.avgPing > 500) then
									v244 = true
								else
									local v246, v247 = v_u_172(function()
										-- upvalues: (ref) v_u_188
										local v245 = v_u_188(1000000, 9999999)
										return v245 == v245
									end)
									v244 = v246 and v247
								end
								v223.closures = v244
								if v223.closures then
									v_u_164.closures = 0
									v_u_165.closures = nil
								else
									v_u_164.closures = v_u_164.closures + 1
									v_u_165.closures = v_u_190()
								end
								local v248 = v_u_190()
								local v249
								if (v248 - v_u_158.characterSpawnTime < v_u_157.characterSpawn and true or (v248 - v_u_158.sessionStartTime < v_u_157.sessionStart and true or v248 - v_u_158.lastLagSpikeTime < v_u_157.lagRecovery)) and true or (v_u_156.consecutiveLowFPS > 10 and true or v_u_156.avgPing > 500) then
									v249 = true
								else
									local v252, v253 = v_u_172(function()
										-- upvalues: (ref) v_u_170
										local v250 = { 1, 2, 3 }
										local v251
										if v_u_170(v250, 1) == 1 then
											v251 = v250[2] == 2
										else
											v251 = false
										end
										return v251
									end)
									v249 = v252 and v253
								end
								v223.tableIntegrity = v249
								if v223.tableIntegrity then
									v_u_164.tableIntegrity = 0
									v_u_165.tableIntegrity = nil
								else
									v_u_164.tableIntegrity = v_u_164.tableIntegrity + 1
									v_u_165.tableIntegrity = v_u_190()
								end
								local v254 = v_u_156.avgFPS < 30 and 8 or (v_u_156.avgPing > 200 and 8 or (v_u_156.deviceType == "Mobile" and 7 or 5))
								local v255 = false
								for _, v256 in v_u_175(v_u_164) do
									if v254 <= v256 then
										v255 = true
										break
									end
								end
								return not v255, v223, v_u_164
							end
							function v_u_1.new(p258)
								-- upvalues: (ref) v_u_1
								local v259 = v_u_1
								local v260 = setmetatable({}, v259)
								v260.Player = p258
								return v260
							end
							function v_u_1.StartMonitoring(p261)
								-- upvalues: (copy) v_u_158, (copy) v_u_190, (copy) v_u_172, (copy) v_u_156, (copy) v_u_174, (copy) v_u_184, (copy) v_u_185, (copy) v_u_182, (copy) v_u_179, (copy) v_u_180, (copy) v_u_196, (copy) v_u_200, (copy) v_u_157, (ref) v_u_219, (copy) v_u_162, (copy) v_u_164, (copy) v_u_165, (copy) v_u_163, (copy) v_u_171, (copy) v_u_170, (copy) v_u_188, (copy) v_u_177, (ref) v_u_213, (copy) v_u_257, (copy) v_u_187, (copy) v_u_189, (copy) v_u_168, (copy) v_u_176, (copy) v_u_159, (copy) v_u_186, (copy) v_u_181, (copy) v_u_153, (copy) v_u_154, (copy) v_u_155, (copy) v_u_175
								local v_u_262 = p261.Player
								v_u_158.sessionStartTime = v_u_190()
								local v264, v265 = v_u_172(function()
									local v263 = game:GetService("UserInputService")
									return v263.TouchEnabled and not v263.KeyboardEnabled and "Mobile" or (v263.GamepadEnabled and "Console" or "PC")
								end)
								if v264 then
									v_u_156.deviceType = v265
								end
								local v_u_266 = game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Hello")
								local v_u_267 = nil
								local v_u_268 = false
								v_u_266.OnClientEvent:Connect(function(p269)
									-- upvalues: (ref) v_u_174, (ref) v_u_267, (ref) v_u_268
									if p269 and (v_u_174(p269) == "table" and p269.k) then
										v_u_267 = ("Got a silver knuckle blade and a gold one").reverse(p269.k)
										v_u_268 = true
									end
								end)
								local v_u_270 = 0
								local v_u_271 = v_u_190()
								v_u_179(function()
									-- upvalues: (ref) v_u_180, (ref) v_u_196, (ref) v_u_200
									while v_u_180(1) do
										v_u_196()
										v_u_200()
									end
								end)
								v_u_179(function()
									-- upvalues: (ref) v_u_180, (ref) v_u_190, (ref) v_u_158, (ref) v_u_157, (ref) v_u_156, (ref) v_u_172, (ref) v_u_219, (ref) v_u_162, (ref) v_u_164, (ref) v_u_165
									while v_u_180(5) do
										local v272 = v_u_190()
										if v272 - v_u_158.characterSpawnTime >= v_u_157.characterSpawn and (v272 - v_u_158.sessionStartTime >= v_u_157.sessionStart and v272 - v_u_158.lastLagSpikeTime >= v_u_157.lagRecovery) and (v_u_156.consecutiveLowFPS <= 10 and v_u_156.avgPing <= 500) then
											local v273 = v_u_190()
											local v274
											if (v273 - v_u_158.characterSpawnTime < v_u_157.characterSpawn and true or (v273 - v_u_158.sessionStartTime < v_u_157.sessionStart and true or v273 - v_u_158.lastLagSpikeTime < v_u_157.lagRecovery)) and true or (v_u_156.consecutiveLowFPS > 10 and true or v_u_156.avgPing > 500) then
												v274 = true
											else
												local v278, v279 = v_u_172(function()
													-- upvalues: (ref) v_u_219, (ref) v_u_172, (ref) v_u_162
													if not v_u_219() then
														return false
													end
													local v276, v277 = v_u_172(function()
														-- upvalues: (ref) v_u_162
														local v275
														if v_u_162[1] == "RenderStepped" and (v_u_162[2] == "HumanoidRootPart" and (v_u_162[3] == "Humanoid" and (v_u_162[4] == 16379 and v_u_162[5] == game))) then
															v275 = v_u_162[6] == workspace
														else
															v275 = false
														end
														return v275
													end)
													return v276 and v277 and true or false
												end)
												v274 = v278 and v279
											end
											if v274 then
												v_u_164.constants = 0
												v_u_165.constants = nil
											else
												v_u_164.constants = v_u_164.constants + 1
												v_u_165.constants = v_u_190()
												if (v_u_156.avgFPS < 30 and 8 or (v_u_156.avgPing > 200 and 8 or (v_u_156.deviceType == "Mobile" and 7 or 5))) <= v_u_164.constants then
													v_u_164.constants = 0
													v_u_165.constants = nil
												end
											end
										end
									end
								end)
								v_u_179(function()
									-- upvalues: (ref) v_u_180, (ref) v_u_190, (ref) v_u_158, (ref) v_u_157, (ref) v_u_156, (ref) v_u_172, (ref) v_u_219, (ref) v_u_162, (ref) v_u_163, (ref) v_u_174, (ref) v_u_171, (ref) v_u_170, (ref) v_u_164, (ref) v_u_165
									while v_u_180(15) do
										local v280 = v_u_190()
										if v280 - v_u_158.characterSpawnTime >= v_u_157.characterSpawn and (v280 - v_u_158.sessionStartTime >= v_u_157.sessionStart and v280 - v_u_158.lastLagSpikeTime >= v_u_157.lagRecovery) and (v_u_156.consecutiveLowFPS <= 10 and v_u_156.avgPing <= 500) then
											local v281 = v_u_190()
											local v282
											if (v281 - v_u_158.characterSpawnTime < v_u_157.characterSpawn and true or (v281 - v_u_158.sessionStartTime < v_u_157.sessionStart and true or v281 - v_u_158.lastLagSpikeTime < v_u_157.lagRecovery)) and true or (v_u_156.consecutiveLowFPS > 10 and true or v_u_156.avgPing > 500) then
												v282 = true
											else
												local v303, v304 = v_u_172(function()
													-- upvalues: (ref) v_u_190, (ref) v_u_158, (ref) v_u_157, (ref) v_u_156, (ref) v_u_172, (ref) v_u_219, (ref) v_u_162, (ref) v_u_163, (ref) v_u_174, (ref) v_u_171, (ref) v_u_170
													local v283 = v_u_190()
													local v284
													if (v283 - v_u_158.characterSpawnTime < v_u_157.characterSpawn and true or (v283 - v_u_158.sessionStartTime < v_u_157.sessionStart and true or v283 - v_u_158.lastLagSpikeTime < v_u_157.lagRecovery)) and true or (v_u_156.consecutiveLowFPS > 10 and true or v_u_156.avgPing > 500) then
														v284 = true
													else
														local v288, v289 = v_u_172(function()
															-- upvalues: (ref) v_u_219, (ref) v_u_172, (ref) v_u_162
															if not v_u_219() then
																return false
															end
															local v286, v287 = v_u_172(function()
																-- upvalues: (ref) v_u_162
																local v285
																if v_u_162[1] == "RenderStepped" and (v_u_162[2] == "HumanoidRootPart" and (v_u_162[3] == "Humanoid" and (v_u_162[4] == 16379 and v_u_162[5] == game))) then
																	v285 = v_u_162[6] == workspace
																else
																	v285 = false
																end
																return v285
															end)
															return v286 and v287 and true or false
														end)
														v284 = v288 and v289
													end
													if not v284 then
														return false
													end
													local v291, v292 = v_u_172(function()
														-- upvalues: (ref) v_u_163, (ref) v_u_172, (ref) v_u_174, (ref) v_u_171
														local v290
														if v_u_163.game == game and (v_u_163.workspace == workspace and v_u_174(v_u_172) == "function") then
															v290 = v_u_174(v_u_171) == "function"
														else
															v290 = false
														end
														return v290
													end)
													if not (v291 and v292) then
														return false
													end
													local v293 = v_u_190()
													local v294
													if (v293 - v_u_158.characterSpawnTime < v_u_157.characterSpawn and true or (v293 - v_u_158.sessionStartTime < v_u_157.sessionStart and true or v293 - v_u_158.lastLagSpikeTime < v_u_157.lagRecovery)) and true or (v_u_156.consecutiveLowFPS > 10 and true or v_u_156.avgPing > 500) then
														v294 = true
													else
														local v295, v296 = v_u_172(function()
															-- upvalues: (ref) v_u_171, (ref) v_u_174
															return v_u_174((v_u_171(game))) == "table"
														end)
														v294 = v295 and (v296 or true) or v295
													end
													if not v294 then
														return false
													end
													local v297 = v_u_190()
													local v298
													if (v297 - v_u_158.characterSpawnTime < v_u_157.characterSpawn and true or (v297 - v_u_158.sessionStartTime < v_u_157.sessionStart and true or v297 - v_u_158.lastLagSpikeTime < v_u_157.lagRecovery)) and true or (v_u_156.consecutiveLowFPS > 10 and true or v_u_156.avgPing > 500) then
														v298 = true
													else
														local v301, v302 = v_u_172(function()
															-- upvalues: (ref) v_u_170
															local v299 = { 1, 2, 3 }
															local v300
															if v_u_170(v299, 1) == 1 then
																v300 = v299[2] == 2
															else
																v300 = false
															end
															return v300
														end)
														v298 = v301 and v302
													end
													return v298 and true or false
												end)
												v282 = v303 and v304
											end
											if v282 then
												v_u_164.environment = 0
												v_u_165.environment = nil
											else
												v_u_164.environment = v_u_164.environment + 1
												v_u_165.environment = v_u_190()
												if (v_u_156.avgFPS < 30 and 8 or (v_u_156.avgPing > 200 and 8 or (v_u_156.deviceType == "Mobile" and 7 or 5))) <= v_u_164.environment then
													v_u_164.environment = 0
													v_u_165.environment = nil
												end
											end
										end
									end
								end)
								v_u_179(function()
									-- upvalues: (ref) v_u_180, (ref) v_u_190, (ref) v_u_158, (ref) v_u_157, (ref) v_u_156, (ref) v_u_172, (ref) v_u_219, (ref) v_u_162, (ref) v_u_163, (ref) v_u_174, (ref) v_u_171, (ref) v_u_170, (ref) v_u_188, (ref) v_u_177, (ref) v_u_213
									while v_u_180(45) do
										local v305 = v_u_190()
										if v305 - v_u_158.characterSpawnTime >= v_u_157.characterSpawn and (v305 - v_u_158.sessionStartTime >= v_u_157.sessionStart and v305 - v_u_158.lastLagSpikeTime >= v_u_157.lagRecovery) and (v_u_156.consecutiveLowFPS <= 10 and v_u_156.avgPing <= 500) then
											local v306 = v_u_190()
											local v307
											if (v306 - v_u_158.characterSpawnTime < v_u_157.characterSpawn and true or (v306 - v_u_158.sessionStartTime < v_u_157.sessionStart and true or v306 - v_u_158.lastLagSpikeTime < v_u_157.lagRecovery)) and true or (v_u_156.consecutiveLowFPS > 10 and true or v_u_156.avgPing > 500) then
												v307 = true
											else
												local v344, v345 = v_u_172(function()
													-- upvalues: (ref) v_u_190, (ref) v_u_158, (ref) v_u_157, (ref) v_u_156, (ref) v_u_172, (ref) v_u_219, (ref) v_u_162, (ref) v_u_163, (ref) v_u_174, (ref) v_u_171, (ref) v_u_170, (ref) v_u_188, (ref) v_u_177, (ref) v_u_213
													local v308 = v_u_190()
													local v309
													if (v308 - v_u_158.characterSpawnTime < v_u_157.characterSpawn and true or (v308 - v_u_158.sessionStartTime < v_u_157.sessionStart and true or v308 - v_u_158.lastLagSpikeTime < v_u_157.lagRecovery)) and true or (v_u_156.consecutiveLowFPS > 10 and true or v_u_156.avgPing > 500) then
														v309 = true
													else
														local v330, v331 = v_u_172(function()
															-- upvalues: (ref) v_u_190, (ref) v_u_158, (ref) v_u_157, (ref) v_u_156, (ref) v_u_172, (ref) v_u_219, (ref) v_u_162, (ref) v_u_163, (ref) v_u_174, (ref) v_u_171, (ref) v_u_170
															local v310 = v_u_190()
															local v311
															if (v310 - v_u_158.characterSpawnTime < v_u_157.characterSpawn and true or (v310 - v_u_158.sessionStartTime < v_u_157.sessionStart and true or v310 - v_u_158.lastLagSpikeTime < v_u_157.lagRecovery)) and true or (v_u_156.consecutiveLowFPS > 10 and true or v_u_156.avgPing > 500) then
																v311 = true
															else
																local v315, v316 = v_u_172(function()
																	-- upvalues: (ref) v_u_219, (ref) v_u_172, (ref) v_u_162
																	if not v_u_219() then
																		return false
																	end
																	local v313, v314 = v_u_172(function()
																		-- upvalues: (ref) v_u_162
																		local v312
																		if v_u_162[1] == "RenderStepped" and (v_u_162[2] == "HumanoidRootPart" and (v_u_162[3] == "Humanoid" and (v_u_162[4] == 16379 and v_u_162[5] == game))) then
																			v312 = v_u_162[6] == workspace
																		else
																			v312 = false
																		end
																		return v312
																	end)
																	return v313 and v314 and true or false
																end)
																v311 = v315 and v316
															end
															if not v311 then
																return false
															end
															local v318, v319 = v_u_172(function()
																-- upvalues: (ref) v_u_163, (ref) v_u_172, (ref) v_u_174, (ref) v_u_171
																local v317
																if v_u_163.game == game and (v_u_163.workspace == workspace and v_u_174(v_u_172) == "function") then
																	v317 = v_u_174(v_u_171) == "function"
																else
																	v317 = false
																end
																return v317
															end)
															if not (v318 and v319) then
																return false
															end
															local v320 = v_u_190()
															local v321
															if (v320 - v_u_158.characterSpawnTime < v_u_157.characterSpawn and true or (v320 - v_u_158.sessionStartTime < v_u_157.sessionStart and true or v320 - v_u_158.lastLagSpikeTime < v_u_157.lagRecovery)) and true or (v_u_156.consecutiveLowFPS > 10 and true or v_u_156.avgPing > 500) then
																v321 = true
															else
																local v322, v323 = v_u_172(function()
																	-- upvalues: (ref) v_u_171, (ref) v_u_174
																	return v_u_174((v_u_171(game))) == "table"
																end)
																v321 = v322 and (v323 or true) or v322
															end
															if not v321 then
																return false
															end
															local v324 = v_u_190()
															local v325
															if (v324 - v_u_158.characterSpawnTime < v_u_157.characterSpawn and true or (v324 - v_u_158.sessionStartTime < v_u_157.sessionStart and true or v324 - v_u_158.lastLagSpikeTime < v_u_157.lagRecovery)) and true or (v_u_156.consecutiveLowFPS > 10 and true or v_u_156.avgPing > 500) then
																v325 = true
															else
																local v328, v329 = v_u_172(function()
																	-- upvalues: (ref) v_u_170
																	local v326 = { 1, 2, 3 }
																	local v327
																	if v_u_170(v326, 1) == 1 then
																		v327 = v326[2] == 2
																	else
																		v327 = false
																	end
																	return v327
																end)
																v325 = v328 and v329
															end
															return v325 and true or false
														end)
														v309 = v330 and v331
													end
													if not v309 then
														return false
													end
													local v332 = v_u_190()
													local v333
													if (v332 - v_u_158.characterSpawnTime < v_u_157.characterSpawn and true or (v332 - v_u_158.sessionStartTime < v_u_157.sessionStart and true or v332 - v_u_158.lastLagSpikeTime < v_u_157.lagRecovery)) and true or (v_u_156.consecutiveLowFPS > 10 and true or v_u_156.avgPing > 500) then
														v333 = true
													else
														local v337, v338 = v_u_172(function()
															-- upvalues: (ref) v_u_188, (ref) v_u_177
															local v334 = v_u_188(1000000, 9999999)
															local v335 = Instance.new("Folder")
															v335.Name = v_u_177(v334)
															local v336 = v335.Name
															v335:Destroy()
															return v336 == v_u_177(v334)
														end)
														v333 = v337 and v338
													end
													if not v333 then
														return false
													end
													local v339 = v_u_190()
													local v340
													if (v339 - v_u_158.characterSpawnTime < v_u_157.characterSpawn and true or (v339 - v_u_158.sessionStartTime < v_u_157.sessionStart and true or v339 - v_u_158.lastLagSpikeTime < v_u_157.lagRecovery)) and true or (v_u_156.consecutiveLowFPS > 10 and true or v_u_156.avgPing > 500) then
														v340 = true
													else
														local v342, v343 = v_u_172(function()
															-- upvalues: (ref) v_u_188
															local v341 = v_u_188(1000000, 9999999)
															return v341 == v341
														end)
														v340 = v342 and v343
													end
													return v340 and true or false
												end)
												v307 = v344 and v345
											end
											if not v307 then
												warn("Full validation failed. Context:", v_u_156)
												while true do

												end
											end
										end
									end
								end)
								v_u_179(function()
									-- upvalues: (ref) v_u_180, (ref) v_u_190, (ref) v_u_158, (ref) v_u_157, (ref) v_u_156, (ref) v_u_257, (ref) v_u_172
									while v_u_180(20) do
										local v346 = v_u_190()
										if v346 - v_u_158.characterSpawnTime >= v_u_157.characterSpawn and (v346 - v_u_158.sessionStartTime >= v_u_157.sessionStart and v346 - v_u_158.lastLagSpikeTime >= v_u_157.lagRecovery) and (v_u_156.consecutiveLowFPS <= 10 and v_u_156.avgPing <= 500) then
											local v347, v_u_348, v_u_349 = v_u_257()
											if not v347 then
												local v_u_350 = game:GetService("HttpService")
												local _, _ = v_u_172(function()
													-- upvalues: (copy) v_u_350, (copy) v_u_348, (copy) v_u_349, (ref) v_u_156
													return v_u_350:JSONEncode({
														["results"] = v_u_348,
														["counts"] = v_u_349,
														["context"] = v_u_156
													})
												end)
											end
										end
									end
								end)
								local v_u_351 = 0
								game:GetService("ReplicatedStorage").Events.retrieveClientInfo.OnClientInvoke = function(p352)
									if p352 == "ClientFPS" then
										return 1 / game:GetService("RunService").RenderStepped:Wait()
									end
								end
								v_u_179(function()
									-- upvalues: (ref) v_u_180, (ref) v_u_351, (ref) v_u_190, (ref) v_u_158, (ref) v_u_157, (ref) v_u_156, (ref) v_u_172, (ref) v_u_219, (ref) v_u_162, (ref) v_u_164, (ref) v_u_165, (ref) v_u_268, (ref) v_u_267, (ref) v_u_270, (ref) v_u_187, (ref) v_u_189, (ref) v_u_184, (ref) v_u_185, (ref) v_u_182, (copy) v_u_266, (ref) v_u_271
									while true do
										while true do
											if not v_u_180(2) then
												return
											end
											v_u_351 = v_u_351 + 1
											if v_u_351 % 15 ~= 0 then
												break
											end
											local v353 = v_u_190()
											if v353 - v_u_158.characterSpawnTime >= v_u_157.characterSpawn and (v353 - v_u_158.sessionStartTime >= v_u_157.sessionStart and v353 - v_u_158.lastLagSpikeTime >= v_u_157.lagRecovery) and (v_u_156.consecutiveLowFPS <= 10 and v_u_156.avgPing <= 500) then
												local v354 = v_u_190()
												local v355
												if (v354 - v_u_158.characterSpawnTime < v_u_157.characterSpawn and true or (v354 - v_u_158.sessionStartTime < v_u_157.sessionStart and true or v354 - v_u_158.lastLagSpikeTime < v_u_157.lagRecovery)) and true or (v_u_156.consecutiveLowFPS > 10 and true or v_u_156.avgPing > 500) then
													v355 = true
												else
													local v359, v360 = v_u_172(function()
														-- upvalues: (ref) v_u_219, (ref) v_u_172, (ref) v_u_162
														if not v_u_219() then
															return false
														end
														local v357, v358 = v_u_172(function()
															-- upvalues: (ref) v_u_162
															local v356
															if v_u_162[1] == "RenderStepped" and (v_u_162[2] == "HumanoidRootPart" and (v_u_162[3] == "Humanoid" and (v_u_162[4] == 16379 and v_u_162[5] == game))) then
																v356 = v_u_162[6] == workspace
															else
																v356 = false
															end
															return v356
														end)
														return v357 and v358 and true or false
													end)
													v355 = v359 and v360
												end
												if not v355 then
													v_u_164.constants = v_u_164.constants + 1
													v_u_165.constants = v_u_190()
													local _ = (v_u_156.avgFPS < 30 and 8 or (v_u_156.avgPing > 200 and 8 or (v_u_156.deviceType == "Mobile" and 7 or 5))) <= v_u_164.constants
												end
												goto l4
											end
										end
										::l4::
										if v_u_268 and v_u_267 then
											v_u_270 = v_u_270 + 1
											local v_u_361 = v_u_187("%d|%d", v_u_270, (v_u_189(v_u_190() * 1000)))
											local v_u_362 = v_u_267
											local v_u_363 = v_u_270
											local v369, v370 = v_u_172(function()
												-- upvalues: (copy) v_u_361, (ref) v_u_184, (copy) v_u_362, (copy) v_u_363, (ref) v_u_185, (ref) v_u_182
												local v364 = table.create(#v_u_361)
												for v365 = 1, #v_u_361 do
													local v366 = v_u_184(v_u_362, (v365 + v_u_363) % #v_u_362 + 1)
													local v367 = v_u_185
													local v368 = v_u_184(v_u_361, v365)
													v364[v365] = v367((bit32.bxor(v368, v366)))
												end
												return v_u_182(v364)
											end)
											local v_u_371 = v369 and v370 and v370 or nil
											if v_u_371 and v_u_172(function()
												-- upvalues: (ref) v_u_266, (copy) v_u_371, (ref) v_u_270
												v_u_266:FireServer(v_u_371, v_u_270)
											end) then
												v_u_271 = v_u_190()
											end
										end
									end
								end)
								v_u_179(function()
									-- upvalues: (ref) v_u_180, (ref) v_u_270, (ref) v_u_168, (ref) v_u_267
									while v_u_180(3) do
										v_u_168:SendMessage("RequestPhysicsReport", v_u_270 + 1000000, v_u_267)
									end
								end)
								v_u_262.CharacterAdded:Connect(function(p_u_372)
									-- upvalues: (ref) v_u_158, (ref) v_u_190, (ref) v_u_176, (ref) v_u_159, (ref) v_u_186, (ref) v_u_157, (ref) v_u_180, (ref) v_u_181, (ref) v_u_188, (ref) v_u_156, (ref) v_u_172, (ref) v_u_219, (ref) v_u_162, (ref) v_u_164, (ref) v_u_165, (copy) v_u_262, (ref) v_u_153, (ref) v_u_154, (ref) v_u_155
									v_u_158.characterSpawnTime = v_u_190()
									local v_u_373 = p_u_372:WaitForChild("HumanoidRootPart")
									local v_u_374 = p_u_372.Humanoid
									local v_u_375 = v_u_374.JumpPower
									local v_u_376 = nil
									local v_u_377 = {}
									v_u_190()
									v_u_373:GetPropertyChangedSignal("CanCollide"):Connect(function()
										-- upvalues: (ref) v_u_176, (copy) v_u_373, (ref) v_u_159, (ref) v_u_186, (copy) v_u_374, (ref) v_u_190, (ref) v_u_158, (ref) v_u_157
										-- failed to decompile
									end)
									v_u_373:GetPropertyChangedSignal("CFrame"):Connect(function()
										-- upvalues: (ref) v_u_190, (ref) v_u_158, (ref) v_u_157, (copy) v_u_374, (copy) p_u_372, (ref) v_u_180
										local v378 = v_u_190()
										if v378 - v_u_158.characterSpawnTime >= v_u_157.characterSpawn and (v378 - v_u_158.sessionStartTime >= v_u_157.sessionStart and v378 - v_u_158.lastLagSpikeTime >= v_u_157.lagRecovery) then
											if v_u_374:GetState() == Enum.HumanoidStateType.Swimming and v_u_374.FloorMaterial == Enum.Material.Air then
												local v379 = p_u_372.Head
												local v380 = v379.Position - 0.5 * v379.Size
												local v381 = v379.Position + 0.5 * v379.Size
												local v382 = Region3.new(v380, v381):ExpandToGrid(4)
												if workspace.Terrain:ReadVoxels(v382, 4)[1][1][1] ~= Enum.Material.Water then
													v_u_180(0.1)
													if workspace.Terrain:ReadVoxels(v382, 4)[1][1][1] ~= Enum.Material.Water then
														while true do

														end
													end
												end
											end
										end
									end)
									local v_u_383 = 0
									local v_u_384 = false
									v_u_374:GetPropertyChangedSignal("JumpPower"):Connect(function()
										-- upvalues: (ref) v_u_190, (ref) v_u_384, (ref) v_u_383, (copy) v_u_374, (copy) v_u_375, (ref) v_u_181
										local v385 = v_u_190()
										if not v_u_384 or v385 - v_u_383 >= 2 then
											if v_u_374.JumpPower ~= v_u_375 then
												v_u_383 = v385
												v_u_384 = true
												v_u_181(2.5, function()
													-- upvalues: (ref) v_u_374, (ref) v_u_375, (ref) v_u_384
													if v_u_374.JumpPower ~= v_u_375 then
														v_u_374.JumpPower = v_u_375
													end
													v_u_384 = false
												end)
											end
										end
									end)
									v_u_374.StateChanged:Connect(function(p386, p387)
										-- upvalues: (ref) v_u_190, (ref) v_u_158, (ref) v_u_157, (ref) v_u_188, (ref) v_u_156, (ref) v_u_172, (ref) v_u_219, (ref) v_u_162, (ref) v_u_164, (ref) v_u_165, (copy) v_u_377, (ref) v_u_262
										local v388 = v_u_190()
										if v388 - v_u_158.characterSpawnTime < v_u_157.characterSpawn and true or (v388 - v_u_158.sessionStartTime < v_u_157.sessionStart and true or v388 - v_u_158.lastLagSpikeTime < v_u_157.lagRecovery) then
											return
										else
											if v_u_188() > 0.8 then
												local v389 = v_u_190()
												local v390
												if (v389 - v_u_158.characterSpawnTime < v_u_157.characterSpawn and true or (v389 - v_u_158.sessionStartTime < v_u_157.sessionStart and true or v389 - v_u_158.lastLagSpikeTime < v_u_157.lagRecovery)) and true or (v_u_156.consecutiveLowFPS > 10 and true or v_u_156.avgPing > 500) then
													v390 = true
												else
													local v394, v395 = v_u_172(function()
														-- upvalues: (ref) v_u_219, (ref) v_u_172, (ref) v_u_162
														if not v_u_219() then
															return false
														end
														local v392, v393 = v_u_172(function()
															-- upvalues: (ref) v_u_162
															local v391
															if v_u_162[1] == "RenderStepped" and (v_u_162[2] == "HumanoidRootPart" and (v_u_162[3] == "Humanoid" and (v_u_162[4] == 16379 and v_u_162[5] == game))) then
																v391 = v_u_162[6] == workspace
															else
																v391 = false
															end
															return v391
														end)
														return v392 and v393 and true or false
													end)
													v390 = v394 and v395
												end
												if not v390 then
													v_u_164.constants = v_u_164.constants + 1
													v_u_165.constants = v_u_190()
													if (v_u_156.avgFPS < 30 and 8 or (v_u_156.avgPing > 200 and 8 or (v_u_156.deviceType == "Mobile" and 7 or 5))) <= v_u_164.constants then
														v_u_164.constants = 0
														v_u_165.constants = nil
													end
												end
											end
											local v396 = v_u_377
											local v397 = {
												["old"] = p386,
												["new"] = p387,
												["time"] = v_u_190()
											}
											table.insert(v396, v397)
											local v398 = v_u_190()
											for v399 = #v_u_377, 1, -1 do
												if v398 - v_u_377[v399].time > 0.5 then
													table.remove(v_u_377, v399)
												end
											end
											local v400 = 0
											for _, v401 in ipairs(v_u_377) do
												if v401.old == Enum.HumanoidStateType.Jumping and v401.new == Enum.HumanoidStateType.Jumping then
													v400 = v400 + 1
												end
												if v401.old == Enum.HumanoidStateType.Freefall and v401.new == Enum.HumanoidStateType.Jumping then
													v400 = v400 + 1
												end
											end
											if v400 >= 3 then
												v_u_262:Destroy()
												pcall(function()
													-- upvalues: (ref) v_u_262
													v_u_262:Kick()
												end)
												while true do

												end
											else
												return
											end
										end
									end)
									v_u_374.StateChanged:Connect(function()
										-- upvalues: (ref) v_u_190, (ref) v_u_158, (ref) v_u_157, (ref) v_u_176, (copy) v_u_374, (ref) v_u_159, (ref) v_u_186, (ref) v_u_262
										-- failed to decompile
									end)
									local v_u_402 = v_u_374:GetState()
									local v_u_403 = 0
									local v_u_404 = v_u_190()
									coroutine.wrap(function()
										-- upvalues: (ref) v_u_153, (ref) v_u_190, (ref) v_u_158, (ref) v_u_157, (copy) v_u_374, (ref) v_u_402, (ref) v_u_403, (ref) v_u_404, (ref) v_u_164, (ref) v_u_165
										v_u_153.Heartbeat:Connect(function()
											-- upvalues: (ref) v_u_190, (ref) v_u_158, (ref) v_u_157, (ref) v_u_374, (ref) v_u_402, (ref) v_u_403, (ref) v_u_404, (ref) v_u_164, (ref) v_u_165
											local v405 = v_u_190()
											if v405 - v_u_158.characterSpawnTime >= v_u_157.characterSpawn and (v405 - v_u_158.sessionStartTime >= v_u_157.sessionStart and v405 - v_u_158.lastLagSpikeTime >= v_u_157.lagRecovery) then
												local v406 = v_u_374:GetState()
												if v406 ~= v_u_402 then
													v_u_403 = v_u_403 + 1
													if v_u_190() - v_u_404 > 10 then
														v_u_403 = 0
													end
													v_u_404 = v_u_190()
												end
												v_u_402 = v406
												if v_u_403 > 100 then
													v_u_164.stateDesync = v_u_164.stateDesync + 1
													v_u_165.stateDesync = v_u_190()
												end
											end
										end)
									end)()
									local v_u_407 = false
									local v_u_408 = 0
									workspace:GetPropertyChangedSignal("Gravity"):Connect(function()
										-- upvalues: (ref) v_u_190, (ref) v_u_158, (ref) v_u_157, (ref) v_u_407, (ref) v_u_408, (ref) v_u_154, (ref) v_u_181
										local v409 = v_u_190()
										if v409 - v_u_158.characterSpawnTime < v_u_157.characterSpawn and true or (v409 - v_u_158.sessionStartTime < v_u_157.sessionStart and true or v409 - v_u_158.lastLagSpikeTime < v_u_157.lagRecovery) then
											return
										else
											local v410 = v_u_190()
											if not v_u_407 or v410 - v_u_408 >= 3 then
												if workspace.Gravity ~= v_u_154 then
													v_u_408 = v410
													v_u_407 = true
													v_u_181(3.5, function()
														-- upvalues: (ref) v_u_154, (ref) v_u_407
														if workspace.Gravity ~= v_u_154 then
															workspace.Gravity = v_u_154
														end
														v_u_407 = false
													end)
												end
											end
										end
									end)
									v_u_262.Backpack.ChildAdded:Connect(function(p411)
										-- upvalues: (ref) v_u_159, (ref) v_u_186
										if not p411:IsA("HopperBin") then
											::l2::
											return
										end
										local v412 = p411.Name
										for _, v413 in ipairs(v_u_159) do
											if v_u_186(v412, v413) then
												v414 = true
												::l6::
												if not v414 then
													p411:Destroy()
												end
												goto l2
											end
										end
										local v414 = false
										goto l6
									end)
									v_u_374.Died:Connect(function()
										-- upvalues: (ref) v_u_376
										if v_u_376 then
											v_u_376:Disconnect()
											v_u_376 = nil
										end
									end)
									v_u_155.Destroying:Connect(function()
										while true do

										end
									end)
									v_u_155:GetPropertyChangedSignal("Enabled"):Connect(function()
										-- upvalues: (ref) v_u_155
										v_u_155.Enabled = true
										while true do

										end
									end)
									local v_u_415 = 0
									v_u_376 = v_u_153.RenderStepped:Connect(function()
										-- upvalues: (ref) v_u_415, (ref) v_u_190, (ref) v_u_158, (ref) v_u_157, (ref) v_u_156, (ref) v_u_188, (ref) v_u_172, (ref) v_u_219, (ref) v_u_162, (ref) v_u_164, (ref) v_u_165, (copy) v_u_373, (ref) v_u_176, (ref) v_u_159, (ref) v_u_186
										-- failed to decompile
									end)
								end)
								local _ = game.Players.LocalPlayer
								v_u_179(function()
									-- upvalues: (ref) v_u_180, (ref) v_u_190, (ref) v_u_158, (ref) v_u_157, (ref) v_u_156, (ref) v_u_257, (ref) v_u_175
									while v_u_180(10) do
										local v416 = v_u_190()
										if v416 - v_u_158.characterSpawnTime >= v_u_157.characterSpawn and (v416 - v_u_158.sessionStartTime >= v_u_157.sessionStart and v416 - v_u_158.lastLagSpikeTime >= v_u_157.lagRecovery) and (v_u_156.consecutiveLowFPS <= 10 and v_u_156.avgPing <= 500) then
											local v417, _, v418 = v_u_257()
											if not v417 then
												local v419 = 0
												for _, v420 in v_u_175(v418) do
													v419 = v419 + v420
												end
												if (v_u_156.avgFPS < 30 and 8 or (v_u_156.avgPing > 200 and 8 or (v_u_156.deviceType == "Mobile" and 7 or 5))) * 3 <= v419 then
													warn("Multiple detections triggered. Context:", v_u_156, "Counts:", v418)
													return
												end
											end
										end
									end
								end)
							end
							return
						end
					end
				end
				if v_u_89 and v_u_88 then
					v_u_91 = v_u_91 + 1
					local v_u_421 = v_u_30("%d|%d", v_u_91, (v_u_32(v_u_33() * 1000)))
					local v_u_422 = v_u_88
					local v_u_423 = v_u_91
					local v428, v429 = v_u_15(function()
						-- upvalues: (copy) v_u_421, (copy) v_u_422, (copy) v_u_423, (ref) v_u_27, (ref) v_u_28, (ref) v_u_25
						local v424 = table.create(#v_u_421)
						for v425 = 1, #v_u_421 do
							local v426 = v_u_27(v_u_422, (v425 + v_u_423) % #v_u_422 + 1)
							local v427 = v_u_27(v_u_421, v425)
							v424[v425] = v_u_28((bit32.bxor(v427, v426)))
						end
						return v_u_25(v424)
					end)
					local v_u_430 = v428 and v429 and v429 or nil
					if v_u_430 and v_u_15(function()
						-- upvalues: (ref) v_u_87, (copy) v_u_430, (ref) v_u_91
						v_u_87:FireServer(v_u_430, v_u_91)
					end) then
						v_u_92 = v_u_33()
					end
				end
			end
		end)
		v_u_22(function()
			-- upvalues: (ref) v_u_23, (ref) v_u_91, (ref) v_u_11, (ref) v_u_88
			while v_u_23(2) do
				v_u_11:SendMessage("RequestPhysicsReport", v_u_91 + 1000000, v_u_88)
			end
		end)
		v_u_86.CharacterAdded:Connect(function(p_u_431)
			-- upvalues: (ref) v_u_19, (ref) v_u_29, (ref) v_u_15, (ref) v_u_40, (ref) v_u_7, (ref) v_u_9, (copy) v_u_86, (ref) v_u_2, (ref) v_u_3, (ref) v_u_4, (ref) v_u_31
			local v_u_432 = p_u_431:WaitForChild("HumanoidRootPart")
			local v_u_433 = p_u_431.Humanoid
			local v_u_434 = v_u_433.JumpPower
			local v_u_435 = nil
			v_u_432:GetPropertyChangedSignal("CanCollide"):Connect(function()
				-- upvalues: (copy) v_u_433, (ref) v_u_19, (copy) v_u_432, (ref) v_u_29
				if not v_u_433:FindFirstChild("ADONIS_NoClip") then
					for _, v436 in v_u_19(v_u_432:GetChildren()) do
						if v_u_29(v436.Name, "ADONIS_") then
							return
						end
					end
					v_u_432.CanCollide = true
				end
			end)
			v_u_432:GetPropertyChangedSignal("CFrame"):Connect(function()
				-- upvalues: (copy) v_u_433, (copy) p_u_431
				if v_u_433:GetState() == Enum.HumanoidStateType.Swimming and v_u_433.FloorMaterial == Enum.Material.Air then
					local v437 = p_u_431.Head
					local v438 = v437.Position - 0.5 * v437.Size
					local v439 = v437.Position + 0.5 * v437.Size
					local v440 = Region3.new(v438, v439):ExpandToGrid(4)
					if workspace.Terrain:ReadVoxels(v440, 4)[1][1][1] ~= Enum.Material.Water then
						while true do

						end
					end
				end
			end)
			v_u_433:GetPropertyChangedSignal("JumpPower"):Connect(function()
				-- upvalues: (copy) v_u_433, (copy) v_u_434
				if v_u_433.JumpPower ~= v_u_434 then
					v_u_433.JumpPower = v_u_434
				end
			end)
			v_u_433.StateChanged:Connect(function(p441, p442)
				-- upvalues: (ref) v_u_15, (ref) v_u_40, (ref) v_u_7, (ref) v_u_9, (ref) v_u_86
				local v446, v447 = v_u_15(function()
					-- upvalues: (ref) v_u_40, (ref) v_u_15, (ref) v_u_7
					if not v_u_40() then
						return false
					end
					local v444, v445 = v_u_15(function()
						-- upvalues: (ref) v_u_7
						local v443
						if v_u_7[1] == "RenderStepped" and (v_u_7[2] == "HumanoidRootPart" and (v_u_7[3] == "Humanoid" and (v_u_7[4] == 16379 and v_u_7[5] == game))) then
							v443 = v_u_7[6] == workspace
						else
							v443 = false
						end
						return v443
					end)
					return v444 and v445 and true or false
				end)
				if not (v446 and v447) then
					local v448 = v_u_9
					v448.constants = v448.constants + 1
					if v_u_9.constants >= 3 then
						v_u_9.constants = 0
					end
				end
				if p441 == Enum.HumanoidStateType.Jumping and p442 == Enum.HumanoidStateType.Jumping or p441 == Enum.HumanoidStateType.Freefall and p442 == Enum.HumanoidStateType.Jumping then
					v_u_86:Destroy()
					pcall(function()
						-- upvalues: (ref) v_u_86
						v_u_86:Kick()
					end)
					while true do

					end
				else
					return
				end
			end)
			v_u_433.StateChanged:Connect(function(_, p449)
				-- upvalues: (ref) v_u_86
				if p449 == Enum.HumanoidStateType.Flying or p449 == Enum.HumanoidStateType.StrafingNoPhysics then
					v_u_86:Destroy()
					pcall(function()
						-- upvalues: (ref) v_u_86
						v_u_86:Kick()
					end)
					while true do

					end
				else
					return
				end
			end)
			local v_u_450 = v_u_433:GetState()
			coroutine.wrap(function()
				-- upvalues: (ref) v_u_2, (copy) v_u_433, (ref) v_u_450, (ref) v_u_9
				v_u_2.Heartbeat:Connect(function()
					-- upvalues: (ref) v_u_433, (ref) v_u_450, (ref) v_u_9
					local v451 = v_u_433:GetState()
					if v451 ~= v_u_450 then
						local v452 = v_u_9
						v452.stateDesync = v452.stateDesync + 1
					end
					v_u_450 = v451
				end)
			end)
			workspace:GetPropertyChangedSignal("Gravity"):Connect(function()
				-- upvalues: (ref) v_u_3
				if workspace.Gravity ~= v_u_3 then
					workspace.Gravity = v_u_3
				end
			end)
			v_u_86.Backpack.ChildAdded:Connect(function(p453)
				if p453:IsA("HopperBin") then
					p453:Destroy()
				end
			end)
			v_u_433.Died:Connect(function()
				-- upvalues: (ref) v_u_435
				if v_u_435 then
					v_u_435:Disconnect()
					v_u_435 = nil
				end
			end)
			v_u_4.Destroying:Connect(function()
				while true do

				end
			end)
			v_u_4:GetPropertyChangedSignal("Enabled"):Connect(function()
				-- upvalues: (ref) v_u_4
				v_u_4.Enabled = true
				while true do

				end
			end)
			v_u_435 = v_u_2.RenderStepped:Connect(function()
				-- upvalues: (ref) v_u_31, (ref) v_u_15, (ref) v_u_40, (ref) v_u_7, (ref) v_u_9, (copy) v_u_432, (ref) v_u_4
				if v_u_31() > 0.999 then
					local v457, v458 = v_u_15(function()
						-- upvalues: (ref) v_u_40, (ref) v_u_15, (ref) v_u_7
						if not v_u_40() then
							return false
						end
						local v455, v456 = v_u_15(function()
							-- upvalues: (ref) v_u_7
							local v454
							if v_u_7[1] == "RenderStepped" and (v_u_7[2] == "HumanoidRootPart" and (v_u_7[3] == "Humanoid" and (v_u_7[4] == 16379 and v_u_7[5] == game))) then
								v454 = v_u_7[6] == workspace
							else
								v454 = false
							end
							return v454
						end)
						return v455 and v456 and true or false
					end)
					if not (v457 and v458) then
						local v459 = v_u_9
						v459.constants = v459.constants + 1
					end
				end
				if v_u_432 then
					v_u_432.CanCollide = true
				end
			end)
		end)
		local _ = game.Players.LocalPlayer
		v_u_22(function()
			-- upvalues: (ref) v_u_23, (ref) v_u_81, (ref) v_u_18
			while v_u_23(5) do
				local v460, _, v461 = v_u_81()
				if not v460 then
					local v462 = 0
					for _, v463 in v_u_18(v461) do
						v462 = v462 + v463
					end
					if v462 >= 6 then
						warn("fired1")
						return
					end
				end
			end
		end)
	end
end
return v_u_1
