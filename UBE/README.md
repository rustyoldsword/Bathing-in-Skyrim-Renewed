# Bathing in Skyrim - Renewed: UBE smart support (branch `ube`)

Mod page: https://dwemermods.com/mods/4508 - repacked with the author's permission.

Changes against upstream, all in `Core/Source/Scripts`:

- `mzinUBEDirtTextures.psc` (new): routes UBE actors to `mzin\Bathe\UBE\F\` / `M\`. The race is
  read natively through PapyrusUtil's `MiscUtil.GetActorRaceEditorID`; `Actor.GetRace()` is not
  used because RaceCompatibilityCondition hooks it and returns a vanilla proxy race.
- `mzinOverlayUtility.psc`
  - UBE actors always get the UBE prefix, replacing a saved `Set#` prefix from before the patch.
  - `QueueNiNodeUpdate()` after applying dirt, for every actor: SKEE stores the overlay but the body
    keeps its old skin until its 3D is rebuilt, so dirt only showed after a save/load.
  - `UpdateAlpha` now calls `NiOverride.ApplyNodeOverrides` - the gradual darkening was stored
    but never pushed.
  - `ClearDirtGameLoad` also removes UBE-prefixed overlays.

The UBE dirt textures, Zaki's UBE overlays and the voice pack shipped in the mod are not part of
this repository.

Build: `powershell -ExecutionPolicy Bypass -File UBE\build.ps1 -Game <Skyrim SE dir>`
