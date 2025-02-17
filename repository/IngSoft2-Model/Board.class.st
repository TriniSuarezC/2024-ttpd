Class {
	#name : 'Board',
	#superclass : 'Object',
	#instVars : [
		'boxes',
		'lastBoxPlayed'
	],
	#classInstVars : [
		'boxes'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Board class >> withBoxesArray: aBoxesArray [

	aBoxesArray size < 4 ifTrue: [
		Error signal: 'A Board must have at least 3 box to be created' ].

	^ self new initializeWithBoxesArray: aBoxesArray
]

{ #category : 'testing' }
Board >> boardSize [
	^boxes size.
]

{ #category : 'accessing' }
Board >> boxes [
	^ boxes
]

{ #category : 'as yet unclassified' }
Board >> checkAfterEffects: aCollectionOfShips [

	aCollectionOfShips do: [ :aShip | self checkPositionOf: aShip ]
]

{ #category : 'as yet unclassified' }
Board >> checkPositionOf: aShip [

	| actualPosition |
	actualPosition := aShip getPosition.


	actualPosition > boxes size ifTrue: [
		actualPosition := actualPosition - boxes size.
		aShip updateLaps ].


	actualPosition < 1 ifTrue: [
		actualPosition := aShip getLaps >= 2
			                  ifTrue: [ boxes size + actualPosition ]
			                  ifFalse: [ 1 ] ].

	aShip movesTo: actualPosition
]

{ #category : 'as yet unclassified' }
Board >> getLastBox [
	^lastBoxPlayed.
]

{ #category : 'initialization' }
Board >> initializeWithBoxesArray: aBoxesArray [

	boxes := aBoxesArray.
	lastBoxPlayed := aBoxesArray at: 1
]

{ #category : 'accessing' }
Board >> players: aCollectionOfShips playerTurn: aPlayerTurn withDiceResult: aDiceResult andLaps: laps [

	| actualPosition aShip aBox |
	aShip := aCollectionOfShips at: aPlayerTurn.
	aShip moves: aDiceResult.
	self checkPositionOf: aShip.
	actualPosition := aShip getPosition.
	aShip consumeFuel: aDiceResult.
	aShip checkIfWin: laps.
	aBox := boxes at: actualPosition.
	aShip victory ifTrue: [ ^ self ].
	aBox
		shipsPlaying: aCollectionOfShips
		withShip: aShip
		withBoardSize: boxes size.
	lastBoxPlayed := aBox.
	self checkAfterEffects: aCollectionOfShips.
	aShip checkIfWin: laps
]
