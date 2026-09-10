# R-Utility Laser

Clean-room rebuild of the old R-Utility turret concept.

## Goal

Create one utility turret that can:

- manually mine asteroids into ore;
- manually salvage wrecks/alloys into scrap;
- retain separate stone and metal efficiency behavior;
- support automatic use without the old mining-vs-salvaging identity conflict.

## Current phase

Research and API verification.

The old implementation proved that dual resource conversion could work manually. The unresolved problem was autonomous target classification: automatic turret logic expected a single weapon role and became unreliable when one turret tried to represent both mining and salvaging.

The rebuild will therefore treat automatic targeting as a first-class subsystem rather than simply assigning two behaviors to one vanilla weapon type.

## Compatibility target

Current Avorion 2.x. Exact minimum version will be set after validating against current vanilla scripts.

## Development rule

Do not copy current vanilla Avorion source into this folder. Local reference copies belong in repository-level `.reference/` only.
