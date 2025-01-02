singleton Class constructor
	
Function CountOccurrencesInFile($file : 4D:C1709.File; $searchString : Text) : Integer
	var $fileContent : Text
	var $occurrences; $position; $option; $lengthFound : Integer
	$option:=sk whole word:K86:10
	If ($file.exists)
		$fileContent:=$file.getText()
		$position:=1
		While (True:C214)
			$position:=Position:C15($searchString; $fileContent; $position; $lengthFound; $option)
			If ($position=0)
				break
			End if 
			$occurrences+=1
			$position+=Length:C16($searchString)
		End while 
	End if 
	return $occurrences
	
Function CountOccurrencesInFileV2($file : 4D:C1709.File; $searchString : Text) : Integer
	var $fileContent : Text
	var $occurrences; $position; $option; $lengthFound : Integer
	$option:=sk whole word:K86:10
	If ($file.exists)
		$fileContent:=$file.getText()
		$position:=1
		While ($position>0)
			$position:=Position:C15($searchString; $fileContent; $position; $lengthFound; $option)
			If ($position>0)
				$occurrences+=1
				$position+=Length:C16($searchString)
			End if 
		End while 
	End if 
	return $occurrences
	
Function Trim($originValue : Text) : Text
	var $outputText : Text
	var $startIndex; $endIndex : Integer
	
	// Début de la chaîne sans espaces
	$startIndex:=1
	While ($startIndex<=Length:C16($originValue)) & (Character code:C91(Substring:C12($originValue; $startIndex; 1))<=32)
		$startIndex+=1
	End while 
	
	// Fin de la chaîne sans espaces
	$endIndex:=Length:C16($originValue)
	While ($endIndex>=$startIndex) & (Character code:C91(Substring:C12($originValue; $endIndex; 1))<=32)
		$endIndex-=1
	End while 
	
	// Extraire le texte entre les indices
	If ($startIndex<=$endIndex)
		$outputText:=Substring:C12($originValue; $startIndex; $endIndex-$startIndex+1)
	Else 
		$outputText:=""  // Si tout est blanc, renvoyer une chaîne vide
	End if 
	
	return ($outputText)
	
Function incrementSharedCounter($value : Text)
	var $incrementValue : Integer:=1
	Use (Storage:C1525)
		If (Storage:C1525.data=Null:C1517)
			Storage:C1525.data:=New shared object:C1526
		End if 
		Use (Storage:C1525.data)
			If (Storage:C1525.data[$value]#Null:C1517)
				$incrementValue:=Num:C11(Storage:C1525.data[$value])+1
			End if 
			Storage:C1525.data[$value]:=$incrementValue
		End use 
	End use 