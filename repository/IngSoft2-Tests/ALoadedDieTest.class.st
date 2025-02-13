Class {
	#name : 'ALoadedDieTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'asserting' }
ALoadedDieTest >> should: aErrorBlock raise: anErrorClass withMessage: anErrorMessage [

	self
		should: aErrorBlock
		raise: anErrorClass
		withExceptionDo: [ :error |
		self assert: error messageText equals: anErrorMessage ]
]

{ #category : 'tests' }
ALoadedDieTest >> testADieCantBeCreatedWithLessThanTwoFaces [

	self
		should: [ LoadedDie of: 1 ]
		raise: Error
		withMessage: 'Faces should be more than 1'
]

{ #category : 'tests' }
ALoadedDieTest >> testWhenDieHasFiveFacesThenValuesIsFive [

	| aDie |
	aDie := LoadedDie of: 5.

	self assert: aDie throw equals: 5
]
