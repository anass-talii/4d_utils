
property stacks : Collection

Class constructor
	This:C1470.stacks:=New collection:C1472
	
Function saveToFile($fileName; $data)
	Folder:C1567(fk resources folder:K87:11).file($fileName).setText($data)
	
	//END NEW
	
	// Fonction pour obtenir les attributs d'un élément XML
Function GetXMLAttributes($xmlElement; $attributeCollection)
	var $i : Integer
	var $attriName; $attriValue : Variant
	var $numAttributes:=DOM Count XML attributes:C727($xmlElement)
	For ($i; 1; $numAttributes)
		DOM GET XML ATTRIBUTE BY INDEX:C729($xmlElement; $i; $attriName; $attriValue)
		$attributeCollection[$attriName]:=$attriValue
	End for 
	
	// Fonction pour obtenir les informations d'un élément XML
Function GetXMLInfo($xmlElement; $info)
	var $baliseAttribute:=New object:C1471
	var $name:=""
	
	This:C1470.GetXMLAttributes($xmlElement; $baliseAttribute)
	
	DOM GET XML ELEMENT NAME:C730($xmlElement; $name)
	$info["Attribute"]:=$baliseAttribute
	$info["Name"]:=$name
	
	// Fonction récursive pour traiter un élément XML et ses enfants
Function ProcessElement($xmlElement : Text; $stack : Collection)
	var $baliseInfo:=New object:C1471
	var $coll1:=New collection:C1472
	var $childElement:=$xmlElement
	var $nextChildElement:=""
	var $childName; $childValue : Variant
	// Obtenir les informations de l'élément courant
	This:C1470.GetXMLInfo($xmlElement; $baliseInfo)
	
	// Traiter les enfants
	var $xml_Child_Ref:=DOM Get first child XML element:C723($xmlElement; $childName; $childValue)
	
	While ($xml_Child_Ref#"00000000000000000000000000000000")
		// Appel récursif pour chaque enfant
		This:C1470.ProcessElement($xml_Child_Ref; $coll1)
		$xml_Child_Ref:=DOM Get next sibling XML element:C724($xml_Child_Ref; $childName; $childValue)
	End while 
	
	If ($coll1.length>0)
		$baliseInfo["child"]:=$coll1
	End if 
	
	$stack.push($baliseInfo)
	
	
Function ConvertToJson($xmlValue : Text) : Collection
	var $xml_Parent_Ref:=DOM Parse XML variable:C720($xmlValue)
	This:C1470.ProcessElement($xml_Parent_Ref; This:C1470.stacks)
	return This:C1470.stacks