initialization
initialize

	super initialize.
	
	superclass := RG2UnresolvedValue recursive.
	localMethods := self unresolvedValue: self defaultLocalMethods.
	protocols := self unresolvedValue: self defaultProtocols.
	traitComposition := self unresolvedValue: self defaultTraitComposition.