Class {
	#name : 'ADieTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'asserting' }
ADieTest >> should: aErrorBlock raise: anErrorClass withMessage: anErrorMessage [ 
	self should: aErrorBlock raise: anErrorClass withExceptionDo: [ :error | self assert: error messageText equals: anErrorMessage ]
]

{ #category : 'tests' }
ADieTest >> testADieIsCreatedWithAnAmountOfFacesThenThrowsFaces [

	| aDie |
	aDie := Die of: 3.
	self assert: (aDie throw between: 1 and: 3)
]

{ #category : 'tests' }
ADieTest >> testDieCannotBeCreatedWithLessThan3Faces [

	self
		should: [ Die of: 1 ]
		raise: Error
		withMessage: 'Faces should be more than 1'
]

{ #category : 'tests' }
ADieTest >> testWhenADieHasAMaximumValueTheItReturnsFaces_01 [

	| aDie |
	aDie := Die of: 3.
	self assert: aDie maximumValue equals: 3.
]

{ #category : 'tests' }
ADieTest >> testWhenDieIsThrownThenValueIsBetween1AndNumberOfFaces [

	| aDie |
	aDie := Die of: 3.
	self assert: (aDie throw between: 1 and: 3)
]
