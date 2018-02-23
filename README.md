What is this?
-------------

This is the source code to the web version of "En Garde", an 
interactive fiction game (or more commonly known as "text adventure".) 
It is translated from the original game, "Faute De Servo", by Jack
Welch. This version was created in 2018.

The code is released under the MIT license, which you can find in the
LICENSE file.

The game is written in the Inform 7 programming language, using
version 6M62, the most recent version available at the time of
writing.  The non-web version was written for an older version of 
Inform using the GLIMMR library to provide graphic hyperlink 
buttons in a classic interpreter. This version is built with 
Vorple 3 (preview), which leverages Javascript and CSS to do the
same thing, but in a browser. 

You can download the compiler and IDE as a single
package from http://www.inform7.com

Vorple is available at http://vorple-if.com/doc/

When compiled, the source code produces glulxe bytecode, which the 
vorple interpreter executes via javascript:

  http://www.eblong.com/zarf/glulx/

The game's source code lives in a single file called 'story.ni' --
this file, some .i7x extensions, along with the 'uuid.txt', are the
primary things kept under version control.


To build the game:
------------------

	1. Create a working Inform project from your source tree:

		$ git clone URL web-engarde
  
		$ cd web-engarde
  
		$ mv web-engarde.inform/ temp.inform/

	[...launch Inform, create new project in this dir called 'web-engarde'…]

		$ cp temp.inform/Source/story.ni web-engarde.inform/Source/
  
		$ cp temp.inform/uuid.txt web-engarde.inform/
  
		$ rm -rf temp.inform/

	2. Install extensions. The extensions used in this project are all "stock" -- 
	none have been modified, but there's always the concern about versions and 
	compatability. For that reason, I've put copies of all used extensions in the 
	web-engarde/extensions directory. If the whole project is cloned, these files will 
	come along for the ride. Be sure to install them into your local copy of inform 
	when you compile.

	3. Launch the Inform IDE and load the web-engarde.inform project.  The source code 
	should be visible, and it should compile fine. Make	sure that Inform's 
	settings are are set to "Glulx" as the target VM. Remember to force-reload the game
	in a web browser to dump whatever is in the cache and be sure that you are running
	the most recent version of the game. See vorple documentation for details on how
	this all works.
	
	4. This version of the game is not intended to work in an interpreter -- it is only
	for the web.

WARNING!!

	DO NOT do any version control operations (commit, push, and particularly, 
	pull, update, and merge) while the Inform IDE  is still open.  When the IDE 
	'saves', it destroys and recreates  the whole cerveux.inform/ directory, thus
	possibly eradicating and changes you may have downloaded.  
