# Howling Whispers — Avorion Mods

A collection of Avorion mods maintained by Howling Whispers.

## Repository layout

Each mod lives in its own self-contained **top-level folder** and must already match the exact folder structure Avorion expects when installed.

```text
Avorion-Mods/
├─ README.md
├─ RUtilityLaser/
│  ├─ modinfo.lua
│  ├─ thumb.png
│  └─ data/
│     ├─ localization/
│     ├─ textures/
│     │  └─ icons/
│     └─ scripts/
│        ├─ items/
│        ├─ lib/
│        └─ player/
├─ AdvancedBountySystem/
│  ├─ modinfo.lua
│  ├─ thumb.png
│  └─ data/
│     └─ ...
├─ _docs/
├─ _tools/
└─ .reference/        # local-only vanilla Avorion reference files; never committed
```

`main` is the canonical Howling Whispers mod collection. Individual mods do **not** get their own permanent branches. Feature branches are temporary and merge back into `main`.

## Structure rules

- One mod = one self-contained top-level folder.
- Do **not** place installable mods under an extra `mods/` directory.
- The contents of a mod folder must be directly installable into Avorion's mod directory without repackaging or path surgery.
- `modinfo.lua`, `thumb.png`, and `data/` belong at the root of each mod folder when that mod uses them.
- Runtime files must remain inside that mod's own folder.
- Never place one mod's runtime files inside another mod's folder.
- Shared development documentation belongs in `_docs/`.
- Shared developer tooling belongs in `_tools/` unless the game needs that tool at runtime.
- Vanilla Avorion files copied for API/reference purposes belong in `.reference/` and must never be committed.
- Generated Workshop ZIPs/build output should not be committed.
- Do not add an extra wrapper directory inside a distributable mod. If `RUtilityLaser/` is copied or zipped, its root must immediately contain the files Avorion expects.

## Packaging rule

For a mod such as `RUtilityLaser`, this is correct:

```text
RUtilityLaser/
├─ modinfo.lua
├─ thumb.png
└─ data/
```

This is **not** correct:

```text
mods/
└─ r-utility-laser/
   └─ RUtilityLaser/
      ├─ modinfo.lua
      └─ data/
```

The repository is a collection, but every top-level mod folder is also its own complete Avorion mod package.

## Mods

### R-Utility Laser

A modern rebuild of the old R-Utility turret concept: one utility beam capable of both mining stone into ore and salvaging alloys into scrap, with special attention to solving automatic-targeting ambiguity.

Status: **active rebuild / testing**.
