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
WormHoleBox >> effectShips: aCollection playing: aShip [

	| positionToMove |
	positionToMove:= (destiny getPosition ) - place.
	
	aShip moves: positionToMove.
	aShip  consumeFuel: (positionToMove abs).
	 
]

{ #category : 'as yet unclassified' }
WormHoleBox >> getDestiny [
	^ destiny .
]

{ #category : 'initialization' }
WormHoleBox >> initializeInPlace: aPosition [

	place := aPosition
]

{ #category : 'as yet unclassified' }
WormHoleBox >> withDestiny: aWormHoleBox [ 
	destiny:= aWormHoleBox.
]
