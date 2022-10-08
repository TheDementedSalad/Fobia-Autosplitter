//Fobia: St Dinfna Autosplitter v 1.0 08/10/2022
//Supports Autosplits for each chapter + item splitter
//Removes loads
// By TheDementedSalad

state("Fobia-Win64-Shipping", "Release")
{
	byte isLoading: 0x4C37300, 0x10, 0x8, 0x560;
	string128 map: 0x4C3C688, 0xD28, 0x30, 0xF8, 0x14;
	float X: 0x4C28680, 0x30, 0x250, 0x130, 0x3E8, 0x130, 0x10;
	float Y: 0x4C28680, 0x30, 0x250, 0x130, 0x3E8, 0x130, 0x18;
	float Z: 0x4C28680, 0x30, 0x250, 0x130, 0x3E8, 0x130, 0x14;
	float FinBoss: 0x4C3FFA0, 0x260, 0x98, 0x20, 0x4D0, 0xBC;
}

state("Fobia-Win64-Shipping", "1.02")
{
	byte isLoading: 0x4C4D400, 0x10, 0x8, 0x560;
	string128 map: 0x4C52788, 0xD28, 0x30, 0xF8, 0x14;
	float X: 0x4C3E780, 0x30, 0x250, 0x130, 0x3E8, 0x130, 0x10;
	float Y: 0x4C3E780, 0x30, 0x250, 0x130, 0x3E8, 0x130, 0x18;
	float Z: 0x4C3E780, 0x30, 0x250, 0x130, 0x3E8, 0x130, 0x14;
	float FinBoss: 0x4C3FFA0, 0x260, 0x98, 0x20, 0x4D0, 0xBC;
}

startup
{
	//Variables for our settings
	//Key Item Splits For Chapter 1
	vars.Hotel1Items = new List<string>()
    {"It has the weird ability to see things in other worlds.","Opens the drawer at the end of the corridor of the 6th-floor.","Opens the 608 room.","Opens the 606 room.","Used to open security gates of the 6th floor.",
	 "Open the blue corridor bathroom.","Opens the 603 room.","Tool to loosen Allen screws. I believe it works in the elevator.","7th Floor button. It can be placed on the elevator panel.","Opens the mezzanine door, behind the theater.",
	 "Piece of a chess game.","Opens the 6th-floor service room.","1st Floor button. It can be placed on the elevator panel."};
	 
	vars.Hotel1Settings = new List<string>()
	{"Photographic Camera","6th Floor Drawer Key","Room 608 Key","Room 606 Key","Red Key Card","5th Floor Bathroom Key","Room 603 Key & 5th Floor Circuit",
	 "Allen Keys","7th Floor Button","Mezzanine 1 Key","Chess Piece","6th Floor Service Room Key","1st Floor Button"};
	 
	 
	//Key Item Splits For Chapter 2
	vars.HomeItems = new List<string>()
    {"Open the kitchen door of my house.","Opens my office.","It seems that some pieces are missing.","Mysterious technological object. It seems to be a source of great energy."};
	 
	vars.HomeSettings = new List<string>()
	{"Kitchen Door Key","Office Door Key","Ornate Key (Chris)","Metal Sphere"};
	
	
	//Key Item Splits For Chapter 3	
	vars.Hotel2Items = new List<string>()
    {"Opens the library on the 1st floor.","Opens meeting room 2 on the 1st floor.","3rd Floor button. It can be placed on the elevator panel.","Opens the conference room on the 1st floor.",
	 "Tool that can be used to force some objects, I believe it can fix that crooked elevator door.","Can be used to open security gates of the 5th floor.","I've seen this shape somewhere in the hotel.",
	 "Used to open security gates of the 8th floor.","8th Floor button. It can be placed on the elevator panel.","Cash register handle.","Opens the reception of the hotel.",
	 "Opens the administration room on the 8th floor.","Loose pieces of a piano."};
	 
	vars.Hotel2Settings = new List<string>()
	{"Library Key","Meeting Room Key","3rd Floor Button","Conference Room Key & Shotgun","Crowbar","Blue Key Card","709 Metal Piece",
	 "White Card","8th Floor Button","Cash Register Handle","Reception Key","Administration Room Key & 4th Floor Circuit","Small Gear & Piano Keys"};
	 
	 
	//Key Item Splits For Chapter 4
	vars.ForestItems = new List<int>()
    {6,7,8,9,10,11};
	 
	vars.ForestSettings = new List<string>()
	{"Metal Piece 6","Metal Piece 7","Metal Piece 8","Metal Piece 9","Metal Piece 10","Metal Piece 11"};
	
	
	//Key Item Splits For Chapter 5
	vars.LabItems = new List<string>()
    {"Low-level access card, grants access to level 1 rooms.","Contains the data for creating the level 2 security card.","Tool for unscrewing screws.","Server module. It can be used to replace the defective module.",
	 "Mid-level access card, grants access to level 2 rooms.","Contains the data for creating the level 3 security card.","High-level access card, grants access to level 3 rooms.","This card gives access to the universal transporter's laboratory.",
	 "Some kind of very strong toxin.","Some kind of parasite!?","Live cells of some being, with an immunosuppressive substance","Used to protect yourself from toxic gases."};
	
	vars.LabSettings = new List<string>()
	{"Card Level 1","USB Flash Lvl 2","Screwdriver","Server 19","Card Level 2","USB Flash Lvl 3","Card Level 3","Universal Transporter Lab Access Card",
	 "Batrachotoxin Compound","Plasmodium Compound","M Cells + Cycles","Gas Mask"};
	 
	vars.ChapSplit = new List<string>()
	{"It has the weird ability to see things in other worlds."};
	 
	settings.Add("Chap", false, "Chapter End Splits(Check below which items to split on)");
	settings.CurrentDefaultParent = "Chap";
	settings.Add("Chap1", false, "Finish Hotel 1");
	settings.Add("Chap2", false, "Finish Christophers House");
	settings.Add("Chap3", false, "Finish Hotel 2");
	settings.Add("Chap4", false, "Finish The Forest");
	settings.CurrentDefaultParent = null;
	
	settings.Add("Items", false, "Item Splits (Check below which items to split on)");
	 //Item Split Options
	settings.Add("Hotel1Items", false, "Chapter 1 Item Splits (Check below which items to split on)", "Items");
		settings.CurrentDefaultParent = "Hotel1Items";
		for(int i = 0; i < 13; i++){
        	settings.Add("" + vars.Hotel1Items[i].ToString(), false, "" + vars.Hotel1Settings[i].ToString());
    	}
		settings.CurrentDefaultParent = null;

	 
	 //Item Split Options
	settings.Add("HomeItems", false, "Chapter 2 Item Splits (Check below which items to split on)", "Items");
		settings.CurrentDefaultParent = "HomeItems";
		for(int i = 0; i < 4; i++){
        	settings.Add("" + vars.HomeItems[i].ToString(), false, "" + vars.HomeSettings[i].ToString());
    	}
		settings.CurrentDefaultParent = null;

	 
	 //Item Split Options
	settings.Add("Hotel2Items", false, "Chapter 3 Item Splits (Check below which items to split on)", "Items");
		settings.CurrentDefaultParent = "Hotel2Items";
		for(int i = 0; i < 13; i++){
        	settings.Add("" + vars.Hotel2Items[i].ToString(), false, "" + vars.Hotel2Settings[i].ToString());
    	}
		settings.CurrentDefaultParent = null;
	 
	 //Item Split Options
	settings.Add("ForestItems", false, "Chapter 4 Item Splits (Check below which items to split on)", "Items");
		settings.CurrentDefaultParent = "ForestItems";
		for(int i = 0; i < 6; i++){
        	settings.Add("" + vars.ForestItems[i].ToString(), false, "" + vars.ForestSettings[i].ToString());
    	}
		settings.CurrentDefaultParent = null;
	 
	 //Item Split Options
	settings.Add("LabItems", false, "Chapter 5 Item Splits (Check below which items to split on)", "Items");
		settings.CurrentDefaultParent = "LabItems";
		for(int i = 0; i < 12; i++){
        	settings.Add("" + vars.LabItems[i].ToString(), false, "" + vars.LabSettings[i].ToString());
    	}
		settings.CurrentDefaultParent = null;
		
	settings.Add("Fin", true, "Final Split - Always Active");
}

init
{
	vars.completedSplits = new List<string>();
	vars.completedSplitsInt = new List<int>();
	vars.FinBoss = 0;
	current.Inventory = new string[16];
	current.AmmoCount = new int[16];
	
	switch (modules.First().ModuleMemorySize)
	{
		case (84893696):
			version = "1.02";
			vars.inventoryPtr = 0x4C3E780;
			break;
		default:
			version = "Release";
			vars.inventoryPtr = 0x4C28680;
			break;
	}
}


update
{
	//Reset variables when the timer is reset.
	if(timer.CurrentPhase == TimerPhase.NotRunning)
	{
		vars.completedSplits.Clear();
		vars.completedSplitsInt.Clear();
		vars.FinBoss = 0;
	}

	//print(modules.First().ModuleMemorySize.ToString());
	
	//Iterate through the inventory slots to return their values
	current.Inventory = new string[16].Select((_, i) => {
        StringBuilder sb = new StringBuilder(300);
        IntPtr ptr;
		new DeepPointer(vars.inventoryPtr, 0x30, 0x228, 0x340, 0xA0 + (i * 0x260), 0x0).DerefOffsets(memory, out ptr);
	memory.ReadString(ptr, sb);
    return sb.ToString();
    }).ToArray();
	
	current.AmmoCount = new int[16];
	//Iterate through the inventory slots to return their values
		for(byte i = 0; i < 5; i++){
			current.AmmoCount[i] = new DeepPointer(vars.inventoryPtr, 0x190, 0x30, 0x120, 0x0, 0x340, 0x8 + (i * 0x260)).Deref<byte>(game);
		}
	
	if(current.FinBoss == 0f && old.FinBoss > 0f && current.X >= -4750f && current.X <= -3250f && current.Y >= 24f && current.Y <= 25f && current.Z >= 6400f && current.Z <= 7900f){
		vars.FinBoss++;
	}

	//Uncomment debug information in the event of an update.
	//print(modules.First().ModuleMemorySize.ToString());
}

start
{
	return current.isLoading == 1 && old.isLoading == 0 && current.map == "MapTest";
}

split
{
	string[] currentInventory = (current.Inventory as string[]);
	int[] currentAmmoCount = (current.AmmoCount as int[]);
	 
	if(settings["Items"]){ 
		if(settings["Hotel1Items"] && current.map == "MapTest")
		{
			for(int i = 0; i < 13; i++)
			{
				if(vars.Hotel1Items.Contains(currentInventory[i]) && !vars.completedSplits.Contains(currentInventory[i]) && settings[currentInventory[i].ToString()])
				{
					vars.completedSplits.Add(currentInventory[i]);
					return true;
				}
			}
		}
	
		if(settings["HomeItems"] && current.map == "Map_LoadCasaChristopher")
		{
			for(int i = 0; i < 4; i++)
			{
				if(vars.HomeItems.Contains(currentInventory[i]) && !vars.completedSplits.Contains(currentInventory[i]) && settings[currentInventory[i].ToString()])
				{
					vars.completedSplits.Add(currentInventory[i]);
					return true;
				}
			}
		}
	
		if(settings["Hotel2Items"] && current.map == "MapTest")
		{
			for(int i = 0; i < 13; i++)
			{
				if(vars.Hotel2Items.Contains(currentInventory[i]) && !vars.completedSplits.Contains(currentInventory[i]) && settings[currentInventory[i].ToString()])
				{
					vars.completedSplits.Add(currentInventory[i]);
					return true;
				}
			}
		}
	
		if(settings["ForestItems"] && current.map == "Map_LoadFloresta")
		{
			for(int i = 0; i < 6; i++)
			{
				if(vars.ForestItems.Contains(currentAmmoCount[i]) && !vars.completedSplitsInt.Contains(currentAmmoCount[i]) && settings[currentAmmoCount[i].ToString()])
				{
					vars.completedSplitsInt.Add(currentAmmoCount[i]);
					return true;
				}
			}
		}
		
		if(settings["LabItems"] && current.map == "Map_PersistentSubsolo")
		{
			for(int i = 0; i < 12; i++)
			{
				if(vars.LabItems.Contains(currentInventory[i]) && !vars.completedSplits.Contains(currentInventory[i]) && settings[currentInventory[i].ToString()])
				{
					vars.completedSplits.Add(currentInventory[i]);
					return true;
				}
			}
		}
	}
	
	if(current.map == "Map_PersistentSubsolo" && vars.FinBoss == 3){
		return settings["Fin"];
	}
	
	if(settings ["Chap"]){
		if(settings ["Chap1"]){
			if(current.map == "Map_LoadCasaChristopher" && old.map != "Map_LoadCasaChristopher" && !vars.completedSplits.Contains(current.map)){
				vars.completedSplits.Add(current.map);
				return true;
			}
		}
		
		if(settings ["Chap2"]){
			if(current.map == "MapTest" && old.map != "MapTest" && !vars.completedSplits.Contains(current.map)){
				vars.completedSplits.Add(current.map);
				return true;
			}
		}
		
		if(settings ["Chap3"]){
			if(current.map == "Map_LoadFloresta" && old.map != "Map_LoadFloresta" && !vars.completedSplits.Contains(current.map)){
				vars.completedSplits.Add(current.map);
				return true;
			}
		}
		
		if(settings ["Chap4"]){
			if(current.map == "Map_PersistentSubsolo" && old.map != "Map_PersistentSubsolo" && !vars.completedSplits.Contains(current.map)){
				vars.completedSplits.Add(current.map);
				return true;
			}
		}
	}
}

isLoading
{
	return current.isLoading == 0;
}
