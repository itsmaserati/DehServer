cfg = {
    debug = false,
    updateInterval = 500,
    speedoInterval = 250,
    minimapScale = 1000,
    settingsCommand = "hud",
    useRealTime = false, -- if you make it true this feature, the clock in top info will be real time clock, if you make it false it will be in-game clock
    serverNameBold = 'IZZY',
    serverName = 'SHOP',
    notifyPosition = "top-left", -- top-left / top-center / top-right / bottom-left / bottom-center / bottom-right

    useNitro = true,
    nitroKey = "X",
    nitroItem = "nitrous",
    nitroForce = 50.0,
    removeNitroOnMilliseconds = 0.2,

    useStress = true,
    MinimumStress = 50,         -- Minimum Stress Level For Screen Shaking
    MinimumSpeedUnbuckled = 50, -- Going Over This Speed Unbuckled Will Cause Stress
    MinimumSpeed = 100,        -- Going Over This Speed While Buckled Will Cause Stress
    StressChance = 0.1,
    WhitelistedWeaponArmed = { -- Disable showing armed icon from weapons in this table
        [`weapon_petrolcan`] = true,
        [`weapon_hazardcan`] = true,
        [`weapon_fireextinguisher`] = true,
        [`weapon_dagger`] = true,
        [`weapon_bat`] = true,
        [`weapon_bottle`] = true,
        [`weapon_crowbar`] = true,
        [`weapon_flashlight`] = true,
        [`weapon_golfclub`] = true,
        [`weapon_hammer`] = true,
        [`weapon_hatchet`] = true,
        [`weapon_knuckle`] = true,
        [`weapon_knife`] = true,
        [`weapon_machete`] = true,
        [`weapon_switchblade`] = true,
        [`weapon_nightstick`] = true,
        [`weapon_wrench`] = true,
        [`weapon_battleaxe`] = true,
        [`weapon_poolcue`] = true,
        [`weapon_briefcase`] = true,
        [`weapon_briefcase_02`] = true,
        [`weapon_garbagebag`] = true,
        [`weapon_handcuffs`] = true,
        [`weapon_bread`] = true,
        [`weapon_stone_hatchet`] = true,
        [`weapon_grenade`] = true,
        [`weapon_bzgas`] = true,
        [`weapon_molotov`] = true,
        [`weapon_stickybomb`] = true,
        [`weapon_proxmine`] = true,
        [`weapon_snowball`] = true,
        [`weapon_pipebomb`] = true,
        [`weapon_ball`] = true,
        [`weapon_smokegrenade`] = true,
        [`weapon_flare`] = true
    },

    WhitelistedWeaponStress = { -- Disable gaining stress from weapons in this table
        [`weapon_petrolcan`] = true,
        [`weapon_hazardcan`] = true,
        [`weapon_fireextinguisher`] = true
    },

    VehClassStress = { -- Enable/Disable gaining stress from vehicle classes in this table
        ['0'] = true,         -- Compacts
        ['1'] = true,         -- Sedans
        ['2'] = true,         -- SUVs
        ['3'] = true,         -- Coupes
        ['4'] = true,         -- Muscle
        ['5'] = true,         -- Sports Classics
        ['6'] = true,         -- Sports
        ['7'] = true,         -- Super
        ['8'] = true,         -- Motorcycles
        ['9'] = true,         -- Off Road
        ['10'] = true,        -- Industrial
        ['11'] = true,        -- Utility
        ['12'] = true,        -- Vans
        ['13'] = false,       -- Cycles
        ['14'] = false,       -- Boats
        ['15'] = false,       -- Helicopters
        ['16'] = false,       -- Planes
        ['18'] = false,       -- Emergency
        ['19'] = false,       -- Military
        ['20'] = false,       -- Commercial
        ['21'] = false        -- Trains
    },

    WhitelistedVehicles = { -- Disable gaining stress from speeding in any vehicle in this table
        --[`adder`] = true
    },

    WhitelistedJobs = { -- Disable stress completely for players with matching job or job type
        ['leo'] = true,
        ['ambulance'] = true
    },

    Intensity = {
        ['blur'] = {
            [1] = {
                min = 50,
                max = 60,
                intensity = 1500,
            },
            [2] = {
                min = 60,
                max = 70,
                intensity = 2000,
            },
            [3] = {
                min = 70,
                max = 80,
                intensity = 2500,
            },
            [4] = {
                min = 80,
                max = 90,
                intensity = 2700,
            },
            [5] = {
                min = 90,
                max = 100,
                intensity = 3000,
            },
        }
    },

    EffectInterval = {
        [1] = {
            min = 50,
            max = 60,
            timeout = math.random(50000, 60000)
        },
        [2] = {
            min = 60,
            max = 70,
            timeout = math.random(40000, 50000)
        },
        [3] = {
            min = 70,
            max = 80,
            timeout = math.random(30000, 40000)
        },
        [4] = {
            min = 80,
            max = 90,
            timeout = math.random(20000, 30000)
        },
        [5] = {
            min = 90,
            max = 100,
            timeout = math.random(15000, 20000)
        }
    },

    colors = {
        primary = '#FF5656',
        purple = {
            primary = '#B04AFF',
            secondary = '#672D95'
        },
        pink = {
            primary = '#FB32FF',
            secondary = '#912E93'
        },
        green = {
            primary = '#78FC4A',
            secondary = '#49962E'
        },
        lightgreen = {
            primary = '#A7FFDF',
            secondary = '#4AFCBC'
        },
        white = {
            primary = '#FFFFFF',
            secondary = '#999999'
        },
        red = {
            primary = '#FF4A4A',
            secondary = '#9B2F2F'
        },
        yellow = {
            primary = '#FFCA0F',
            secondary = '#A38931'
        },
        darkblue = {
            primary = '#95ADFF',
            secondary = '#4A72FC'
        },
        lightblue = {
            primary = '#9CE2FF',
            secondary = '#4AC7FC'
        },
        brown = {
            primary = '#FFAA7A',
            secondary = '#FC8A4A'
        }
    },
    mapType = "circle", -- square / circle
    status = { -- you can look for icons https https://react-icons.github.io/react-icons/icons/fa6/
        {
            name = 'health',
            icon = 'health',
            label = 'Health',
            value = 50,
            color = '#FF3535',
        },
        {
            name = 'armor',
            icon = 'armor',
            label = 'Armor',
            value = 50,
            color = '#004ABA',
        },
        {
            name = 'hunger',
            icon = 'hunger',
            label = 'Hunger',
            value = 50,
            color = '#FFA740',
        },
        {
            name = 'thirst',
            icon = 'thirst',
            label = 'Thirst',
            value = 50,
            color = '#00BAAA',
        },
        {
            name = 'stamina',
            icon = 'stamina',
            label = 'Stamina',
            value = 50,
            color = '#A965FF',
        },
        {
            name = 'stress',
            icon = 'stress',
            label = 'Stress',
            value = 50,
            color = '#FC8A4A',
        },
        {
            name = 'mic',
            icon = 'mic',
            label = 'Mic',
            value = 66,
            rangeLabel = 'Normal',
            color = '#FFFFFF',
        },
    },

    topInfos = {
        {
			id = 'fullname',
			value = 'Brenden Randall',
			secondValue = '[2562]',
			header = true,
		},
		{
			id = 'job',
			value = 'Police Officer II',
		},
		{
			id = 'bank',
			icon = 'bank',
			value = '237000',
			currency = true,
			color = '#56FFC2',
		},
		{
			id = 'cash',
			icon = 'cash',
			value = '56000',
			currency = true,
			color = '#56FF67',
		},
    },
    
    defaultSettings = {
        statusStyle = 5,
		topInfoStyle = 1,
		carhudStyle = 1,
        statusSize = 100,
        carhudSize = 100,
		speedType = 'kmh',
        mapType = "circle",
        cinematic = false,
        mapVisibility = "vehicle"
    },

    voiceRanges = {
        ["1.5"] = 33,
        ["3.0"] = 66,
        ["6.0"] = 100
    },
    
    rangeLabels = {
        ["33"] = "Whisper",
        ["66"] = "Normal",
        ["100"] = "Scream",
    },

    notifyTypes = {
        ["inform"] = "darkblue",
        ["error"] = "red",
        ["success"] = "green",
    },

    locale = "en",
    locales = {
        ["en"] = {
            toggleseatbelt = "Toggle Seatbelt",
            kmh = 'KM/H',
            mph = 'MPH',
            hudSettings = 'HUD SETTINGS',
            chooseSettings = 'CHOOSE SETTINGS',
            statusTypes = 'Status Types',
            statusColors = 'Status Colors',
            statusSize = 'Status Size',
            speedoMeter = 'Speedo Meter',
            speedoMeterSize = 'Speedo Meter Size',
            speedType = 'Speed Type',
            choose = 'Choose',
            saveSettings = 'Save Settings',
            defaultAll = 'Default All',
            cinematicMode = 'Cinematic Mode',
            moveIt = 'Move It',
            pageDescription = 'Lorem ipsum dolor sit amet consectetur. Curabitur nibh quisque dui ut sit consequat. Iaculis et sit ut risus',
            type = 'Type',
            typeDescription = 'Lorem ipsum dolor sit amet consectetur.',
            information = 'Information',
            mapType = 'Map Type',
            circle = 'Circle',
            square = 'Square',
            location = "Location",
            topInfoStyle = "Top Info Style",
            mapVisibility = "Map Visibility",
            always = "Always",
            onlyVehicle = "Only in Vehicle"
        }
    }
}
