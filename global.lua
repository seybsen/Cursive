local L = AceLibrary("AceLocale-2.2"):new("Cursive")
Cursive = AceLibrary("AceAddon-2.0"):new("AceEvent-2.0", "AceDebug-2.0", "AceModuleCore-2.0", "AceConsole-2.0", "AceDB-2.0", "AceHook-2.1")
Cursive.superwow = true

if not GetPlayerBuffID or not CombatLogAdd or not SpellInfo then
	local notify = CreateFrame("Frame", "CursiveNoSuperwow", UIParent)
	notify:SetScript("OnUpdate", function()
		DEFAULT_CHAT_FRAME:AddMessage(L["|cffffcc00Cursive:|cffffaaaa Couldn't detect SuperWoW."])
		this:Hide()
	end)

	Cursive.superwow = false
end

function Cursive:OnEnable()
	if not Cursive.superwow then
		return
	end

	DEFAULT_CHAT_FRAME:AddMessage(L["|cffffcc00Cursive:|cffffaaaa Loaded.  /cursive for commands and minimap icon for options."])

	Cursive.curses:LoadCurses()
	if Cursive.db.profile.enabled then
		Cursive.core.enable()
	end
end
