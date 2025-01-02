singleton Class constructor
	
	
Function saveFile($fileContent : Text; $fileNameWithExtension : Text)
	Folder:C1567(fk resources folder:K87:11; *).file($fileNameWithExtension).setText($fileContent)
	
	
Function getFileContent($fileNameWithPathAndExtension : Text) : Text
	return File:C1566($fileNameWithPathAndExtension).getText()
	
	