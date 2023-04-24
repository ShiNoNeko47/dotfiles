local nest = require("nest")

nest.applyKeymaps({
	{
		mode = "v",
		{
			{ "<LeftMouse>", "<nop>" },
			{ "<LeftDrag>", "<nop>" },
			{ "<RightMouse>", "<nop>" },
			{ "<RightDrag>", "<nop>" },
			{ "<MiddleMouse>", "<nop>" },
			{
				"<2-",
				{
					{ "-LeftMouse>", "<nop>" },
					{ "-LeftDrag>", "<nop>" },
					{ "-RightMouse>", "<nop>" },
					{ "-RightDrag>", "<nop>" },
					{ "-MiddleMouse>", "<nop>" },
				},
			},
			{
				"<3-",
				{
					{ "-LeftMouse>", "<nop>" },
					{ "-LeftDrag>", "<nop>" },
					{ "-RightMouse>", "<nop>" },
					{ "-RightDrag>", "<nop>" },
					{ "-MiddleMouse>", "<nop>" },
				},
			},
			{
				"<4-",
				{
					{ "-LeftMouse>", "<nop>" },
					{ "-LeftDrag>", "<nop>" },
					{ "-RightMouse>", "<nop>" },
					{ "-RightDrag>", "<nop>" },
					{ "-MiddleMouse>", "<nop>" },
				},
			},
		},
	},
	{
		mode = "n",
		{
			{ "<LeftMouse>", "<nop>" },
			{ "<LeftDrag>", "<nop>" },
			{ "<RightMouse>", "<nop>" },
			{ "<RightDrag>", "<nop>" },
			{ "<MiddleMouse>", "<nop>" },
			{
				"<2-",
				{
					{ "-LeftMouse>", "<nop>" },
					{ "-LeftDrag>", "<nop>" },
					{ "-RightMouse>", "<nop>" },
					{ "-RightDrag>", "<nop>" },
					{ "-MiddleMouse>", "<nop>" },
				},
			},
			{
				"<3-",
				{
					{ "-LeftMouse>", "<nop>" },
					{ "-LeftDrag>", "<nop>" },
					{ "-RightMouse>", "<nop>" },
					{ "-RightDrag>", "<nop>" },
					{ "-MiddleMouse>", "<nop>" },
				},
			},
			{
				"<4-",
				{
					{ "-LeftMouse>", "<nop>" },
					{ "-LeftDrag>", "<nop>" },
					{ "-RightMouse>", "<nop>" },
					{ "-RightDrag>", "<nop>" },
					{ "-MiddleMouse>", "<nop>" },
				},
			},
		},
	},
})
