queries - other
allInstVarNames
	"Answer an Array of the names of the receiver's instance variables. The 
	Array ordering is the order in which the variables are stored and 
	accessed by the interpreter."

	| vars |
	(self superclass == self or: [ self superclass isNil ])
		ifTrue: [vars := self instVarNames copy]	"Guarantee a copy is answered."
		ifFalse: [vars := self superclass allInstVarNames , self instVarNames].
	^vars