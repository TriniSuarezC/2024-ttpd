Class {
	#name : 'WormHoleBox',
	#superclass : 'Box',
	#instVars : [
		'destiny'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
WormHoleBox class >> inPlace: aPosition [ 
	^self new initializeInPlace: aPosition.
]

{ #category : 'as yet unclassified' }
WormHoleBox >> effectShips: aCollection playing: aShip withBoardSize: aBoardSize [

	| positionToMove |
	positionToMove := destiny getPosition - place.

	aShip moves: positionToMove.
	aShip consumeFuel: positionToMove abs
]

{ #category : 'as yet unclassified' }
WormHoleBox >> getDestiny [
	^ destiny .
]

{ #category : 'initialization' }
WormHoleBox >> initializeInPlace: aPosition [
	place := aPosition.
	state := NormalBox new.
]

{ #category : 'as yet unclassified' }
WormHoleBox >> reversalEffectShips: aCollection playing: aShip withBoardSize: aBoardSize [

	| destinationPlace positionsToMove |
	destinationPlace := destiny getPosition.
	destinationPlace > place
		ifTrue: [
			positionsToMove := place + (aBoardSize - destinationPlace).
			aShip moveToEndWormHole: positionsToMove ]
		ifFalse: [
			positionsToMove := destinationPlace + (aBoardSize - place).
			aShip
				moveToStartingWormHole: destinationPlace
				andFuel: positionsToMove ]
]

{ #category : 'as yet unclassified' }
WormHoleBox >> stateAlteration [
	state := state changeState.
	destiny stateChange.
]

{ #category : 'as yet unclassified' }
WormHoleBox >> stateChange [
	state := state changeState.
]

{ #category : 'as yet unclassified' }
WormHoleBox >> withDestiny: aWormHoleBox [ 
	destiny:= aWormHoleBox.
]
