bomberman = {
	inGameStorage = 722601,
	bombStorage = 722602,
	radiusStorage = 722603,
	imuneStorage = 722604,
	bombLimitStorage = 722605,
	bombDelayStorage = 722606,
	oldSpeedStorage = 722607,

	bombId = 12697,
	stoneId = 9419,
	blockId = 10755,

	bonuses = {12693, 12694, 12695, 12696},
	ips = {},
	tpPos = {x = 289, y = 103, z = 8}
}

bomberman.arenas = {
	[1] = {
		storage = 722608,
		
		fromPosLeaver = {x = 467, y = 105, z = 9},
		toPosLeaver = {x = 469, y = 106, z = 9},

		fromPos = {x = 411, y = 42, z = 9},
		toPos = {x = 433, y = 62, z = 9},
		rightTopCorner = {x = 433, y = 42, z = 9},
		leftBottomCorner = {x = 411, y = 62, z = 9},

		exit = {x = 468, y = 108, z = 9}
	},

	[2] = {	
		storage = 722609,

		fromPosLeaver = {x = 472, y = 105, z = 9},
		toPosLeaver = {x = 474, y = 106, z = 9},

		fromPos = {x = 445, y = 42, z = 9},
		toPos = {x = 467, y = 62, z = 9},
		rightTopCorner = {x = 467, y = 42, z = 9},
		leftBottomCorner = {x = 445, y = 62, z = 9},

		exit = {x = 473, y = 108, z = 9}	
	},

	[3] = {
		storage = 722610,

		fromPosLeaver = {x = 477, y = 105, z = 9},
		toPosLeaver = {x = 479, y = 106, z = 9},

		fromPos = {x = 479, y = 42, z = 9},
		toPos = {x = 501, y = 62, z = 9},
		rightTopCorner = {x = 501, y = 42, z = 9},
		leftBottomCorner = {x = 479, y = 62, z = 9},

		exit = {x = 478, y = 108, z = 9}
	},

	[4] = {
		storage = 722611,

		fromPosLeaver = {x = 482, y = 105, z = 9},
		toPosLeaver = {x = 484, y = 106, z = 9},

		fromPos = {x = 513, y = 42, z = 9},
		toPos = {x = 535, y = 62, z = 9},
		rightTopCorner = {x = 535, y = 42, z = 9},
		leftBottomCorner = {x = 513, y = 62, z = 9},

		exit = {x = 483, y = 108, z = 9}
	},

	[5] = {
		storage = 722612,

		fromPosLeaver = {x = 467, y = 113, z = 9},
		toPosLeaver = {x = 469, y = 114, z = 9},

		fromPos = {x = 411, y = 75, z = 9},
		toPos = {x = 433, y = 95, z = 9},
		rightTopCorner = {x = 433, y = 75, z = 9},
		leftBottomCorner = {x = 411, y = 95, z = 9},

		exit = {x = 468, y = 111, z = 9}
	},

	[6] = {
		storage = 722613,

		fromPosLeaver = {x = 472, y = 113, z = 9},
		toPosLeaver = {x = 474, y = 144, z = 9},

		fromPos = {x = 445, y = 75, z = 9},
		toPos = {x = 467, y = 95, z = 9},
		rightTopCorner = {x = 467, y = 75, z = 9},
		leftBottomCorner = {x = 445, y = 95, z = 9},

		exit = {x = 473, y = 111, z = 9}
	},

	[7] = {
		storage = 722614,

		fromPosLeaver = {x = 477, y = 113, z = 9},
		toPosLeaver = {x = 479, y = 114, z = 9},

		fromPos = {x = 479, y = 75, z = 9},
		toPos = {x = 501, y = 95, z = 9},
		rightTopCorner = {x = 501, y = 75, z = 9},
		leftBottomCorner = {x = 479, y = 95, z = 9},

		exit = {x = 478, y = 111, z = 9}
	},

	[8] = {
		storage = 722615,

		fromPosLeaver = {x = 482, y = 113, z = 9},
		toPosLeaver = {x = 484, y = 114, z = 9},

		fromPos = {x = 513, y = 75, z = 9},
		toPos = {x = 535, y = 95, z = 9},
		rightTopCorner = {x = 535, y = 75, z = 9},
		leftBottomCorner = {x = 513, y = 95, z = 9},

		exit = {x = 483, y = 111, z = 9}
	},
}

bomberman.isArenaFree = function(arenaNumber)
	return getGlobalStorageValue(bomberman.arenas[arenaNumber].storage) == -1
end
