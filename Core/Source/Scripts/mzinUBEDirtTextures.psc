Scriptname mzinUBEDirtTextures Hidden

; Resolves Bathing in Skyrim's dirt-overlay folder for UBE actors.
;
; Detection goes through PapyrusUtil's MiscUtil.GetActorRaceEditorID, which reads
; the actor's real race natively.  Actor.GetRace() is deliberately not used here:
; RaceCompatibilityCondition hooks that Papyrus function and hands back a vanilla
; proxy race, which would hide every UBE race.  The native read is not hooked, so
; this file needs no RaceCompatibilityCondition and behaves the same with or
; without it installed.

String Function ResolvePrefix(Actor akTarget, Int aiSex) Global
	If IsUBEActor(akTarget)
		If aiSex as Bool
			Debug.Trace("[BiS UBE] Routing " + akTarget.GetLeveledActorBase().GetName() + " to \\mzin\\Bathe\\UBE\\F\\")
			Return "\\mzin\\Bathe\\UBE\\F\\"
		Else
			Debug.Trace("[BiS UBE] Routing " + akTarget.GetLeveledActorBase().GetName() + " to \\mzin\\Bathe\\UBE\\M\\")
			Return "\\mzin\\Bathe\\UBE\\M\\"
		EndIf
	EndIf
	Return ""
EndFunction

Bool Function IsUBEActor(Actor akTarget) Global
	If !akTarget
		Return False
	EndIf

	Return StringUtil.Find(MiscUtil.GetActorRaceEditorID(akTarget), "UBE") >= 0
EndFunction
