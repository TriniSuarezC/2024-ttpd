Class {
	#name : 'ALoadedDieWithSequenceTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'asserting' }
ALoadedDieWithSequenceTest >> should: aErrorBlock raise: anErrorClass withMessage: anErrorMessage [
	self
		should: aErrorBlock
		raise: anErrorClass
		withExceptionDo: [ :error |
		self assert: error messageText equals: anErrorMessage ]
]

{ #category : 'tests' }
ALoadedDieWithSequenceTest >> testALoadedDieOf4FacesReturnsASequenceFrom1To4WhenThrown [

	| aLoadedDieWithSequence |
	aLoadedDieWithSequence := LoadedDieWithSequence loadedWithSequence:
		                          #( 1 2 3 4 ).
	self assert: aLoadedDieWithSequence throw equals: 1.
	self assert: aLoadedDieWithSequence throw equals: 2.
	self assert: aLoadedDieWithSequence throw equals: 3.
	self assert: aLoadedDieWithSequence throw equals: 4
]

{ #category : 'tests' }
ALoadedDieWithSequenceTest >> testALoadedDieOf5FacesReturnsASequenceFrom1To5WhenThrown [

	| aLoadedDieWithSequence |
	aLoadedDieWithSequence := LoadedDieWithSequence loadedWithSequence:
		                          #( 1 2 3 4 5 ).
	self assert: aLoadedDieWithSequence throw equals: 1.
	self assert: aLoadedDieWithSequence throw equals: 2.
	self assert: aLoadedDieWithSequence throw equals: 3.
	self assert: aLoadedDieWithSequence throw equals: 4.
	self assert: aLoadedDieWithSequence throw equals: 5
]

{ #category : 'tests' }
ALoadedDieWithSequenceTest >> testALoadedDieOfNFacesReturnsASequenceFrom1ToNWhenThrown [

	| aLoadedDieWithSequence |
	aLoadedDieWithSequence := LoadedDieWithSequence loadedWithSequence:
		                          #( 1 2 3 ).

	self assert: aLoadedDieWithSequence throw equals: 1.
	self assert: aLoadedDieWithSequence throw equals: 2.
	self assert: aLoadedDieWithSequence throw equals: 3
]

{ #category : 'tests' }
ALoadedDieWithSequenceTest >> testALoadedDieWithSequenceCannotBeCreatedWithLessThan3Faces [

	| aLoadedDieWithSequence |
	self
		should: [ aLoadedDieWithSequence := LoadedDieWithSequence of: 2 ]
		raise: Error
		withMessage: 'A Die cannot be createdWith less of 3 faces'
]

{ #category : 'tests' }
ALoadedDieWithSequenceTest >> testALoadedDieWithSequenceIsInitializedWithASequenceThenItThrowsTheSequence [

	| aLoadedDieWithSequence |
	aLoadedDieWithSequence := LoadedDieWithSequence loadedWithSequence:
		                          #( 1 2 3 ).

	self assert: aLoadedDieWithSequence throw equals: 1.
	self assert: aLoadedDieWithSequence throw equals: 2.
	self assert: aLoadedDieWithSequence throw equals: 3
]
