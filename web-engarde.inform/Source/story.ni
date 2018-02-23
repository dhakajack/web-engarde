"En Garde" by Jack Welch

The story headline is "A voyager forever mindless".
The story genre is "horror".
The release number is 1.
The story creation year is 2018.
The story description is "The one thing you don't miss is memory."

Include Vorple Element Manipulation by Juhana Leinonen.
Include Vorple Hyperlinks by Juhana Leinonen.
Include Vorple Command Prompt Control by Juhana Leinonen.

Use full-length room descriptions.
Use no scoring.

Release along with the "Vorple" interpreter.
Release along with style sheet "web-engarde.css".

Release along with cover art, a file of "Blurb" called "blurb.txt" and a file of "Walkthrough" called "walkthrough.txt".

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

Chapter 5 -Langauge-specific tweaks

[not needed for English]

Chapter 6 - Suppress Mention of Doors

For printing a locale paragraph about a door (called the item)
	(this is the don't mention doors in room descriptions rule):
	set the locale priority of the item to 0;
	continue the activity.

Chapter 7 - Button Setup

Palette is a list of text that varies. 
Palette is {"black","brown","red","orange","yellow","green","blue","violet","gray","white"}.
	
Chapter 8 - Start of Play

When play begins:
	execute JavaScript command "function forceScroll() {if((navigator.userAgent.indexOf('Opera') || navigator.userAgent.indexOf('OPR') || navigator.userAgent.indexOf('Chrome')) != -1 ) {return false;} else {return true;}} forceScroll()";
	if the JavaScript command returned false:
		now forceScroll is false;
	if debugMode is false:
		hide the prompt;
	place a block level element called "arrows";
	sort the palette in random order.

After printing the banner text:
	listExits;
	listHiddenExits;
	say "[line break][italic type]Where am I? For that matter, who am I?[roman type][paragraph break]You wake up alone in a plain room with a bluish hue.[paragraph break][italic type]Why can't I remember anything?[paragraph break]I've got to concentrate! What happened? Come on. Think! Think![paragraph break]In any case, the solution isn't here -- I'll have to look around.";
	say roman type;
	increment the knownCommands of the player.

Chapter 9 - Geography

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
				say "call the elevator."
			
To say bougePas:
	say "The wall does not budge".
			
Section Bloc Opératoire

Bloc Opératoire is a room. The description of Bloc Opératoire is "[descBlocOperatoire]." Couloir 2 is east from Bloc Opératoire. The player is in Bloc Opératoire. The printed name of the Bloc Opératoire is "[pnBlocOpératoire]".

To say descBlocOperatoire:
	if the consciousness of the player is:
		-- 0:
			say "A dark room[one of]. Nothing interesting here[or][stopping]";
		-- 1:
			say "There's a bit of blood here -- a huge, blue room with metallic walls";
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
		say ". The opening to the east has disappeared".
			
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

	
The cage is an openable closed container in the Laboratoire Zoologique.

The chien is an edible thing. It is in the cage. The printed name of the chien is "[if the consciousness of the player is 1]wolf[otherwise]dog[end if]". The chien can be dead. The chien is not dead. 

The animal body is a thing. It is in the void.

The food dispenser is in the Laboratoire Zoologique. It is buttoned. 

Instead of pushing the food dispenser:
	say "You press the red button. ";
	if the consciousness of the player is:
		-- 2:
			say "In reward, a few nuggets fall to the ground. You eat them, but they do not satisfy your hunger.";
		-- 3:
			say "You don't find the reward nuggets that fall at your feet the least bit appetizing.";
			move the tas de nourriture de chien to the Laboratoire Zoologique;
		-- 4:
			say "The operant conditioning device dispenses a few dog food pellets that pile up on the ground.";
			move the tas de nourriture de chien to the Laboratoire Zoologique.
			
The tas de nourriture de chien is in the void.

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
				say ", the elevator [if the location is Ascenseur 2]descends to the first level[otherwise]goes up to the second level[end if] and the doors open to the west."; 
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
		say "the doors close";
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
			say "he central corridor on level one leads south to the restroom, west to the decontamination suite, north to the histopathology laboratory, and east to the elevator".
		
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
	say "A button green shines on a panel".
	
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
			say "[one of]This room reminds you of better times that you spent with your family -- from before you were abducted. Considering the counters, shelves full of food, sinks, and large appliances, there's no doubt in your mind that this is the most important room in the entire house: the kitchen[or]A typical kitchen, with black decor[stopping]";
		-- 3:
			say "This is where the researchers prepare microscope slides.[paragraph break]You recognize a meat slicer and a microwave oven, but most of the equipment on the counter doesn't look familiar";
		-- 4:
			say "An ultramodern laboratory dedicated to preparation and analysis of tissue samples".
	
The frigo is a closed openable container in the Laboratoire de Pathologie. The frigo is closed. The printed name of the frigo is "[pnFrigo]". 

To say pnFrigo:
	if the consciousness of the player is:
		-- 2:
			say "fridge[if the frigo is closed] (closed)[end if]";
		-- 3:
			say "freezer";
		-- 4:
			say "minus 80 freezer for storing pathology specimens".
			
After opening the frigo:
	move the tupperware container to the location;
	say "You open the fridge and a plastic box falls to the floor."
	
The tupperware container is a closed openable container in the frigo. 

The slice of brain is a  edible thing in the tupperware container.

After opening the labPathDoor:
	say "[openNord]."
	
After going north from Couloir 1 when the labPathDoor is open for the first time:
	now the BlockChatterFlag is true;
	say "[italic type][quotation mark]Mmmmm![quotation mark] says Lucky, obviously excited.[line break][quotation mark]What are you so happy about?[quotation mark][line break][quotation mark]You see that box, there? That's the real magic box: the fridge![quotation mark][line break][quotation mark]Do we get in the fridge to go places?[quotation mark][line break][quotation mark]No, we eat what's inside it![quotation mark][roman type][paragraph break]";
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
		say "The toilets".
		
Instead of simplePushing when the player is in les Toilettes:
	if the consciousness of the player is less than 3:
		say "You press a metal button and immediately hear a loud sound.";
	otherwise:
		say "You pull the flush lever."
		
Instead of simpleOpening when the player is in Les Toilettes:
	if the consciousness of the player is less than 3:
		say "[if the potty is in Les Toilettes]The water bowl is already open[otherwise]Having lifted the cover, you reveal a bowl full of water[end if].";
	otherwise:
		say "[if the potty is in Les Toilettes]You have already lifted[otherwise]You lift[end if] the toilet seat cover.";
	now the potty is in Les Toilettes.
	
The potty is a thing in the void. The printed name of the potty is "[pnPotty]". The indefinite article of the potty is "[if the consciousness of the player is less than 3]un[otherwise]des[end if]".

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
				say "Do you have any idea how many species are pathogenic bacteria live in the water? No way."
				
After going south from Couloir 1 when the consciousness of the player is 3 for the first time:
		now the BlockChatterFlag is true;
		say "Quand vous entrez dans les toilettes, un mouvement attire votre attention.[paragraph break][italic type]Y a-t-il quelqu'un d'autre ici[unicode 160]?[roman type][paragraph break]Un costaud vêtu d'un uniforme en lambeaux vous dévisage sans sourciller. Son teint blafard, ses yeux cernés et ses joues creuses rappellent un cadavre.[paragraph break]Cette rencontre maladroite continue pendant plusieurs minutes, jusqu'au moment où vous vous rendez compte que vous regardez votre propre reflet dans un miroir.";
		try looking.
	
After going south from Couloir 1 when the consciousness of the player is 4 for the first time:
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
			say "The showers";
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
			say "The personnel decontamination system blasts you with a phenolic-smelling spray.".

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
		say "You would need to get past the scientist and she doesn't appear to be all that cooperative. More over, since you don't know the code to open the outer door, it wouldn't make much sense to try.";
	otherwise:
		say "Useless. The door is hermitically sealed and can only be opened by someone in the control room."
			
Before eating scientist when the conversations of scientist are less than 5:
	now the BlockChatterFlag is true;
	say "[one of]The scientist beats you back with her crowbar. Once out of reach of your slavering maw, she presses a button on the intercom and says, [quotation mark]Attention, control room, this is Doctor Rambaud in the airlock. Julien is here with me. Unfortunately, I have to report that the experiment has failed. Don't unlock the outer door no matter what.[quotation mark][paragraph break][or]Doctor Rambaud does not budge from behind the desk, but as you approach she lands a series of blows with her crowbar that makes you reconsider your actions.[or]The scientist acknowledges, [quotation mark]I have to give you credit for your perseverance, but… [quotation mark] and she whacks you solidly on the nose. Stunned, you stagger back out of reach of her crowbar.[or]Doctor Rambaud beats you repeatedly with the crowbar.[stopping]";
	stop the action.
	

Chapter 10 - Verbs

Section 1 - simpleUnlocking

simpleUnlocking is an action applying to nothing. Understand "unlock" as simpleUnlocking.

Carry out simpleUnlocking:
	repeat with way running through directions:
		if the door the way of the location is locked:
			now the door the way from the location is unlocked;
			say "You enter the code on the numeric keypad and hear the door to the [way] unlock.[no line break][one of][firstUnlocked][or][stopping][paragraph break]";
			stop the action;
	say "You don't see any locked door."
	
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
	repeat with the item running through visible containers:
		if the item is closed:
			try opening the item;
			stop the action;
	say "There's nothing obvious to open here." 
	
[this works here because things only contain a single item
After opening something (called the item):
	say "Vous ouvrez [the item]";
	if the item contains exactly one thing:
		say ", révélant [a random thing in item]";
	say "."
]

Section 3 - simpleEating

simpleEating is an action applying to nothing. Understand "eat" as simpleEating.

Carry out simpleEating:
	repeat with the item running through visible edible things:
		try eating the item;
		stop the action;
	say "You don't see anything to eat";
	if the tas de nourriture de chien is in the location:
		say " (at least, nothing that looks appetizing)";
	say "."
	
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
		say "No one is around. Who are you talking to[one of]?[paragraph break]Do you want everyone to think you're nuts[or][stopping]?";
		stop the action;
	otherwise:
		if the bloody corpse of Docteur Rambaud is in the sas:
			if the interphone is not live:
				say "To talk to the control room, you must first activate the intercom.";
				stop the action.
				
Carry out simpleTalking:
	if the bloody corpse of Docteur Rambaud is in the sas:
		now the BlockChatterFlag is true;
		if the curedFlag of the player is not true:
			say "[one of]You explain your plan. The director of the installation grabs the microphone and wishes you good luck. Beyond that, he instructs you report back when you have succeeded. Short of that, though, he requests that you not use the intercom[or]The control room refuses to talk to you until you have a proven cure in hand[stopping]. They hang up on you and the intercom goes dark.";
			now the interphone is not live;
		otherwise:
			increase the conversations of the player by 1;
			if the conversations of the player is:
				-- 1:
					say "[quotation mark]Control room, Professor Drummond speaking.[quotation mark][line break][quotation mark]It's me, your dog, Lucky! I'm in the airlock! I am so happy to hear your voice![quotation mark][line break][quotation mark]Um. Huh? Are you messing with me? The intercom is only for official communications. Who is this?[quotation mark][paragraph break][italic type][quotation mark]It's him! It's the father of my family,[quotation mark] says Lucky.[line break][quotation mark]Calm down, Lucky,[quotation mark] insists the scientist. [quotation mark]Please let Julien do the talking.[quotation mark][roman type][paragraph break][quotation mark]Excuse me,[quotation mark] says Julien. [quotation mark]I can explain everything. I am Julien Truffaut.[quotation mark][line break][quotation mark]The guard?[line break][quotation mark]Yes.[quotation mark][line break][quotation mark]Impossible. Doctor Rambaud said that he had turned. Zombies can't talk. I don't have time for your crap, now get off the line.[quotation mark][paragraph break]";
				-- 2:
					say "[quotation mark]I'm not joking,[quotation mark] pleads Julien. [quotation mark]Doctor Rambaud has cured me.[quotation mark][line break][quotation mark]Okay, enough,[quotation mark] answers the professor. [quotation mark]If she's there, put her on.[quotation mark][line break][quotation mark]She is… occupied… at the moment.[quotation mark] While you are speaking, you drag the scientist's lifeless body around the corner to the stairwell.[paragraph break][quotation mark]Listen,[quotation mark] you continue, [quotation mark]if you don't believe me, turn on the surveillance cameras in the airlock. You'll be able to see me.[quotation mark][line break][quotation mark]Okay, give me a sec.[quotation mark][paragraph break]";
				-- 3:
					say "[quotation mark]Do you see me?[quotation mark] you ask.[line break][quotation mark]Yes. Got you on the screen. But how can you still be alive? I thought you'd been infected by the virus.[quotation mark][line break][quotation mark]Well, yes, you're right, but as I told you…[quotation mark][paragraph break][italic type][quotation mark]Let me explain,[quotation mark] interrupts the scientist.[roman type][paragraph break][quotation mark]Doctor Rambaud prepared a cure using the microfluidic biosynthesis workstation following protocol M13 as she discussed with you previously. My neural pathways were restored and I am entirely cured.[quotation mark][line break][quotation mark]Okay… But that would mean… this could be it. An end the pandemic![quotation mark][line break][quotation mark]Right. We need to move on this quickly.[quotation mark][paragraph break]";
				-- 4: 
					say "You request to speak to the director of the entire research complex, Colonel Greillier, and you relate everything that has happened, leaving out, for now, some of the details suggested by Lucky and the mouse.[paragraph break]After a couple hours of discussion and some blood tests, the colonel is convinced and orders that the airlock doors be unsealed, permitting you to exit. ";
					terminate the game;
	otherwise:
		now the BlockChatterFlag is true;
		increase the conversations of scientist by 1;
		if the conversations of scientist is:
			-- 1:
				say "You start babbling incoherently, the words refusing to come. As the sounds trip off your tongue, the scientist stares at you incredulously.[paragraph break][quotation mark]Is it possible,[quotation mark] she asks. [quotation mark]Are you still capable of speaking somehow?[quotation mark][line break][quotation mark]Yes,[quotation mark] you groan painfully, [quotation mark]I… speak.[quotation mark][line break][quotation mark]Incredible! It's a miracle, Julien. What do you remember?[quotation mark][paragraph break][italic type][quotation mark]Julien? Who's Julien?[quotation mark] asks Lucky.[line break][quotation mark]Not me,[quotation mark] says the mouse. [quotation mark]Maybe the name belongs to our buddy, the slice of brain?[quotation mark][line break][quotation mark]I don't recall, but sure, I guess I could be this Julien. I mean, why not?[quotation mark][roman type][paragraph break][quotation mark]Nothing. I don't remember a thing… Julien… that's me?[quotation mark][line break][quotation mark]Yes, Julien. It's you. And I'm your Isabelle. Isabelle Rambaud,[quotation mark] replies the scientist in a disappointed tone.[paragraph break]";
			-- 2:
				say "[italic type][quotation mark]She has pretty eyes (for a giant),[quotation mark] remarks the mouse.[line break][quotation mark]Shut up,[quotation mark] say the slice of brain and Lucky in unison.[roman type][paragraph break]You force yourself to form the words, one after another.[paragraph break][quotation mark]What are we doing here?[quotation mark][line break][quotation mark]Listen, Julien, I don't have much time. I am a medical researcher and you are a guard. We both work at an installation dedicated to finding a cure for the zombie777 virus, which has desolated the entire world.[quotation mark][line break][quotation mark]A guard?[quotation mark][line break][quotation mark]Yes. Pay attention, Julien, this is important. A crowd of pandemic victims surrounded the lab complex and you were protecting me when you were scratched by one of them. I had to give you the experimental treatment to prevent you from turning into a zombie.[quotation mark][line break][quotation mark]So, I'm cured?[quotation mark][line break][quotation mark]No, not even close.[quotation mark][paragraph break]";
			-- 3:
				say "[quotation mark]So, the treatment didn't work?[quotation mark] you ask.[line break][quotation mark]No, not entirely it would seem. I had a problem with the microfluidic biosynthesis unit that produced the dose I gave you. I think that one of the ingredients must have been left out of that batch. I was trying to repair the unit when you caught me off guard. You attacked me, but I managed to hole up here in the airlock. So. That's where things stand.[quotation mark][line break][quotation mark]Sorry.[quotation mark][line break][quotation mark]It wasn't you. You were a full-blown zombie at the time. But… how is it that now you're able to talk? I've never heard of a zombie that could talk -- it just doesn't happen.[quotation mark][paragraph break]";
			-- 4:
				say "[quotation mark]It's really hard for us to talk.[quotation mark][line break][quotation mark]Naturally, your neural pathways are in a state of… hold on… what do you mean, [apostrophe]us[apostrophe]?[quotation mark][paragraph break][italic type][quotation mark]Tell her about me,[quotation mark] implores the mouse, full of excitement.[line break][quotation mark]And about me![quotation mark] adds Lucky.[roman type][paragraph break][quotation mark]Yeah. About that. I said [apostrophe]us[apostrophe] because there are three minds in my head: a mouse, a dog named Lucky, and a slice of brain. We work together as best we can to get around and talk.[quotation mark][line break][quotation mark]Well.[quotation mark] She stares a moment at the ceiling to gather her thoughts. [quotation mark]Well, I suppose that explains everything. You brain was rebooted, more or less erased by the virus, but somehow you have managed to sort of reload it with normal brains. That slice of brain that you mentioned must have been the biopsy that I took from Julien before the virus had invaded that part of his brain.[quotation mark][paragraph break]";
			-- 5:
				say "[quotation mark]So, we're well and truly screwed?[quotation mark] you say.[paragraph break][italic type][quotation mark]Totally,[quotation mark] whines the mouse.[line break][quotation mark]Yeah, I'd say so,[quotation mark] agrees Lucky.[roman type][paragraph break][quotation mark]Maybe not… [quotation mark][line break][quotation mark]You have an idea?[quotation mark][line break][quotation mark]Yes, I think so. Do exactly what I say: I don't have long for this world. I can't even feel my legs; it's only a matter of time. However… if you eat my brain -- hang on, not yet! Let me finish talking -- thanks. As I was saying, if you eat my brain, my personality will meld with all of yours. You are still actively infected with the virus and in time it will destroy what's left of your brain, but the infection seems to have been slowed by the first treatment, even if it wasn't completely effective. If there's enough time, I can repair the synthesis unit and we can try one more time to produce a cure for the virus. If we succeed, I can live on in you, along with your thoughts.[quotation mark][line break][quotation mark]So, I should eat your brain now?[quotation mark][line break][quotation mark]Go for it.[quotation mark][paragraph break]";
			-- otherwise:
				say "There's nothing more to say."
									
Section 6 - simpleRepairing

simpleRepairing is an action applying to nothing. Understand "repair" as simpleRepairing.

Carry out simpleRepairing:
	repeat with the item running through visible broken things:
		try touching the item;
		stop the action;
	say "You don't see anything in need of repair."
	
Instead of touching something (called the item):
	now the item is not broken;
	say "You repair [the item]."
	[override touch with specific repair actions.]
	
Chapter 11 - Consciousness

To increment the consciousness of the player:
	increase the consciousness of the player by 1;
	try looking.


Chapter 12 - Known Commands

The list of text called actionList is always {"east", "west","eat","open","north","south","push","unlock","talk","repair"}.

The commandList is a list of numbers that varies. The commandList is {}.

To increment the knownCommands of the player:
	increase the knownCommands of the player by 1;
	add the knownCommands of the player to commandList;
	place an inline element called "hidden" reading "A new command has appeared: ";
	place a link to the command "[entry knownCommands of the player of actionList]" called "box[knownCommands of the player] [entry knownCommands of the player of palette]" reading "[entry knownCommands of the player of palette]";
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
				
Chapter 13 - Milestones

After going east for the first time:
	try looking;
	say "Une petite créature arrive de nulle part, se faufile entre vos pieds, et s'enfuit vers l'ouest.";
	increment the knownCommands of the player.
	
After going west from Couloir 2 for the first time:
	move the petite créature grise to the Bloc Opératoire;
	try looking;
	say "Elle se cache dans l'obscurité, tremblante.";
	increment the knownCommands of the player.
	
After eating the petite créature grise:
	say "[line break]De votre main, vous balayez aveuglément les recoins à la base du mur. Malgré votre manque de vitesse et de dextérité, par miracle vous réussissez à coincer le petit rongeur contre le mur. Vous vous empressez de le saisir fermement et sentez quelque chose de chaud, poilu, et maintenant, mouillé dans la paume de votre main. Sans y penser plus, vous le mangez précipitamment.[paragraph break]Après un petit moment, de nouvelles pensées vous frappent. Pris au dépourvu, vous frissonnez.[paragraph break][italic type]Au secours[unicode 160]! Un énorme monstre me poursuit[unicode 160]! Il va me manger[unicode 160]! Il faut me dissimuler.[paragraph break]Je… euh.  Suis-je mort ou quoi[unicode 160]? [unicode 160]Je ne comprends pas[roman type].";
	increment the consciousness of the player.
	
After going east when the consciousness of the player is 1 for the first time:
	try looking;
	now the BlockChatterFlag is true;
	say "[italic type]Ah, le grand couloir blanc.[paragraph break]Combien de fois est-ce que j'ai vu les géants marcher à travers les murs lisses pour entrer dans les pièces secrètes[unicode 160]? Comment le font-ils[unicode 160]?[no line break][roman type][line break]";
	increment the knownCommands of the player.
	
After opening the labZooDoor:
	say "[openNord].";
	increment the knownCommands of the player.
	
After going north from Couloir 2 for the first time:
	say "Vous pénétrez dans la tanière du loup, un endroit bien connu mais toujours effrayant.";
	try looking;
	say "Comme d'habitude le loup est emprisonné dans sa cage et vous êtes libre d'explorer, hors de portée de ses mâchoires baveuses.";
	increment the knownCommands of the Player.
	
After opening the cage:
	say "Vous ouvrez la cage mais le loup reste prudemment à l'intérieur."
	
After eating the chien:
	now the chien is dead;
	now the animal body is in the cage;
	say "[line break]D'instinct, vous dévorez son cerveau et jetez le corps dans la cage. Encore une fois, de nouvelles pensées envahissent votre esprit.[paragraph break][italic type]Je vous préviens[unicode 160]:[unicode 160]si vous approchez de ma cage, je vous mordrai. Arrêtez[unicode 160]! Sans blague… [paragraph break]Mais, qu'est-ce qui se passe[unicode 160]? Qui est ce chien mort dans ma cage… dont le sang coule sur mon coussin préféré[unicode 160]?[paragraph break]Et pourquoi est-ce que je me tiens debout sur deux jambes à la façon des êtres humains[unicode 160]? C'est en fait plus facile que j'aurais pensé.";
	increment the consciousness of the player;
	now the BlockChatterFlag is true;
	say "[italic type]«[unicode 160]Désolé.[line break]-- Quoi, désolé[unicode 160]?[line break]-- Moi, je suis désolé de t'avoir mangé.[line break]-- De m'avoir mangé[unicode 160]? Dis donc, qui es-tu[unicode 160]?[line break]-- La souris.[no line break][unicode 160]»[roman type][line break]";
	increment the knownCommands of the player.
	
After eating the slice of brain:
	say "[line break]En mâchant la tranche de cerveau, vous sentez un saveur désagréable, mais ça s'estompe presque immédiatement.[paragraph break]Pendant quelques moments rien ne se passe et vous vous demandez si vous pouvez maintenant manger n'importe quoi en toute impunité.[paragraph break]Soudain, le monde passe de plutôt monochrome à la couleur vive. Une vague électrique parcourt votre esprit et vous vous effondrez, désorienté. Lorsque vous vous mettez debout, des nouvelles idées se mêlent à vos pensées et vous voyez tout sous un nouveau jour.";
	now the potty is plural-named;
	now indefinite article of the potty is "des";
	increment the consciousness of the player;
	now the BlockChatterFlag is true;
	say "[italic type]«[unicode 160] Il faut patrouiller[unicode 160]! ordonne une nouvelle voix.[line break]-- Patrouiller[unicode 160]? Qu'est que ça veut dire[unicode 160]? demande la souris.[line break]-- Cela signifie marcher partout, pour sécuriser l'installation, répond la voix.[line break]-- J'aime bien faire des promenades[unicode 160]! dit Lucky tout excité.[no line break][unicode 160]»[roman type][line break]";
	increment the knownCommands of the player.
	
After going north from Escalier 2 when the sasDoor is not closed for the first time:
	now the BlockChatterFlag is true;
	say "Une femme d'une quarantaine d'années vêtue d'une blouse blanche est assise derrière un bureau en métal. Elle est à mi-chemin entre vous et la porte à l'autre bout de la pièce. Elle semble gravement blessée et saigne d'une blessure au bras qu'elle a bandé de gaze stérile. Dans son autre main, elle brandit un pied-de-biche.";
	try looking;
	say "Elle vous regarde avec mépris.";
	increment the knownCommands of the player.
	
After eating scientist:
	now the BlockChatterFlag is true;
	say "[line break]Vous dévorez le cerveau de la scientist. Immédiatement vous voyez le monde d'un point de vue plus raffiné et érudit.[paragraph break]«[unicode 160][italic type]C'est fait[unicode 160]? demande la voix d'Isabelle avec hésitation.[line break]-- Oui, tu étais délicieuse, enthousiasme la souris.[line break]-- Le meilleur jusqu'ici, ajoute Lucky.[line break]-- Excuse mes co-esprits, ils manquent cruellement de tact, intervient la tranche de cerveau.[line break]-- Hé[unicode 160]! gémissent la souris et le chien.[line break]-- Sois la bienvenue, Isabelle, continue la tranche de cerveau. Laisse-moi te présenter notre petite troupe[unicode 160]:[unicode 160]voilà Lucky, le chien, et ici figure Le Marquis Des Souris (ou juste simplement [quotation mark]Souris[quotation mark] parce qu'il est plutôt modeste), et moi, je suis le nommé [quotation mark]tranche de cerveau[quotation mark]. On est à ta disposition.[line break]-- Bonjour, les gars, dit Isabelle avec chaleur. [unicode 160]»[line break]";
	move the bloody corpse of Docteur Rambaud to the sas;
	move the interphone to the sas;
	move the panneau électrique to escalier 1;
	move the unité de synthèse microfluidique to the Laboratoire Biochimique;
	increment the knownCommands of the player;
	increment the consciousness of the player.
		
Chapter 14 - Dialogue

Every turn:
	if the curedFlag of the player is not true:
		if the disjoncteurs are not broken and the servomoteur is not broken and the player is in the Laboratoire Biochimique:
			now the BlockChatterFlag is true;
			say "L'appareil robotique émet un bip et remplit un flacon d'un fluide vert fluo. Vous le prenez anxieusement, portez un toast à votre propre santé, et buvez le remède à grandes gorgées.[paragraph break]«[unicode 160][italic type]Je ne ressens rien, s'inquiète la tranche de cerveau.[line break]-- Attendez, rassure Isabelle.[line break]-- Moi non plus, opine la souris.[line break]-- Attendez, insiste la scientist.[line break]-- Houlà[unicode 160]! s'exclame Lucky. Quelque chose commence à…[line break]-- C'est parti[unicode 160]! hurle la scientist. [roman type][unicode 160]»[paragraph break]Vous tremblez violentement et vous évanouissez. Lorsque vous vous levez, vous observez que votre peau a repris son teint naturel et que vous pouvez vous déplacer sans trébucher. Bref, vous êtes guéri.[paragraph break]";
			now the curedFlag of the player is true;
	if the BlockChatterFlag is false:
		if the consciousness of the player is:
			-- 1:
				if the number of entries in mouseDialogue is greater than zero:
					say "[italic type][entry 1 of mouseDialogue][roman type][paragraph break]";
					remove entry 1 from mouseDialogue;
			-- 2:
				if the number of entries in mouseDogDialogue is greater than zero:
					say "[italic type]«[unicode 160][entry 1 of mouseDogDialogue][unicode 160]»[roman type][paragraph break]";
					remove entry 1 from mouseDogDialogue;
			-- 3:
				if the number of entries in mouseDogGuardDialogue is greater than zero:
					say "[italic type]«[unicode 160][entry 1 of mouseDogGuardDialogue][unicode 160]»[roman type][paragraph break]";
					remove entry 1 from mouseDogGuardDialogue;
			-- 4:
				if the curedFlag of the player is true:
					if the number of entries in CuredDialogue is greater than zero:
						say "[italic type]«[unicode 160][entry 1 of CuredDialogue][unicode 160]»[roman type][paragraph break]";
						remove entry 1 from CuredDialogue;
				otherwise:
					if the number of entries in EverybodyDialogue is greater than zero:
						say "[italic type]«[unicode 160][entry 1 of EverybodyDialogue][unicode 160]»[roman type][paragraph break]";
						remove entry 1 from EverybodyDialogue;
	now the BlockChatterFlag is false;
	listExits;
	if the knownCommands of the player is greater than 0:
		listHiddenExits.
	

[This is a little kludgey, but necessary because the javascript library at present behaves differently 
across browers. For Chrome and Opera, it is not necessary. However, for Safari and Firefox (and 
perhaps others), when a hyperlink is clicked, the window scrolls upwards. This rule forces the window to scroll back to the bottom. After that, the player can still manually scroll backwards to see previous bits of the story.]

This is the scroll update rule:
	if forceScroll is true:
		scroll to the bottom of the page.
	
The scroll update rule is listed last in the every turn rules.
	
Section Mouse Dialogue

mouseDialogue is a list of text that varies. 
	
mouseDialogue is {
"Quoi qu'il en soit, il me semble que j'ai beaucoup grandi, hein.",
"Je désire quelque chose fortement, mais j'ai du mal à dire quoi.",
"Voyons, quel sont mes envies habituelles[unicode 160]?",
"Dormir[unicode 160]? Non. Boire[unicode 160]? Non. Faire l'amour[unicode 160]? Non.[paragraph break]Mes Dieux[unicode 160]! Non[unicode 160]? Est-ce que je suis malade[unicode 160]?",
"Eh bien, j'ai faim.",
"Qu'est-ce que j'ai envie de manger[unicode 160]? Cela m[apostrophe]échappe pour le moment.",
"Du fromage[unicode 160]? Non, pas vraiment.",
"Je cherche quelque chose plus moelleux, plus juteux.",
"Je le saurai quand je le verrai, je suppose."
}.

Section MouseDog Dialogue	
		
mouseDogDialogue is a list of text that varies. 

mouseDogDialogue is {
"La souris[unicode 160]? Quelle souris[unicode 160]?[line break]-- La souris qui habite ici.[line break]-- La maudite souris qui vole toujours les restes autour de mon distributeur[unicode 160]?[line break]-- Ouais, la même. Une fois de plus, je suis désolé de t'avoir dérangé.",
"Pas du tout. J'aurais fait pareil.[line break]-- Bon, merci.[line break]-- Dis, souris, as-tu un nom[unicode 160]?[line break]-- Non. Nous les souris n'avons pas de noms. Tu peux m'appeler simplement [quotation mark]Souris[quotation mark]. Et toi[unicode 160]? Comment tu t'appelles[unicode 160]?[line break]-- [quotation mark]Lucky[quotation mark]. C'est le nom que ma famille m'a donné avant que je sois arrivé ici. Les bourreaux me désignent [quotation mark]Sujet 205-Alpha[quotation mark], mais je préfère [quotation mark]Lucky[quotation mark].[line break]-- D'accord, Lucky.",
"Souris, peux-tu m'expliquer quelque chose[unicode 160]? Je suis toujours perplexe. Comment se fait-il que toi, une souris, un animal tout petit, puisse manger un chien comme moi, de plusieurs fois ta taille[unicode 160]?[line break]-- Je me suis demandé la même chose. Tiens -- t'es un chien[unicode 160]? Je pensais que tu étais un loup[unicode 160]![line break]-- Non, un chien.[line break]-- Ah bon[unicode 160]?[line break]-- Oui. J'en suis certain.",
"Je n'arrive pas à comprendre exactement comment j'ai réussi à vous manger.[line break]-- Est-ce que tu te rappelles de l[apostrophe]événement[unicode 160]?[line break]-- J[apostrophe]étais pris d'une folle envie de cerveaux.[line break]-- Quel cerveau[unicode 160]?[line break]-- Dans ce cas, le tien.[line break]-- Ah, je vois… euh, non, pas vraiment.",
"As-tu toujours vécu ici, Souris[unicode 160]?[line break]-- Plusieurs générations de ma famille ont vécu ici, c'est le domaine familial. On le défend contre les envahisseurs, les souris des campagnes qui ne sont que des abruties et des voleuses.[line break]-- As-tu jamais vu le monde en dehors d'ici[unicode 160]?[line break]-- Je n'en ai pas envie. J'ai entendu des contes, bien sûr[unicode 160]:[unicode 160]le ciel, les nuages, les champs, mais rien du tout cela ne m'intéresse.",
"Et toi, Lucky[unicode 160]? Tu as mentionné une famille[unicode 160]? As-tu une femme (nous les souris ne croyons pas au mariage, mais j'ai entendu que les chiens sont plus traditionnels).[line break]-- Une famille, oui, mais pas de femme... bien qu'il y avait un caniche, mais rien de sérieux… euh, mais c'est une autre histoire. Non, lorsque je parle de famille, il s'agit d'une famille humaine.",
"Tu étais leur esclave[unicode 160]? demande la souris.[line break]-- Non, ce n[apostrophe]était pas comme ça. J'ai joué avec les enfants, ils m'ont donné de la nourriture, ils m'ont caressé toute la journée, et j'avais même mon propre lit.[line break]-- Tu rêves. Je n'ai jamais rien vu de pareil. Les humains n'aiment pas les animaux. Ils essaient toujours de nous écraser sous leurs semelles[unicode 160]!",
"Bah, tu ne connais que peu d'humains, réfute Lucky.[line break]-- Je n'ai aucune envie de les connaître de plus près.[line break]-- Tu aurais aimé ma famille.[line break]-- Alors, pourquoi as-tu quitté cette famille si remarquable[unicode 160]?[line break]-- Pas par choix. Nous étions dans une forêt, j'ai vu un écureuil, et je me suis perdu.[line break]-- Ne me parle pas d[apostrophe]écureuils. Ils sont pire que les souris sauvages[unicode 160]!",
"Lucky, penses-tu que tu retrouveras un jour ta famille[unicode 160]?[line break]-- Je l'espère.[line break]-- Moi aussi. Je veux chasser les écureuils avec toi.[line break]-- Ça serait génial."
}


Section MouseDogGuard Dialogue

mouseDogGuardDialogue is a list of text that varies. 

mouseDogGuardDialogue is { 
"Si je puis poser une question, demande la souris, qui es-tu[unicode 160]?[line break]-- Mon nom est… euh… voyons… un instant… bonne question. En effet, je ne me souviens pas. Le nom m[apostrophe]échappe pour l'instant. Que proposerais-tu[unicode 160]?[line break]-- Appelons-le [quotation mark]La petite tranche de cerveau que nous avons trouvée dans le frigo et dont la saveur était un peu avariée[quotation mark], conseille le chien.[line break]-- Non, c'est vraiment trop long. Disons plutôt simplement [quotation mark]la tranche de cerveau[quotation mark]. Est-ce que ça te convient[unicode 160]?[line break]-- Oui, dit la tranche de cerveau, de toute manière, j'ai une préférence pour les noms courts.", 
"Avez-vous des noms[unicode 160]? questionne la tranche de cerveau.[line break]-- Oui, répond le chien. Pardonne notre manque de politesse. Je m'appelle Lucky et mon amie la souris est tout simplement appelée [quotation mark]Souris[quotation mark].[line break]-- C'est exact, confirme la souris.[line break]-- C'est un plaisir de faire votre connaissance, mes nouveaux amis.", 
"Alors, tranche de cerveau, je me demande quelle sorte d'animal tu étais avant d'arriver ici. J[apostrophe]étais un chien et la souris a toujours été une souris.[line break]-- J[apostrophe]étais quelque chose d'autre qu'une tranche de cerveau auparavant[unicode 160]?[line break]-- Il me semble que tu étais un frigo, suggère la souris. J'ai mangé le cerveau d'un chien et Lucky est apparu. Puis nous avons ouvert et mangé un frigo et tu es apparu.[line break]-- Je ne crois pas que ça fonctionne comme ça, murmure Lucky.", 
"Quand tu es arrivé, tu as dit qu'il fallait [quotation mark]sécuriser l'installation[quotation mark]. Qu'est-ce que ça veut dire[unicode 160]? demande Lucky. [line break]-- Cela signifie que nous devons regarder autour de l'installation pour la protéger contre toute menace.[line break] -- OK, dit la souris en essayant de suivre la conversation, mais c'est quoi une installation[unicode 160]?[line break] -- C'est le complexe des ... euh ... c'est un endroit où ... tout le monde travaille pour ... euh. Voilà où nous en sommes, conclut la tranche de cerveau.", 
"De quelle menace parles-tu[unicode 160]? demande la souris.[line break]-- Franchement, je ne sais pas, répond la tranche de cerveau. Encore, je ne me souviens pas. Mais il y en a beaucoup, j'en suis certain.[line break]-- Tu as l'air parano, dit le chien.[line break]-- Peut-être que si j'avais mes souvenirs, je pourrais… non. Ils sont perdus.", 
"Peut-être qu'il y a un moyen de récupérer vos souvenirs, suggère Lucky.[line break]-- Comment[unicode 160]? J'ai beaucoup essayé et rien ne me vient à l'esprit.[line break]-- Probablement parce tu n'es qu'une petite tranche de cerveau, suppose la souris.  Si nous pouvons trouver le reste du cerveau, qui doit être ici quelque part, nous pourrions le manger pour obtenir les souvenirs manquants, non[unicode 160]?[line break]-- Hein[unicode 160]? Tu penses[unicode 160]? questionne la tranche de cerveau.[line break]-- Oui, certainement, rassure le chien.", 
"Et si le reste du cerveau nous trouve avant que nous le trouvions[unicode 160]? demande la souris.[line break]-- Et alors[unicode 160]? dit Lucky.[line break]-- Le reste de cerveau peut nous manger plutôt que nous le mangions, répond la souris.[line break]-- Ça changera quoi, exactement[unicode 160]? demande la tranche de cerveau. Nous serons tous ensemble en tout cas.[line break]-- Oui. Mais. D'habitude je préfère manger les autres avant qu'ils me mangent.", 
"Savez-vous ce dont nous avons besoin[unicode 160]? interroge Lucky. Un plan.[line break]-- Oui, je suis d'accord avec toi, dit la souris. Que proposes-tu[unicode 160]?[line break]-- Numéro un, explique le chien, il faut explorer un peu plus, comme la tranche de cerveau a dit, pour sécuriser l'installation. Numéro deux[unicode 160]:[unicode 160]chercher le cerveau manquant. Et numéro… euh, le numéro qui suit le numéro deux[unicode 160]:[unicode 160]nous devons nous échapper d'ici.[line break]-- Génial[unicode 160]! Tu es un génie, Lucky, dit la tranche de cerveau.",
"Dehors[unicode 160]? demande la souris. Je suis tout à fait à mon aise ici. Qu'offre le monde extérieur[unicode 160]? Rien que des ennuis. J'ai hérité des terres ici et même un titre -- vous rendez-vous compte que je suis un marquis[unicode 160]? Oui, je ne plaisante pas. Je suis le dix-huitième marquis de ma lignée. Tu veux que je sacrifie tout ça[unicode 160]?[line break]-- Il y a un monde entier[unicode 160]! plaide le chien[line break]-- J'ai vécu là, ajoute la tranche de cerveau. Je crois que je vivais non loin d'ici avec ma copine… comment s'appelait-elle[unicode 160]?", 
"Une petite amie, hein[unicode 160]? demande Lucky, intéressé.[line break]-- Raconte nous les détails[unicode 160]! encourage la souris.[line break]-- À vraiment dire, je ne me souviens pas beaucoup, pas même son nom. Cependant je me rappelle qu'elle était bigrement intelligente… elle avait un bon sens de l'humour et un rire plein d'entrain… et des yeux en amande d'un violet profond… et elle avait des grandes… euh… Zut. J'ai oublié le mot.",
"Penses-tu que tu peux trouver votre maison si nous parvenons à sortir de l'installation[unicode 160]? demande Lucky.[line break]-- Ah oui, assurément. Il n'y a qu'une dizaine de pièces à traverser et nous serons dehors. La maison est toute proche. On a juste à suivre la rue… je ne me souviens pas du nom de la rue, cependant je la reconnaîtrai.[line break]-- Ton amnésie ne m'inspire pas confiance, plaisante la souris.[line break]-- Si nous trouvons le reste du cerveau au cours de notre évasion tout sera réglé.", 
"Si nous quittons l'installation, pourrais-tu aider Lucky à retrouver sa famille[unicode 160]? demande la souris.[line break]-- As-tu aussi une maison près d'ici[unicode 160]? continue la tranche de cerveau.[line break]-- Probablement, répond le chien, ma famille vit dans une jolie maison blanche entourée de grands arbres.[line break]-- Y a-t-il des chats[unicode 160]? interrompt la souris.[line break]-- Aucun, dit fièrement le chien.",
"J'avais une pensée troublante, dit la souris.[line break]-- Quoi[unicode 160]? interroge la tranche de cerveau.[line break]-- Qu'allons-nous faire si nous rencontrons un chat[unicode 160]?[line break]-- Nous lui mangerons le cerveau, non[unicode 160]? répond la tranche de cerveau. Où est le problème[unicode 160]?[line break]-- Oh, je vois, dit le chien. On aura les pensées d'un chat avec nous. Ça serait plutôt insupportable.[line break]-- Carrément, dit la souris. Je suis d'accord de le manger, mais je refuse d'entendre les pensées d'un chat. C'est trop.", 
"Quand nous serons dehors, que ferons-nous pour retrouver la maison de Lucky[unicode 160]? demande la souris.[line break]-- D'abord mettons le cap vers chez moi, répond la tranche de cerveau. J'ai une voiture et cela aidera beaucoup à chercher rapidement.[line break]-- Tu ne te souviens pas de ton nom, mais tu sais conduire[unicode 160]? demande la souris.[line break]-- Sinon, moi je peux, dit Lucky. J'ai vu les humains le faire de nombreuses fois. Conduire ne me semble pas trop compliqué.",
"Mes amis, dit la tranche de cerveau, j'ai de plus en plus de peine à mettre de l'ordre dans mes pensées[unicode 160];[unicode 160]puis-je vous proposer une petite pause dans notre conversation pour ramasser mes forces[unicode 160]?[line break]-- Oui, moi aussi, dit la souris. J'aime beaucoup causer avec vous, mais j'ai un sacré mal de tête. Un repos me ferait du bien.[line break]-- Je suis d'accord, dit Lucky. J'aime bien courir avec la meute, mais un peu de temps mort me conviendrait.[line break]-- Bonne nuit, tous, dit la souris."
}

Section Everybody Dialogue

EverybodyDialogue is a list of text that varies. 

EverybodyDialogue is { "Quelle sensation incroyable[unicode 160]! délire la scientist.[line break]-- On s'y habitue après un temps, dit la souris laconiquement.[line break]-- Dis-lui le plan, Lucky, demande la tranche de cerveau. Je ne me rappelle pas de toutes les étapes.[line break]-- D'accord, dit le chien, numéro un[unicode 160]:[unicode 160]pour commencer nous avons besoin de trouver le reste du cerveau de Julien, numéro deux[unicode 160]:[unicode 160]quitterons l'installation, enfin, numéro plus que deux[unicode 160]:[unicode 160]nous chercherons ma famille.",
"Euh. D'accord, dit Isabelle. Mais en premier lieu il faut sortir de la pièce où vous m'avez trouvée, et pour ce faire, il faut synthétiser le remède, propose la scientist.[line break]-- Impossible, dit la souris d'un ton définitif.[line break]-- Pourquoi[unicode 160]? demande Isabelle bouleversée.[line break]-- C'est une question de mathématiques, répond la souris d'un air pointilleux. Le plan de Lucky commence déjà avec numéro un. Il n'y a rien avant le numéro un.[line break]-- Numéro zéro[unicode 160]? suggère Isabelle.[roman type][unicode 160]»[paragraph break]Silence radio.[paragraph break]«[unicode 160][italic type]OK, dit Isabelle, renumérotons… un[unicode 160]:[unicode 160]faire le remède, deux[unicode 160]:[unicode 160]sortir de l'installation, trois[unicode 160]:[unicode 160]chercher la famille de Lucky. Ça vous convient[unicode 160]?[line break]-- Oui, accorde Lucky, ça l'air raisonnable.[line break]-- Et mathématiquement correct, ajoute la souris.",
"Attends, dit Lucky, toujours comptant les étapes du plan proposé par Isabelle. Que ferons-nous en ce qui concerne le cerveau manquant[unicode 160]? Si j'ai bien compris, nous en aurons besoin pour reconstituer Julien.[line break]-- Malheureusement, répond Isabelle, la tranche de cerveau est maintenant tout qui reste de Julien. Nous utilisons en ce moment les voies neurales du reste de son cerveau, mais à l'exception de la tranche récupérée rien ne reste de sa personnalité. C'est une perte grave, particulièrement pour moi.[line break]-- Pourquoi pour toi[unicode 160]? demande la souris.[line break]-- Parce que nous étions fiancés, Julien et moi.[line break]-- Désolé, dit la tranche de cerveau. Si je pouvais me souvenir de toi, je suis sûre que je t'aurais aimée.",
"Isabelle, penses-tu que nous allons un jour trouver ma famille[unicode 160]? demande Lucky.[line break]-- Oui, j'en suis certaine.[line break]-- Comment peux-tu être si sûr[unicode 160]? demande la tranche de cerveau.[line break]-- Parce que je connais la famille[unicode 160]:[unicode 160]Jean-Paul et Alexandra Drummond et leurs filles, Léa et Camille. Ils ne vivent qu[apostrophe]à une centaine de mètres de moi et Julien.[line break]-- Oui, j'ai entendu ces noms souvent à la maison. Tu as assurément raison, mais comment peux-tu connaître de qui je parlais[unicode 160]? demande Lucky.[line break]-- Je les ai vus dans vos pensées, dit la scientifique.",
"Tu dis que tu as vu dans les pensées de Lucky[unicode 160]? demande la souris. Comment est-ce possible[unicode 160]?[line break]-- Nous faisons tous partie d'un seul cerveau maintenant. Nos esprits sont d'une manière ou d'une autre mélangés. Je peux accéder à ses pensées et il peut également accéder aux miennes.[line break]-- Cool[unicode 160]! dit . Nous avons des superpouvoirs[unicode 160]!",
"Je trouve cela un peu improbable, dit le chien. Si tu peux voir dans mes pensées, à quel numéro est-ce que je pense en ce moment[unicode 160]?[unicode 160]»[paragraph break]La scientifique réfléchit un moment et elle dit[unicode 160]:[unicode 160]«[unicode 160]Au numéro un.[line break]-- Oui, c'est exact, admet le chien, mais peut-être que tu y es arrivé par hasard. Essaie encore une fois…[line break]-- Tu penses au numéro deux, dit la scientifique avec conviction.[line break]-- Oui encore, dit le chien satisfait.[line break]-- Mais, objecte , Lucky ne connaît que deux numéros… qu'est-ce que ça prouve[unicode 160]?",
"D'accord, dit la scientifique patiemment, prenons un autre exemple. Souris, je pense en ce moment à mon petit déjeuner. Je m'efforce de le visualiser avec le plus de détails possibles… tente de le voir.[line break]-- Où[unicode 160]? demande la souris. Je ne sens rien.[line break]-- Ah, dit Isabelle. Voilà le problème. Je pensais en termes visuels. Laisse-moi imaginer son odeur, sa saveur… [line break]-- Oh[unicode 160]! Oui, oui. Je commence à l'apercevoir, dit la souris. Mes Dieux, c[apostrophe]était un énorme repas[unicode 160]! C'est merveilleux[unicode 160]! Puis-je vivre de nouveau chaque repas de votre vie[unicode 160]? Pince-moi, je rêve.",
"Même si je trouve le souvenir de votre repas délicieux, en ce moment je ne veux rien d'autre que des cerveaux. C'est drôle, non[unicode 160]? remarque la souris.[line break]-- Moi aussi, dit la tranche de cerveau.[line break]-- En fait, c'est tout à fait normal pour ceux comme nous qui fonctionnent en mode zombie, répond la scientifique.[line break]-- Nous sommes des zombies[unicode 160]? interroge Lucky.[line break]-- Non, précise la scientifique, ensemble nous constituons un seul zombie, partageant le corps de Julien.[line break]-- Au moins je suis dans mon propre corps, dit la tranche de cerveau.", 
"D'autres zombies sont-ils aussi agréables que nous[unicode 160]? demande Lucky.[line break]-- Non, répond Isabelle, ce sont des monstres. Nous sommes quelque chose à part.  Je dirais que nous sommes un demi-zombie, ayant reçu une dose d'un remède partiellement efficace. Quant aux autres zombies, ils ne sont pas capable de parler, de penser, en somme, de faire autrement que manger des cerveaux.[line break]-- Et ça pose un problème[unicode 160]? demande la souris.[line break]-- C'est rien de le dire, répond la scientifique. Les zombies ont presque détruit la civilisation[unicode 160]!", 
"Comment est-ce possible[unicode 160]? dit la tranche de cerveau.[line break]-- Le virus a une virulence sans précédent, répond la scientifique. La moindre griffure et c'est la contamination assurée. Les premiers cas ont été rapportés au Cambodge et vingt-quatre heures après des milliers des cas sont apparus tout autour du monde grâce aux transports aériens. La semaine suivante, c[apostrophe]était un capharnaüm à l[apostrophe]échelle mondiale. Sans électricité, eau et nourriture les grandes villes se sont effondrées presque immédiatement. Des feux ont balayé la campagne. Il ne reste que quelques poches d'humanité.",
"Et quant aux animaux[unicode 160]? demande la souris. Étaient-ils touchés[unicode 160]?[line break]-- En fait, répond Isabelle, nous pensons que la maladie est d'origine canine. Avant la perte de communications avec l'Institut Pasteur à Hô-Chi-Minh-Ville, ils ont isolé une souche mutante de la rage qui a déclenché la pandémie.[line break]-- La rage[unicode 160]! dit Lucky, frappé de terreur. Il n'y a rien de plus terrifiant[unicode 160]![line break]-- Jusqu[apostrophe]à présent, précise la tranche de cerveau.",
"Si le zombisme s'est propagé si vite, s'inquiète Lucky, penses-tu que ma famille ait survécu[unicode 160]?[line break]-- Oui, je le sais, rassure la scientifique. Les Drummond travaillent ici, dans l'installation et tous les travailleurs sont hébergés dans l'enceinte. Tu n'es pas loin d'eux. [line break]-- Génial[unicode 160]! dit le chien.", 
"Isabelle, dit la souris, si le remède fonctionne comme prévu, que deviendrons-nous[unicode 160]?[line break]-- Dans quel sens[unicode 160]?[line break]-- Est-ce que nous restons les individus avec nos propres pensées, ou crois-tu que nous allons fusionner dans un seul esprit[unicode 160]?[line break]-- Impossible à prédire. Jusqu[apostrophe]à maintenant, nous avons mené des vies individuelles. Tu as tes souvenirs et j'ai les miens, mais à l'avenir nous allons vivre les mêmes événements du même point de vue. Nous partagerons un seul corps et c'est possible que nous devenions un seul esprit après un certain temps.", 
"Je n'ai jamais souhaité être autre chose qu'une souris. Je trouve cela terrifiant, que mon esprit puisse être dilué.[line break]-- Mais vois les avantages, dit Lucky. Regarde dans mes pensées -- voici comment je me sens en chassant un écureuil. Et voici la sensation d[apostrophe]être gratté entre les oreilles.[line break]-- Oui, je suppose.[line break]-- Et ici, dit la scientifique, je te montre la Terre vue depuis l'espace -- quelque chose qu'aucune souris n'a jamais vu.[line break]-- Heu. C'est impressionnant. Et je suppose que de mon coté j'ai quelques souvenirs à partager aussi[unicode 160]:[unicode 160]la chaleur de dormir avec les autres souris, la joie de voler les restes du distributeur de Lucky…[line break]-- Hé[unicode 160]! hurle le chien.", 
"Quand j'ai vu le corps de Julien entrer dans le sas, j'ai remarqué qu'il se déplaçait avec difficulté, marchant lentement et trébuchant, dit la scientifique.[line break]-- Oui, je sais comment marcher, dit la tranche de cerveau, mais je le trouve désespérément difficile de le mettre en pratique.[line break]-- La souris n'aide pas, commente Lucky. Il bouge toujours les jambes.[line break]-- Moi[unicode 160]? dit  avec indignation. C'est toi qui veut toujours aller à quatre pattes.[line break]-- OK, dit la scientifique, puis-je vous convaincre qu'une seule personne doit piloter le corps à la fois[unicode 160]?[line break]-- Oui, certainement, acquiesce la tranche de cerveau. Le volant est à toi.", 
"D'accord, dit la scientifique. Je m'empresse de faire ce qu'il faut pour obtenir le remède.[line break]-- Bon. Assez de papotage mes amis, laissez-la se concentrer, conseille la tranche de cerveau.[line break]-- Oui, d'accord, disent le chien et la souris."
}

Section Cured Dialogue

CuredDialogue is a list of text that varies. 
	
CuredDialogue is { 
"C'est fait, dit la scientifique. Je ferai l'appel[unicode 160]:[unicode 160]Lucky[unicode 160]?[line break]-- Présent.[line break]-- Le Marquis de Souris[unicode 160]?[line break]-- Oui. Ici.[line break]-- Et la tranche de cerveau de Julien[unicode 160]?[line break]-- Présent.[line break]-- Bon, dit Isabelle, il me semble que nous sommes tous arrivés sain et sauf.",
"Et maintenant on quitte l'installation[unicode 160]? suggère le chien.[line break]-- Oui, dit Isabelle[line break]-- Mais la porte extérieure est verrouillée. Personne ne peut l'ouvrir à part le colonel Greillier dans la salle de contrôle, dit la tranche de cerveau.[line break]-- Oui, nous devons le convaincre de l'ouvrir, acquiesce la scientifique.",
"Dis, ça me surprend un peu que tu te souviennes du colonel Greillier. J'ai pensé que tu avais oublié les noms.[line break]-- Du colonel[unicode 160]? demande la tranche de cerveau. Comment puis-je oublier le nom de ton boss[unicode 160]? C[apostrophe]était juste la dernière semaine qu'il est tombé dans la piscine pendant sa fête d'anniversaire. Je suppose que nous étions tous un tantinet bourrés[unicode 160]![line break]-- C'est quoi bourré[unicode 160]? demande la souris. Oh, je vois dans vos pensées. Ça a l'air amusant.[line break]-- Patiente un instant, Souris, dit Isabelle. Julien, c[apostrophe]était un souvenir compliqué. Penses-tu que ta mémoire est de retour[unicode 160]?[line break]-- Hein[unicode 160]? Comment pourrais-je savoir[unicode 160]?",
"Julien, dit la scientifique, qu'est-ce que tu m'a donné en cadeau pour notre premier Noël[unicode 160]?[line break]-- Des gants[unicode 160]?[line break]-- Et ils étaient…[line break]-- Bien trop grands[unicode 160]! Oui, je les avais achetés pour mon frère, mais quand tu m'as donné un cadeau et je n'avais rien pour toi… oui… euh, es-tu toujours vexée[unicode 160]?[line break]-- Non, pas vraiment. Je testais juste ta mémoire.",
"Teste-moi encore[unicode 160]![line break]-- D'accord. Comme est-ce que tu m'appelles quand nous sommes seuls[unicode 160]?[line break]-- Isabelle[unicode 160]?[line break]-- Non, réfléchis[unicode 160]! Quand c'est juste nous…[line break]-- Je préfère de ne pas le dire devant Lucky et la souris.[line break]-- Vas-y[unicode 160]! dit le chien. Nous partageons un esprit maintenant, il n'y a pas de vrais secrets entre nous.[line break]-- Très bien, dit Julien, je t'appelle mon lapin.[line break]-- Lapin[unicode 160]? dit la souris. Elle est un lapin[unicode 160]? Quoi[unicode 160]? Je suis totalement confus.",
"Bon, Julien, il me semble que tu es en train de récupérer ta mémoire, dit la scientifique.[line break]-- Tu penses[unicode 160]? Pourtant tu m'as dit que je ne suis qu'une toute petite biopsie de cerveau. Est-il possible que les souvenirs soient les tiens et que je lise dans tes pensées[unicode 160]?[line break]-- Je dirais qu'une toute petite biopsie ne serait guère capable de formuler une telle hypothèse, il s'agit plutôt d'un cerveau entier en pleine forme.",
"Si j'ai bien compris, dit Lucky, tu as dit que les cerveaux des zombies sont complètement effacés par le virus. Vu que rien ne reste de son cerveau, comment se fait-il qu'il peut fonctionner maintenant[unicode 160]?[line break]-- Nous n'avons jamais eu un pareil cas pour étudier, répond la scientifique. Il est temps de réviser notre compréhension du processus[unicode 160]:[unicode 160]il semble que les cerveaux ne sont pas détruits, mais plutôt supprimés. Ses voies neuronales ont toujours été intactes. En fait, c'est grâce à elles que nous continuons à exister. Nous nous servons de ces voies pour formuler nos propres pensées.",
"C'est super[unicode 160]! dit Julien. On peut restaurer tous les zombies[unicode 160]![line break]-- Mon Dieu, Julien, vous avez raison. Ils ne sont plus perdus, répond la scientifique. Pour la première fois, il y a un espoir de restaurer le monde et terminer ce cauchemar.[line break]-- Même les chiens infectés[unicode 160]? demande Lucky.[line break]-- Oui, y compris les chiens et toutes les autres espèces infectées par le virus, répond la scientifique.",
"Alors, que faire[unicode 160]? demande la souris.[line break]-- Julian, dit Isabelle, il faut parler avec le colonel pour le convaincre que tu es guéri et que nous possédons un remède contre le virus.[line break]-- D'accord. Je ferai de mon mieux, dit Julien.[line break]-- Allons-y[unicode 160]! crie la souris."
}.

Chapter 15 - The Void

The void is a room.

The petite créature grise is an edible thing. It is in the void. The indefinite article of the petite créature grise is "une".

The bloody corpse of Docteur Rambaud is a thing in the void. The indefinite article of bloody corpse of Docteur Rambaud is "la".

The interphone is a buttoned thing in the void. The interphone can be live. The interphone is not live. The indefinite article of the interphone is "une".

Instead of pushing the interphone:[only present at consciousness 4]
	if the interphone is not live:
		say "Une petite LED rouge sur l'interphone s'allume indiquant que vous êtes en direct avec la salle de contrôle.";
		now the interphone is live;
	otherwise:
		say "Vous avez déjà activé l'interphone et sa LED reste allumée."

The panneau électrique is an openable closed container in the void. The printed name of the panneau électrique is "panneau électrique[if the panneau électrique is closed] (fermé)[end if]".

The disjoncteurs are in the panneau électrique. The disjoncteurs are plural-named. The disjoncteurs are broken. The indefinite article of disjoncteurs is "des". The printed name of the disjoncteurs is "disjoncteurs[if the disjoncteurs are broken] sautés[end if]". The indefinite article of the panneau électrique is "un".

Instead of touching the disjoncteurs:
	say "Vous remettez les disjoncteurs";
	now the disjoncteurs are not broken;
	if the servomoteur is broken:
		say ".[paragraph break]Le panneau électrique fait un bruit sec et vous constatez que les disjoncteurs ont de nouveau sautés";
		now the disjoncteurs are broken;
	say "."

The unité de synthèse microfluidique is an openable closed container in the void. The indefinite article of the unité de synthèse microfluidique is "une". The printed name of the unité de synthèse microfluidique is "unité de synthèse microfluidique[if the unité de synthèse microfluidique is closed] (fermée)[end if]".

The servomoteur is in the unité de synthèse microfluidique. The servomoteur is broken. The printed name of the servomoteur is "[pnServo]". The indefinite article of servomoteur is "un".

To say pnServo:
	say "servomoteur";
	if the servomoteur is not broken:
		say " que vous avez réparé".

After opening the unité de synthèse microfluidique:
	say "Vous ouvrez le panneau d'accès et tout de suite reconnaissez le problème[unicode 160]:[unicode 160]une écaille de soudure est tombée sur les terminaux d'un servomoteur, créant un court-circuit."
	
Instead of touching the servomoteur:
	now the servomoteur is not broken;
	say "Vous écartez le morceau de soudure. La machine doit fonctionner normalement maintenant."

Chapter 16 - End Game

To terminate the game:
	remove all elements called "vorple-link";
	say "[VictoryText]";
	[to prevent players bypassing CSS from continuing past this point]
	now the knownCommands of the player is 0.
	
To say VictoryText:
	say "[paragraph break][bold type]        *** VOUS AVEZ GAGNÉ ***[roman type][paragraph break]Vous avez sauvé le monde du fléau du virus zombie777.[paragraph break][bold type]>infos[roman type][line break]Ce jeu participe au Concours Francophone de Fictions Interactives (2017). Il a été écrit en Inform 7.[paragraph break][bold type]>remerciements[roman type][paragraph break]Je voudrais remercier :[paragraph break]* Les organisateurs du concours.[line break]* Graham Nelson pour avoir conçu et écrit Inform 7.[line break]* Juhana Leinonen pour l'extension [quotation mark]Vorple[quotation mark].[line break]* Corax pour ses suggestions concernant l'accessibilité.[line break]* Ben Collins-Sussman, qui a peint la couverture à l'aquarelle.[line break]* Relecteurs: Éric Forgeot et Stéphane Flauder.[line break]* Bêta-testeurs: Brian Rushton, Denise Jobin et Hugo Labrande.[paragraph break][bold type]FIN."
	
Chapter 17 - Testing

Test me with "est / ouest / manger / est / ouvrir / nord / ouvrir / manger / pousser / sud / pousser / est / pousser / ouest / sud / ouvrir / manger / manger / manger / nord / ouvrir / nord / ouvrir / ouvrir / manger / sud / ouest / déverrouiller / ouvrir / ouest / déverrouiller / ouvrir / nord / nord / déverrouiller / ouvrir / nord / parler / parler / parler / parler / parler / manger / sud / sud / sud / est / pousser / est / pousser / ouest / déverrouiller / ouvrir / sud / ouvrir / réparer / nord / pousser / est / pousser / ouest / ouest / nord / ouvrir / réparer / sud / est / pousser / est / pousser / ouest / sud / nord / pousser / est / pousser / ouest / ouest / nord / nord / nord / pousser / parler / parler / parler /  parler ".

Test full with "est / est / ouest / ouest / manger / est / ouest / ouvrir / est / ouvrir / nord / sud / ouest / sud / est / nord / z / z / z / z / z / z / z / z / z / z / z / manger / ouvrir / manger / pousser / manger / nord / sud / ouest / ouest / est / est / pousser / est / pousser / ouest / ouest / sud / ouvrir / pousser / manger / manger / manger / manger / nord / ouest / nord / nord / ouvrir / nord / manger / pousser / ouvrir / ouvrir / manger / sud / sud / ouvrir / pousser / nord / ouest / déverrouiller / ouest / ouvrir / ouest / nord / déverrouiller / nord / ouvrir / nord / nord / nord / nord / déverrouiller / nord / ouvrir / nord / manger / manger / manger / manger / manger / manger / pousser / déverrouiller / nord / parler / parler / parler / parler / parler / parler / manger / parler / pousser / parler / pousser / pousser / parler / nord / sud / sud / sud / ouvrir / réparer / ouvrir / réparer / pousser / sud / est / sud / pousser / ouvrir / manger / nord / nord / réparer / sud / pousser / est / pousser / ouest / ouest / est / nord / pousser / manger / réparer / sud / sud / déverrouiller / ouvrir / sud / réparer / ouvrir / réparer / nord / pousser / est / pousser / ouest / ouest / nord / ouvrir / réparer / sud / est / est / pousser / est / pousser / ouest / sud / réparer / nord / pousser / est / pousser / ouest / sud / nord / ouest / nord / nord / nord / manger /parler / pousser / parler / parler / sud / nord / parler / parler ".
