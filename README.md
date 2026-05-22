# Portal2-CoopTweaks
Portal 2 Coop Tweaks is a simple script mod that modifies Co-op Maps slightly in order to improve the experience.

To install simply put the mapedits folder and mapspawn.nut file into common/Portal 2/portal2_dlc3/scripts/vscripts/


## **Main Changes/Features:**

0. **Misc:**
    - MapSpawn changes certain entity keyvalues based on current map
    - Mapspawn activates other scripts based on current map
    - All Faith Plates will now turn orange when used

1.  **Calibration:**
    - Hint to use Ping Tool in Portal Gun room has been added

2. **Hub:**
    - Hub Course 5 Entrance on Atlas's Side now has blue lights instead of orange
    - Hub Course 5 Entrances now have an extra light where there was previously one missing
    - "Annoy Lights" now work so that when pressing them, they change color
    - Low resolution catwalk models have been replaced with their higher resolution counterparts
    - Course 6 now transitions players to the correct spawn points when going from Course 6's Vactube exit back to main hub
    - Added Randomized Hub music
        - Music is now set to maximum possible value allowed by ambient_generics (10)
        - Music will be randomized even if some courses have not been revealed yet

3. **Course 1:**
    - prop_indicator_panel Entities have been moved closer to the wall in Buttons
    - Pedestal Button's Antline now properly changes colors in Laser Drill
    - Stairs In Laser Drill will remain permanently raised when the door is opened
    - Restored Unused Vactube logic in Laser Crusher
    - Fixed Broken Logic in Behind the Scenes to prevent softlocks via losing the disk
    - Fixed potential softlock in Behind the Scenes where the door could get stuck in a "closed & locked" state after pulling the third lever before the door closes

4. **Course 2:**
    - Removed the hurt trigger in Flings inside of the exit hallway
    - Made the Exit Door in Flings permanently open once it opens for the first time
    - prop_indicator_panel Entity has been moved closer to the wall in Infinifling
    - Portal Placement Helpers now lock Portals' orientation in Team Retrieval & Vertical Flings
    - Portal Placement Helper in Vertical Flings have changed their orientation
    - Moving Wall in Catapults now kills players if obstructed
    - Invisible Buttons in Fling Crusher have been fixed
        - Instead of being removed, they are now intangible and non-interactable since removing them causes timers to not play ticking sounds
    - Antline from laser reciever to the rising platform in Fling Crusher now changes colors as intended
    - Added Logic to respawn disk if fizzled by the lower Fizzler in Industrial Fan

5. **Course 3:**
    - All Pedestal Buttons, Light Bridges, and Turrets use their alternate skins to match the overgrown theme
    - Moved prop_indicator_panel Entity closer to the wall and its respective antline in Cooperative Bridges, Fling Block, & Turret Walls
    - Fixed softlock in Bridge Testing regarding getting stuck inside Sphere Receptacles
    - Fixed potential softlock in Bridge Testing where pulling both levers with 1 person can cause the other player to get left behind
    - Fixed potential softlock in Bridge Testing where pulling both levers without activating the Light Bridge button causes the Light Bridges to remain in a cycle
    - Added fizzler inside of the first room's heavy door to prevent potential softlock in Bridge Testing where players could bring the ball outside of the first room and drop it off the catwalk
    - Door in first room of Bridge Testing now closes when the ball is placed
        - This will also kill all players who are behind or inside the door when it closes
    - GLaDOS dialogue will play when players die from softlock prevention in Bridge Testing in order to help ease confusion
    - Fixed potential softlock in Bridge Testing where the level will not fade out when activating the teamhug trigger after already inserting the disk
    - Changed position of env_sprite entities in Bridge Testing to match points on the Vactube instead of being placed in the air

6. **Course 4:**
    - Moved Portal Placement Helper in Cooperative Funnels so that players do not need to move to fit through the door

7. **Course 5:**
    - Course 5 Airlocks now use correct dropper model
    - Course 5 Exit Doors now use correct button sounds (Except for Turret Ninja)
    - Changed model of the Cube Button in Propulsion Crushers to reflect map design
    - Fixed Various Antlines not working correctly in Vault Entrance
    - Added Gesture hint to Vault Entrance when reaching the final camera
        - Hint only activates when idle for long enough

8. **Credits:**
    - Co-op Bot Skins in credits are now based on both players' current skins
        - This does **NOT** reflect players' hats or miscellaneous equipped items 

9. **Course 6:**
    - Added Hidden Companion Cube to each map
    - Antlines and Exit Door will now remain permanently open once activated in Catapult Catch to prevent potential softlock
    - Assemblers In Maintenance now have their respective skins match which spawn point they drop to
        - This does **NOT** force either player to go into their respective colored Assembler
    - Fixed potential softlock in Crazier Box where players could get stuck in the wall once moved
    - Removed trigger_push Entity due to not being very good at preventing previously mentioned softlock and therefore being unnecessary

10. **Other Maps:**
    - Pedestal button in mp_coop_community_hub has been moved to be more center alligned in its Y position
    - mp_coop_fling_train beta map from Portal: Companion Collection on nintendo switch now has functioning logic
        - Intro room's Dialogue trigger has been moved to beneath player droppers so that it activates when landing instead of when the room is walked into
        - Intro room's wall panels are invisible until rotated to prevent z-fighting
        - Heavy door at the end of the first room is now visible
        - GLaDOS dialogue has been added in the first and second rooms that originally used nonfunctional/nonexistent script functions
        - The cube in the second room can now respawn, preventing softlocks
        - Trigger position in the third room has been modified to allow the button to drop down as soon as the room is entered
        - prop_indicator_panel position has been moved closer to the wall in the third room
        - The checkpoint area from the third room to the fourth room will now keep its camera active even when the checkpoint is opened
        - Portal placement helpers have been modified in the third and fourth rooms to make the infiniflings easier
        - Panel movement in the fourth room can now be activated by only one player walking into the room instead of requiring both
        - Player spawn is now set to the fifth room when the end of the fourth room is reached, so that way both players can still reach the fifth room via dying
        - End of level logic is implemented, and players will explode before returning to the hub (similar to behind the scenes areas in the final game)