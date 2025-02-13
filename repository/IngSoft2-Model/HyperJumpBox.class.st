Class {
	#name : 'HyperJumpBox',
	#superclass : 'Box',
	#instVars : [
		'parsecList',
		'boardLength',
		'parsecLength',
		'parsecBoxProp',
		'parsecNumber'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'adding' }
HyperJumpBox >> addParsecsList: aParsecList withBoardLenght: aBoardLength andParsecLength: aParsecLength [ 
	parsecList := (aParsecList asSortedCollection: [ :a :b | a > b ])
	              asOrderedCollection.
	boardLength := aBoardLength.
	parsecLength := aParsecLength.
	parsecBoxProp := aBoardLength / aParsecLength.
	parsecNumber := 0
]

{ #category : 'as yet unclassified' }
HyperJumpBox >> effectShips: aCollection playing: aShip [

	| parsecs positionsToMove |
	parsecs := (parsecList at: self parsecsToMove) convertToParsec.
	positionsToMove := parsecs * parsecBoxProp.
	positionsToMove := positionsToMove > 0.5
		                   ifTrue: [ positionsToMove ceiling ]
		                   ifFalse: [ positionsToMove floor ].
	aShip moves: positionsToMove.
	aShip consumeFuel: positionsToMove
]

{ #category : 'as yet unclassified' }
HyperJumpBox >> getParsecLenght [
	^parsecLength.
]

{ #category : 'as yet unclassified' }
HyperJumpBox >> getParsecList [
	^parsecList 
]

{ #category : 'as yet unclassified' }
HyperJumpBox >> initializeInPlace: aPlace [
	place := aPlace.
	parsecList := OrderedCollection new.
	parsecList add: (Parsec withValue: 7).
	parsecList add: (Parsec withValue: 5).
	parsecList add: (Parsec withValue: 2).
	parsecLength := 100.
	boardLength := 100.
]

{ #category : 'as yet unclassified' }
HyperJumpBox >> parsecBoxProportion [
	^parsecBoxProp .
]

{ #category : 'as yet unclassified' }
HyperJumpBox >> parsecsToMove [
	parsecNumber := parsecNumber < parsecList size
		                ifTrue: [ parsecNumber + 1 ]
		                ifFalse: [ 1 ].
	^parsecNumber
]
