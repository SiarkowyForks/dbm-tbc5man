# DBM 5man

## CHANGELOG

### v3.22.1100 "Many Whelps!" (2020-10-23)

- Sunwell/Entropius: Added a timer for Dark Fiend dispels.
- Sunwell/Kil'jaeden: Fixed losing timers in Dragon form due to combat reset.
- Sunwell/Kil'jaeden: Fixed Darkness timers to be in line with live server.
  Timers now properly account for Kil'jaeden channeling Darkness, and a warning
  is shown 15 secs before Darkness begins. Final phase timers were reworked too.
  The timer might be slightly rushing if the boss is still casting Soul Flay etc.
- TBC 5 Man/Emerald Dream Ysondre: Implemented tracking of Mushrooms & Elks.
- TBC 5 Man/Onyxia Tier 6.5: Implemented tracking for most parts of the fight.
    - Tunnel: Announce teleports, egg hatching, and hitting the flame walls.
    - Razorgore the Untamed: Track Fire Nova & Conflagration.
    - Broodlord Lashlayer: Track Rain of Fire & Blast Wave.
    - Phase 3: Track Eggs & Bellowing Roar. Use your aggro reducing abilities!
    - Huge thanks to Perle & co. of Hex for provided sniffs and Raiders of oof
      for field testing during wipe nights, followed by a fresh evening one shot!
- Misc: Introduced a [THANKS](THANKS.md) file to credit all people who influenced the project.

### v3.22.1092 "Kel'Thuzad" (2020-06-19)

- Black Temple/Illidan Stormrage: Corrected Enrage timer (now 20 mins).
- Sunwell/Kalecgos: Fixed combat recognition & boss health frame. Health syncing
  is backwards incompatible (it is now %-based instead of absolute HP).
  For best experience, all raid members need to upgrade.
- Sunwell/Brutallus: Adjusted Burn timers (now 20 secs).
- Sunwell/Felmyst: Fixed phase change/Deep Breath timers. Air phase timer
  doesn't take into account the rare case of late Encapsulate + Gas Nova combo;
  phase timers will correct on phase switch.
- Naxxramas/Sapphiron: Rewrote stock mod for compatibility with TBC 5 Man.
  - Added phase announcement incl. "No more Air Phase" warning at 10% HP.
  - Ground Phase: Added Life Drain/soon announce. First one is random, however.
  - Ground Phase: Added special warning for Chill, enabled by default.
  - Air Phase: Combine Icebolt/Ice Bomb timers into a single "Stay Behind: target".
  - Air Phase: Disabled Icebolt ping by default as its function is already
    provided by Stay Behind timer + Icebolt announce.
  - Color coded announcements to emphasize Life Drains/Icebolts.
- Naxxramas/Kel'Thuzad: Rewrote stock mod for compatibility with TBC 5 Man.
  - Added Enrage timer (12 mins).
  - Modified phase tracking and added "Phase 2 soon" warning (10 seconds prior).
  - Added timer & warnings for Sinister Reflection/Exploding Shadow.
  - Added special warning & local timer for Shadow Fissure (enabled by default).
  - Allowed whispering Shadow Fissure/Detonate Mana targets (requires announce).
  - Removed icon marking for Detonate Mana target.
  - Color coded announcements, emphasizing Fissures/Frost Blasts.

### v3.22.1083 "Kil'jaeden" (2020-04-26)

- TBC 5 Man/Buff Bots: Add despawn timer & announce.
- TBC 5 Man/World Buff: Add trigger timer & announce.
- Karazhan/Netherspite: Show special warning for 15+ Blue/Red debuff stacks.
- Black Temple/Mother Shahraz: Icon targeting is now a togglable option.
- Black Temple/Illidari Council: Corrected Enrage timer (now 12 mins).
- Sunwell/Brutallus: Fixed missing Enrage timer (6 mins).
- Sunwell/Brutallus: Granular Stomp announce is now a togglable option.
- Sunwell/Entropius: Show special warning while standing in Void Zones.
- Sunwell/Kil'jaeden: Fixed encounter recognition & phase switch warnings.
- Sunwell/Kil'jaeden: Fixed/reworked "Darkness soon" warning to mean
  the proper time for tank to go & grab the next available Dragon Orb.
- Misc: Fixed a bug related to timer sync mismatch that affected a few bosses
  (Akil'zon, Archimonde, Mother Shahraz, M'uru).
- Misc: Mod versioning changed to v(MAJOR).(MINOR).(REVISION). This is in
  order to stay in line with what DBM version check (/dbm version) reports.

### v3.22.1080 "M'uru" (2019-11-26)

- Magtheridon's Lair: Fixed encounter not starting.
- Black Temple/Supremus: Fixed phase tracking & focused gaze timers.
- Black Temple/Mother Shahraz: Corrected Enrage timers.
- Hyjal Summit/Archimonde: Corrected Enrage timers.
- Zul'Aman/Akil'zon: Corrected Storm timer.
- Sunwell/Brutallus: Corrected Stomp timer, it ticks every second to aid healer.
- Sunwell/Brutallus: Warn when Meteor Slash hits Burned targets (togglable).
- Sunwell/M'uru: Fixed first Darkness not being reported.
- Sunwell/Kil'jaeden: Fixed transition to phase 2.
