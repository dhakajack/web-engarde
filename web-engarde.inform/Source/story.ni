"En Garde" by Jack Welch

The story headline is "A voyager forever mindless".
The story genre is "horror".
The release number is 4.
The story creation year is 2018.
The story description is "The one thing you don't miss is memory."

Include Vorple Element Manipulation by Juhana Leinonen.
Include Vorple Hyperlinks by Juhana Leinonen.
Include Vorple Command Prompt Control by Juhana Leinonen.
Include Vorple Modal Windows by Juhana Leinonen.

Use full-length room descriptions.
Use no scoring.

Release along with the "Vorple" interpreter.
Release along with style sheet "web-engarde.css".

Release along with cover art ("A cadaverous man in a guard hat surrounded by pictures of a woman scientist, a mouse, a dog, and an electric motor"), a file of "Blurb" called "blurb.txt" and a file of "Walkthrough" called "walkthrough.txt".

[********]
debugMode is a truth state that varies. debugMode is FALSE.
[*******]

forceScroll is a truth state that varies. forceScroll is TRUE.

Chapter 1 - Override Vorple

[To get around escaping of characters so I can use escaped unicode to render accented characters and symbols]

To display text (content - text) in all the/-- elements called (classes - text):
	execute JavaScript command "$('.[classes]').text('[content]')".

Chapter 2 - Block Dialogue

BlockChatterFlag is a truth state that varies. BlockChatterFlag is false.

Chapter 3 - Player

The player has a number called consciousness. The consciousness of the player is 0. The curedFlag of the player is a truth state that varies. The curedFlag of the player is false. The player has a number called conversations. The conversations of the player is 0.

[Level					after eating….
0					nothing
1					a mouse
2					a dog
3					a slice of guard brain
4					the scientist's brain
]

The player has a number called knownCommands. The knownCommands of the player is 0.

[Niveau					Action
1					East
2					West
3					Eating
4					Opening
5					North
6					South
7					Push Button
8					Unlock
9					Talk
10					Repair]

Chapter 4 - Exit Lister

To listExits:
	clear all elements called "arrows";
	display text "[exitList]" in the element called "arrows".


To say exitList:
	let L be {west, north, south, east};
	repeat with way running through L:
		if the room the way from the location is not nothing:
			let D be the door the way from the location;
			if D is nothing or D is open or (D is simpleOpenable and the consciousness of the player is greater than 0) or (D is buttoned and the consciousness of the player is greater than one) or (D is locked and the consciousness of the player is greater than two):
				if the way is:
					-- west:
						say "\u2190 ";
					-- north:
						say "\u2191  ";
					-- south:
						say "\u2193 ";
					-- east:
						say "\u2192 ".
						
To listHiddenExits:
	place an inline element called "hidden" reading "Potential exits:[hiddenExitList]. "
	
To say hiddenExitList:
	let L be {west, north, south, east};
	let LL be a list of text;
	repeat with way running through L:
		if the room the way from the location is not nothing:
			let D be the door the way from the location;
			if D is nothing or D is open or (D is simpleOpenable and the consciousness of the player is greater than 0) or (D is buttoned and the consciousness of the player is greater than one) or (D is locked and the consciousness of the player is greater than two):
				if the way is:
					-- west:
						add " west" to LL;
					-- north:
						add " north" to LL;
					-- south:
						add " south" to LL;
					-- east:
						add " east" to LL;
	let N be the number of entries in LL;
	repeat with X running from 1 to N:
		if (N is greater than 1 and X is N):
			say " and";
		say entry X of LL;
		if (N is greater than 2 and X is less than N):
			say ",".

Chapter 5 -Language-specific tweaks

Rule for printing the banner text: 
	place an inline element called "titre" reading "[story title]";
	say line break;
	say "[story headline] by [story author][line break]";
	say "Release [release number] / Serial number 180225 / Inform 7 build 6M62 (I6/v6.33 lib 6/12N)[line break]".
	
The can't go that way rule response (A) is "[bougePas]."

Chapter 6 - Suppress Mention of Doors

For printing a locale paragraph about a door (called the item)
	(this is the don't mention doors in room descriptions rule):
	set the locale priority of the item to 0;
	continue the activity.
	
Chapter 7 - Suppress Container Open/Closed Messages

The examine containers rule is not listed in any rulebook.

Chapter 8 - Button Setup

Palette is a list of text that varies. 
Palette is {"black","brown","red","orange","yellow","green","blue","violet","gray","white"}.
	
Chapter 9 - Start of Play

When play begins:
	if debugMode is false:
		hide the prompt;
	place a block level element called "arrows";
	sort the palette in random order.

After printing the banner text:
	listExits;
	listHiddenExits;
	say "[line break][italic type]Where am I? For that matter, who am I?[roman type][paragraph break]You wake up alone in a plain room with a bluish hue.[paragraph break][italic type]Why can't I remember anything?[paragraph break]I've got to concentrate! What happened? Come on. Think! Think![paragraph break]In any case, the solution isn't here [unicode 8212] I'll have to look around.";
	say roman type;
	increment the knownCommands of the player.

Chapter 10 - Geography

Section Location Generalities

Doors are usually closed. Doors are usually not locked.

Section Doors

A thing can be buttoned. Things are usually not buttoned.
A thing can be broken. Things are usually not broken.

Instead of going through a closed door (called la porte):
	if the consciousness of the player is less than 3:
		say "[bougePas].";
		try looking;
	otherwise:
		if la porte is locked:
			say "This door is secured with an electronic lock.";
		otherwise:
			if la porte is buttoned:
				say "First, you have to ";
				if the player is in an elevator:
					say "indicate the destination floor.";
				otherwise:
					say "call the elevator.";
			otherwise:
				say "The door is closed."
			
To say bougePas:
	say "The wall does not budge".
			
Section Bloc Opératoire

Bloc Opératoire is a room. The description of Bloc Opératoire is "[descBlocOperatoire]." Couloir 2 is east from Bloc Opératoire. The player is in Bloc Opératoire. The printed name of the Bloc Opératoire is "[pnBlocOpératoire]".

To say descBlocOperatoire:
	if the consciousness of the player is:
		-- 0:
			say "A dimly lit room[one of] with some deep shadows[or][stopping]";
		-- 1:
			say "There's a bit of blood here [unicode 8212] a huge, blue room with metallic walls";
		-- 2:
			say "The blue room in which humans cut up animals and remove their guts";
		-- 3:
			say "The operating table stands in the middle of the blue room, surrounded by surgical equipment. The exit leads to the corridor";
		-- 4:
			say "The operating table in the middle of the room is covered in blue surgical drapes. The table has various straps and contraptions to immobilize animals during surgery. Just next to the table is an anesthesia machine, with knobs and dials, and tubes leading to the ceiling. Just above it, there are several vital signs monitors, all of which are off at present. A portable radiography machine has been wheeled in next to the table.[paragraph break]The central corridor for level two is just off to the east"
			
To say pnBlocOpératoire:
	if the consciousness of the player is:
		-- 0:
			say "The blue place";
		-- 1:
			say "The scary place";
		-- 2:
			say "The torture chamber";
		-- 3:
			say "Operating room";
		-- 4:
			say "Surgical theater".
			
Instead of simplePushing when the player is in the Bloc Opératoire:
	if the consciousness of the player is less than 4:
		say "You aren't sure what does what in here and don't want to risk accidently dissecting yourself by poking randomly about[one of]. That would be embarassing[or][stopping].";
	otherwise:
		say "You aren't scrubbed in and all the equipment in here is sterile; you don't want to contaminate the equipment."

Section Couloir 2

Couloir 2 is a room. The description of Couloir 2 is "[descCouloir2]." The labZooDoor is a door. It is north of Couloir 2 and south of Laboratoire Zoologique. The printed name of Couloir 2 is "[pnCouloir2]".

To say descCouloir2:
	if the consciousness of the player is:
		-- 0:
			say "A white, unfurnished hallway";
		-- 1:
			say "A great white corridor that connects the scary place to the west with the den of the fierce wolf to the north";
		-- 2:
			say "The hall that leads from my comfy nook to the north to the chamber of horrors to the west";
			say "[liftDoorDogStatus]";
		-- 3:
			say "The central corridor for level two. The operating room is to the west, the kennel to the north, the lab to the south, and the elevator to the east";
		-- 4:
			say "The central corridor for level two. The operating room is to the west, the kennel to the north, the lab to the south, and the elevator to the east".
			
To say liftDoorDogStatus:
	if the door east from the location is closed:
		say ". A red button shines on the wall to the east";
	otherwise:
		say ". The opening to the east has disappeared. There's a red button on the wall next to where the opening was"
			
To say pnCouloir2:
	if the consciousness of the player is:
		-- 0:
			say "Corridor";
		-- 1:
			say "Great Hall";
		-- 2:
			say "Dangerous Passage";
		-- 3:
			say "Corridor, Level 2";
		-- 4:
			say "Level 2: Physiological Experiments".
	
		
After going east from Couloir 2 when the ascenseur2door is open for the first time:
	now the BlockChatterFlag is true;
	try looking;
	say "[italic type][quotation mark]Lucky, how did you know how to open the magic box?[quotation mark][line break][quotation mark]I saw a button. I pushed it. That's what I do. So, what's all this about a [apostrophe]magic box[apostrophe]?[quotation mark][line break][quotation mark]The giants… [quotation mark][line break][quotation mark]You mean the humans?[quotation mark][line break][quotation mark]Sure, probably. Anyhow, the humans go into the box and they disappear. Later, other humans appear in the same box. It's got to be magic.[quotation mark][line break][quotation mark]Hmm. We'll see about that.[quotation mark][roman type][paragraph break]".
			

Section Laboratoire Zoologique

Laboratoire Zoologique is a room. The description of Laboratoire Zoologique is "[descLabZoo]." The printed name of Laboratoire Zoologique is "[pnLabZoo]".

To say descLabZoo:
	if the consciousness of the player is:
		-- 1:
			say "From his cage, the vicious wolf stares at you";
		-- 2:
			say "The room in which you were taught to press a button to get treats out of the reward machine";
		-- 3:
			say "A cage takes up half the space in this room; the rest is dedicated to animal training equipment";
		-- 4:
			say "Animals are kept here in a large cage, which allows them to remain active during experiments that can last up to several weeks[one of]. You notice a sign taped to the cage: [apostrophe]Subject 205-Alpha[apostrophe][or][stopping]"
			
To say pnLabZoo:
	if the consciousness of the player is:
		-- 1:
			say "The wolf's den";
		-- 2:
			say "My home";
		-- 3:
			say "The kennel";
		-- 4:
			say "Zoological laboratory".
	
To say openNord:
		say "The wall to the north slides aside, revealing the room next door".

	
The cage is an openable closed container in the Laboratoire Zoologique. The printed name of the cage is "cage".

The chien is an edible thing. It is in the cage. The printed name of the chien is "[if the consciousness of the player is 1]wolf[otherwise]dog[end if]". The chien can be dead. The chien is not dead. 

The food dispenser is in the Laboratoire Zoologique. It is buttoned. The printed name of the food dispenser is "[if the consciousness of the player is greater than 2]dog [end if]food dispenser".

After choosing notable locale objects when the player is in the Laboratoire Zoologique:
	set the locale priority of the food dispenser to 9.
	
Rule for printing a locale paragraph about the food dispenser:
	say "A [food dispenser] stands next to [if the cage is open]an open[otherwise]a closed[end if] [cage][if chien is dead] containing the mauled corpse of an animal[end if].";
	now the chien is mentioned; 
	now the food dispenser is mentioned;
	now the cage is mentioned.

Instead of pushing the food dispenser:
	say "You press the red button. ";
	if the consciousness of the player is:
		-- 2:
			say "In reward, a few nuggets fall to the ground. You eat them, but they do not satisfy your hunger.";
		-- 3:
			say "You don't find the reward nuggets that fall at your feet the least bit appetizing.";
			move the pile of dog food to the Laboratoire Zoologique;
		-- 4:
			say "The operant conditioning device dispenses a few dog food pellets that pile up on the ground.";
			move the pile of dog food to the Laboratoire Zoologique.
			
The pile of dog food is in the void.

Every turn when the chien is in the cage and the player is in the Laboratoire Zoologique:
	if a random chance of 3 in 8 succeeds:
		say "The wolf [one of]barks loudly[or]chews the bars of his cage[or]scratches his ears[or]paces back and forth in his metal cage[or]howls with all his might[or]sniffs the air[or]sniffs his cage[or]sniffs himself[or]licks his paws[or]shows you his teeth[or]growls menacingly[or]ignores you[or]runs the length of his cage, eying you[in random order]."		
	
		 
Section Ascenseur 2

An elevator is a kind of room. The description of an elevator is "[descAscenseur1]." The printed name of an elevator is "[pnAsc]".

An elevatorDoor is a kind of door. ElevatorDoors are buttoned. 

To say pnAsc:
	if the consciousness of the player is 2:
		say "The little room";
		if Ascenseur 2 is visited:
			say " that vibrates";
	otherwise:
		say "The elevator".

Ascenseur 2 is an elevator. The Ascenseur2door is an elevatorDoor. It is east of Couloir 2 and west of Ascenseur 2. 

Instead of pushing an elevatorDoor:
	say "You push the button";
	if the player is in an elevator:
		if the consciousness of the player is:
			-- 2:
				say " with your snout[one of] (which seems shorter than you remember)[or][stopping] and notice a slight vibration. A moment later, the wall opens upon a corridor to the west.";
			-- otherwise:
				say ", the elevator [if the location is Ascenseur 2]descends to the first level[otherwise]goes up to the second level[end if] and the door opens to the west."; 
		if the player is in Ascenseur 2:
			move the player to Ascenseur 1, without printing a room description;
			now Ascenseur1door is open;
		otherwise:
			move the player to Ascenseur 2, without printing a room description;
			now Ascenseur2door is open;
	otherwise:
		if the consciousness of the player is:
			-- 2:
				say " and the wall slides open, allowing you to proceed to the east.";
			-- otherwise:
				say " and the elevator door opens to the east.";
		if the player is in Couloir 2:
			now Ascenseur2door is open;
		otherwise:
			now Ascenseur1door is open.
		
After going east from Couloir 2:
		say "[portesReferment].";
		try looking;
		now the Ascenseur2door is closed.
		
To say portesReferment:
	say "You ";
	if the player is in an elevator:
		say "enter";
	otherwise:
		say "leave";
	say " and ";
	if the consciousness of the player is less than 3:
		say "the wall slides shut again";
	otherwise:
		say "the door closes";
	say " silently behind you".
	
After going west from an Ascenseur 2:
	say "[portesReferment].";
	try looking;
	now Ascenseur2door is closed.
	

Section Laboratoire Biochimique

Laboratoire Biochimique is a room. The description of Laboratoire Biochimique is "[descLabBio]." The printed name of the Laboratoire Biochimique is "[pnLabBio]". 

The labBioDoor is a locked door. It is south of Couloir 2 and north of Laboratoire Biochimique. The printed name of the labBioDoor is "[pnLabBioDoor]".

To say descLabBio:
	if the consciousness of the player is:
		-- 3:
			say "The room is lined floor to ceiling with high-tech equipment. On a typical day, the room would be full of blinking lights and the whir of robotic actuators, but right now the equipment is dark and you don't hear the slightest sound";
		-- 4:
			if the disjoncteurs are not broken:
				say "With power restored, the room is now lit up like a Christmas tree, the computer fans are whirring, and the microfluidic station stands ready to carry out even the most complex biochemical syntheses";
			otherwise:
				say "The room is entirely dark, and neither the computers nor the robotic molecular synthesis unit are working. It's obvious that somewhere electrical power to the room has been cut"
					
To say pnLabBio:
	if the consciousness of the player is:
		-- 3:
			say "Biochemical Laboratory";
		-- 4:
			say "Molecular Synthesis Laboratory".
			
To say pnLabBioDoor:
	say "laboratory door".
	
After choosing notable locale objects when the player is in the Laboratoire Biochimique:
	if the microfluidic synthesis unit is in the location, set the locale priority of the microfluidic synthesis unit to 9.
	
Rule for printing a locale paragraph about the microfluidic synthesis unit:
	say "A next-generation microfluidic synthesis unit takes up one side of the room, its panel indicators ";
	if disjoncteurs are broken:
		say "uniformly dark";
	otherwise:
		say "blinking ";
		if the microfluidic synthesis unit is broken:
			say "to indicate an error condition";
		otherwise:
			say "normally";
	say ". The unit's service panel is ";
	if the microfluidic synthesis unit is closed:
		say "closed";
	otherwise:
		say "open, revealing ";
		if the disjoncteurs are broken:
			say "its inner workings";
		otherwise:
			if the microfluidic synthesis unit is broken:
				say "a non-";
			otherwise:
				say "a repaired, ";
			say "functional servo motor";
	say ".";
	now the microfluidic synthesis unit is mentioned.
	
Section Couloir 1

Couloir 1 is a room. The description of Couloir 1  is "[descCouloir1]." The printed name of Couloir 1 is "[pnCouloir1]".

To say descCouloir1:
	if the consciousness of the player is:
		-- 2:
			say "A corridor that looks like the [quotation mark]dangerous hallway[quotation mark] near your cage. You see [if labPathDoor is closed]an exit to the south and a sliding door to the north[otherwise]exits to the north and south[end if]";
			say "[liftDoorDogStatus]";
		-- 3:
			say "The level one central corridor lies between the restrooms to the south, showers to the west, a lab to the north, and the elevator to the east";
		-- 4:
			say "The central corridor on level one leads south to the restroom, west to the decontamination suite, north to the histopathology laboratory, and east to the elevator".
		
To say pnCouloir1:
	if the consciousness of the player is:
		-- 2:
			say "New corridor";
		-- 3:
			say "Corridor, level one";
		-- 4:
			say "Level 1: Biocontainment".
			
After going east from Couloir 1:
		say "[portesReferment].";
		try looking;
		now the Ascenseur1door is closed.

Section Ascenseur 1

Ascenseur 1 is an elevator. The Ascenseur1door is an elevatorDoor. It is east of Couloir 1 and west of Ascenseur 1. 

To say descAscenseur1:
	say "A green button shines on a panel".
	
After going west from an Ascenseur 1:
	say "[portesReferment].";
	try looking;
	now Ascenseur1door is closed.

Section Laboratoire De Pathologie

Laboratoire de Pathologie is a room. The description of Laboratoire de Pathologie is "[descLabPath]." The labPathDoor is a door. It is north of Couloir 1 and south of Laboratoire de Pathologie. The printed name of Laboratoire de Pathologie is "[pnLabPath]".

To say pnLabPath:
	if the consciousness of the player is:
		-- 2:
			say "The kitchen";
		-- 3: 
			say "The prep lab";
		-- 4:
			say "The histopathology laboratory".

To say descLabPath:
	If the consciousness of the player is:
		-- 2:
			say "[one of]This room reminds you of better times that you spent with your family [unicode 8212] from before you were abducted. Considering the counters, shelves full of food, sinks, and large appliances, there's no doubt in your mind that this is the most important room in the entire house: the kitchen[or]A typical kitchen, with black decor[stopping]";
		-- 3:
			say "This is where the researchers prepare microscope slides.[paragraph break]You recognize a meat slicer and a microwave oven, but most of the equipment on the counter doesn't look familiar";
		-- 4:
			say "An ultramodern laboratory dedicated to preparation and analysis of tissue samples".
	
The frigo is a closed openable container in the Laboratoire de Pathologie. The frigo is closed. The printed name of the frigo is "[pnFrigo]". 

To say pnFrigo:
	if the consciousness of the player is:
		-- 2:
			say "fridge";
		-- 3:
			say "freezer";
		-- 4:
			say "-80[unicode 176]C freezer for storing pathology specimens".
			
After opening the frigo:
	move the plastic container to the location;
	say "You open the fridge and a plastic box falls to the floor."
	
The plastic container is a closed openable container in the frigo. The printed name of the plastic container is "[if the consciousness of the player is less than 3]plastic[otherwise]Tupperware[end if] container".

The slice of brain is an edible thing in the plastic container.

After opening the labPathDoor:
	say "[openNord]."
	
After going north from Couloir 1 when the labPathDoor is open for the first time:
	now the BlockChatterFlag is true;
	say "[italic type][quotation mark]Mmmmm![quotation mark] says Lucky, licking his chops.[line break][quotation mark]What are you so happy about?[quotation mark][line break][quotation mark]You see that box, there? That's the real magic box: the fridge![quotation mark][line break][quotation mark]Do we get in the fridge to go places?[quotation mark][line break][quotation mark]No, we eat what's inside it![quotation mark][roman type][paragraph break]";
	try looking.


Section Les Toilettes

Les Toilettes is a room. The description of Les Toilettes is "[descToilettes]." Les Toilettes are south of Couloir 1. The printed name of Les Toilettes is "[pnToilettes]". 
To say descToilettes:
	if the consciousness of the player is less than 3:
		say "The scent of urine is strong here[one of]. Many have marked their territory. This must be an extremely desirable location[or][stopping]";
	otherwise:
		say "A black and white tiled floor, cabinets, urinals and sinks"
	
To say pnToilettes:
	if the consciousness of the player is less than 3:
		say "The tiled room";
	otherwise:
		say "The bathroom".
		
Instead of simplePushing when the player is in les Toilettes:
	if the consciousness of the player is less than 3:
		say "You press a metal button and immediately hear a loud sound.";
	otherwise:
		say "You flush the toilet."
		
Instead of simpleOpening when the player is in Les Toilettes:
	if the consciousness of the player is less than 3:
		say "[if the potty is in Les Toilettes]The water bowl is already open[otherwise]You lift a cover to reveal a bowl full of water[end if].";
	otherwise:
		say "[if the potty is in Les Toilettes]You have already lifted[otherwise]You lift[end if] the toilet seat cover.";
	now the potty is in Les Toilettes.
	
The potty is a thing in the void. The printed name of the potty is "[pnPotty]".

To say pnPotty:
	if the consciousness of the player is less than 3:
		say "bowl full of water";
	otherwise:
		say "toilet (the cover of which has been lifted)". 
		
Instead of simpleEating when the player is in Les Toilettes:
	if the potty is in the void:
		continue the action;
	otherwise:
		if the consciousness of the player is:
			-- 2:
				say "You [one of]lap up the water in the bowl. It's refreshing[or]aren't really thirsty, but you drink some water[or]are no longer thirsty having already guzzled down a few liters of water[stopping].";
			-- 3:
				say "No, that would be disgusting[one of] (even for someone who eats brains)[or][stopping]."; 
			-- 4:
				say "Do you have any idea how many species of pathogenic bacteria live in the water? No way."
				
After going south from Couloir 1 when the consciousness of the player is 4 for the first time:
		now the BlockChatterFlag is true;
		say "As you enter the bathroom, you catch some movement out of the corner of your eye.[paragraph break][italic type]Who's here? A man... Oh, Julian, look: it's you.[roman type][paragraph break]You facepalm, and in the mirror, still dressed in his blue guard uniform and cap, so does Julian. This is going to take some getting used to.";
		try looking.
	
After going south from Couloir 1 when the consciousness of the player is 3 for the first time:
	now the BlockChatterFlag is true;
	say "As you enter the bathroom, you catch some movement out of the corner of your eye.[paragraph break][italic type]Is somebody else here?[roman type][paragraph break]A burly man dressed in a tattered uniform stares at you with unblinking eyes. His pale skin, rheumy eyes and sunken cheeks call to mind a cadaver.[paragraph break]This awkward encounter goes on for several minutes before you realize that you are staring at your own reflection in a mirror.";
	try looking.

Section Salle de Décontamination

Salle de Décontamination is a room. The description of Salle de Décontamination is "[descDecon]." The printed name of the Salle de Décontamination is "[pnDecon]".

The deconDoor is a locked door. It is west of Couloir 1 and east of Salle de Décontamination. The printed name of the deconDoor is "[pnDeconDoor]".

To say descDecon:
	if the consciousness of the player is:
		-- 3:
			say "The showerheads are aimed at the center of a room bathed continuously in a deep, purple light";
		-- 4: 
			say "The high pressure nozzles that ring the room are designed to hose down personnel with an antiseptic solution as they come and go from potentially contaminated zones within the complex. The room is continuously illuminated by germicidal lights";
	say ". Doors lead eastward to the hallway and northward to the stairs"

To say pnDecon:
	if the consciousness of the player is:
		-- 3:
			say "The Locker Room";
		-- 4:
			say "Decontamination room".
			
To say pnDeconDoor:
	if the consciousness of the player is:
		-- 3:
			say "door to the showers";
		-- 4:
			say "decontamination suite door".
			
Instead of simplePushing when the player is in the Salle de Décontamination:
	if the consciousness of the player is:
		-- 3:
			say "You relax in the warm, gentle shower. After a moment, the shower stops spraying and you dry off.";
		-- 4:
			say "[one of]The personnel decontamination system blasts you with a phenolic-smelling spray[or]Your skin sizzles and eyes burn from the caustic spray[stopping].".

Section Escalier 1

Escalier 1 is a room. The description of Escalier 1  is "[descEscalier1]." The printed name of Escalier 1 is "Stairway (first level)".

The esc1door is a locked door. It is north of Salle de Décontamination and south of Escalier 1.

The printed name of esc1door is "door between the [if the consciousness of the player is 3]shower[otherwise]decontamination[end if] room and the stairs".

To say descEscalier1:
	say "The stairway climbs to the north and connects the [if the consciousness of the player is 3]shower[otherwise]decontamination[end if] room to the south with the rest of the installation above".
	
After going north from Salle de Décontamination:
	say "[upNorth].";
	try looking.
	
After going south from Escalier 2:
	say "[downSouth].";
	try looking.
	
To say upNorth:
	say "You climb the stairs towards the north".
	
To say downSouth:
	say "You go down the stairs southwards".

Section Escalier 2

Escalier 2 is a room. The description of Escalier 2  is "[descEscalier2]." Escalier 2 is north from Escalier 1. The printed name of Escalier 2 is "Stairway (second level)".

To say descEscalier2:
	say "The stairs go up towards the north and connect the lower set of stairs to the south with the airlock to the north".
	
After going north from Escalier 1:
	say "[upNorth].";
	try looking.
	
After going south from Sas:
	say "[downSouth].";
	try looking.

Section Sas

Sas is a room. The description of Sas is "[descSas]." The printed name of the sas is "Airlock".

The sasDoor is a locked door. It is north of Escalier 2 and south of Sas. The printed name of the sasDoor is "armored airlock door".

The scientist is an edible thing in the sas. The scientist has a truth state called introducedFlag. The introducedFlag of scientist is false. The scientist has a number called conversations. The conversations of the scientist is 0.

To say descSas:
	if the consciousness of the player is:
		-- 3:
			say "A long, tubular room bathed in red light";
		-- 4:
			say "The heavy armored doors, lack of windows, and tubular shape of the room remind you of a submarine. The light above the door at the other end of the room is red, signaling that the exterior door is locked";
		say ". The stairs downward are behind you, to the south".
			
Instead of going north when the player is in the sas:
	if scientist is in the sas:
		say "You would need to get past the scientist and she doesn't appear to be all that cooperative. Moreover, since you don't know the code to open the outer door, it wouldn't make much sense to try.";
	otherwise:
		say "Useless. The door is hermetically sealed and can only be opened by someone in the control room."
			
Before eating scientist when the conversations of scientist are less than 5:
	now the BlockChatterFlag is true;
	say "[one of]The scientist beats you back with her crowbar. Once out of reach of your slavering maw, she presses a button on the intercom and says, [quotation mark]Attention, control room, this is Doctor Rambaud in the airlock. Julien is here with me. Unfortunately, I have to report that the experiment seems not to have gone well. Don't unlock the outer door without authorization from Colonel Greillier. Understood?[quotation mark][paragraph break][quotation mark]The voice over the intercom acknowledges, [quotation mark]Affirmative, ma'am. Colonel authorization only, confirmed. Engaging failsafe protocols.[quotation mark][or]Doctor Rambaud does not budge from behind the desk, but as you approach she lands a series of blows with her crowbar that makes you reconsider your actions.[or]The scientist acknowledges, [quotation mark]I have to give you credit for your perseverance, but… [quotation mark] and she whacks you solidly on the nose. Stunned, you stagger back out of reach of her crowbar.[or]Doctor Rambaud beats you repeatedly with the crowbar.[stopping]";
	stop the action.

After choosing notable locale objects when player is in sas:
	If the bloody corpse of Doctor Rambaud is in sas, set the locale priority of the bloody corpse of Doctor Rambaud to 9. [this assures Inform looks for the corpse first]
	
Rule for printing a locale paragraph about the bloody corpse of Doctor Rambaud when the bloody corpse of Doctor Rambaud is in the sas:
	say "The corpse of Doctor Rambaud lies crumpled on the floor not far from the intercom.";
	now the bloody corpse of Doctor Rambaud is mentioned;
	now the intercom is mentioned.

Chapter 11 - Verbs

Section 1 - simpleUnlocking

simpleUnlocking is an action applying to nothing. Understand "unlock" as simpleUnlocking.

Carry out simpleUnlocking:
	repeat with way running through directions:
		if the door the way of the location is locked:
			now the door the way from the location is unlocked;
			say "You enter the code on the numeric keypad and hear the door to the [way] unlock.[no line break][one of][firstUnlocked][or][stopping][paragraph break]";
			stop the action;
	say "You don't see any locked door here";
	if the location is the sas:
		say ", except the reinforced vault door leading northward into the complex. You are aware, however, that door can only be opened from the other side. Your passcode will not work on it";
		if the consciousness of the player is 4:
			say " now that failsafe protocol has been engaged";
	say "."
	
To say firstUnlocked:
	now the BlockChatterFlag is true;[hate to side effect this way, but here it seems expedient]
	say "[paragraph break][italic type][quotation mark]Hang on a minute,[quotation mark] says the dog. [quotation mark]What kind of a trick is that?[quotation mark][line break][quotation mark]To unlock these doors with electronic locks, you have to enter the right code.[quotation mark][line break][quotation mark]And you remember the code?[quotation mark] asks the mouse.[line break][quotation mark]Apparently so.[quotation mark][roman type]".
	
Section 2- simpleOpening

Definition: A door is simpleOpenable if it is closed and it is not locked and it is not buttoned.
	
simpleOpening is an action applying to nothing. Understand "open" as simpleOpening.

Carry out simpleOpening:
	repeat with the way running through directions:
		if the door the way of the location is simpleOpenable:
			try opening the door the way from the location;
			stop the action;
		if the door the way of the location is locked and the consciousness of the player is greater than 2:
			say "You would have to first unlock the door to [the way].";
			stop the action;
	repeat with the item running through visible containers:
		if the item is closed:
			try opening the item;
			stop the action;
	say "There's nothing obvious to open here." 
	
After opening the plastic container:
	say "You grab the plastic container by a corner and shake it back and forth until it comes apart. A glistening slice of brain goes flying across the kitchen, strikes the wall with a rubbery smack, and slides to the floor."

Section 3 - simpleEating

simpleEating is an action applying to nothing. Understand "eat" as simpleEating.

Carry out simpleEating:
	repeat with the item running through visible edible things:
		try eating the item;
		stop the action;
	say "You don't see anything to eat";
	if the consciousness of the player is 1 and the chien is in the cage:
		say " (at least, nothing you can get to for the moment)";
	if the pile of dog food is in the location:
		say " (at least, nothing that looks appetizing)";
	say "."


Rule for implicitly taking something (called the target) while eating:
	try silently taking the target.
	
Section 4- simplePushing

simplePushing is an action applying to nothing. Understand "push" as simplePushing.

Carry out simplePushing:
	repeat with the item running through visible buttoned things:
		try pushing the item;
		stop the action;
	say "There's nothing to push here."
	
Section 5- simpleTalking

simpleTalking is an action applying to nothing. Understand "talk" as simpleTalking.

Check simpleTalking:
	if the player is not in the sas:
		say "You don't see anyone to talk to.";					
		stop the action;
	otherwise:
		if the bloody corpse of Doctor Rambaud is not in the void:
			if the intercom is not live:
				say "To talk to the control room, you must first activate the intercom.";
				stop the action.
				
Carry out simpleTalking:
	if the bloody corpse of Doctor Rambaud is not in the void:
		now the BlockChatterFlag is true;
		if the curedFlag of the player is not true:
			say "[one of]Speaking into the intercom, you explain your plan. The technician on the other end of the line hurriedly wishes you good luck. Yelling between bursts of gunfire, he instructs you report back when you have succeeded. Short of that, though, he requests that you not use the intercom. He hangs up on you and the intercom goes dark[or]They must have a lot going on up there. You wait impatiently, but no one answers[or]Until and unless you find a cure, there isn't much to discuss with the control room. You decide to save their time and yours and hold off on calling them for now[stopping].";
			now the intercom is not live;
		otherwise:
			increase the conversations of the player by 1;
			if the conversations of the player is:
				-- 1:
					say "[quotation mark]Control room, Professor Drummond speaking.[quotation mark][line break][quotation mark]It's me, your dog, Lucky! I'm in the airlock! I am so happy to hear your voice![quotation mark][line break][quotation mark]Um. Huh? Are you messing with me? The intercom is only for official communications. Who is this?[quotation mark][paragraph break][italic type][quotation mark]It's him! It's the father of my family,[quotation mark] says Lucky.[line break][quotation mark]Calm down, Lucky,[quotation mark] insists the scientist. [quotation mark]Please let Julien do the talking.[quotation mark][roman type][paragraph break][quotation mark]Excuse me,[quotation mark] you say. [quotation mark]I can explain everything. It is imperative that I discuss the matter with Colonel Greillier. I am Julien Truffaut.[quotation mark][line break][quotation mark]The guard?[quotation mark][line break][quotation mark]Yes.[quotation mark][line break][quotation mark]Impossible. Doctor Rambaud said that he had turned. Zombies can't talk. I don't have time for your crap, now get off the line.[quotation mark][paragraph break]";
				-- 2:
					say "[quotation mark]I'm not joking,[quotation mark] pleads Julien. [quotation mark]Doctor Rambaud has cured me.[quotation mark][line break][quotation mark]Okay, enough,[quotation mark] answers the professor. [quotation mark]If she's there, put her on.[quotation mark][line break][quotation mark]She is… occupied… at the moment.[quotation mark] While you are speaking, you drag the scientist's lifeless body around the corner to the stairwell.[paragraph break][quotation mark]Listen,[quotation mark] you continue, [quotation mark]if you don't believe me, turn on the surveillance cameras in the airlock. You'll be able to see me.[quotation mark][line break][quotation mark]Okay, give me a sec.[quotation mark][paragraph break]";
					move the bloody corpse of Doctor Rambaud to Escalier 2;
				-- 3:
					say "[quotation mark]Do you see me?[quotation mark] you ask.[line break][quotation mark]Yes. Got you on the screen. But how can you still be alive? I thought you'd been infected by the virus.[quotation mark][line break][quotation mark]Well, yes, you're right, but as I told you…[quotation mark][paragraph break][italic type][quotation mark]Let me explain,[quotation mark] interrupts the scientist.[roman type][paragraph break][quotation mark]Doctor Rambaud prepared a cure using the microfluidic biosynthesis workstation following protocol M13 as she discussed with you previously. My neural pathways were restored and I am entirely cured.[quotation mark][line break][quotation mark]Okay… But that would mean… this could be it. An end to the pandemic![quotation mark][line break][quotation mark]Right. We need to move on this quickly.[quotation mark][paragraph break]";
				-- 4: 
					say "You ask to speak to the director of the entire research complex, Colonel Greillier, and you relate everything that has happened, leaving out, for now, some of the details suggested by Lucky and the mouse.[paragraph break]After a couple hours of discussion and some blood tests, the colonel is convinced and orders that the airlock doors be unsealed, permitting you to exit. ";
					terminate the game;
	otherwise:
		now the BlockChatterFlag is true;
		increase the conversations of scientist by 1;
		if the conversations of scientist is:
			-- 1:
				say "You start babbling incoherently, the words refusing to come. As the sounds trip off your tongue, the scientist stares at you incredulously.[paragraph break][quotation mark]Is it possible?[quotation mark] she asks. [quotation mark]Are you still capable of speaking somehow?[quotation mark][line break][quotation mark]Yes,[quotation mark] you groan painfully, [quotation mark]I… speak.[quotation mark][line break][quotation mark]Incredible! It's a miracle, Julien. What do you remember?[quotation mark][paragraph break][italic type][quotation mark]Julien? Who's Julien?[quotation mark] asks Lucky.[line break][quotation mark]Not me,[quotation mark] says the mouse. [quotation mark]Maybe the name belongs to our buddy, the slice of brain?[quotation mark][line break][quotation mark]I don't recall, but sure, I guess I could be this Julien. I mean, why not?[quotation mark][roman type][paragraph break][quotation mark]Nothing. I don't remember a thing… Julien… that's me?[quotation mark][line break][quotation mark]Yes, Julien. It's you. And I'm your Isabelle. Isabelle Rambaud,[quotation mark] replies the scientist in a disappointed tone.[paragraph break]";
			-- 2:
				say "[italic type][quotation mark]She has pretty eyes (for a giant),[quotation mark] remarks the mouse.[line break][quotation mark]Shut up,[quotation mark] say the slice of brain and Lucky in unison.[roman type][paragraph break]You force yourself to form the words, one after another.[paragraph break][quotation mark]What are we doing here?[quotation mark][line break][quotation mark]Listen, Julien, I don't have much time. I am a medical researcher and you are a guard. We both work at an installation dedicated to finding a cure for the zombie777 virus, which has devastated the entire world.[quotation mark][line break][quotation mark]A guard?[quotation mark][line break][quotation mark]Yes. Pay attention, Julien, this is important. A crowd of pandemic victims surrounded the lab complex and you were protecting me when you were scratched by one of them. I had to give you the experimental treatment to prevent you from turning into a zombie.[quotation mark][line break][quotation mark]So, I'm cured?[quotation mark][line break][quotation mark]No, not even close.[quotation mark][paragraph break]";
			-- 3:
				say "[quotation mark]So, the treatment didn't work?[quotation mark] you ask.[line break][quotation mark]No, not entirely it would seem. I had a problem with the microfluidic biosynthesis unit that produced the dose I gave you. I think that one of the ingredients must have been left out of that batch. I was trying to repair the unit when you caught me off guard. You attacked me, but I managed to hole up here in the airlock. So. That's where things stand.[quotation mark][line break][quotation mark]Sorry.[quotation mark][line break][quotation mark]It wasn't you. You were a full-blown zombie at the time. But… how is it that now you're able to talk? I've never heard of a zombie that could talk [unicode 8212] it just doesn't happen.[quotation mark][paragraph break]";
			-- 4:
				say "[quotation mark]It's really hard for us to talk.[quotation mark][line break][quotation mark]Naturally, your neural pathways are in a state of… hold on… what do you mean, [apostrophe]us[apostrophe]?[quotation mark][paragraph break][italic type][quotation mark]Tell her about me,[quotation mark] implores the mouse, full of excitement.[line break][quotation mark]And about me![quotation mark] adds Lucky.[roman type][paragraph break][quotation mark]Yeah. About that. I said [apostrophe]us[apostrophe] because there are three minds in my head: a mouse, a dog named Lucky, and a slice of brain. We work together as best we can to get around and talk.[quotation mark][paragraph break][quotation mark]Well.[quotation mark] She stares a moment at the ceiling to gather her thoughts. [quotation mark]Well, I suppose that explains everything. Your brain was rebooted, more or less erased by the virus, but somehow you have managed to sort of reload it with normal brains. That slice of brain that you mentioned must have been the biopsy that I took from Julien before the virus had invaded that part of his brain.[quotation mark][paragraph break]";
			-- 5:
				say "[quotation mark]So, we're well and truly screwed?[quotation mark] you say.[paragraph break][italic type][quotation mark]Totally,[quotation mark] whines the mouse.[line break][quotation mark]Yeah, I'd say so,[quotation mark] agrees Lucky.[roman type][paragraph break][quotation mark]Maybe not… [quotation mark][line break][quotation mark]You have an idea?[quotation mark][line break][quotation mark]Yes, I think so. Do exactly what I say: I don't have long for this world. I can't even feel my legs; it's only a matter of time. However… if you eat my brain [unicode 8212] hang on, not yet! Let me finish talking [unicode 8212] thanks. As I was saying, if you eat my brain, my personality will meld with all of yours. You are still actively infected with the virus and in time it will destroy what's left of your brain, but the infection seems to have been slowed by the first treatment, even if it wasn't completely effective. If there's enough time, I can repair the synthesis unit and we can try one more time to produce a cure for the virus. If we succeed, I can live on in you, along with your thoughts.[quotation mark][line break][quotation mark]So, I should eat your brain now?[quotation mark][line break][quotation mark]Go for it.[quotation mark][paragraph break]";
			-- otherwise:
				say "There's nothing more to say."
									
Section 6 - simpleRepairing

simpleRepairing is an action applying to nothing. Understand "repair" as simpleRepairing.

Carry out simpleRepairing:
	repeat with the item running through visible things:
		if the item is:
			-- the microfluidic synthesis unit:
				if the microfluidic synthesis unit is broken and the microfluidic synthesis unit is open:
					say "You brush aside the bit of solder. The machine should work normally now, when powered up.";
					now the microfluidic synthesis unit is not broken;
				otherwise:
					if the curedFlag of the player is true:
						say "All of the equipment in here has performed flawlessly, there is nothing more to fix. In theory, with some resupply, the unit is now capable of cranking out more doses of the cure.";
					otherwise: [broken mfsu means flipped circuit breakers, so this would be true]	
						say "The machinery itself looks functional [unicode 8212] the problem appears to be lack of electrical current to the room itself.";	
				stop the action;
			-- the disjoncteurs:
				if the the microfluidic synthesis unit is broken:
					say "As soon as you flip the circuit breakers, there is a sharp clicking sound from the electrical panel and you notice the breakers have again tripped[one of][or][or]. As long as an electrical fault condition persists, they will automatically cut in to avert damage to the sensitive equipment in the lab[or]. They will not remain in the [quotation mark]on[quotation mark] position until you address whatever condition is causing a massive electrical current draw in the lab[or]. Chances are, something in the lab has shorted out. You need to fix that first[or][stopping].";
				otherwise:
					if the disjoncteurs are broken:
						say "You reset the circuit breakers. Power should now be restored to the molecular synthesis lab.";
						now the disjoncteurs are not broken;
					otherwise:
						say "The circuit breaks are already locked in the [quotation mark]on[quotation mark] position, so power should be flowing to all stations on level two of the complex.";
				stop the action;
	[if it falls through to this point, give the default blocking message]
	say "You don't see anything in need of repair."
	
Chapter 12 - Consciousness

To increment the consciousness of the player:
	increase the consciousness of the player by 1;
	try looking.


Chapter 13 - Known Commands

The list of text called actionList is always {"east", "west","eat","open","north","south","push","unlock","talk","repair"}.

The commandList is a list of numbers that varies. The commandList is {}.

To increment the knownCommands of the player:
	increase the knownCommands of the player by 1;
	add the knownCommands of the player to commandList;
	place an inline element called "hidden" reading "A new command has appeared: ";
	if the knownCommands of the player is 8:
		remove all elements called "vorple-link";
		repeat with N running from 1 to 8:
			place a link to the command "[entry N of actionList]" called "boutons box[N] literate" reading "[entry N of actionList]";	
	if the knownCommands of the player is less than 8:
		place a link to the command "[entry knownCommands of the player of actionList]" called "boutons box[knownCommands of the player] [entry knownCommands of the player of palette]" reading "[entry knownCommands of the player of palette]";
	otherwise:
		place a link to the command "[entry knownCommands of the player of actionList]" called "boutons box[knownCommands of the player] literate" reading "[entry knownCommands of the player of actionList]";	
	place an inline element called "hidden" reading ". ".
	
Understand "east/west/eat/open/north/south/push/unlock/talk/repair" as "[okayCommand]".

[To prevent players bypassing the CSS to enter arbitrary commands]
After reading a command:
	if the knownCommands of the player is zero:
		say "The game has ended. To play again, reload the game in your browser.";
		reject the player's command;
	otherwise:
		if the player's command does not match "[okayCommand]":
			say "Select from one of the above command links.";
			reject the player's command.
				
Chapter 14 - Milestones

After going east for the first time:
	try looking;
	say "A tiny creature zips out of nowhere, weaves between your feet, and flees to the west.";
	increment the knownCommands of the player.
	
After going west from Couloir 2 for the first time:
	move the small gray creature to the Bloc Opératoire;
	try looking;
	say "It hides in the shadows, trembling.";
	increment the knownCommands of the player.
	
After eating the small gray creature:
	say "[line break]You blindly sweep the base of the wall with your hand. Despite your lack of speed and dexterity, by some miracle you manage to trap the tiny creature against the wall. You seize it firmly and feel something warm, furry [unicode 8212] and now moist [unicode 8212] melt in your hand. Without another thought, you pop it into your mouth and swallow.[paragraph break]A moment later, you are overcome as new thoughts flood your mind.[paragraph break][italic type]Help! A giant monster is after me! It's going to eat me! I have to hide.[paragraph break]I…um.  Am I dead or what? I don't get it. What's going on?[roman type][paragraph break]";
	increment the consciousness of the player.
	
After going east when the consciousness of the player is 1 for the first time:
	try looking;
	now the BlockChatterFlag is true;
	say "[italic type]Ah, the great white hallway.[paragraph break]How many times I have seen the giants walk right through the smooth walls into secret rooms? How do they do it?[roman type][line break]";
	increment the knownCommands of the player.
	
After opening the labZooDoor:
	say "[openNord].";
	increment the knownCommands of the player.
	
After going north from Couloir 2 for the first time:
	say "You sneak into the wolf's den, a place that is well known to you, but still terrifying.";
	try looking;
	say "As usual, the wolf is imprisoned in an iron cage and you are free to explore, beyond the reach of his slavering fangs.";
	increment the knownCommands of the Player.
	
After opening the cage:
	say "You open the cage, but the wolf remains prudently inside, watching you."
	
After eating the chien:
	now the chien is dead;
	move the chien to the void;
	say "[line break]Out of instinct, you eat the wolf[apostrophe]s brain and throw the body back into the cage. Once again, new thoughts invade your mind.[paragraph break][italic type]I'm warning you: if you get near my cage, I'll eat you. Stop! I'm not kidding…[paragraph break]Huh? What's going on? What's that dead dog doing in my cage… bleeding on my favorite pillow?[paragraph break]And what am I doing standing on my hind legs like a human? It seems to be easier than I would have thought.";
	increment the consciousness of the player;
	now the BlockChatterFlag is true;
	say "[italic type][quotation mark]Sorry[quotation mark][line break][quotation mark]Sorry about what?[quotation mark][line break][quotation mark]I guess, I'm sorry that I ate you.[quotation mark][line break][quotation mark]Ate me? Who are you, anyhow?[quotation mark][line break][quotation mark]The mouse.[quotation mark][roman type][line break]";
	increment the knownCommands of the player.
	
After eating the slice of brain:
	say "[line break]While eating the slice of brain you notice that the flavor is a little bit off.[paragraph break]Nothing happens for a few minutes and you begin to wonder if you can now eat just anything you find without having to worry about it.[paragraph break]Suddenly, the world explodes from muddy grays into full, vibrant color. A wave of electricity courses through your mind and you collapse, disoriented. As you stand back up, new ideas blend into your thoughts and you see everything in a new light.";
	increment the consciousness of the player;
	now the BlockChatterFlag is true;
	say "[italic type][quotation mark]We have to patrol![quotation mark] commands a new voice.[line break][quotation mark]Patrol? What's that mean?[quotation mark] asks the mouse.[line break][quotation mark]Well, it means to walk everywhere and secure the installation,[quotation mark] replies the voice.[line break][quotation mark]I love to go on walks![quotation mark] says Lucky excitedly.[roman type][line break]";
	increment the knownCommands of the player.
	
After going north from Escalier 2 when the sasDoor is not closed for the first time:
	now the BlockChatterFlag is true;
	say "A woman in her forties, dressed in a white lab coat sits behind a metal desk. She is half way between you and the door at the other end of the room. Her upper right arm is swathed in gauze, but the bandages are drenched in blood and she appears gravely injured. In her other hand, she brandishes a crowbar with determination.";
	try looking;
	say "She stares at you warily.";
	increment the knownCommands of the player.
	
After eating scientist:
	now the BlockChatterFlag is true;
	say "[line break]You eat the scientist's brain and immediately perceive the world from a more refined and erudite perspective.[paragraph break][italic type][quotation mark]Is it done?[quotation mark] asks the voice of Isabelle with hesitation.[line break][quotation mark]Yes, you were delicious,[quotation mark] compliments the mouse.[line break][quotation mark]The best yet,[quotation mark] adds Lucky.[line break][quotation mark]Excuse my co-brains, they are sorely lacking in tact,[quotation mark] interjects the slice of brain.[line break][quotation mark]Hey![quotation mark] complain the mouse and dog.[line break][quotation mark]Make yourself at home, Isabelle,[quotation mark] continues the slice of brain. [quotation mark]Let me present our little company: here's Lucky the dog, and that's the Duke of Mousedom (or just [apostrophe]the mouse[apostrophe], as he's rather modest), and me. I'm the one they call [apostrophe]slice of brain[apostrophe]. We are at your service.[quotation mark][line break][quotation mark]Good morning, boys,[quotation mark] says Isabelle warmly.[roman type][line break]";
	move the bloody corpse of Doctor Rambaud to the sas;
	move the intercom to the sas;
	move the panneau électrique to escalier 1;
	move the microfluidic synthesis unit to the Laboratoire Biochimique;
	increment the knownCommands of the player;
	increment the consciousness of the player.
		
Chapter 15 - Dialogue

Every turn:
	if the curedFlag of the player is not true:
		if the disjoncteurs are not broken and the the microfluidic synthesis unit is not broken and the player is in the Laboratoire Biochimique:
			now the BlockChatterFlag is true;
			say "The robotic workstation emits a beep and fills a flask with fluorescent green fluid. You take the flask, propose a short toast to yourself, and kick it back in one gulp.[paragraph break][italic type][quotation mark]I don't feel anything,[quotation mark] worries the slice of brain.[line break][quotation mark]Wait for it,[quotation mark] reassures Isabelle.[line break][quotation mark]Me neither,[quotation mark] pipes up the mouse.[line break][quotation mark]Wait for it,[quotation mark] insists the scientist.[line break][quotation mark]Oh my![quotation mark] barks Lucky. [quotation mark]Something's starting to…[quotation mark][line break][quotation mark]And we're off![quotation mark] shouts the doctor.[roman type][paragraph break]You shake violently and pass out. When you are able to stand up again, you note that you skin has recovered its normal tint and that you can walk without lurching back and forth. In short, you've been cured.[paragraph break]";
			now the curedFlag of the player is true;
	if the BlockChatterFlag is false:
		if the consciousness of the player is:
			-- 1:
				if the number of entries in mouseDialogue is greater than zero:
					say "[italic type][entry 1 of mouseDialogue][roman type][paragraph break]";
					remove entry 1 from mouseDialogue;
			-- 2:
				if the number of entries in mouseDogDialogue is greater than zero:
					say "[italic type][quotation mark][entry 1 of mouseDogDialogue][quotation mark][roman type][paragraph break]";
					remove entry 1 from mouseDogDialogue;
			-- 3:
				if the number of entries in mouseDogGuardDialogue is greater than zero:
					say "[italic type][entry 1 of mouseDogGuardDialogue][roman type][paragraph break]";
					remove entry 1 from mouseDogGuardDialogue;
			-- 4:
				if the curedFlag of the player is true:
					if the number of entries in CuredDialogue is greater than zero:
						say "[italic type][entry 1 of CuredDialogue][roman type][paragraph break]";
						remove entry 1 from CuredDialogue;
				otherwise:
					if the number of entries in EverybodyDialogue is greater than zero:
						say "[italic type][entry 1 of EverybodyDialogue][roman type][paragraph break]";
						remove entry 1 from EverybodyDialogue;
	now the BlockChatterFlag is false;
	listExits;
	if the knownCommands of the player is greater than 0:
		listHiddenExits.
	
This is the scroll update rule:
	execute javascript command "$('html, body').animate({scrollTop:$(document).height()}, 1);".
	
The scroll update rule is listed last in the every turn rules.
	
Section Mouse Dialogue

mouseDialogue is a list of text that varies. 
	
mouseDialogue is {
"In any case, I seem to have grown quite a bit. Hmph, how about that.",
"I've got a real hankering for something [unicode 8212] I just can't quite put my paw on it.",
"Let's see, what do I usually want?",
"Sleep? Nope. Drink? Nope. Sex? Nope.[paragraph break]My gods! No? Am I sick?",
"Ah, that's it. I'm hungry.",
"But hungry for what? That escapes me for the moment.",
"For some cheese? No, not really.",
"I'm looking for something soft, juicy...",
"I guess I'll know it when I see it."
}.

Section MouseDog Dialogue	
		
mouseDogDialogue is a list of text that varies. 

mouseDogDialogue is {
"The mouse? What mouse?[quotation mark][line break][quotation mark]The mouse who lives here.[quotation mark][line break][quotation mark]That damned mouse who is always swiping crumbs from around my food dispenser?[quotation mark][line break][quotation mark]Yes, one and the same. Once again, just wanted to say that I'm sorry if I upset you.",
"Don't sweat it. I would have done the same.[quotation mark][line break][quotation mark]Thanks.[quotation mark][line break][quotation mark]Say, mouse, do you have a name?[quotation mark][line break][quotation mark]No, we mice don't have names. You can just call me [apostrophe]Mouse[apostrophe]. How about you? What's yours?[quotation mark][line break][quotation mark][apostrophe]Lucky[apostrophe]. Or, at least that's what my family called me before I got here. The torturers refer to me as [apostrophe]Subject 205-Alpha[apostrophe], but I prefer [apostrophe]Lucky[apostrophe].[quotation mark][line break][quotation mark]Okay, Lucky.",
"Mouse, can you explain something to me? I'm still a bit confused. How can it be that you, a tiny little mouse, could manage to eat a big strong dog like me, when I'm several times your size?[quotation mark][line break][quotation mark]You know, I've asked myself the same question. Hang on [unicode 8212] you're a dog? I thought you were a wolf![quotation mark][line break][quotation mark]Nope, a dog.[quotation mark][line break][quotation mark]Really?[quotation mark][line break][quotation mark]Yes, I'm pretty sure.",
"I can't figure out how I managed to eat you.[quotation mark][line break][quotation mark]What do you remember about it?[quotation mark][line break][quotation mark]I was seized by a sudden urge to eat brains.[quotation mark][line break][quotation mark]Brains? Which ones?[quotation mark][line break][quotation mark]In this case [unicode 8212] yours.[quotation mark][line break][quotation mark]Ah, I see… no, not really.",
"Have you always lived here, Mouse?[quotation mark][line break][quotation mark]My family has lived here for generations, it is our hereditary territory. We defend it against all invaders. Field mice are nothing but thugs and thieves.[quotation mark][line break][quotation mark]Have you ever seen the outside world?[quotation mark][line break][quotation mark]I don't have the slightest desire to do so. I've heard stories, of course: the sky, clouds, fields, and so on, but none that interests me.",
"What about you, Lucky? You mentioned a family? Do you have a wife? We mice don't believe in marriage, but I've heard you dogs are more traditional.[quotation mark][line break][quotation mark]A family, yes, but not a wife (although there was that poodle next door… but, um, that's another story). No, when I speak of family, I'm talking about a human family.",
"You were their slave?[quotation mark] asks the mouse.[line break][quotation mark]No, it wasn't like that. I played with the kids, they fed me, they petted me all day, and I even had my own bed.[quotation mark][line break][quotation mark]You're dreaming. I've never seen anything like that. Humans don't like animals [unicode 8212] they're always trying to crush us under their heels.",
"Meh, you don't know anything about humans,[quotation mark] refutes Lucky.[line break][quotation mark]I don't want to know them from any closer, thank you very much.[quotation mark][line break][quotation mark]You would have liked my family.[quotation mark][line break][quotation mark]If that's the case, why did you leave such an amazing family, if I may ask?[quotation mark][line break][quotation mark]Not by choice. We were in a forest, I saw a squirrel, and you can figure out the rest. I never saw them again.[quotation mark][line break][quotation mark]Don't talk to me about squirrels. They're worse than wild mice.",
"Lucky, do you think that some day you'll find your family?[quotation mark][line break][quotation mark]Hope so.[quotation mark][line break][quotation mark]Me too. I'd like to chase squirrels with you.[quotation mark][line break][quotation mark]Yeah, that would be great."
}


Section MouseDogGuard Dialogue

mouseDogGuardDialogue is a list of text that varies. 

mouseDogGuardDialogue is { 
"[quotation mark]If I might ask a question,[quotation mark] begins the mouse, [quotation mark]who are you?[quotation mark][line break][quotation mark]My name is… hmm… let's see… give me a sec… yeah, good question. I don't quite seem to remember it for the moment. Why don't you pick one for me?[quotation mark][line break][quotation mark]Let's call him [apostrophe]the little slice of brain that we found in the fridge that had kind of a weird taste[apostrophe][quotation mark], suggests Lucky.[line break][quotation mark]No, that's entirely too long. Let's just go with [apostrophe]the slice of brain[apostrophe]. How's that?[quotation mark][line break][quotation mark]Sure,[quotation mark] says the slice of brain. [quotation mark]All things considered, I prefer short names.[quotation mark]", 
"[quotation mark]Do you guys also have names?[quotation mark] asks the slice of brain.[line break][quotation mark]Yes,[quotation mark] replies the dog. [quotation mark]Excuse our lack of etiquette. I'm called [apostrophe]Lucky[apostrophe] and my friend the mouse is simply named [apostrophe]Mouse[apostrophe].[quotation mark][line break][quotation mark]Right,[quotation mark] confirms the mouse.[line break][quotation mark]A pleasure to make your acquaintances, my new friends.[quotation mark]", 
"[quotation mark]So, slice of brain, I wonder what kind of animal you were before you got here. I was a dog and the mouse had always been a mouse.[quotation mark][line break][quotation mark]I was something other than a slice of brain?[quotation mark][line break][quotation mark]It seems to me that you must have been a fridge,[quotation mark] suggests the mouse. [quotation mark]I ate the brain of a dog and Lucky appeared. After that, we opened and ate a fridge, and you appeared.[quotation mark][line break][quotation mark]I don't think it works like that,[quotation mark] murmurs Lucky.", 
"[quotation mark]When you got here, you said that we had to [apostrophe]secure the installation[apostrophe]. What did you mean by that?[quotation mark] asks Lucky.[line break][quotation mark]I meant that we have to look all around the installation to protect it against all threats.[quotation mark][line break][quotation mark]Okay,[quotation mark] says the mouse, trying to follow the thread of the conversation, [quotation mark]but what's an installation?[quotation mark][line break][quotation mark]Oh, an installation? It's the complex of… um… rather, it's a place, where everyone works to… hmm.  Yeah. It's where we are,[quotation mark] concludes the slice of brain.", 
"[quotation mark]What threat are you talking about?[quotation mark] asks the mouse.[line break][quotation mark]To be honest, I'm not sure,[quotation mark] replies the slice of brain. [quotation mark]This is so frustrating! I just can't remember, but I'm sure that there's a lot of them and that they are very bad.[quotation mark][line break][quotation mark]You know, you're sounding a bit paranoid,[quotation mark] observes the dog.[line break][quotation mark]Maybe, but if I just had my memories, I could… no, I'm afraid they're lost.[quotation mark]", 
"[quotation mark]Do you think there's anything we could do to get your memories back?[quotation mark] asks Lucky.[line break][quotation mark]How? I've tried remembering all sorts of things and nothing comes to mind.[quotation mark][line break][quotation mark]Probably because you're just a little slice of brain,[quotation mark] remarks the mouse. [quotation mark]If we could find the rest of your brain, which I guess must be around here some place, we could eat it and get back all your missing memories, right?[quotation mark][line break][quotation mark]Really? Do you think so?[quotation mark] wonders the slice of brain.[line break][quotation mark]Oh yes, certainly,[quotation mark] reassures the dog.", 
"[quotation mark]But what if the rest of the brain finds us before we find it?[quotation mark] asks the mouse.[line break][quotation mark]Yeah, so?[quotation mark] says Lucky.[line break][quotation mark]The rest of the brain could eat us before we eat it,[quotation mark] replies the mouse anxiously.[line break][quotation mark]And what exactly would that change?[quotation mark] asks the slice of brain. [quotation mark]Either way, we'd all still be together in one spot, wouldn't we?[quotation mark] asks the slice of brain.[line break][quotation mark]Yes, but usually I prefer to eat others before they eat me.[quotation mark]", 
"[quotation mark]You know what we need?[quotation mark] asks Lucky. [quotation mark]A plan. We need a plan.[quotation mark][line break][quotation mark]Yes, I agree,[quotation mark] says the mouse. [quotation mark]What do you propose?[quotation mark][line break][quotation mark]Number one[quotation mark], explains the dog, [quotation mark]we need to explore a bit to, as the slice of brain says, secure the installation. Number two: to search for the missing brain. And number… um, the number that comes after two: we need to escape.[quotation mark][line break][quotation mark]Amazing! You're a genius, Lucky,[quotation mark] says the slice of brain.",
"[quotation mark]Escape? You mean out of here? Outside?[quotation mark] asks the mouse. [quotation mark]What does the outside world offer? Nothing but headaches, I'd say. Here, I have inherited lands and even a title [unicode 8212] did you know that I am a duke? It's true, I'm not kidding. I am the eighteenth duke of my line. You want me to throw all that away?[quotation mark][line break][quotation mark]But, there's a whole world out there![quotation mark] howls the dog.[line break][quotation mark]I've lived out there,[quotation mark] adds the slice of brain. [quotation mark]I think I lived not too far from the installation with my girlfriend… what was her name?[quotation mark]", 
"[quotation mark]Eww, a girlfriend, huh?[quotation mark] asks Lucky, suddenly interested.[line break][quotation mark]Details, please,[quotation mark] encourages the mouse.[line break][quotation mark]Well, to tell you the truth, I don't remember much about her, not even her name. That said, I do recall that was blindingly clever… she had a great sense of humor and a loud, rowdy laugh… and almond-shaped eyes of the deepest violet… and she had huge… hmm…  Sorry, I don't recall the word.[quotation mark]",
"[quotation mark]If we manage to get out of the installation, do you think you could find your house?[quotation mark] asks Lucky.[line break][quotation mark]Sure, no doubt. There are only a handful of rooms to get through and we'll be out. The house is not far at all, we just have to follow the street… I don't remember which one, but I'd recognize it.[quotation mark][line break][quotation mark]Your amnesia does not fill me with confidence,[quotation mark] complains the mouse.[line break][quotation mark]If we can find the rest of the brain on our way out, everything will fall into place,[quotation mark] suggests Lucky.", 
"[quotation mark]Do you think that if we can get out of this building, you can help Lucky find his family?[quotation mark] asks the mouse.[line break][quotation mark]Maybe. Probably. Lucky, is your house also nearby?[quotation mark] inquires the slice of brain.[line break][quotation mark]I think so,[quotation mark] replies the dog. [quotation mark]My family lives in a large, white house surrounded by tall trees. There can't be many houses like that.[quotation mark][line break][quotation mark]Are there any cats?[quotation mark] interrupts the mouse.[line break][quotation mark]Not one,[quotation mark] says the dog proudly.",
"[quotation mark]I had a troubling thought,[quotation mark] says the mouse.[line break][quotation mark]What?[quotation mark] asks the slice of brain.[line break][quotation mark]What are we going to do if we run into a cat?[quotation mark][line break][quotation mark]We'd eat its brains, wouldn't we?[quotation mark] answers the slice of brain. [quotation mark]I don't see a problem there.[quotation mark][line break][quotation mark]Oh, but I do,[quotation mark] says the dog. [quotation mark]We'd hear cat thoughts all the time. That would be intolerable.[quotation mark][line break][quotation mark]Absolutely![quotation mark] agrees the mouse. [quotation mark]Eating a cat? Sure. No problem. Count me in. But no way am I willing to listen to its thoughts. That would be too much.[quotation mark]", 
"[quotation mark]When we're outside, what do we need to do to find Lucky's house?[quotation mark] asks the mouse.[line break][quotation mark]First, let's head to my house,[quotation mark] replies the slice of brain. [quotation mark]I have a car, and that will speed up the search.[quotation mark][line break][quotation mark]Let me get this straight,[quotation mark] says the mouse, [quotation mark]you don't remember your own name, but you know how to drive?[quotation mark][line break][quotation mark]If not, I can,[quotation mark] says Lucky. [quotation mark]I've watched humans do it many times. Driving doesn't seem all that complicated.[quotation mark]",
"[quotation mark]Listen, guys,[quotation mark] says the slice of brain, [quotation mark]It's getting harder and harder for me to focus; could I suggest that we hold off on the conversation for a bit so I can catch my figurative breath?[quotation mark][line break][quotation mark]Yeah, me too,[quotation mark] agrees the mouse. [quotation mark]I have a splitting headache. A little rest would be nice.[quotation mark][line break][quotation mark]I agree. I like to run with the pack as much as anyone, but I could do with a little downtime.[quotation mark][line break][quotation mark]Good night, everyone,[quotation mark] says the mouse."
}

Section Everybody Dialogue

EverybodyDialogue is a list of text that varies. 

EverybodyDialogue is { "[quotation mark]What an incredible sensation![quotation mark] marvels the scientist.[line break][quotation mark]You get used to it after a while,[quotation mark] says the mouse laconically.[line break][quotation mark]Tell her the plan, Lucky,[quotation mark] suggests the slice of brain.[line break][quotation mark]Okay,[quotation mark] says the dog, [quotation mark]Revised plan: from the top… Number one: we find the rest of Julien's brain; number two: we find a way out of the installation; and finally, number more-than-two: we look for my family.[quotation mark]",
"[quotation mark]Um, okay,[quotation mark] says Isabelle. [quotation mark]But first we have to get beyond the room where you found me, and to do that, we have to synthesize an effective cure.[quotation mark][line break][quotation mark]Impossible,[quotation mark] remarks the mouse with finality.[line break][quotation mark]Why?[quotation mark] asks the scientist, a bit off balance.[line break][quotation mark]It's a question of mathematics,[quotation mark] answers the mouse pedantically. [quotation mark]Lucky's plan starts with item number one. There is nothing before number one.[quotation mark][line break][quotation mark]Number zero?[quotation mark] suggests Isabelle.[paragraph break][roman type][quotation mark]…[quotation mark][paragraph break][italic type][quotation mark]Okay,[quotation mark] says Isabelle. [quotation mark]How about we renumber? One: prepare the cure; two: get out of the installation; thr... rather, the number after two: find Lucky's family. Does that work for you?[quotation mark][line break][quotation mark]Sure,[quotation mark] says Lucky, [quotation mark]that sounds entirely reasonable.[quotation mark][line break][quotation mark]And it's mathematically correct,[quotation mark] adds the mouse.",
"[quotation mark]Listen,[quotation mark] says Lucky, still counting the steps in Isabelle's plan. [quotation mark]What are we going to do about the missing brain? If I have this right, we need it to put Julien back together.[quotation mark][line break][quotation mark]Unfortunately,[quotation mark] replies Isabelle, [quotation mark]the slice of brain is all that's left of Julien now. Right now we're all using the neural pathways of his entire brain to think, but nothing is left of Julien's original personality except what was stored in the brain biopsy. It's a heavy loss, particularly for me.[quotation mark][line break][quotation mark]Why for you?[quotation mark] asks the mouse.[line break][quotation mark]Because we were to be married, Julien and I.[quotation mark][line break][quotation mark]Sorry,[quotation mark] consoles the slice of brain. [quotation mark]I'm sure that if I could remember you, I would really like you.[quotation mark]",
"[quotation mark]Isabelle, do you think that one day we'll find my family?[quotation mark] asks Lucky.[line break][quotation mark]Yes, I'm certain of it.[quotation mark][line break][quotation mark]How can you be so sure?[quotation mark] asks the slice of brain.[line break][quotation mark]Because I know the family: Jean-Paul and Alexandra Drummond and their daughters, Léa et Camille. They live not more than a hundred meters from me and Julien.[quotation mark][line break][quotation mark]Yes, I've heard those names often around my house. I'm sure you're right! But, how could you know who I was talking about?[quotation mark] asks Lucky.[line break][quotation mark]Because I saw them in your thoughts,[quotation mark] answers the scientist.",
"[quotation mark]Are you saying that you can see what Lucky is thinking?[quotation mark] asks the mouse. [quotation mark]How could that be possible?[quotation mark][line break][quotation mark]We're all part of one brain now. Our minds are more or less merged. I can access his thoughts and conversely, he can access mine.[quotation mark][line break][quotation mark]Cool![quotation mark] says the mouse. [quotation mark]We've got superpowers.[quotation mark]",
"[quotation mark]I have to say that I find that somewhat improbable,[quotation mark] says the dog. [quotation mark]If you can see my thoughts, what number am I thinking of right now?[quotation mark][line break]The scientist ponders for a moment and says, [quotation mark]The number one.[quotation mark][line break][quotation mark]Well, yes,[quotation mark] admits the dog. [quotation mark]But perhaps that was a random guess. Try again…[quotation mark][line break][quotation mark]You're thinking of the number two,[quotation mark] says the scientist with conviction.[line break][quotation mark]Yes again![quotation mark] says the dog, now satisfied.[line break][quotation mark]But,[quotation mark] objects the mouse, [quotation mark]Lucky only knows two numbers… what does that prove?[quotation mark]",
"[quotation mark]Fine,[quotation mark] says the scientist patiently, [quotation mark]let's take another example. Mouse, I am thinking at this very moment of this morning's breakfast. I am trying to visualize it in as much detail as I can… try to see it.[quotation mark][line break][quotation mark]Where?[quotation mark] asks the mouse. [quotation mark]I can't smell anything.[quotation mark][line break][quotation mark]Ah,[quotation mark] says Isabelle, [quotation mark]Therein lies the problem. I was thinking in visual terms. Here, let me imagine its aroma, its taste… [quotation mark][line break][quotation mark]Oh! Yes, yes! I'm starting to sense it! My gods! It was a huge meal! This is fabulous. Can I relive every meal you've ever eaten? Pinch me, I'm dreaming.[quotation mark]",
"[quotation mark]Even though I find the memory of your last meal delicious, right now I don't feel like eating anything but brains. That's kind of weird, isn't it?[quotation mark] remarks the mouse.[line break][quotation mark]In fact, it's entirely normal for someone who has been zombified,[quotation mark] replies the scientist.[line break][quotation mark]We're zombies?[quotation mark] asks Lucky.[line break][quotation mark]No,[quotation mark] clarifies the scientist. [quotation mark]Together we constitute a single zombie, sharing Julien's body.[quotation mark][line break][quotation mark]At least I'm in my own body,[quotation mark] remarks the slice of brain.", 
"[quotation mark]Are other zombies as pleasant as we are?[quotation mark] asks Lucky.[line break][quotation mark]No,[quotation mark] replies Isabelle, [quotation mark]they are monsters. We're something else entirely. I'd say that we're sort of a pseudozombie, having received a partially effective treatment. Your typical zombie can't talk or think, all they can do is eat brains.[quotation mark][line break][quotation mark]And that's a problem?[quotation mark] asks the mouse.[line break][quotation mark]Rather a big one,[quotation mark] remarks the scientist. [quotation mark]They've just about destroyed civilization![quotation mark]", 
"[quotation mark]How is that possible?[quotation mark] asks the slice of brain.[line break][quotation mark]The virulence of this virus is without precedent,[quotation mark] replies the scientist. [quotation mark]The slightest scratch is enough to transmit the virus. The first cases were reported in Cambodia and twenty-four hours later, thousands of cases appeared around the world thanks to international flights. A week later: global chaos. Without electricity, food, and water, the largest cities collapsed almost immediately. Fires have swept the countryside. Only a few pockets of humanity remain.[quotation mark]",
"[quotation mark]What about animals?[quotation mark] asks the mouse. [quotation mark]Were they affected?[quotation mark][line break][quotation mark]In fact,[quotation mark] replies Isabelle, [quotation mark]we think that the disease was canine in origin. Before we lost communications with the Pasteur Institute in Ho Chi Minh City, they had isolated a mutant form of rabies putatively responsible for the pandemic.[quotation mark][line break][quotation mark]Rabies![quotation mark] Lucky cries, [quotation mark]There's nothing more terrifying than rabies![quotation mark][line break][quotation mark]Until now,[quotation mark] corrects the slice of brain.",
"[quotation mark]If zombie-ism spreads so quickly,[quotation mark] worries Lucky, [quotation mark]do you think that my family has survived?[quotation mark][line break][quotation mark]Yes, I know so,[quotation mark] reassures the scientist. [quotation mark]The Drummonds work here at the installation and all staff families are housed within the compound. You're not far from them right now.[quotation mark][line break][quotation mark]That's great![quotation mark] exclaims the dog.", 
"[quotation mark]Isabelle,[quotation mark] says the mouse, [quotation mark]if the cure works as expected, what will become of us?[quotation mark][line break][quotation mark]In what sense?[quotation mark][line break][quotation mark]Will we remain individuals with our own thoughts or do you think that we'll somehow blend together into one mind?[quotation mark][line break][quotation mark]Impossible to say. Up until now, we've all lead our own separate lives. You have your memories, I have mine. But in the future, we'll see everything from the same point of view. We'll share one body and it's possible that over time we'll end up as a single mind. Can't really say right now how that will go.[quotation mark]", 
"[quotation mark]I never wanted to be anything other than a mouse. What you say terrifies me [unicode 8212] that my mind might be diluted or even fade out of existence.[quotation mark][line break][quotation mark]But look at the plus side,[quotation mark] says Lucky. [quotation mark]Look into my thoughts [unicode 8212] this is how it feels to chase a squirrel. And here's what it feel like to be scratched between the ears.[quotation mark][line break][quotation mark]Yes, I suppose.[quotation mark][line break][quotation mark]And here,[quotation mark] says the scientist, [quotation mark]is what Earth looks like from space [unicode 8212] something that no other mouse has ever seen.[quotation mark][line break][quotation mark]Hmm. Impressive. And I suppose that for my part, I have some memories to share as well: the warmth of sleeping huddled with the other mice, the joy of stealing bits and scraps from around Lucky's food dispenser…[quotation mark][line break][quotation mark]Hey![quotation mark] howls the dog.", 
"[quotation mark]When I saw Julien's body enter the airlock, I noticed that he was getting around with difficulty, shambling, if you will,[quotation mark] says the scientist.[line break][quotation mark]Right. I know how to walk,[quotation mark] says the slice of brain, [quotation mark]but I find it infuriatingly difficult to do it.[quotation mark][line break][quotation mark]The mouse doesn[apostrophe]t help,[quotation mark] whines Lucky. [quotation mark]He's always moving the legs, and I don't think he knows what he's doing.[quotation mark][line break][quotation mark]Me?[quotation mark] says the mouse with indignation, [quotation mark]You're the one who's always trying to run on all fours.[quotation mark][line break][quotation mark]Okay, gentlemen,[quotation mark] says the scientist, [quotation mark]Do you think I could convince you to let one of us drive at a time?[quotation mark][line break][quotation mark]Yes, certainly,[quotation mark] agrees the slice of brain, [quotation mark]You have the wheel.[quotation mark]", 
"[quotation mark]Okay[quotation mark], says the scientist. [quotation mark]I need to concentrate on how we're going to produce an effective cure.[quotation mark][line break][quotation mark]Right [unicode 8212] enough chit-chat, fellows, let her focus,[quotation mark] suggests the slice of brain.[line break][quotation mark]Right, okay,[quotation mark] say the mouse and dog."
}

Section Cured Dialogue

CuredDialogue is a list of text that varies. 
	
CuredDialogue is { 
"[quotation mark]It's done,[quotation mark] says the scientist. [quotation mark]Time for roll call: Lucky?[quotation mark][line break][quotation mark]Here.[quotation mark][line break][quotation mark]The Duke of Mousedom?[quotation mark][line break][quotation mark]Present.[quotation mark][line break][quotation mark]The slice of Julien's brain?[quotation mark][line break][quotation mark]Here.[quotation mark][line break][quotation mark]Good,[quotation mark] says Isabelle, [quotation mark]it sounds like we all made it safe and sound.[quotation mark]",
"[quotation mark]So, now we get out of here?[quotation mark] suggests the dog.[line break][quotation mark]Yes,[quotation mark] says Isabelle.[line break][quotation mark]But the exterior airlock door is still electronically locked. No one can open it aside from Colonel Greillier in the control room,[quotation mark] says the slice of brain.[line break][quotation mark]Yes, we will need to convince him to open it,[quotation mark] agrees the scientist.",
"[quotation mark]That sort of surprises me, that you remember Colonel Greillier. I thought that you couldn't remember names.[quotation mark][line break][quotation mark]Of the Colonel?[quotation mark] asks the slice of brain. [quotation mark]How could I forget your boss? Just last week he tumbled into our pool at his birthday party. I suppose we were all a little soused that evening.[quotation mark][line break][quotation mark]Soused?[quotation mark] asks the mouse. [quotation mark]Oh, I can see it in your thoughts. Soused, huh? Looks like fun.[quotation mark][line break][quotation mark]Hang on a minute, mouse.[quotation mark] says Isabelle, [quotation mark]Julien, you just expressed a complicated thought. Do you think your memory is returning?[quotation mark][line break][quotation mark]Hmph. How could I know?[quotation mark]",
"[quotation mark]Julien,[quotation mark] says the scientist, [quotation mark]What did you give me as a gift our first Christmas?[quotation mark][line break][quotation mark]Gloves?[quotation mark][line break][quotation mark]And they were… [quotation mark][line break][quotation mark]Far too large for you! Yes, I had bought them for my brother, but when you gave me a present and I didn't have anything for you… yes, um, are you still upset about that?[quotation mark][line break][quotation mark]No, not really. I was just testing your memory.[quotation mark]",
"[quotation mark]Give me another test![quotation mark][line break][quotation mark]Okay. What do you call me when we're all alone?[quotation mark][line break][quotation mark]Isabelle?[quotation mark][line break][quotation mark]No, think! When it's just the two of us… [quotation mark][line break][quotation mark]I'd rather not say in front of Lucky and the mouse.[quotation mark][line break][quotation mark]Oh, come on,[quotation mark] says the dog. [quotation mark]We're all sharing one mind now; there aren't any real secrets here.[quotation mark][line break][quotation mark]Very well,[quotation mark] says Julien, still a bit hesitant, [quotation mark]I call you my bunny rabbit.[quotation mark][line break][quotation mark]Bunny?[quotation mark] says the mouse. [quotation mark]She used to be a rabbit? Now I am totally confused.[quotation mark]",
"[quotation mark]Good, Julien, it seems to me that you're on the road to recovering your memory,[quotation mark] says the scientist.[line break][quotation mark]You think so? Even though you said that I'm just a little slice of brain? Is it possible that these memories aren't really mine, but I'm just reading them from your thoughts?[quotation mark][line break][quotation mark]I would have to say that a little slice of brain wouldn't be capable of proposing such an elaborate hypothesis. It seems to me your whole brain is now back at work.[quotation mark]",
"[quotation mark]But, if I understood you correctly,[quotation mark] says Lucky, [quotation mark]you said that the virus completely wipes zombie brains, leaving nothing.[quotation mark][line break][quotation mark]Yes, that is what I said,[quotation mark] admits the scientist, [quotation mark]but we've never had a case like this one to study. I'd say it's time to revise our understanding about what's going on. It seems that the brain isn't destroyed, but rather that higher thought processes are suppressed. The neural pathways are still intact. In fact, that has to be the case: our very existence is a matter of piggy-backing on those pathways.[quotation mark]",
"[quotation mark]That's great![quotation mark] says Julien. [quotation mark]Then, we can restore all the zombies![quotation mark][line break][quotation mark]My God, Julien, you're right. We haven't lost them,[quotation mark] replies the scientist. [quotation mark]For the first time, there's a chance that we could put the world back on its feet and end this nightmare.[quotation mark][line break][quotation mark]Even the sick dogs?[quotation mark] asks Lucky.[line break][quotation mark]Yes, including dogs and every other species infected by the virus,[quotation mark] replies the scientist.",
"[quotation mark]So, now what?[quotation mark] asks the mouse.[line break][quotation mark]Julien,[quotation mark] says Isabelle, [quotation mark]we have to talk with the Colonel and convince him that you're cured and that we now have a way to reverse the damage caused by the virus.[quotation mark][line break][quotation mark]Okay, I'll do my best,[quotation mark] says Julien.[line break][quotation mark]Onward, comrades![quotation mark] cries the mouse."
}.

Chapter 16 - The Void

The void is a room.

The small gray creature is an edible thing. It is in the void. 

The bloody corpse of Doctor Rambaud is a thing in the void. The indefinite article of bloody corpse of Doctor Rambaud is "the".

The intercom is a buttoned thing in the void. The intercom can be live. The intercom is not live. 

Instead of pushing the intercom:[only present at consciousness 4]
	if the intercom is not live:
		say "A little red LED lights up on the intercom indicating that the connection to the control room is live.";
		now the intercom is live;
	otherwise:
		say "You have already activated the intercom; the red LED is still on."

The panneau électrique is an openable closed container in the void. The printed name of the panneau électrique is "electrical panel".

The disjoncteurs are in the panneau électrique. The disjoncteurs are plural-named. The disjoncteurs are broken. The printed name of the disjoncteurs is "[if the disjoncteurs are broken]flipped[otherwise]reset[end if] circuit breakers".

The microfluidic synthesis unit is an openable closed container in the void. The printed name of the microfluidic synthesis unit is "microfluidic synthesis unit". microfluidic synthesis unit is broken.

After opening the microfluidic synthesis unit:
	say "You open the service panel and immediately recognize the problem: a fleck of solder has fallen across the terminals of a servo motor, shorting it out."

Chapter 17 - End Game

To terminate the game:
	remove all elements called "vorple-link";
	say "[VictoryText]";
	infos;
	credits;
	[to prevent players bypassing CSS from continuing past this point]
	now the knownCommands of the player is 0.
	
To say VictoryText:
	say "[paragraph break]        *** YOU HAVE WON ***[roman type][paragraph break]You have saved the world from the scourge of the zombie777 virus.[paragraph break]".
	
To infos:
	say "[bold type]>about[roman type][line break]This game was originally created as part of the 2018 French Interactive Fiction Competition. The English translation of the game was submitted to the 2018 IFcomp. The game was written in Inform 7. The source code is available on ";
	place a link to web site "https://github.com/dhakajack/web-engarde" reading "github";
	say " and is provided under the MIT license. Please report any errors by email to  engarde@templaro.com.[paragraph break]";
	
To credits:
	say "[bold type]>credits[roman type]";
	open HTML tag "ul";
	open HTML tag "li";
	say "Organizers of both competitions.";
	close HTML tag;
	open HTML tag "li";
	say "Graham Nelson for having conceived and written Inform.";
	close HTML tag;
	open HTML tag "li";
	say "Authors of the extensions used in this work and its previous versions : Éric Forgeot, Emily Short, Erik Temple and Juhana Leinonen.";
	close HTML tag;
	open HTML tag "li";
	say "Ben Collins-Sussman, who painted the cover.";
	close HTML tag;
	open HTML tag "li";
	say "Proofers and beta-testers: Éric Forgeot, Stéphane Flauder, Brian Rushton, Hugo Labrande, Denise Jobin (original version). Lara Welch, Ben Collins-Sussman, Andrew Schultz, Valentin Koptel[apostrophe]tsev, and David White (English version).";
	close HTML tag;
	open HTML tag "li";
	say "Corax for suggestions regarding accessibility.";
	close HTML tag;
	close HTML tag;
	say "[bold type]FIN."
	
Chapter 18 - Testing

Test me with "east / west / eat /east / open / north / open / eat / push / south / push /east / push / west / south / open / eat / eat / eat / north / open / north / open / open / eat / south / west / unlock / open / west / unlock / open / north / north / unlock / open / north / talk / talk / talk / talk / talk / eat / south / south / south /east / push /east / push / west / unlock / open / south / open / repair / north / push /east / push / west / west / north / open / repair / south /east / push /east / push / west / south / north / push /east / push / west / west / north / north / north / push / talk / talk / talk /  talk ".

Test full with "east /east / west / west / eat /east / west / open /east / open / north / south / west / south /east / north / z / z / z / z / z / z / z / z / z / z / z / eat / open / eat / push / eat / north / south / west / west /east /east / push /east / push / west / west / south / open / push / eat / eat / eat / eat / north / west / north / north / open / north / eat / push / open / open / eat / south / south / open / push / north / west / unlock / west / open / west / north / unlock / north / open / north / north / north / north / unlock / north / open / north / eat / eat / eat / eat / eat / eat / push / unlock / north / talk / talk / talk / talk / talk / talk / eat / talk / push / talk / push / push / talk / north / south / south / south / open / repair / open / repair / push / south /east / south / push / open / eat / north / north / repair / south / push /east / push / west / west /east / north / push / eat / repair / south / south / unlock / open / south / repair / open / repair / north / push /east / push / west / west / north / open / repair / south /east /east / push /east / push / west / south / repair / north / push /east / push / west / south / north / west / north / north / north / eat /talk / push / talk / talk / south / north / talk / talk ".