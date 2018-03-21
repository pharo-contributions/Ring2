tests
testCopying

	| env class classVariable1 classVariable2 copy |

	class := RG2Class unnamed.
	env := class environment.

	classVariable1 := RG2ClassVariable named: #ClassVariable1 parent: class.
	classVariable2 := RG2ClassVariable named: #ClassVariable2 parent: class.

	class addClassVariable: classVariable1.
	self assert: class behaviorStrategy classVariables size equals: 1.
	self assert: (class classVariables allSatisfy: [ :each | each parent == class]).

	copy := class copyForBehaviorDefinition.
	class behaviorStrategy classVariables.

	self deny: (copy == class).
	self assert: (copy behaviorStrategy owner == copy).
	self deny: (class behaviorStrategy == copy behaviorStrategy).
	self deny: ((class behaviorStrategy instVarNamed: #classVariables) == (copy behaviorStrategy instVarNamed: #classVariables)).
	self deny: (class behaviorStrategy owner == copy behaviorStrategy owner).
	self assert: (class behaviorStrategy owner == class).
	self assert: (copy behaviorStrategy owner == copy).
	self assert: (class classVariables allSatisfy: [ :each | each parent == class]).
	self deny: ((class classVariables first) == (copy classVariables first)).

	self assert: class behaviorStrategy classVariables size equals: 1.