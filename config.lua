Config = {}
Config.Locale = 'es'

Config.Marker = {
	r = 250, g = 0, b = 0, a = 100,  -- red color
	x = 1.0, y = 1.0, z = 1.5,       -- tiny, cylinder formed circle
	DrawDistance = 15.0, Type = 1    -- default circle type, low draw distance due to indoors area
}

Config.PoliceNumberRequired = 3
Config.TimerBeforeNewRob    = 21600 -- The cooldown timer on a store after robbery was completed / canceled, in seconds

Config.MaxDistance    = 20   -- max distance from the robbary, going any longer away from it will to cancel the robbary

Stores = {
	["AmmoNation1"] = {
		position = { x = 807.94, y = -2159.67, z = 29.63 },
		nameOfStore = "AmmoNation (Cypress Flats)",
		secondsRemaining = 350, -- seconds
		lastRobbed = 0
	},
	["AmmoNation2"] = {
		position = { x = 24.97, y = -1105.96, z = 29.8 },
		nameOfStore = "AmmoNation (PillBox Hill)",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
	},
	["AmmoNation3"] = {
		position = { x = 839.86, y = -1035.8, z = 28.19 },
		nameOfStore = "AmmoNation (lA mESA)",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
	},
	["AmmoNation4"] = {
		position = { x = -659.7, y = -933.34, z = 21.83 },
		nameOfStore = "AmmoNation (Cypress Flats)",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
	},
	["AmmoNation6"] = {
		position = { x = -1304.25, y = -397.22, z = 36.70 },
		nameOfStore = "AmmoNation (MorningWood)",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
	},
	["AmmoNation7"] = {
		position = { x = 253.42, y = -53.13, z = 69.94 },
		nameOfStore = "AmmoNation (Hawick)",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
	},
	["AmmoNation8"] = {
		position = { x = 2565.4, y = 292.08, z = 108.63 },
		nameOfStore = "AmmoNation (Montañas Tataviam)",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
	},
	["AmmoNation9"] = {
		position = { x = 1693.57, y = 3763.2, z = 34.71 },
		nameOfStore = "AmmoNation (Sandy Shores)",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
	},
	["AmmoNation10"] = {
		position = { x = -330.04, y = 6087.03, z = 31.45 },
		nameOfStore = "AmmoNation (Sandy Shores)",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
	},
	["AmmoNation11"] = {
		position = { x = -1117.48, y = 2701.36, z = 18.55 },
		nameOfStore = "AmmoNation (Sandy Shores)",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
	}
}
