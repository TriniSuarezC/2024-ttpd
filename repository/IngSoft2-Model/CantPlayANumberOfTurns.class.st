Class {
	#name : 'CantPlayANumberOfTurns',
	#superclass : 'State',
	#instVars : [
		'turns'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'accessing' }
CantPlayANumberOfTurns class >> skip: aNumberOfTurns [ 
	^self new initializeSkip: aNumberOfTurns.
]

{ #category : 'as yet unclassified' }
CantPlayANumberOfTurns >> checkPlay [
	^false
]

{ #category : 'as yet unclassified' }
CantPlayANumberOfTurns >> checkTurnState: aShip [ 
	self updateTurns.
	turns = 0 ifTrue: [ aShip changeStateToPlay. ^true].
	^false.
]

{ #category : 'as yet unclassified' }
CantPlayANumberOfTurns >> getContTurns [
	^turns.
]

{ #category : 'initialization' }
CantPlayANumberOfTurns >> initializeSkip: aNumberOfTurns [ 
	turns := aNumberOfTurns + 1.
]

{ #category : 'as yet unclassified' }
CantPlayANumberOfTurns >> updateTurns [
	turns := turns -1.
]
