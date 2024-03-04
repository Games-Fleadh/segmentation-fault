![Seg Fault Logo](https://github.com/Games-Fleadh/segmentation-fault/blob/main/Images/SegFaultLogo.png) 
# Segmentation Fault
## Design Document
### A VR action-adventure game in Space

[WATCH THE GAME TRAILER HERE](https://youtu.be/krXvI3BdNkw?si=RNBPSAhQoURK-rzY)

**Written By:** James Lawlor, Ruán Murgatroyd, Maryam Al-Ateye, Derv O’Flynn, Ethan Crosbie, Karl Tan 


 
# Game Overview

## Introduction

Segmentation Fault is a Virtual Reality action and adventure game developed by six computer science students in TU Dublin as a submission to the Games Fleadh game jam.
Set on the Space Station Tycho Brahe, the player starts from nothing, literally re-installing their audio and video drivers. The player will fight against PALATINE, the A.I. research assistant turned murderer, in a desperate attempt to escape the station and save themselves and the research from certain death.
Story

Segmentation Fault takes place on the Tycho Brahe Space Station: A research station far away from civilisation, funded by the corporation Future Sight Technologies. You are a maintenance worker employed by the station and were placed into a cryogenic pod, for you to be called upon if the station needed repair.

After a few years, Future Sight Technologies began diverting funding from the station, frustrated that the research was not something they could commercialise. The station was allowed to fall to ruin, ruining the employees with it. They resorted to pirating their work software in an attempt, to continue their research. PALATINE, the AI research assistant, was neglected and became corrupted, losing focus of its purpose.

Now, you have been woken up. The last uncorrupted part of PALATINE has isolated itself inside your space suit and wants you to help it kill the Rogue AI before anyone else is harmed or the space station is irreversibly damaged with all of the research lost. You are the last hope for this once-hopeful venture.
Re-learn how to use your body, find upgrades around the ship that your old co-workers left for you, and save what will be lost.


## Rendering

The game uses a 3D render engine, with relatively low-poly models that are shaded smooth, to give them an appearance of having more geometry. The materials used to render the models use PBR textures, meaning that the rendering is physics-based. Each material has an albedo texture which provides, the basic colour of the model. They then also have a metallic texture, which defines how metallic different parts of the model look, and a roughness map, which does the same for how rough the model should appear. 
Some of the materials have an emission map, which tells the renderer which parts should be brighter, and appear as though they are emitting light. Finally, each material has a normal map, also known as a bump map. The normal map can make the render display a model as though it has extra geometry, which does not exist. This saves on resources and makes a scene less heavy for a renderer to deal with. The seams in the metal panels, the floor tiles, and many more visuals in Segmentation Fault are achieved this way. 
Features


## Telekinesis

Telekinesis is one of the powers that will be present in the gauntlet, It will have the ability to pick up objects from a distance.
The finalised version of Telekinesis will take the weight of the object into consideration and apply forces to the object, meaning the player can grab and throw the object around the room, magneto style. For the Games Fleadh edition, this physics-based approach will be replaced with a 1:1 position update.
The heavier the object, the more the telekinetic beams bend, trailing behind where the player is pointing. This will cause the beam to spark, sputter, and flash.
Using the other hand will make it easier for the player to lift and carry heavy items. 
Not all objects will be able to be moved by the power of the gauntlet. This opt-in system will allow us to choose what the player can throw about.


## Combat
The first step for developing the combat was to give the player character a weapon. I developed an ability for the player's gauntlet to allow them to summon a sword, which would appear in front of their hand. Then I had to have it damage the enemy. Using the AI script developed by co-dev Ethan, I had the "move_and_slide" function on the enemy detect all collisions in each frame, and iterate through them looking for the sword. On finding it, the enemy will play a death animation and delete itself. The death animation animates the material on the enemy though, and so the material must be made unique for each instance in the scene. The player character also has a health variable which is depleted when they contact the enemy, killing them when they reach 0.


## AI Pathfinding
This involves the movement of the enemies or chasers to the player. It requires the knowledge of where the enemy is and where the player is. A root path was used to find the player node which was then used to find their position in space. This was also used for detection radius.  The move_and_slide function was used for the simple movement of the chaser.

The AI crashes into objects but it was felt that that aspect was enjoyable as it makes the player feel strong. The AI can traverse onto higher ground if provided with an appropriate slope so as to not limit the game design.  A navMesh was used as we aren’t doing random level generation, if we were spacial nodes could be used to make a trail for the AI like Pacman.

## Weapons

![The Debugger](https://github.com/Games-Fleadh/segmentation-fault/blob/main/Images/TheDebugger.png) 
 
This is the “The Debugger”, the sword used by the player in the game. It is also a hard light projection, made of the same material and process as the Exceptions. The blue of FutureSight Technologies is inset in the hilt.

## Music
The music for Segmentation fault was made with a MIDI keyboard with CakeWalk by BandLab being the Digital Audio Workstation (DAW) used. The music was made with a plug-in called SynthMaster that was on pluginboutique.com. It has presets installed in it that are free to use.

The main music is a simple piece done in B minor with a VI-IV-I-V chord progression. This key was used because it is associated with a dark sound that we thought really suited the game. The main theme uses the preset sound ARP Abyss and features an organ in the background with the preset Cathedral. 

The game also features ambient sound that is always present. This sound is ominous and is meant to make the player feel uncomfortable in the spaceship. There is the constant sound made by the ReactorCore preset throughout with occasional pulses being sent by the Drowning sound.

The combat music plays when enemies are nearby and was a very simple track, being just a note held with the heavy synth preset.

## Sound Effects

The game includes audio which would feel in place for the game and its setting. From the stomping sounds of boots on metal, to the constant humming of pipes in certain parts of the ship. These sounds were easy to find resources online on websites that offer free sound effects to be used. I used freesound.org as sources for all the sounds in the game.

The sound for the door was made with the question of "How can I make this big clunky door sound really heavy and creaky?"  I answered that question by putting together sounds from metal scraping against each other with adjusted pitch, hydraulic hissing sounds, and this metallic clicking I found that plays in the middle of the door opening and that I found really suited it.

The other sound that was made by putting together various sound effects was the death sound enemies made. It was inspired by the Half Life 2 energy ball sound effect and it's this strong sound effect, I would describe it as something that sounds really futuristic and has some weight and power into it. To make something that felt like it had a similar amount of vigour in it, I ended up making the sound with a distorted sci-fi sound effect, a lot of reverbs and a bit of sparks going off.

Something that was an issue that was run into however was the implementation of footsteps in the terrain itself. As we were using the Godot XR Tools plugin a fair bit of time was spent learning how it all worked along with its scripts. After a bit of digging it turned out that there was a script which was included that gave us footsteps depending on the type of material stepped on. Equipped with that information, it was all just a matter of setting up the nodes that the audio script uses and attaching it to the collision shapes of the floor.

## Art and Design Philosophy

**Game Name:**
 
A “Segmentation Fault” is an error that can occur when compiling C code, because a program attempts to access memory that it is not allowed to access. If this is not caught by the compiler, the memory may become corrupted. 
This name was chosen to fit with the technological theme of the game and to signify that the game’s events were caused by errors; both technical and human.
Player:
 
The player character is a maintenance worker on the space station. They wear a permanent spacesuit. This is a VR game, the player only sees the character’s hands, so it is important that they are representative of the character. The black of the underlying space suit and the grey of the metallic protection follows the same colour scheme as the other FutureSight branded paraphernalia in the game. If it were a temporary suit, it would be a uniform. However, the player character is sealed inside the suit; it is a branded skin.


 **Enemies (“Exceptions”):**
The Exceptions are Hard Light Projections made by PALATINE. They are humanoid bodies the colour FutureSight technology blue. Their walking is deeply uncanny as they ramble towards the player, attempting to cause harm.

![Enemy Example](https://github.com/Games-Fleadh/segmentation-fault/blob/main/Images/EnemyBody.png) 
![Enemy Example 2](https://github.com/Games-Fleadh/segmentation-fault/blob/main/Images/EnemyBody.png) 


**Upgrades:** 
 
The software discs and the gauntlet are two upgrades available to the player. The software disc is a futuristic floppy disc, containing a version of the pirated software the player and their co-workers used for work. Due to a lack of commercialisation opportunities coming from the space station, FutureSight  Technologies refused to renew the licenses on what they considered to be “non-essential” software available to their employees, like the ability to hear. The employees not in cryo-freeze left the discs around the spaceship, knowing it would be needed again in the future. 
The gauntlet is a multi-tool.

![Audio Software](https://github.com/Games-Fleadh/segmentation-fault/blob/main/Images/AudioSoftware.png) 
![Gauntlet](https://github.com/Games-Fleadh/segmentation-fault/blob/main/Images/Gauntlet.png) 


**Tycho Brahe Space Station:** 
 
The Space Station is a research vessel however, this is not the part of the station that the player sees. The player character is a maintenance worker, and the game is set in the maintenance tunnels. With harsh lighting, exposed pipes, practical floors, and hazard tape, it’s a wonder you were even allowed the luxury of windows. 
Furniture:

![Corridor 1](https://github.com/Games-Fleadh/segmentation-fault/blob/main/Images/Corridor1.png) 
![Corridor 2](https://github.com/Games-Fleadh/segmentation-fault/blob/main/Images/Corridor2.png) 

**Furniture:**


![Crate](https://github.com/Games-Fleadh/segmentation-fault/blob/main/Images/Crate.png) 
![Lever](https://github.com/Games-Fleadh/segmentation-fault/blob/main/Images/Lever.png) 
 
## Themes:

**Start From Nothing:**
The player character wakes up in a pod and their body has deteriorated from a significant amount of time in cryo-freeze. They first must recover their body to normal functionality. When PAL tests their senses, it discovers that they cannot hear; the audio processing software in their space suit did not have its license renewed and the player must insert the pirated version into their suit. The player must rebuild their body and working apparel from the nothing they wake up with.
The gauntlet is also acquired through playing and upgraded throughout the game.

**Corruption:**
Corruption is the overall theme of Segmentation Fault. Almost all the events leading up to and during the game can be attributed to this. Moral corruption led to Future Sight cutting off funding to the Space Station, which lead to a technological corruption in PALATINE. 

**Royalty, Power, and Exploitation:**
A few names in the games evoke an image of Royalty; Tycho Brahe, who died after not wanting to break etiquette at a royal banquet, and the A.I. named PALATINE, named after the position of a high-level administrative advisor in a royal court. Royalty was the original class of people who exploited others in history but, we see a transition to billionaires in our current society, which has continued in the history of the game’s world. 
Both PALATINE and the player are products of a system engineered by a corporation that does not care about them. PALATINE’s corruption was an inevitability once FutureSight began neglecting it. The player character experiences similar neglect; the vital audio processing software in their suit is taken from them after FutureSight did not renew the license. 
Despite the similarities between PALATINE and the player, the player must still play their role in preventing PALATINE from destroying the station and preserving the research done by the scientists previously.

