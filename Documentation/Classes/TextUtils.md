<!-- Type your summary here -->
## TextUtils

## CountOccurrencesInFile
searches for a word in a file and returns the number of times it was found
```4d
var $file : 4D.File
$file:=Folder(fk resources folder).file("myFile")
$file.setText("Hi, this is a fake text for testing the CountOccurencesInFiles singleton, Hi again, thanx for all")
ASSERT(cs.TextUtils.me.CountOccurrencesInFileV2($file; "Hi")=2; "")
```

## TRIM
Deletes spaces from the beginning and end of a character string
```4d
ASSERT(cs.TextUtils.me.Trim("   Hello, I am here!    ")="Hello, I am here!"; "")
```
## IncrementSharedCounter
counts the number of times a string is entered
```4d
cs.TextUtils.me.IncrementSharedCounter("myValue")
cs.TextUtils.me.IncrementSharedCounter("myValue")
ASSERT(Storage.data["myValue"]=2; "")
```