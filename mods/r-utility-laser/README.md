# R-Utility Laser

Clean-room rebuild of the old R-Utility turret concept.

## Goal

Create one utility turret that can:

- manually mine asteroids into ore;
- manually salvage wrecks/alloys into scrap;
- retain separate stone and metal efficiency behavior;
- support automatic use without the old mining-vs-salvaging identity conflict.

## Current phase

First playable prototype.

The prototype is deliberately based on a vanilla Raw Mining Laser and then adds raw-metal efficiency plus hull-focused damage. This gives us a conservative starting point for validating the old behavior without immediately patching Avorion's automatic-targeting internals.

Automatic dual-role targeting is **not considered solved yet**. That remains the main R-Utility v2 engineering task.

## Starter equipment

For development/testing, each player receives **4 Common Iron R-Utility Turrets** the first time the mod initializes for that player.

The grant is protected by a persistent player value so reconnecting/reloading does not keep handing out more turrets. During development, enabling the mod in an existing save will also trigger the one-time grant for that player; a later pass can restrict this strictly to newly-created players once current callback behavior is verified against the installed game scripts.

Current starter prototype values intentionally prioritize testability over final balance:

- Iron material
- Tech 1
- Common rarity
- minimum 55% raw stone efficiency
- minimum 45% raw metal efficiency
- 7.5x minimum hull damage multiplier
- no shield damage

## Compatibility target

Avorion 2.x. Exact minimum version will be tightened after validation against the user's current vanilla installation/API documentation.

## Development rule

Do not copy current vanilla Avorion source into this folder. Local reference copies belong in repository-level `.reference/` only.
