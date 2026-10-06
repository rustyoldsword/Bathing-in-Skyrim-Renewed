Scriptname NiOverride Hidden

Bool Function HasOverlays(ObjectReference akActor) Global Native
Function AddOverlays(ObjectReference akActor) Global Native
Function AddNodeOverrideString(ObjectReference akActor, Bool abGender, String asNode, Int aiKey, Int aiIndex, String asValue, Bool abPersist) Global Native
Function AddNodeOverrideInt(ObjectReference akActor, Bool abGender, String asNode, Int aiKey, Int aiIndex, Int aiValue, Bool abPersist) Global Native
Function AddNodeOverrideFloat(ObjectReference akActor, Bool abGender, String asNode, Int aiKey, Int aiIndex, Float afValue, Bool abPersist) Global Native
Function RemoveNodeOverride(ObjectReference akActor, Bool abGender, String asNode, Int aiKey, Int aiIndex) Global Native
Function ApplyNodeOverrides(ObjectReference akActor) Global Native
String Function GetNodeOverrideString(ObjectReference akActor, Bool abGender, String asNode, Int aiKey, Int aiIndex) Global Native
Int Function GetNodeOverrideInt(ObjectReference akActor, Bool abGender, String asNode, Int aiKey, Int aiIndex) Global Native
Float Function GetNodeOverrideFloat(ObjectReference akActor, Bool abGender, String asNode, Int aiKey, Int aiIndex) Global Native
Int Function GetNumBodyOverlays() Global Native
Int Function GetNumHandOverlays() Global Native
Int Function GetNumFeetOverlays() Global Native
Int Function GetNumFaceOverlays() Global Native
