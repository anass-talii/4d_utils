//%attributes = {}
// How to use
var $xmlValue:=Folder:C1567(fk resources folder:K87:11).file("XML2JSON/catalog.4DCatalog").getText()
var $jsonValue:=cs:C1710.XML2JSON.new().ConvertToJson($xmlValue)

// the test
cs:C1710.FileUtils.me.saveFile(JSON Stringify:C1217($jsonValue); "XML2JSON/jsonResult.json")
var $expectedJson:=cs:C1710.FileUtils.me.getFileContent(Folder:C1567(fk resources folder:K87:11; *).file("XML2JSON/ExpectedJson.json").path)
ASSERT:C1129(JSON Stringify:C1217($jsonValue)=$expectedJson; "the value must be the same")