# Portal2-CoopTweaks
Portal 2 Coop Tweaks is a simple script mod that modifies Co-op Maps slightly in order to improve the experience.
Written By:
    LittleBlueBox

## **Help From:**
- [ServerClown](https://github.com/TestAccount-4)  
- [PortalRunner's ppmod Library](https://github.com/p2r3/ppmod)
  - Note that ppmod is not used anywhere in this mod, nor is it required to have installed. It was simply used as a reference.


## **Installation:**

1. **Normal Installation:**  
    To install simply put the mapedits folder and mapspawn.nut file into one of the game's common directories' "scripts/vscripts" folder.
    - eg. ```portal2/scripts/vscripts/```, ```portal2_dlc1/scripts/vscripts/```, ```portal2_dlc2/scripts/vscripts/```, ```portal2_dlc3/scripts/vscripts/```, etc.

2. **Merged Installation:**  
    To merge this mod with other mods that overwrite ```mapspawn.nut```, do the following:

    1. Rename the ```mapspawn.nut``` file from **__THIS__** mod and rename the file to whatever file name you want
    2. Place these files inside of one of the game's common directories' "scripts/vscripts" folder
        - eg. ```portal2/scripts/vscripts/```, ```portal2_dlc1/scripts/vscripts/```, ```portal2_dlc2/scripts/vscripts/```, ```portal2_dlc3/scripts/vscripts/```, etc.
    3. Inside the **__OTHER__** mod's ```mapspawn.nut```, write/paste the command: ```IncludeScript([Name of Co-op Tweaks File Here])```, replacing ```[Name of Co-op Tweaks File Here]``` with the name and path to your file starting from the scripts/vscripts folder
        - eg. If you renamed the file to: ```cooptweaks.nut``` and left it inside of the vscripts folder, put ```IncludeScript("cooptweaks.nut")```

3. **VPK Installation:**  
    To install, simply put the ```pak00_dir.vpk``` (or ```pak99_dir.vpk``` for ```v1.0.1```) file into one of the game's common directories.  
        - eg. ```portal2/```, ```portal2_dlc1/```, ```portal2_dlc2/```, ```portal2_dlc3/```, etc.  
    Once the file is placed, rename it so that its number is the highest pak number that comes next in the sequence (starting at ```pak01_dir.vpk```)  
        - eg. If the folder you're placing it in already has ```pak01_dir.vpk``` rename the co-op tweaks file to ```pak02_dir.vpk```, if a ```pak02_dir.vpk``` file already exists rename the file to ```pak03_dir.vpk```, etc.  
        - The pak number will not be read automatically by the game as a valid VPK if the pak number is below 01 (00, -01, -02, etc.)  
        - If the pak number skips a number (eg. naming the co-op tweaks file to ```pak04_dir.vpk``` without having a ```pak03_dir.vpk``` file) the game will not read the VPK automatically  

- Note that the VPK version of the mod is the **__ONLY__** one to have the modified Hub ```soundscript``` as of right now.


## **Main Changes/Features:**

0. **Misc:**
    - MapSpawn modifies certain entity properties based on current map
    - MapSpawn activates other scripts based on current map
    - All Faith Plates will now turn orange when used

1.  **Calibration:**
    - Hint to use Ping Tool in Portal Gun room has been added
    - Glass panel doors now face towards players instead of facing away from players
    - Fixed potential softlock in Portal Gun room where falling into the Portal Gun's hole was inescapable

2. **Hub:**
    - Hub Course 5 Entrance on Atlas's Side now has blue lights instead of orange
    - Hub Course 5 Entrances now have an extra light where there was previously one missing
    - "Annoy Lights" now work so that when pressing them, they change color
    - Low resolution catwalk models have been replaced with their higher resolution counterparts
    - Course 6 now transitions players to the correct spawn points when going from Course 6's Vactube exit back to main hub
    - Added Randomized Hub music
        - Music is now set to the maximum possible value allowed by ```ambient_generic``` entities (10)
        - Music will be randomized even if some courses have not been revealed yet

3. **Course 1:**
    - ```prop_indicator_panel``` entities have been moved closer to the wall in Buttons
    - Pedestal Button's Antline now properly changes colors in Laser Drill
    - Stairs in Laser Drill will remain permanently raised when the door is opened
    - Restored Unused Vactube logic in Laser Crusher
    - Fixed Broken Logic in Behind the Scenes to prevent softlocks via losing the disk
    - Fixed potential softlock in Behind the Scenes where the door could get stuck in a "closed & locked" state after pulling the third lever before the door closes

4. **Course 2:**
    - Removed the hurt trigger in Flings inside of the exit hallway
    - Made the exit door in Flings permanently open once it opens for the first time
    - ```prop_indicator_panel``` has been moved closer to the wall in Infinifling
    - Portal placement helpers now lock portals' orientation in Team Retrieval & Vertical Flings
    - Portal placement helper in Vertical Flings changed its orientation to make players face the same direction when falling
    - Moving wall in Catapults now kills players if obstructed
    - Invisible buttons in Fling Crusher have been made intangible and non-interactable
        - Removing them outright causes timers to not play ticking sounds
    - Antline from laser receiver to the rising platform in Fling Crusher now changes colors as intended
    - Added logic to respawn disk if fizzled by the lower Fizzler in Industrial Fan

5. **Course 3:**
    - All Pedestal Buttons, Light Bridges, and Turrets use their alternate skins to match the overgrown theme
    - Moved ```prop_indicator_panel``` closer to the wall and its respective antline in Cooperative Bridges, Fling Block, & Turret Walls
    - Fixed softlock in Bridge Testing regarding getting stuck inside Sphere Receptacles
    - Fixed potential softlock in Bridge Testing where pulling both levers with 1 person can cause the other player to get left behind
    - Fixed potential softlock in Bridge Testing where pulling both levers without activating the Light Bridge button causes the Light Bridges to remain in a cycle
    - Added fizzler inside of the first room's heavy door to prevent potential softlock in Bridge Testing where players could bring the ball outside of the first room and drop it off the catwalk
    - Added new trigger outside of the first room to kill players and fizzle objects when thrown off the catwalk
        - Whilst the previous change is no longer needed due to this change being added in ```v1.2.1```, it was kept intact due to visuals and visual clarity
    - Door in first room of Bridge Testing now closes when the ball is placed
        - This will also kill all players who are behind or inside the door when it closes
    - GLaDOS dialogue will play when players die from softlock prevention in Bridge Testing in order to help ease confusion
    - Fixed potential softlock in Bridge Testing where the level will not fade out when activating the ```teamhug``` trigger after already inserting the disk
    - Changed position of ```env_sprite``` entities in Bridge Testing to match points on the Vactube instead of being placed in the air

6. **Course 4:**
    - Moved Portal Placement Helper in Cooperative Funnels so that players do not need to move to fit through the door
    - Added functionality to stand on the moving floor in Funnel Catch
    - Stairs in Funnel Laser will remain permanently raised when the door is opened
    - Panels in Cooperative Polarity will remain permanently raised when the door is opened

7. **Course 5:**
    - Course 5 Airlocks now use correct dropper model
    - Course 5 exit doors now use correct button sounds (Except for Turret Ninja)
    - Fixed various Antlines not working correctly in Vault Entrance
    - Added Gesture hint to Vault Entrance when reaching the final camera
        - Hint only activates when idle for long enough

8. **Credits:**
    - Co-op Bot Skins in credits are now based on both players' current skins
        - This does **NOT** reflect players' hats or miscellaneous equipped items 

9. **Course 6:**
    - Added Hidden Companion Cube to each map
    - Antlines and exit door will now remain permanently open once activated in Catapult Catch to prevent potential softlock
    - Assemblers in Maintenance now have their respective skins match which spawn point they drop to
        - This does **NOT** force either player to go into their respective colored Assembler
    - Fixed potential softlock in Crazier Box where players could get stuck in the wall once moved
    - Removed ```trigger_push``` due to not being very good at preventing previously mentioned softlock and therefore being unnecessary

10. **Other Maps:**
    - Pedestal button in ```mp_coop_community_hub``` has been moved to be more centrally aligned in its Y position
    - ```mp_coop_fling_train``` beta map from Portal: Companion Collection on Nintendo Switch now has functioning logic
        - Intro room's Dialogue trigger has been moved to beneath player droppers so that it activates when landing instead of when the room is walked into
        - Intro room's wall panels are invisible until rotated to prevent z-fighting
        - Heavy door at the end of the first room is now visible
        - GLaDOS dialogue has been added in the first and second rooms that originally used nonfunctional/nonexistent script functions
        - The cube in the second room can now respawn, preventing softlocks
        - Trigger position in the third room has been modified to allow the button to drop down as soon as the room is entered
        - ```prop_indicator_panel``` position has been moved closer to the wall in the third room
        - The checkpoint area from the third room to the fourth room will now keep its camera active even when the checkpoint is opened
        - Portal placement helpers have been modified in the third and fourth rooms to make the infiniflings easier
        - Panel movement in the fourth room can now be activated by only one player walking into the room instead of requiring both
        - Player spawn is now set to the fifth room when the end of the fourth room is reached
            - This is so that both players can still reach the fifth room when the top player leaves the bottom player behind via the bottom player dying
        - End of level logic is implemented, and players will explode before returning to the hub (similar to behind the scenes areas in the final game)
            - Despite the beta disassembly room existing, death transition felt more natural with dialogue and was likely even intended based on the names of certain entities.