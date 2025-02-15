Class {
	#name : 'ACantPlayStateTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
ACantPlayStateTest >> testWhenACantPlayStateIsCreatedThenANumberOfTurnsIsSaved_01 [ 
	| aCantPlayState |
	aCantPlayState := CantPlayANumberOfTurns skip: 2.
	self assert: aCantPlayState getContTurns equals: 3.
]

{ #category : 'tests' }
ACantPlayStateTest >> testWhenCantPlayStateUpdatesItsTurnsThenTurnsDecreacedBy1_02 [
	| aCantPlayState |
	aCantPlayState := CantPlayANumberOfTurns skip: 2.
	aCantPlayState updateTurns.
	self assert: aCantPlayState getContTurns equals: 2.
]
