singleton Class constructor
	
Function isMacOS() : Boolean
	return (Is macOS:C1572) ? True:C214 : False:C215
	
Function isWindows() : Boolean
	return (Is Windows:C1573) ? True:C214 : False:C215
	
Function isLinux() : Boolean
	return (Not:C34(Is Windows:C1573) && Not:C34(Is macOS:C1572)) ? True:C214 : False:C215
	
Function isMono() : Boolean
	return (Application type:C494=4D Local mode:K5:1) ? True:C214 : False:C215
	
Function isServer() : Boolean
	return (Application type:C494=4D Server:K5:6) ? True:C214 : False:C215
	
Function isRemote() : Boolean
	return (Application type:C494=4D Remote mode:K5:5) ? True:C214 : False:C215
	
	