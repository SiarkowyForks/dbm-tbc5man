# DBM 5man

> Newest release available at: https://github.com/SiarkowyForks/DBM-5man

Fork of Deadly Boss Mod v3.22 modified for compatibility with
[TBC 5 Man server](https://tbc5man.com/). Works exclusively with patch 2.4.3.

## Changelog

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

## Installation

- Hit the `Clone or Download` button above and choose `Download ZIP`,
  then open the archive.
- Extract all DBM folders under `DBM-5man-master\` directory to your
  `Interface\AddOns\` location. You may safely overwrite your existing
  DBM installation.

## Bug Reports

Feel free to file any bug reports in the
[Issues](https://github.com/Siarkowy/DBM-5man/issues) section.
Examples of possible defects include:

- Encounter not starting at all
- Timers of incorrect duration
- Timers firing at wrong moments or not at all
- Health/status frames bugs

Make sure you include the following info in your bug report:

- Brief title
- Actual behaviour - How is DBM broken?
- Expected behaviour - How should DBM work? - with detailed timer values etc.

If you successfully tested the changes on live server, please also comment
in the respective issue to let others know. Thank you!

## Contributing Code

You are invited to improve this addon by opening
[pull requests](https://github.com/Siarkowy/DBM-5man/pulls). Make sure to
fork this repository, commit your change to a fresh topic branch in your
fork and finally target the PR at `develop` branch. Pull requests will be
reviewed as soon as possible. Make sure you add yourself to mod credits.
