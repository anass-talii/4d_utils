//%attributes = {}


// Test CountOccurrencesInFileV2
var $file : 4D:C1709.File
$file:=Folder:C1567(fk resources folder:K87:11).file("myFile")
$file.setText("Hi, this is a fake text for testing the CountOccurencesInFiles singleton, Hi again, thanx for all")
ASSERT:C1129(cs:C1710.TextUtils.me.CountOccurrencesInFileV2($file; "Hi")=2; "")

//Test Trim
ASSERT:C1129(cs:C1710.TextUtils.me.Trim("   Hello, I am here!    ")="Hello, I am here!"; "")