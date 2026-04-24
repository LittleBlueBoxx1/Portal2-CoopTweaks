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
    * Hub Course 5 Entrance on Atlas's Side now has blue lights instead of orange
    * Hub Course 5 Entrances now have an extra light where there was previously one missing
    * Rainbow Annoy Lights now work so that when pressing them, they change color
    * Rainbow Annoy Lights colorization code now allows for more vibrant visuals
    * Low resolution catwalk models have been replaced with their higher resolution counterparts
    * Course 6 now transitions players to the correct spawn points when going from Course 6's Vactube exit back to main hub
    * Added Randomized Hub music
        * Music is now set to maximum possible value allowed by ambient_generics (10)
        * Music will be randomized even if some courses have not been revealed yet

3. **Course 1:**
    - prop_indicator_panel Entities have been moved closer to the wall in Buttons
    - Pedestal Button's Antline now properly changes colors in Laser Drill
    - Stairs In Laser Drill will remain permanently raised when the door is opened
    - Restored Unused Vactube logic in Laser Crusher
    - Fixed Broken Logic in Behind the Scenes to prevent softlocks via losing the disk
    - Fixed potential softlock in Behind the Scenes where the door could get stuck in a "closed & locked" state after pulling the third lever

4. **Course 2:**
    - Removed the trigger_hurt entity in Flings
    - Made the Exit Door in Flings permanently open once it opens for the first time
    - prop_indicator_panel Entity has been moved closer to the wall in Infinifling
    - Portal Placement Helpers now lock Portals' orientation in Team Retrieval & Vertical Flings
    - Portal Placement Helper in Vertical Flings have changed their orientation
    - Moving Wall in Catapults now kills players if obstructed
    * Invisible Buttons in Fling Crusher have been fixed
        * Instead of being removed, they are now intangible and non-interactable since removing them causes timers to not play ticking sounds
    - Added Logic to respawn disk if fizzled by the lower Fizzler in Industrial Fan

5. **Course 3:**
    * All Pedestal Buttons, Light Bridges, and Turrets use their alternate skins to match the overgrown theme
    - Moved prop_indicator_panel Entity closer to the wall and its respective antline in Cooperative Bridges, Fling Block, & Turret Walls
    - Fixed softlock in Bridge Testing regarding getting stuck inside Sphere Receptacles
    - Fixed potential softlock in Bridge Testing where pulling both levers with 1 person can cause the other player to get left behind
    - Fixed potential softlock in Bridge Testing where pulling both levers without activating the Light Bridge button causes the Light Bridges to remain in a cycle

6. **Course 4:**
    - Moved Portal Placement Helper in Cooperative Funnels so that players do not need to move to fit through the door

7. **Course 5:**
    - Course 5 Airlocks now use correct dropper model
    - Course 5 Exit Doors now use correct button sounds (Except for Turret Ninja)
    - Changed model of the Cube Button in Propulsion Crushers to reflect map design
    - Fixed Various Antlines not working correctly in Vault Entrance
    - Added Gesture hint to Vault Entrance when reaching the final camera
        * Hint only activates when idle for long enough
    - **Credits:**
        - Co-op Bot Skins in credits are now based on both player's current skins

8. **Course 6:**
    - Added Hidden Companion Cube to each map
    - Antlines and Exit Door will now remain permanently open once activated in Catapult Catch
    - Assemblers In Maintenance are now properly color coded to which spawn point it leads to
        - Note: This does **NOT** force either player to go into their respective colored Assembler
    - Fixed potential softlock in Crazier Box where players could get stuck in the wall once moved
    - Removed trigger_push Entity due to not being very good at preventing previously mentioned softlock and therefore being unnecessary