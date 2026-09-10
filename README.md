# Howling Whispers — Avorion Mods

A monorepo for Avorion mods maintained by Howling Whispers.

## Repository layout

Each mod lives in its own self-contained folder under `mods/`.

```text
Avorion-Mods/
├─ mods/
│  └─ r-utility-laser/
├─ docs/
├─ tools/
└─ .reference/        # local-only vanilla Avorion reference files; never committed
```

`main` is the canonical library of released and in-development mods. Individual mods do **not** get their own permanent branches. Feature branches are temporary and merge back into `main`.

## Rules

- One mod = one folder under `mods/`.
- A mod folder must be installable/packageable independently.
- Never place one mod's runtime files inside another mod's folder.
- Shared developer tooling belongs in `tools/`, not inside a mod unless the game needs it at runtime.
- Vanilla Avorion files copied for reference belong in `.reference/` and must not be committed.
- Workshop/package output belongs in `dist/` and must not be committed.

## Mods

### R-Utility Laser

A modern rebuild of the old R-Utility turret concept: one utility beam capable of both mining stone into ore and salvaging alloys into scrap, with special attention to solving automatic-targeting ambiguity.

Status: **research / clean-room rebuild**.
