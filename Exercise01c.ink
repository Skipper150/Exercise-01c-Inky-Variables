/*
This is a comment block. It won't be read as an Ink story.
Comments are very useful for leaving ideas for story and functionalty

This exercise will demonstrate the following in the example video:
 - Variable types: integer, float, boolean
 - Variable assignment
 - Printing variables
 - Variable checking
 
 In the assignment:
 * Add four more knots
 * Assign at least TWO new variables through player choices
 * Print at least one of the variables to the player in a passage
 * Check the value of a variable and have it do something
*/

-> Intro

== Intro ==
It's a slow and numb wake up as you're unfrozen from cryogenic storage. The conveyor belt comes to a sudden stop with a loud mechanical thud, rattling your pod and julting your groggy mind awake. The freezing cold air within the cryopod pricks at your skin as feeling returns to your limbs and body. The pod door opens and with a wobbly first step you exit out onto the wide open deck of a spaceship. In the center is a woman in uniform busily typing away on her tablet. Almost on queue, she pushes up her glasses and turns to address you.

*[Approach the officer] -> Approach


== Approach ==
“Greeting Helldiver, I am the Ship Master of this Super Destroyer.” 
*Her voice was clear and monotone as if she had rehearsed her lines.
-> Monotone
-> END


== Monotone ==
“Welcome to the galactic war, all your equipment and Stratagems will be located on this deck.” 
*The Ship Master doesn’t look up from her tablet as she points out the various stations on the main deck. 
-> Look
-> END


== Look ==
“Behind me is where you will both manage the resources of this ship as well as the stratagems you use in battle.”
*She gestures behind her to an alcove filled with terminals displaying the schematics of the Super Destroyer and various other craft and vehicles carried within. 
->Alcove
-> END


== Alcove ==
“Through that hallway will be the Armory where all your equipment will be stored as well as a procurement terminal should you need better gear.”
*The Ship Master points to the open hallway with armor and weapons mounted on one side and an array of monitors installed on the other. 
->Democracy
->END


== Democracy ==
“When you're finished head up to the bridge, the Democracy officer is waiting for you.”
*With the apathetic tour of the Super Destroyer complete the Ship Master goes turns back to her tablet leaving you to your own devices.
->Hub
->END


== Hub ==
The large open deck houses all a Helldiver needs.{Armor_type}{Weapon_type}

{Armor_type == "Light armor":The weight of your armor is bearly noticable though you will need to pick and choose your battles more carefully you will always have the option to run should the situation require you to.}
{Armor_type == "Medium armor":You stand in the iconic armor of the Helldivers, ready to spread managed democracy in style and functionality.}
{Armor_type == "Heavy armor":You are a walking tank but the heavy weight of your armor makes it difficult to move effectivly. Rest assured that what ever fight you get into your armor will come out of it intact.}

{Weapon_type == "Submachine gun":The small weapon in your hands feels easy to manuver and control. A worth while exchange for it's damage capasity.  }
{Weapon_type == "Standared Rifle":The right arm of democracy rests in your hands, all you need now are the enemies in need of liberation.}
{Weapon_type == "Marksmen Rifle":A powerful weapon rests in your hands but one must get used to the conventions that govern it or it will become more of a hindrance than a helper.}

+[Stratagems] -> Stratagems_Select
+[Equipment] -> Equipment_Select
+[The Bridge] -> Bridge
+[Ship Master] -> Conversation


== Stratagems_Select ==
Select a stratagem
* [Take Orbital Artillery] -> Stratagems_Equip1
* [Take Eagle Air Support] -> Stratagems_Equip2
* [Take Sentury] -> Stratagems_Equip3
+[Go back] -> Hub
-> END

== Stratagems_Equip1 ==
The Super Destroyer is ready and able
+[Go back] ->Hub
-> END

== Stratagems_Equip2 ==
Eagle will be on station and at your disposal 
-> Eagle_type

== Stratagems_Equip3 ==
The turrets are good to go, just don't stand in front of them
-> Sentury_type

== Eagle_type ==
*[Eagle Strafing run]
    -> Hub
    
*[Eagle cluster bomb]
    -> Hub
    
+[Go back] -> Stratagems_Select

== Sentury_type ==
*[Machine gun sentury]
    -> Hub
    
*[Mortar sentury]
    -> Hub
    
+[Go back] -> Stratagems_Select


== Equipment_Select ==
Select Equipment
+[Armor] -> Armor_Equip
+[Weapons] -> Weapon_Type
*[Take Standared issue equipment] -> Equipment_Equip
+[Go back] -> Hub
-> END

VAR Weapon_type = ""
VAR Armor_type = ""

== Weapon_Type ==
The racks of the armory are loaded with weapons of all shapes and sizes.

*Submachine gun
    ~Weapon_type = "Submachine gun"
    A small and light weapon with a high rate of fire in exchanged for low damage
    -> Equipment_Select
    
*Standared Rifle
    ~Weapon_type = "Standared Rifle"
    The standared issue rifle of all Helldivers, a good balance all around
    -> Equipment_Select
    
*Marksmen Rifle
    ~Weapon_type = "Marksmen Rifle"
    A weapon ment to be fired at ranged with hard hitting recoil and rounds that hit even harder
    -> Equipment_Select
    
+[Go back] -> Equipment_Select

== Armor_Equip ==
Each suit of armor was made with a different purpose in mind. 

*Light armor
    ~Armor_type = "Light armor"
    This armor sacrifices the protection of the user in exchanged for speed and manuverability 
    -> Equipment_Select
    
*Medium armor
    ~Armor_type = "Medium armor"
    An armor with decent protection and manuverability
    -> Equipment_Select
    
*Heavy armor 
    ~Armor_type = "Heavy armor"
    A bulky and cumbersome set of armor that places the protection of the wearer above all else. 
    -> Equipment_Select
+[Go back] -> Equipment_Select

VAR Stims = 0
== Equipment_Equip ==
Stims packed and weapons at the ready
~ Stims = Stims + 4
+[Go back] -> Hub
-> END


== Conversation ==
The Ship Master looks busy but noticing your approch looks up from her tablet. 
"Is there something you need Helldiver?"
* [Busy] -> Con_1
* [Attitude] -> Con_2
* [Service] -> Con_3
* [Name] -> Con_4
+[Go back] -> Hub
-> END

== Con_1 ==
The Ship Master lets out a huff

"You would all know the half of it Helldiver."

She shakes her head, taking a more relaxed stance before continuing.

{Stratagems_Equip1: "A Super Destroyer like this one burns through more ammuniton in one Helldiver operation than a SEAF garrison does in a month."}

{Stratagems_Equip2: "Eagle may be a good pilot but her bird constantly is in need of some form of maintenance."}

{Stratagems_Equip3: "Despite all the up keep those Senturys need they've killed more Helldivers than they've saved"}

{not Stratagems_Equip1 && not Stratagems_Equip2 && not Stratagems_Equip3: "Managing an idle Super Destroyer is already a handful, you Helldivers have a nack for causing trouble both out there and in here"}


+[Go back] -> Conversation
-> END

== Con_2 ==
The Ship Master shakes her head. 

"To be honest I lost count of how many Helldivers I've had to give that speech to."

She shoots a glance at the cryopod conveyor you exited from. Many other Helldiver lay waiting to be unfrozen. 

"And there's many more after you, Helldiver."
+[Go back] -> Conversation
-> END

== Con_3 ==
A small smirk pull at the Ship Master's lips

"It took me a long time to get command of a ship of my own."

She looks you up and down

"I wonder how far you'll make it?"
+[Go back] -> Conversation
-> END 

== Con_4 ==
The Ship Master's expression harden

"It's nothing personal, cadet, but you Helldivers have a quick turn over rate."

her eyes narrow behind her glasses

"I wouldn't want anything between us if all you do is bite it on the first dive."
+[Go back] -> Conversation
-> END


== Bridge ==
{Stratagems_Equip1 || Stratagems_Equip2 || Stratagems_Equip3 && Stims>0: As you step onto the bridge of the Super Destroyer you're filled with a sense of pride. You are now about to defend both humanity and democracy itself. It’s a dream any kid worth their citizenship could have ever wanted. The large windows of the bridge peer out into the depths of space as dozens of other Super Destroyers prepare to embark on the same journey. “Helldiver.” A tall man clad in armor calls for your attention. “Your comrades are fighting to secure our freedom as we speak.” His firm tone is both commanding and inspiring at the same time. “It’s time that we joined the fray.” As you approach the holotable it displays the many worlds in need of liberation. Will you even live to see them all free or will you just as many have before you? Only time will tell, Good luck Helldiver.-> DONE| You are not ready for a Helldive}
+[Go back] -> Hub
-> END