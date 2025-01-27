<!-- Type your summary here -->
## Utils

## XML2JSON
Converts an XML file into a json file
```4d
var $xmlValue:=Folder(fk resources folder).file("XML2JSON/catalog.4DCatalog").getText()
var $jsonValue:=cs.XML2JSON.new().ConvertToJson($xmlValue)
```
