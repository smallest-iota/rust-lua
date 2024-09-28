local FOV = 70 -- CONFIGURE THIS!
local FOV_TOGGLE = false
local FOV_KEY_ON = "x"
local FOV_KEY_OFF = "c"

-- AK47
local AK47_2_SENSITIVITY = 1.00
local AK47_2_MODIFIER = false -- USE CTRL TO ACTIVATE?
local AK47_2 = 3 -- MOUSE KEYBIND
local AK47_2_HOLOSIGHT = true
local AK47_2_SILENCER = false

-- LR300
local LR300_2_SENSITIVITY = 1.00
local LR300_2_MODIFIER = true -- USE CTRL TO ACTIVATE?
local LR300_2 = 3 -- MOUSE KEYBIND
local LR300_2_HOLOSIGHT = true
local LR300_2_SILENCER = false

-- MP5A4
local MP5A4_2_SENSITIVITY = 1.00
local MP5A4_2_MODIFIER = false -- USE CTRL TO ACTIVATE?
local MP5A4_2 = 5 -- MOUSE KEYBIND
local MP5A4_2_HOLOSIGHT = false
local MP5A4_2_SILENCER = false

-- THOMPSON
local THOMPSON_2_SENSITIVITY = 1.00
local THOMPSON_2_MODIFIER = false -- USE CTRL TO ACTIVATE?
local THOMPSON_2 = 4 -- MOUSE KEYBIND
local THOMPSON_2_HOLOSIGHT = true
local THOMPSON_2_SILENCER = false

-- CUSTOM SMG??
local SMG_2_SENSITIVITY = 1.00
local SMG_2_MODIFIER = false -- USE CTRL TO ACTIVATE?
local SMG_2 = nil -- MOUSE KEYBIND
local SMG_2_HOLOSIGHT = false
local SMG_2_SILENCER = false

-- HM-LMG
local HMLMG_2_SENSITIVITY = 1.00
local HMLMG_2_MODIFIER = true -- USE CTRL TO ACTIVATE?
local HMLMG_2 = 5 -- MOUSE KEYBIND
local HMLMG_2_HOLOSIGHT = false
local HMLMG_2_SILENCER = false

-- M249
local M249_2_SENSITIVITY = 1.00
local M249_2_MODIFIER = true -- USE CTRL TO ACTIVATE?
local M249_2 = 4 -- MOUSE KEYBIND
local M249_2_HOLOSIGHT = false
local M249_2_SILENCER = false


-- ### GUN MODIFICATIONS / ATTACHMENTS ###
---------------------------AK47----------------------------------
local AK47_2_X8_SCOPE = false
local AK47_2_X16_SCOPE = false
local AK47_2_HANDMADESIGHT = false
local AK47_2_MUZZLEBOOST = false
---------------------------LR300---------------------------------
local LR300_2_X8_SCOPE = false
local LR300_2_X16_SCOPE = false
local LR300_2_HANDMADESIGHT = false
local LR300_2_MUZZLEBOOST = false
---------------------------MP5A4---------------------------------
local MP5A4_2_X8_SCOPE = false
local MP5A4_2_X16_SCOPE = false
local MP5A4_2_HANDMADESIGHT = false
local MP5A4_2_MUZZLEBOOST = false
---------------------------THOMPSON------------------------------
local THOMPSON_2_X8_SCOPE = false
local THOMPSON_2_X16_SCOPE = false
local THOMPSON_2_HANDMADESIGHT = false
local THOMPSON_2_MUZZLEBOOST = false
---------------------------SMG-----------------------------------
local SMG_2_X8_SCOPE = false
local SMG_2_X16_SCOPE = false
local SMG_2_HANDMADESIGHT = false
local SMG_2_MUZZLEBOOST = false
---------------------------HMLMG---------------------------------
local HMLMG_2_X8_SCOPE = false
local HMLMG_2_X16_SCOPE = false
local HMLMG_2_HANDMADESIGHT = false
---------------------------M249----------------------------------
local M249_2_X8_SCOPE = false
local M249_2_X16_SCOPE = false
local M249_2_HANDMADESIGHT = false


--HELPER FUNCTIONS------------------------------------------------
function IsLeftNotPressed()return not IsMouseButtonPressed(1)end
function IsRightNotPressed()return not IsMouseButtonPressed(3)end
function waitfornth(a)local b=GetRunningTime()+a;repeat until GetRunningTime()>b-1 end
function round(x) return x>=0 and math.floor(x+0.5) or math.ceil(x-0.5) end
function Smoothing(a,b,c)x_=0;y_=0;t_=0;for d=1,a do xI=round(d*b/a)yI=round(d*c/a)tI=d*a/a;MoveMouseRelative(round(xI-x_),round(yI-y_))waitfornth(tI-t_)x_=xI;y_=yI;t_=tI end end
--PATTERNS-------------------------------------------------------
AK47_OFFSET_X = {"0", "0.196287718722224", "0.365188622188568", "0.508115456226468", "0.626480966663358", "0.721697899326678", "0.795179000043864", "0.848337014642358", "0.882584688949584", "0.899334768792984", "0.9", "0.9", "0.9", "0.9", "0.9", "0.9", "0.9", "0.9", "0.9", "0.9", "0.9", "0.9", "0.9", "0.9", "0.9", "0.9", "0.9", "0.9", "0.9", "0.9"}
AK47_OFFSET_Y = {"-1.35", "-1.35", "-1.35", "-1.35", "-1.35", "-1.35", "-1.35", "-1.35", "-1.35", "-1.35", "-1.35", "-1.35", "-1.35", "-1.35", "-1.35", "-1.35", "-1.35", "-1.35", "-1.35", "-1.35", "-1.35", "-1.35", "-1.35", "-1.35", "-1.35", "-1.35", "-1.35", "-1.35", "-1.35", "-1.35"}
AK47_RPM = 133.3
AK47_BULLETS = #AK47_OFFSET_Y

LR300_OFFSET_X = {"0", "0.017410668448276", "0.017410668448276", "0.017410668448276", "0.017410668448276", "0.017410668448276", "0.017410668448276", "0.017410668448276", "0.017410668448276", "0.017410668448276", "0.017410668448276", "0.017410668448276", "0.017410668448276", "0.017410668448276", "0.017410668448276", "0.017410668448276", "0.017410668448276", "0.017410668448276", "0.017410668448276", "0.017410668448276", "0.017410668448276", "0.017410668448276", "0.017410668448276", "0.017410668448276", "0.017410668448276", "0.017410668448276", "0.017410668448276", "0.017410668448276", "0.017410668448276", "0.017410668448276"}
LR300_OFFSET_Y = {"-1.16853173596552", "-1.16853173596552", "-1.16853173596552", "-1.16853173596552", "-1.16853173596552", "-1.16853173596552", "-1.16853173596552", "-1.16853173596552", "-1.16853173596552", "-1.16853173596552", "-1.16853173596552", "-1.16853173596552", "-1.16853173596552", "-1.16853173596552", "-1.16853173596552", "-1.16853173596552", "-1.16853173596552", "-1.16853173596552", "-1.16853173596552", "-1.16853173596552", "-1.16853173596552", "-1.16853173596552", "-1.16853173596552", "-1.16853173596552", "-1.16853173596552", "-1.16853173596552", "-1.16853173596552", "-1.16853173596552", "-1.16853173596552", "-1.16853173596552"}
LR300_RPM = 120
LR300_BULLETS = #LR300_OFFSET_Y

MP5A4_OFFSET_X = {"0.0", "0.0", "0.0", "0.0", "0.0", "0.0", "0.0", "0.0", "0.0", "0.0", "0.0", "0.0", "0.0", "0.0", "0.0", "0.0", "0.0", "0.0", "0.0", "0.0", "0.0", "0.0", "0.0", "0.0", "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"}
MP5A4_OFFSET_Y = {"-0.64", "-0.64", "-0.64", "-0.64", "-0.64", "-0.64", "-0.64", "-0.64", "-0.64", "-0.64", "-0.64", "-0.64", "-0.64", "-0.64", "-0.64", "-0.64", "-0.64", "-0.64", "-0.64", "-0.64", "-0.64", "-0.64", "-0.64", "-0.64", "-0.64", "-0.64", "-0.64", "-0.64", "-0.64", "-0.64"}
MP5A4_RPM = 100
MP5A4_BULLETS = #MP5A4_OFFSET_Y

THOMPSON_OFFSET_X = {"-0.085809965", "0.006514516", "0.007734019", "0.048618872", "0.078056445", "-0.066088665", "0.067429669", "0.02780332", "0.133849085", "0.025990565", "-0.061993655", "0.019162548", "0.061810655", "-0.092478981", "0.021123053", "-0.08800972", "-0.201583254", "-0.0398146", "0.003178508"}
THOMPSON_OFFSET_Y = {"-0.510477526", "-0.507449769", "-0.51212903", "-0.518510046", "-0.491714729", "-0.495322988", "-0.506388516", "-0.474468436", "-0.47605394", "-0.502083505", "-0.498620747", "-0.477474444", "-0.485339713", "-0.496579241", "-0.496766742", "-0.52010755", "-0.49584349", "-0.50812102", "-0.485279713"}
THOMPSON_RPM = 129.87013
THOMPSON_BULLETS = #THOMPSON_OFFSET_Y

SMG_OFFSET_X = {"-0.085810521", "0.006513752", "0.007734002", "0.048618762", "0.07805627", "-0.066088517", "0.067429517", "0.027803257", "0.133849533", "0.025989756", "-0.061993515", "0.019163255", "0.061809765", "-0.092478773", "0.021123005", "-0.088008772", "-0.2015828", "-0.03981451", "0.003178501", "0.010626753", "-0.007430252", "0.033057008", "-0.032390258"}
SMG_OFFSET_Y = {"-0.510476378", "-0.507447877", "-0.512127878", "-0.51850813", "-0.491712873", "-0.495321874", "-0.506387377", "-0.474467369", "-0.476052869", "-0.502083126", "-0.498620375", "-0.477473369", "-0.485338621", "-0.496578124", "-0.496765624", "-0.52010563", "-0.495841624", "-0.508119877", "-0.485277871", "-0.413580103", "-0.414059354", "-0.433270608", "-0.41218510"}
SMG_RPM = 100
SMG_BULLETS = #SMG_OFFSET_Y

HMLMG_OFFSET_X = {"0", "-0.536458333", "-0.536458333", "-0.556458333", "-0.556458333", "-0.556458333", "-0.556458333", "-0.556458333", "-0.556458333", "-0.556458333", "-0.556458333", "-0.556458333", "-0.556458333", "-0.556458333", "-0.556458333", "-0.556458333", "-0.556458333", "-0.556458333", "-0.556458333", "-0.556458333", "-0.556458333", "-0.556458333", "-0.556458333", "-0.556458333", "-0.556458333", "-0.556458333", "-0.556458333", "-0.556458333", "-0.556458333", "-0.556458333", "-0.556458333", "-0.556458333", "-0.556458333", "-0.556458333", "-0.556458333", "-0.556458333", "-0.556458333", "-0.556458333", "-0.556458333", "-0.556458333", "-0.556458333", "-0.556458333", "-0.556458333", "-0.556458333", "-0.556458333", "-0.556458333", "-0.556458333", "-0.556458333", "-0.556458333", "-0.556458333", "-0.556458333", "-0.556458333", "-0.556458333", "-0.556458333", "-0.556458333", "-0.556458333", "-0.556458333", "-0.556458333", "-0.556458333", "-0.556458333"}
HMLMG_OFFSET_Y = {"-1.047375", "-1.047375", "-1.047375", "-1.047375", "-1.047375", "-1.047375", "-1.047375", "-1.047375", "-1.047375", "-1.047375", "-1.047375", "-1.047375", "-1.047375", "-1.047375", "-1.047375", "-1.047375", "-1.047375", "-1.047375", "-1.047375", "-1.047375", "-1.047375", "-1.047375", "-1.047375", "-1.047375", "-1.047375", "-1.047375", "-1.047375", "-1.047375", "-1.047375", "-1.047375", "-1.047375", "-1.047375", "-1.047375", "-1.047375", "-1.047375", "-1.047375", "-1.047375", "-1.047375", "-1.047375", "-1.047375", "-1.047375", "-1.047375", "-1.047375", "-1.047375", "-1.047375", "-1.047375", "-1.047375", "-1.047375", "-1.047375", "-1.047375", "-1.047375", "-1.047375", "-1.047375", "-1.047375", "-1.047375", "-1.047375", "-1.047375", "-1.047375", "-1.047375", "-1.047375"}
HMLMG_RPM = 125
HMLMG_BULLETS = #HMLMG_OFFSET_Y

M249_OFFSET_X = {"0", "0.39375", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525", "0.525"}
M249_OFFSET_Y = {"-0.81", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800", "-1.0800"}
M249_RPM = 120
M249_BULLETS = #M249_OFFSET_Y

-- screenMultiplier = -0.03*(SENSITIVITY*3)*(FOV/100)
ScreenMultiplier_AK47 = -0.03*(AK47_2_SENSITIVITY*3)*(FOV/100)
ScreenMultiplier_LR300 = -0.03*(LR300_2_SENSITIVITY*3)*(FOV/100)
ScreenMultiplier_MP5A4 = -0.03*(MP5A4_2_SENSITIVITY*3)*(FOV/100)
ScreenMultiplier_THOMPSON = -0.03*(THOMPSON_2_SENSITIVITY*3)*(FOV/100)
ScreenMultiplier_SMG = -0.03*(SMG_2_SENSITIVITY*3)*(FOV/100)
ScreenMultiplier_HMLMG = -0.03*(HMLMG_2_SENSITIVITY*3)*(FOV/100)
ScreenMultiplier_M249 = -0.03*(M249_2_SENSITIVITY*3)*(FOV/100)

StandMultiplier = 1.89
StandMultiplier_HMLMG = 2
StandMultiplier_M2 = 1.93

scope_2_AK47_1 = 1
scope_2_AK47_2 = 1
scope_2_AK47_3 = 1
scope_2_AK47_4 = 1
barrel_2_AK47_1 = 1
barrel_2_AK47_2 = 1
if AK47_2_HOLOSIGHT == true then
scope_2_AK47_1 = 1.2
end
if AK47_2_X8_SCOPE == true then
scope_2_AK47_2 = 6.9
end
if AK47_2_X16_SCOPE == true then
scope_2_AK47_3 = 13.5
end
if AK47_2_HANDMADESIGHT == true then
scope_2_AK47_4 = 0.8
end
if AK47_2_SILENCER == true then
barrel_2_AK47_1 = 1
end
if AK47_2_MUZZLEBOOST == true then
barrel_2_AK47_2 = 0.9
end

scope_2_LR300_1 = 1
scope_2_LR300_2 = 1
scope_2_LR300_3 = 1
scope_2_LR300_4 = 1
barrel_2_LR300_1 = 1
if LR300_2_HOLOSIGHT == true then
scope_2_LR300_1 = 1.2
end
if LR300_2_X8_SCOPE == true then
scope_2_LR300_2 = 6.75
end
if LR300_2_X16_SCOPE == true then
scope_2_LR300_3 = 13.5
end
if LR300_2_HANDMADESIGHT == true then
scope_2_LR300_4 = 0.8
end
if LR300_2_SILENCER == true then
barrel_2_LR300_1 = 1
end
if LR300_2_MUZZLEBOOST == true then
barrel_2_LR300_2 = 0.9
end

scope_2_MP5A4_1 = 1
scope_2_MP5A4_2 = 1
scope_2_MP5A4_3 = 1
scope_2_MP5A4_4 = 1
barrel_2_MP5A4_1 = 1
if MP5A4_2_HOLOSIGHT == true then
scope_2_MP5A4_1 = 1.2
end
if MP5A4_2_X8_SCOPE == true then
scope_2_MP5A4_2 = 6.75
end
if MP5A4_2_X16_SCOPE == true then
scope_2_MP5A4_3 = 13.5
end
if MP5A4_2_HANDMADESIGHT == true then
scope_2_MP5A4_4 = 0.8
end
if MP5A4_2_SILENCER == true then
barrel_2_MP5A4_1 = 1
end
if MP5A4_2_MUZZLEBOOST == true then
barrel_2_MP5A4_2 = 0.9
end

scope_2_THOMPSON_1 = 1
scope_2_THOMPSON_2 = 1
scope_2_THOMPSON_3 = 1
scope_2_THOMPSON_4 = 1
barrel_2_THOMPSON_1 = 1
barrel_2_THOMPSON_2 = 1
if THOMPSON_2_HOLOSIGHT == true then
scope_2_THOMPSON_1 = 1.5
end
if THOMPSON_2_X8_SCOPE == true then
scope_2_THOMPSON_2 = 7.75
end
if THOMPSON_2_X16_SCOPE == true then
scope_2_THOMPSON_3 = 15.5
end
if THOMPSON_2_HANDMADESIGHT == true then
scope_2_THOMPSON_4 = 0.8
end
if THOMPSON_2_SILENCER == true then
	if THOMPSON_2_HOLOSIGHT == true then
		barrel_2_THOMPSON_1 = 0.9
	else
		barrel_2_THOMPSON_1 = 1
	end
end
if THOMPSON_1_MUZZLEBOOST == true then
barrel_1_THOMPSON_2 = 0.9
end

scope_2_SMG_1 = 1
scope_2_SMG_2 = 1
scope_2_SMG_3 = 1
scope_2_SMG_4 = 1
barrel_2_SMG_1 = 1
if SMG_2_HOLOSIGHT == true then
scope_2_SMG_1 = 1.5
end
if SMG_2_X8_SCOPE == true then
scope_2_SMG_2 = 7.75
end
if SMG_2_X16_SCOPE == true then
scope_2_SMG_3 = 15.5
end
if SMG_2_HANDMADESIGHT == true then
scope_2_SMG_4 = 0.8
end
if SMG_2_SILENCER == true then
	if SMG_2_HOLOSIGHT == true then
		barrel_2_SMG_1 = 0.9
	else
		barrel_2_SMG_1 = 1
	end
end
if SMG_2_MUZZLEBOOST == true then
barrel_2_SMG_2 = 0.9
end

scope_2_HMLMG_1 = 1
scope_2_HMLMG_2 = 1
scope_2_HMLMG_3 = 1
scope_2_HMLMG_4 = 1
barrel_2_HMLMG_1 = 1
if HMLMG_2_HOLOSIGHT == true then
scope_2_HMLMG_1 = 1.2
end
if HMLMG_2_X8_SCOPE == true then
scope_2_HMLMG_2 = 7
end
if HMLMG_2_X16_SCOPE == true then
scope_2_HMLMG_3 = 13.5
end
if HMLMG_2_HANDMADESIGHT == true then
scope_2_HMLMG_4 = 0.8
end
if HMLMG_2_SILENCER == true then
barrel_2_HMLMG_1 = 1
end

scope_2_M249_1 = 1
scope_2_M249_2 = 1
scope_2_M249_3 = 1
scope_2_M249_4 = 1
barrel_2_M249_1 = 1
if M249_2_HOLOSIGHT == true then
scope_2_M249_1 = 1.2
end
if M249_2_X8_SCOPE == true then
scope_2_M249_2 = 7
end
if M249_2_X16_SCOPE == true then
scope_2_M249_3 = 13.5
end
if M249_2_HANDMADESIGHT == true then
scope_2_M249_4 = 0.8
end
if M249_2_SILENCER == true then
barrel_2_M249_1 = 1
end


--AK47
local bullet14 = 1
N2_AK47_C_X = {}
N2_AK47_C_Y = {}
N2_AK47_AT = {}
N2_AK47_ST = {}
for AK47_2st = bullet14, AK47_BULLETS do
	local N2_C_X_AK47 = round((AK47_OFFSET_X[bullet14]/ScreenMultiplier_AK47)*scope_2_AK47_1*scope_2_AK47_2*scope_2_AK47_3*scope_2_AK47_4*barrel_2_AK47_1)
	local N2_C_Y_AK47 = round((AK47_OFFSET_Y[bullet14]/ScreenMultiplier_AK47)*scope_2_AK47_1*scope_2_AK47_2*scope_2_AK47_3*scope_2_AK47_4*barrel_2_AK47_1)
	if AK47_2_MUZZLEBOOST == false then
		N2_AT_AK47 = 100
		N2_ST_AK47 = AK47_RPM - N2_AT_AK47
	else
		N2_AT_AK47 = 100*barrel_2_AK47_2
		N2_ST_AK47 = AK47_RPM*barrel_1_AK47_2 - N2_AT_AK47
	end
	N2_AK47_C_X[#N2_AK47_C_X+1] = N2_C_X_AK47
	N2_AK47_C_Y[#N2_AK47_C_Y+1] = N2_C_Y_AK47
	N2_AK47_AT[#N2_AK47_AT+1] = N2_AT_AK47
	N2_AK47_ST[#N2_AK47_ST+1] = N2_ST_AK47
	bullet14 = bullet14 + 1
end
--LR300
local bullet15 = 1
N2_LR300_C_X = {}
N2_LR300_C_Y = {}
N2_LR300_AT = {}
N2_LR300_ST = {}
for LR300_2st = bullet15, LR300_BULLETS do
	local N2_C_X_LR300 = round((LR300_OFFSET_X[bullet15]/ScreenMultiplier_LR300)*scope_2_LR300_1*scope_2_LR300_2*scope_2_LR300_3*scope_2_LR300_4*barrel_2_LR300_1)
	local N2_C_Y_LR300 = round((LR300_OFFSET_Y[bullet15]/ScreenMultiplier_LR300)*scope_2_LR300_1*scope_2_LR300_2*scope_2_LR300_3*scope_2_LR300_4*barrel_2_LR300_1)
	if LR300_2_MUZZLEBOOST == false then
		N2_AT_LR300 = 100
		N2_ST_LR300 = LR300_RPM - N2_AT_LR300
	else
		N2_AT_LR300 = 100*barrel_2_LR300_2
		N2_ST_LR300 = LR300_RPM*barrel_2_LR300_2 - N2_AT_LR300
	end
	N2_LR300_C_X[#N2_LR300_C_X+1] = N2_C_X_LR300
	N2_LR300_C_Y[#N2_LR300_C_Y+1] = N2_C_Y_LR300
	N2_LR300_AT[#N2_LR300_AT+1] = N2_AT_LR300
	N2_LR300_ST[#N2_LR300_ST+1] = N2_ST_LR300
	bullet15 = bullet15 + 1
end
--MP5A4
local bullet16 = 1
N2_MP5A4_C_X = {}
N2_MP5A4_C_Y = {}
N2_MP5A4_AT = {}
N2_MP5A4_ST = {}
for MP5A4_2st = bullet16, MP5A4_BULLETS do
	local N2_C_X_MP5A4 = round((MP5A4_OFFSET_X[bullet16]/ScreenMultiplier_MP5A4)*scope_2_MP5A4_1*scope_2_MP5A4_2*scope_2_MP5A4_3*scope_2_MP5A4_4*barrel_2_MP5A4_1)
	local N2_C_Y_MP5A4 = round((MP5A4_OFFSET_Y[bullet16]/ScreenMultiplier_MP5A4)*scope_2_MP5A4_1*scope_2_MP5A4_2*scope_2_MP5A4_3*scope_2_MP5A4_4*barrel_2_MP5A4_1)
	if MP5A4_2_MUZZLEBOOST == false then
		N2_AT_MP5A4 = 100
		N2_ST_MP5A4 = MP5A4_RPM - N2_AT_MP5A4
	else
		N2_AT_MP5A4 = 100*barrel_1_MP5A4_2
		N2_ST_MP5A4 = MP5A4_RPM*barrel_2_MP5A4_2 - N2_AT_MP5A4
	end
	N2_MP5A4_C_X[#N2_MP5A4_C_X+1] = N2_C_X_MP5A4
	N2_MP5A4_C_Y[#N2_MP5A4_C_Y+1] = N2_C_Y_MP5A4
	N2_MP5A4_AT[#N2_MP5A4_AT+1] = N2_AT_MP5A4
	N2_MP5A4_ST[#N2_MP5A4_ST+1] = N2_ST_MP5A4
	bullet16 = bullet16 + 1
end
--THOMPSON
local bullet17 = 1
N2_THOMPSON_C_X = {}
N2_THOMPSON_C_Y = {}
N2_THOMPSON_AT = {}
N2_THOMPSON_ST = {}
for THOMPSON_2st = bullet17, THOMPSON_BULLETS do
	local N2_C_X_THOMPSON = round((THOMPSON_OFFSET_X[bullet17]/ScreenMultiplier_THOMPSON)*scope_2_THOMPSON_1*scope_2_THOMPSON_2*scope_2_THOMPSON_3*scope_2_THOMPSON_4*barrel_2_THOMPSON_1)
	local N2_C_Y_THOMPSON = round((THOMPSON_OFFSET_Y[bullet17]/ScreenMultiplier_THOMPSON)*scope_2_THOMPSON_1*scope_2_THOMPSON_2*scope_2_THOMPSON_3*scope_2_THOMPSON_4*barrel_2_THOMPSON_1)
	if THOMPSON_2_MUZZLEBOOST == false then
		N2_AT_THOMPSON = 100
		N2_ST_THOMPSON = THOMPSON_RPM - N2_AT_THOMPSON
	else
		N2_AT_THOMPSON = 100*barrel_2_THOMPSON_2
		N2_ST_THOMPSON = THOMPSON_RPM*barrel_2_THOMPSON_2 - N2_AT_THOMPSON
	end
	N2_THOMPSON_C_X[#N2_THOMPSON_C_X+1] = N2_C_X_THOMPSON
	N2_THOMPSON_C_Y[#N2_THOMPSON_C_Y+1] = N2_C_Y_THOMPSON
	N2_THOMPSON_AT[#N2_THOMPSON_AT+1] = N2_AT_THOMPSON
	N2_THOMPSON_ST[#N2_THOMPSON_ST+1] = N2_ST_THOMPSON
	bullet17 = bullet17 + 1
end
--SMG
local bullet18 = 1
N2_SMG_C_X = {}
N2_SMG_C_Y = {}
N2_SMG_AT = {}
N2_SMG_ST = {}
for SMG_2st = bullet18, SMG_BULLETS do
	local N2_C_X_SMG = round((SMG_OFFSET_X[bullet18]/ScreenMultiplier_SMG)*scope_2_SMG_1*scope_2_SMG_2*scope_2_SMG_3*scope_2_SMG_4*barrel_2_SMG_1)
	local N2_C_Y_SMG = round((SMG_OFFSET_Y[bullet18]/ScreenMultiplier_SMG)*scope_2_SMG_1*scope_2_SMG_2*scope_2_SMG_3*scope_2_SMG_4*barrel_2_SMG_1)
	if SMG_2_MUZZLEBOOST == false then
		N2_AT_SMG = 100
		N2_ST_SMG = SMG_RPM - N2_AT_SMG
	else
		N2_AT_SMG = 100*barrel_2_SMG_2
		N2_ST_SMG = SMG_RPM*barrel_2_SMG_2 - N2_AT_SMG
	end
	N2_SMG_C_X[#N2_SMG_C_X+1] = N2_C_X_SMG
	N2_SMG_C_Y[#N2_SMG_C_Y+1] = N2_C_Y_SMG
	N2_SMG_AT[#N2_SMG_AT+1] = N2_AT_SMG
	N2_SMG_ST[#N2_SMG_ST+1] = N2_ST_SMG
	bullet18 = bullet18 + 1
end
--HMLMG
local bullet19 = 1
N2_HMLMG_C_X = {}
N2_HMLMG_C_Y = {}
N2_HMLMG_AT = {}
N2_HMLMG_ST = {}
for HMLMG_2st = bullet19, HMLMG_BULLETS do
	local N2_C_X_HMLMG = round((HMLMG_OFFSET_X[bullet19]/ScreenMultiplier_HMLMG)*scope_2_HMLMG_1*scope_2_HMLMG_2*scope_2_HMLMG_3*scope_2_HMLMG_4*barrel_2_HMLMG_1)
	local N2_C_Y_HMLMG = round((HMLMG_OFFSET_Y[bullet19]/ScreenMultiplier_HMLMG)*scope_2_HMLMG_1*scope_2_HMLMG_2*scope_2_HMLMG_3*scope_2_HMLMG_4*barrel_2_HMLMG_1)
	local N2_AT_HMLMG = 125
	local N2_ST_HMLMG = HMLMG_RPM - N2_AT_HMLMG
	N2_HMLMG_C_X[#N2_HMLMG_C_X+1] = N2_C_X_HMLMG
	N2_HMLMG_C_Y[#N2_HMLMG_C_Y+1] = N2_C_Y_HMLMG
	N2_HMLMG_AT[#N2_HMLMG_AT+1] = N2_AT_HMLMG
	N2_HMLMG_ST[#N2_HMLMG_ST+1] = N2_ST_HMLMG
	bullet19 = bullet19 + 1
end
--M249
local bullet20 = 1
N2_M249_C_X = {}
N2_M249_C_Y = {}
N2_M249_AT = {}
N2_M249_ST = {}
for M249_2st = bullet20, M249_BULLETS do
	local N2_C_X_M249 = round((M249_OFFSET_X[bullet20]/ScreenMultiplier_M249)*scope_2_M249_1*scope_2_M249_2*scope_2_M249_3*scope_2_M249_4*barrel_2_M249_1)
	local N2_C_Y_M249 = round((M249_OFFSET_Y[bullet20]/ScreenMultiplier_M249)*scope_2_M249_1*scope_2_M249_2*scope_2_M249_3*scope_2_M249_4*barrel_2_M249_1)
	local N2_AT_M249 = 120
	local N2_ST_M249 = M249_RPM - N2_AT_M249
	N2_M249_C_X[#N2_M249_C_X+1] = N2_C_X_M249
	N2_M249_C_Y[#N2_M249_C_Y+1] = N2_C_Y_M249
	N2_M249_AT[#N2_M249_AT+1] = N2_AT_M249
	N2_M249_ST[#N2_M249_ST+1] = N2_ST_M249
	bullet20 = bullet20 + 1
end


--MAIN_EVENT_PART------------------------------------------------
local gun = 0
local kickback = falseB
function OnEvent(event, arg)

--AK47
  if (event == "MOUSE_BUTTON_PRESSED" and arg == AK47_2 and AK47_2_MODIFIER == true and IsModifierPressed("lctrl")) then
    kickback = not kickback
    gun = arg
    if (kickback == false) then
      OutputLogMessage("LCTRL_AK47_2_MACRO-OFF\n")
    else
      OutputLogMessage("LCTRL_AK47_2_MACRO-ON\n")
      EnablePrimaryMouseButtonEvents(true)
    end
--LR300
  elseif (event == "MOUSE_BUTTON_PRESSED" and arg == LR300_2 and LR300_2_MODIFIER == true and IsModifierPressed("lctrl")) then
    kickback = not kickback
    gun = arg
    if (kickback == false) then
      OutputLogMessage("LCTRL_LR300_2_MACRO-OFF\n")
    else
      OutputLogMessage("LCTRL_LR300_2_MACRO-ON\n")
      EnablePrimaryMouseButtonEvents(true)
    end
--MP5A4
  elseif (event == "MOUSE_BUTTON_PRESSED" and arg == MP5A4_2 and MP5A4_2_MODIFIER == true and IsModifierPressed("lctrl")) then
    kickback = not kickback
    gun = arg
    if (kickback == false) then
      OutputLogMessage("LCTRL_MP5A4_2_MACRO-OFF\n")
    else
      OutputLogMessage("LCTRL_MP5A4_2_MACRO-ON\n")
      EnablePrimaryMouseButtonEvents(true)
  end
--THOMPSON
  elseif (event == "MOUSE_BUTTON_PRESSED" and arg == THOMPSON_2 and THOMPSON_2_MODIFIER == true and IsModifierPressed("lctrl")) then
    kickback = not kickback
    gun = arg
    if (kickback == false) then
      OutputLogMessage("LCTRL_THOMPSON_2_MACRO-OFF\n")
    else
      OutputLogMessage("LCTRL_THOMPSON_2_MACRO-ON\n")
      EnablePrimaryMouseButtonEvents(true)
    end
--SMG
  elseif (event == "MOUSE_BUTTON_PRESSED" and arg == SMG_2 and SMG_2_MODIFIER == true and IsModifierPressed("lctrl")) then
    kickback = not kickback
    gun = arg
    if (kickback == false) then
      OutputLogMessage("LCTRL_SMG_2_MACRO-OFF\n")
    else
      OutputLogMessage("LCTRL_SMG_2_MACRO-ON\n")
      EnablePrimaryMouseButtonEvents(true)
  end
--HMLMG
  elseif (event == "MOUSE_BUTTON_PRESSED" and arg == HMLMG_2 and HMLMG_2_MODIFIER == true and IsModifierPressed("lctrl")) then
    kickback = not kickback
    gun = arg
    if (kickback == false) then
      OutputLogMessage("LCTRL_HMLMG_2_MACRO-OFF\n")
    else
      OutputLogMessage("LCTRL_HMLMG_2_MACRO-ON\n")
      EnablePrimaryMouseButtonEvents(true)
    end
--M249
  elseif (event == "MOUSE_BUTTON_PRESSED" and arg == M249_2 and M249_2_MODIFIER == true and IsModifierPressed("lctrl")) then
    kickback = not kickback
    gun = arg
    if (kickback == false) then
      OutputLogMessage("LCTRL_M249_2_MACRO-OFF\n")
    else
      OutputLogMessage("LCTRL_M249_2_MACRO-ON\n")
      EnablePrimaryMouseButtonEvents(true)
  end
--AK47
  elseif (event == "MOUSE_BUTTON_PRESSED" and arg == AK47_2 and AK47_2_MODIFIER == false) then
		kickback = not kickback
		gun = arg
		if (kickback == false) then
			OutputLogMessage("AK47_2_MACRO-OFF\n")
		else
			OutputLogMessage("AK47_2_MACRO-ON\n")
			EnablePrimaryMouseButtonEvents(true)
		end
--LR300
	elseif (event == "MOUSE_BUTTON_PRESSED" and arg == LR300_2 and LR300_2_MODIFIER == false ) then
		kickback = not kickback
		gun = arg
		if (kickback == false) then
			OutputLogMessage("LR300_2_MACRO-OFF\n")
		else
			OutputLogMessage("LR300_2_MACRO-ON\n")
			EnablePrimaryMouseButtonEvents(true)
		end
--MP5A4
	elseif (event == "MOUSE_BUTTON_PRESSED" and arg == MP5A4_2 and MP5A4_2_MODIFIER == false ) then
		kickback = not kickback
		gun = arg
		if (kickback == false) then
			OutputLogMessage("MP5A4_2_MACRO-OFF\n")
		else
			OutputLogMessage("MP5A4_2_MACRO-ON\n")
			EnablePrimaryMouseButtonEvents(true)
		end
--THOMPSON
	elseif (event == "MOUSE_BUTTON_PRESSED" and arg == THOMPSON_2 and THOMPSON_2_MODIFIER == false) then
		kickback = not kickback
		gun = arg
		if (kickback == false) then
			OutputLogMessage("THOMPSON_2_MACRO-OFF\n")
		else
			OutputLogMessage("THOMPSON_2_MACRO-ON\n")
			EnablePrimaryMouseButtonEvents(true)
		end
--SMG
	elseif (event == "MOUSE_BUTTON_PRESSED" and arg == SMG_2 and SMG_2_MODIFIER == false) then
		kickback = not kickback
		gun = arg
		if (kickback == false) then
			OutputLogMessage("SMG_2_MACRO-OFF\n")
		else
			OutputLogMessage("SMG_2_MACRO-ON\n")
			EnablePrimaryMouseButtonEvents(true)
		end
--HMLMG
	elseif (event == "MOUSE_BUTTON_PRESSED" and arg == HMLMG_2 and HMLMG_2_MODIFIER == false) then
		kickback = not kickback
		gun = arg
		if (kickback == false) then
			OutputLogMessage("HMLMG_2_MACRO-OFF\n")
		else
			OutputLogMessage("HMLMG_2_MACRO-ON\n")
			EnablePrimaryMouseButtonEvents(true)
		end
--M249
	elseif (event == "MOUSE_BUTTON_PRESSED" and arg == M249_2 and M249_2_MODIFIER == false) then
		kickback = not kickback
		gun = arg
		if (kickback == false) then
			OutputLogMessage("M249_2_MACRO-OFF\n")
		else
			OutputLogMessage("M249_2_MACRO-ON\n")
			EnablePrimaryMouseButtonEvents(true)
		end

end
local bullet_ = 1

------------------------ FOV CONTROL ----------------------------
--- Explanation:
--- If FOV is not set to nil it will press the ingame keybind to change
--- the FOV to XX while the mouse button is down, and set it back to XX
--- once it is no longer pressed, in order to simulate "zoom".
if FOV_TOGGLE then
  if event == "MOUSE_BUTTON_PRESSED" and arg == 2 then
      PressAndReleaseKey(FOV_KEY_ON)
      OutputLogMessage("FOV set to 70\n")
  elseif event == "MOUSE_BUTTON_RELEASED" and arg == 2 then
      PressAndReleaseKey(FOV_KEY_OFF)
      OutputLogMessage("FOV set to 90\n")
  end
end


--MOVE_EVENT-----------------------------------------------------
	if gun == AK47_2 then
		if kickback then
			if (IsMouseButtonPressed(3)) then
				waitfornth(5)
				if (IsMouseButtonPressed(1)) then
					for maincycle = bullet_, AK47_BULLETS do
						if (IsRightNotPressed()) then return end
						if (IsLeftNotPressed()) then return end
							if (IsModifierPressed("lctrl")) then
								Smoothing(N2_AK47_AT[bullet_], N2_AK47_C_X[bullet_], N2_AK47_C_Y[bullet_])
								if (N2_AK47_ST[bullet_] ~= 0) then waitfornth(N2_AK47_ST[bullet_]) end
							else
								if AK47_2_MUZZLEBOOST == true then
									if (bullet_ > 17) then
										Smoothing(N2_AK47_AT[bullet_], N2_AK47_C_X[bullet_]*(-0.1), N2_AK47_C_Y[bullet_]*StandMultiplier*1.05)
										if (N2_AK47_ST[bullet_] ~= 0) then waitfornth(N2_AK47_ST[bullet_]) end
									else
										Smoothing(N2_AK47_AT[bullet_], N2_AK47_C_X[bullet_]*StandMultiplier*1.05, N2_AK47_C_Y[bullet_]*StandMultiplier*1.05)
										if (N2_AK47_ST[bullet_] ~= 0) then waitfornth(N2_AK47_ST[bullet_]) end
									end
								else
									Smoothing(N2_AK47_AT[bullet_], N2_AK47_C_X[bullet_]*StandMultiplier*1.05, N2_AK47_C_Y[bullet_]*StandMultiplier*1.05)
									if (N2_AK47_ST[bullet_] ~= 0) then waitfornth(N2_AK47_ST[bullet_]) end
								end
							end
							bullet_ = bullet_ + 1
					end
					repeat
						if AK47_2_MUZZLEBOOST == true then
							if (IsModifierPressed("lctrl")) then
								Smoothing(N2_AK47_AT[#N2_AK47_AT], N2_AK47_C_X[#N2_AK47_C_X]*0.1, N2_AK47_C_Y[#N2_AK47_C_Y])
								if (N2_AK47_ST[#N2_AK47_ST] ~= 0) then waitfornth(N2_AK47_ST[#N2_AK47_ST]) end
							else
								Smoothing(N2_AK47_AT[#N2_AK47_AT], N2_AK47_C_X[#N2_AK47_C_X]*StandMultiplier*0.1, N2_AK47_C_Y[#N2_AK47_C_Y]*StandMultiplier)
								if (N2_AK47_ST[#N2_AK47_ST] ~= 0) then waitfornth(N2_AK47_ST[#N2_AK47_ST]) end
							end
						else
							if (IsModifierPressed("lctrl")) then
								Smoothing(N2_AK47_AT[#N2_AK47_AT], N2_AK47_C_X[#N2_AK47_C_X], N2_AK47_C_Y[#N2_AK47_C_Y])
								if (N2_AK47_ST[#N2_AK47_ST] ~= 0) then waitfornth(N2_AK47_ST[#N2_AK47_ST]) end
							else
								Smoothing(N2_AK47_AT[#N2_AK47_AT], N2_AK47_C_X[#N2_AK47_C_X]*StandMultiplier, N2_AK47_C_Y[#N2_AK47_C_Y]*StandMultiplier)
								if (N2_AK47_ST[#N2_AK47_ST] ~= 0) then waitfornth(N2_AK47_ST[#N2_AK47_ST]) end
							end
						end
					until (IsLeftNotPressed())
				end
			end
		end
	elseif gun == LR300_2 then
		if kickback then
			if (IsMouseButtonPressed(3)) then
				waitfornth(5)
				if (IsMouseButtonPressed(1)) then
					for maincycle = bullet_, LR300_BULLETS do
						if (IsRightNotPressed()) then return end
						if (IsLeftNotPressed()) then return end
							if (IsModifierPressed("lctrl")) then
								Smoothing(N2_LR300_AT[bullet_], N2_LR300_C_X[bullet_], N2_LR300_C_Y[bullet_])
								if (N2_LR300_ST[bullet_] ~= 0) then waitfornth(N2_LR300_ST[bullet_]) end
							else
								if LR300_2_MUZZLEBOOST == true then
									if (bullet_ > 17) then
										Smoothing(N2_LR300_AT[bullet_], N2_LR300_C_X[bullet_], N2_LR300_C_Y[bullet_]*StandMultiplier)
										if (N2_LR300_ST[bullet_] ~= 0) then waitfornth(N2_LR300_ST[bullet_]) end
									else
										Smoothing(N2_LR300_AT[bullet_], N2_LR300_C_X[bullet_]*StandMultiplier, N2_LR300_C_Y[bullet_]*StandMultiplier)
										if (N2_LR300_ST[bullet_] ~= 0) then waitfornth(N2_LR300_ST[bullet_]) end
									end
								else
									Smoothing(N2_LR300_AT[bullet_], N2_LR300_C_X[bullet_]*StandMultiplier, N2_LR300_C_Y[bullet_]*StandMultiplier)
									if (N2_LR300_ST[bullet_] ~= 0) then waitfornth(N2_LR300_ST[bullet_]) end
								end
							end
							bullet_ = bullet_ + 1
					end
					repeat
						if LR300_2_MUZZLEBOOST == true then
							if (IsModifierPressed("lctrl")) then
								Smoothing(N2_LR300_AT[#N2_LR300_AT], N2_LR300_C_X[#N2_LR300_C_X]*0.1, N2_LR300_C_Y[#N2_LR300_C_Y])
								if (N2_LR300_ST[#N2_LR300_ST] ~= 0) then waitfornth(N2_LR300_ST[#N2_LR300_ST]) end
							else
								Smoothing(N2_LR300_AT[#N2_LR300_AT], N2_LR300_C_X[#N2_LR300_C_X]*StandMultiplier*0.1, N2_LR300_C_Y[#N2_LR300_C_Y]*StandMultiplier)
								if (N2_LR300_ST[#N2_LR300_ST] ~= 0) then waitfornth(N2_LR300_ST[#N2_LR300_ST]) end
							end
						else
							if (IsModifierPressed("lctrl")) then
								Smoothing(N2_LR300_AT[#N2_LR300_AT], N2_LR300_C_X[#N2_LR300_C_X], N2_LR300_C_Y[#N2_LR300_C_Y])
								if (N2_LR300_ST[#N2_LR300_ST] ~= 0) then waitfornth(N2_LR300_ST[#N2_LR300_ST]) end
							else
								Smoothing(N2_LR300_AT[#N2_LR300_AT], N2_LR300_C_X[#N2_LR300_C_X]*StandMultiplier, N2_LR300_C_Y[#N2_LR300_C_Y]*StandMultiplier)
								if (N2_LR300_ST[#N2_LR300_ST] ~= 0) then waitfornth(N2_LR300_ST[#N2_LR300_ST]) end
							end
						end
					until (IsLeftNotPressed())
				end
			end
		end
	elseif gun == MP5A4_2 then
		if kickback then
			if (IsMouseButtonPressed(3)) then
				waitfornth(5)
				if (IsMouseButtonPressed(1)) then
					for maincycle = bullet_, MP5A4_BULLETS do
						if (IsRightNotPressed()) then return end
						if (IsLeftNotPressed()) then return end
							if (IsModifierPressed("lctrl")) then
								Smoothing(N2_MP5A4_AT[bullet_], N2_MP5A4_C_X[bullet_], N2_MP5A4_C_Y[bullet_])
								if (N2_MP5A4_ST[bullet_] ~= 0) then waitfornth(N2_MP5A4_ST[bullet_]) end
							else
								if MP5A4_2_MUZZLEBOOST == true then
									if (bullet_ > 17) then
										Smoothing(N2_MP5A4_AT[bullet_], N2_MP5A4_C_X[bullet_], N2_MP5A4_C_Y[bullet_]*StandMultiplier)
										if (N2_MP5A4_ST[bullet_] ~= 0) then waitfornth(N2_MP5A4_ST[bullet_]) end
									else
										Smoothing(N2_MP5A4_AT[bullet_], N2_MP5A4_C_X[bullet_]*StandMultiplier, N2_MP5A4_C_Y[bullet_]*StandMultiplier)
										if (N2_MP5A4_ST[bullet_] ~= 0) then waitfornth(N2_MP5A4_ST[bullet_]) end
									end
								else
									Smoothing(N2_MP5A4_AT[bullet_], N2_MP5A4_C_X[bullet_]*StandMultiplier, N2_MP5A4_C_Y[bullet_]*StandMultiplier)
									if (N2_MP5A4_ST[bullet_] ~= 0) then waitfornth(N2_MP5A4_ST[bullet_]) end
								end
							end
							bullet_ = bullet_ + 1
					end
					repeat
						if MP5A4_2_MUZZLEBOOST == true then
							if (IsModifierPressed("lctrl")) then
								Smoothing(N2_MP5A4_AT[#N2_MP5A4_AT], N2_MP5A4_C_X[#N2_MP5A4_C_X]*0.1, N2_MP5A4_C_Y[#N2_MP5A4_C_Y])
								if (N2_MP5A4_ST[#N2_MP5A4_ST] ~= 0) then waitfornth(N2_MP5A4_ST[#N2_MP5A4_ST]) end
							else
								Smoothing(N2_MP5A4_AT[#N2_MP5A4_AT], N2_MP5A4_C_X[#N2_MP5A4_C_X]*StandMultiplier*0.1, N2_MP5A4_C_Y[#N2_MP5A4_C_Y]*StandMultiplier)
								if (N2_MP5A4_ST[#N2_MP5A4_ST] ~= 0) then waitfornth(N2_MP5A4_ST[#N2_MP5A4_ST]) end
							end
						else
							if (IsModifierPressed("lctrl")) then
								Smoothing(N2_MP5A4_AT[#N2_MP5A4_AT], N2_MP5A4_C_X[#N2_MP5A4_C_X], N2_MP5A4_C_Y[#N2_MP5A4_C_Y])
								if (N2_MP5A4_ST[#N2_MP5A4_ST] ~= 0) then waitfornth(N2_MP5A4_ST[#N2_MP5A4_ST]) end
							else
								Smoothing(N2_MP5A4_AT[#N2_MP5A4_AT], N2_MP5A4_C_X[#N2_MP5A4_C_X]*StandMultiplier, N2_MP5A4_C_Y[#N2_MP5A4_C_Y]*StandMultiplier)
								if (N2_MP5A4_ST[#N2_MP5A4_ST] ~= 0) then waitfornth(N2_MP5A4_ST[#N2_MP5A4_ST]) end
							end
						end
					until (IsLeftNotPressed())
				end
			end
		end
	elseif gun == SMG_2 then
		if kickback then
			if (IsMouseButtonPressed(3)) then
				waitfornth(5)
				if (IsMouseButtonPressed(1)) then
					for maincycle = bullet_, SMG_BULLETS do
						if (IsRightNotPressed()) then return end
						if (IsLeftNotPressed()) then return end
							if (IsModifierPressed("lctrl")) then
								Smoothing(N2_SMG_AT[bullet_], N2_SMG_C_X[bullet_], N2_SMG_C_Y[bullet_])
								if (N2_SMG_ST[bullet_] ~= 0) then waitfornth(N2_SMG_ST[bullet_]) end
							else
								if SMG_2_MUZZLEBOOST == true then
									if (bullet_ > 17) then
										Smoothing(N2_SMG_AT[bullet_], N2_SMG_C_X[bullet_], N2_SMG_C_Y[bullet_]*StandMultiplier)
										if (N2_SMG_ST[bullet_] ~= 0) then waitfornth(N2_SMG_ST[bullet_]) end
									else
										Smoothing(N2_SMG_AT[bullet_], N2_SMG_C_X[bullet_]*StandMultiplier, N2_SMG_C_Y[bullet_]*StandMultiplier)
										if (N2_SMG_ST[bullet_] ~= 0) then waitfornth(N2_SMG_ST[bullet_]) end
									end
								else
									Smoothing(N2_SMG_AT[bullet_], N2_SMG_C_X[bullet_]*StandMultiplier, N2_SMG_C_Y[bullet_]*StandMultiplier)
									if (N2_SMG_ST[bullet_] ~= 0) then waitfornth(N2_SMG_ST[bullet_]) end
								end
							end
							bullet_ = bullet_ + 1
					end
					repeat
						if SMG_2_MUZZLEBOOST == true then
							if (IsModifierPressed("lctrl")) then
								Smoothing(N2_SMG_AT[#N2_SMG_AT], N2_SMG_C_X[#N2_SMG_C_X]*0.1, N2_SMG_C_Y[#N2_SMG_C_Y])
								if (N2_SMG_ST[#N2_SMG_ST] ~= 0) then waitfornth(N2_SMG_ST[#N2_SMG_ST]) end
							else
								Smoothing(N2_SMG_AT[#N2_SMG_AT], N2_SMG_C_X[#N2_SMG_C_X]*StandMultiplier*0.1, N2_SMG_C_Y[#N2_SMG_C_Y]*StandMultiplier)
								if (N2_SMG_ST[#N2_SMG_ST] ~= 0) then waitfornth(N2_SMG_ST[#N2_SMG_ST]) end
							end
						else
							if (IsModifierPressed("lctrl")) then
								Smoothing(N2_SMG_AT[#N2_SMG_AT], N2_SMG_C_X[#N2_SMG_C_X], N2_SMG_C_Y[#N2_SMG_C_Y])
								if (N2_SMG_ST[#N2_SMG_ST] ~= 0) then waitfornth(N2_SMG_ST[#N2_SMG_ST]) end
							else
								Smoothing(N2_SMG_AT[#N2_SMG_AT], N2_SMG_C_X[#N2_SMG_C_X]*StandMultiplier, N2_SMG_C_Y[#N2_SMG_C_Y]*StandMultiplier)
								if (N2_SMG_ST[#N2_SMG_ST] ~= 0) then waitfornth(N2_SMG_ST[#N2_SMG_ST]) end
							end
						end
					until (IsLeftNotPressed())
				end
			end
		end
	elseif gun == THOMPSON_2 then
		if kickback then
			if (IsMouseButtonPressed(3)) then
				waitfornth(5)
				if (IsMouseButtonPressed(1)) then
					for maincycle = bullet_, THOMPSON_BULLETS do
						if (IsRightNotPressed()) then return end
						if (IsLeftNotPressed()) then return end
							if (IsModifierPressed("lctrl")) then
								Smoothing(N2_THOMPSON_AT[bullet_], N2_THOMPSON_C_X[bullet_], N2_THOMPSON_C_Y[bullet_])
								if (N2_THOMPSON_ST[bullet_] ~= 0) then waitfornth(N2_THOMPSON_ST[bullet_]) end
							else
								if THOMPSON_2_MUZZLEBOOST == true then
									if (bullet_ > 17) then
										Smoothing(N2_THOMPSON_AT[bullet_], N2_THOMPSON_C_X[bullet_], N2_THOMPSON_C_Y[bullet_]*StandMultiplier)
										if (N2_THOMPSON_ST[bullet_] ~= 0) then waitfornth(N2_THOMPSON_ST[bullet_]) end
									else
										Smoothing(N2_THOMPSON_AT[bullet_], N2_THOMPSON_C_X[bullet_]*StandMultiplier, N2_THOMPSON_C_Y[bullet_]*StandMultiplier)
										if (N2_THOMPSON_ST[bullet_] ~= 0) then waitfornth(N2_THOMPSON_ST[bullet_]) end
									end
								else
									Smoothing(N2_THOMPSON_AT[bullet_], N2_THOMPSON_C_X[bullet_]*StandMultiplier, N2_THOMPSON_C_Y[bullet_]*StandMultiplier)
									if (N2_THOMPSON_ST[bullet_] ~= 0) then waitfornth(N2_THOMPSON_ST[bullet_]) end
								end
							end
							bullet_ = bullet_ + 1
					end
					repeat
						if THOMPSON_2_MUZZLEBOOST == true then
							if (IsModifierPressed("lctrl")) then
								Smoothing(N2_THOMPSON_AT[#N2_THOMPSON_AT], N2_THOMPSON_C_X[#N2_THOMPSON_C_X]*0.1, N2_THOMPSON_C_Y[#N2_THOMPSON_C_Y])
								if (N2_THOMPSON_ST[#N2_THOMPSON_ST] ~= 0) then waitfornth(N2_THOMPSON_ST[#N2_THOMPSON_ST]) end
							else
								Smoothing(N2_THOMPSON_AT[#N2_THOMPSON_AT], N2_THOMPSON_C_X[#N2_THOMPSON_C_X]*StandMultiplier*0.1, N2_THOMPSON_C_Y[#N2_THOMPSON_C_Y]*StandMultiplier)
								if (N2_THOMPSON_ST[#N2_THOMPSON_ST] ~= 0) then waitfornth(N2_THOMPSON_ST[#N2_THOMPSON_ST]) end
							end
						else
							if (IsModifierPressed("lctrl")) then
								Smoothing(N2_THOMPSON_AT[#N2_THOMPSON_AT], N2_THOMPSON_C_X[#N2_THOMPSON_C_X], N2_THOMPSON_C_Y[#N2_THOMPSON_C_Y])
								if (N2_THOMPSON_ST[#N2_THOMPSON_ST] ~= 0) then waitfornth(N2_THOMPSON_ST[#N2_THOMPSON_ST]) end
							else
								Smoothing(N2_THOMPSON_AT[#N2_THOMPSON_AT], N2_THOMPSON_C_X[#N2_THOMPSON_C_X]*StandMultiplier, N2_THOMPSON_C_Y[#N2_THOMPSON_C_Y]*StandMultiplier)
								if (N2_THOMPSON_ST[#N2_THOMPSON_ST] ~= 0) then waitfornth(N2_THOMPSON_ST[#N2_THOMPSON_ST]) end
							end
						end
					until (IsLeftNotPressed())
				end
			end
		end
	elseif gun == HMLMG_2 then
		if kickback then
			if (IsMouseButtonPressed(3)) then
				waitfornth(5)
				if (IsMouseButtonPressed(1)) then
					for maincycle = bullet_, HMLMG_BULLETS do
						if (IsRightNotPressed()) then return end
						if (IsLeftNotPressed()) then return end
							if (IsModifierPressed("lctrl")) then
								if (HMLMG_2_X8_SCOPE == true) then
									if (maincycle > 31) then
										Smoothing(N2_HMLMG_AT[bullet_], 0, N2_HMLMG_C_Y[bullet_])
										if (N2_HMLMG_ST[bullet_] ~= 0) then waitfornth(N2_HMLMG_ST[bullet_]) end
									else
										Smoothing(N2_HMLMG_AT[bullet_], N2_HMLMG_C_X[bullet_], N2_HMLMG_C_Y[bullet_])
										if (N2_HMLMG_ST[bullet_] ~= 0) then waitfornth(N2_HMLMG_ST[bullet_]) end
									end
								else
									if (maincycle > 45) then
										Smoothing(N2_HMLMG_AT[bullet_], 0, N2_HMLMG_C_Y[bullet_])
										if (N2_HMLMG_ST[bullet_] ~= 0) then waitfornth(N2_HMLMG_ST[bullet_]) end
									else
										Smoothing(N2_HMLMG_AT[bullet_], N2_HMLMG_C_X[bullet_], N2_HMLMG_C_Y[bullet_])
										if (N2_HMLMG_ST[bullet_] ~= 0) then waitfornth(N2_HMLMG_ST[bullet_]) end
									end
								end
							else
								if (HMLMG_2_X8_SCOPE == true) then
									if (maincycle > 16) then
										Smoothing(N2_HMLMG_AT[bullet_], 0, N2_HMLMG_C_Y[bullet_]*StandMultiplier_HMLMG)
										if (N2_HMLMG_ST[bullet_] ~= 0) then waitfornth(N2_HMLMG_ST[bullet_]) end
									else
										Smoothing(N2_HMLMG_AT[bullet_], N2_HMLMG_C_X[bullet_]*StandMultiplier_HMLMG, N2_HMLMG_C_Y[bullet_]*StandMultiplier_HMLMG)
										if (N2_HMLMG_ST[bullet_] ~= 0) then waitfornth(N2_HMLMG_ST[bullet_]) end
									end
								else
									if (maincycle > 23) then
										Smoothing(N2_HMLMG_AT[bullet_], 0, N2_HMLMG_C_Y[bullet_]*StandMultiplier_HMLMG)
										if (N2_HMLMG_ST[bullet_] ~= 0) then waitfornth(N2_HMLMG_ST[bullet_]) end
									else
										Smoothing(N2_HMLMG_AT[bullet_], N2_HMLMG_C_X[bullet_]*StandMultiplier_HMLMG, N2_HMLMG_C_Y[bullet_]*StandMultiplier_HMLMG)
										if (N2_HMLMG_ST[bullet_] ~= 0) then waitfornth(N2_HMLMG_ST[bullet_]) end
									end
								end
							end
							bullet_ = bullet_ + 1
					end
				end
			end
		end
	elseif gun == M249_2 then
		if kickback then
			if (IsMouseButtonPressed(3)) then
				waitfornth(5)
				if (IsMouseButtonPressed(1)) then
					for maincycle = bullet_, M249_BULLETS do
						if (IsRightNotPressed()) then return end
						if (IsLeftNotPressed()) then return end
							if (IsModifierPressed("lctrl")) then
								Smoothing(N2_M249_AT[bullet_], N2_M249_C_X[bullet_], N2_M249_C_Y[bullet_])
								if (N2_M249_ST[bullet_] ~= 0) then waitfornth(N2_M249_ST[bullet_]) end
							else
								Smoothing(N2_M249_AT[bullet_], N2_M249_C_X[bullet_]*StandMultiplier, N2_M249_C_Y[bullet_]*StandMultiplier)
								if (N2_M249_ST[bullet_] ~= 0) then waitfornth(N2_M249_ST[bullet_]) end
							end
							bullet_ = bullet_ + 1
					end
				end
			end
		end
  end
end
