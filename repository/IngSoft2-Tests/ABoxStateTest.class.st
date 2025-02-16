Class {
	#name : 'ABoxStateTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
ABoxStateTest >> test_01_WhenABoxIsCreatedThenTheStateIsNormal [

	| aBox |
	aBox := Box inPlace: 1.
	self assert: (aBox state isKindOf: NormalBox).
]

{ #category : 'tests' }
ABoxStateTest >> test_02_WhenANormalBoxIsAskedToChangeItsStateThenItChangesToReversal [
	
	| aNormalBox |
	aNormalBox := NormalBox new.
	self assert: ((aNormalBox changeState) isKindOf: ReversalBox).
]

{ #category : 'tests' }
ABoxStateTest >> test_03_WhenAReversalBoxIsAskedToChangeItsStateThenItChangesToNormal [
	
	| aReversalBox |
	aReversalBox := ReversalBox new.
	self assert: ((aReversalBox changeState) isKindOf: NormalBox ).
]
