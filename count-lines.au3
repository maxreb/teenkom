#include<file.au3>
$aFLTA = _FileListToArrayRec(@ScriptDir,"*", $FLTAR_FILES,$FLTAR_RECUR )
$iTotal = 0
For $i = 1 To $aFLTA[0]
   $sFile = $aFLTA[$i]
;~    ConsoleWrite($sFile)
   If StringRight($sFile,3) = ".cs" Or StringRight($sFile, 6) = ".proto" Or StringRight($sFile, 6) = ".razor" Or StringRight($sFile, 4) = ".css" Then
	  If StringInStr($sFile,"\obj\") Then ContinueLoop
	  ConsoleWrite($sFile & @CRLF)
	  $iTotal += _FileCountLines($sFile)
   EndIf
Next
ConsoleWrite($iTotal&@CRLF)
ConsoleWrite((1200 + $iTotal) / 25)

