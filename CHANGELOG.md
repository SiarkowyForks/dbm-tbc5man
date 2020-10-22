# DBM 5man

## CHANGELOG

### v3.22.1092

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

### v3.22.1083

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

### v3.22.1080

- Magtheridon's Lair: Fixed encounter not starting.
- Black Temple/Supremus: Fixed phase tracking & focused gaze timers.
- Black Temple/Mother Shahraz: Corrected Enrage timers.
- Hyjal Summit/Archimonde: Corrected Enrage timers.
- Zul'Aman/Akil'zon: Corrected Storm timer.
- Sunwell/Brutallus: Corrected Stomp timer, it ticks every second to aid healer.
- Sunwell/Brutallus: Warn when Meteor Slash hits Burned targets (togglable).
- Sunwell/M'uru: Fixed first Darkness not being reported.
- Sunwell/Kil'jaeden: Fixed transition to phase 2.
