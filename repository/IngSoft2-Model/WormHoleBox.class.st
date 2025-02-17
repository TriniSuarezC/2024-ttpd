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
	place := aPosition.
	state := NormalBox new.
]

{ #category : 'as yet unclassified' }
WormHoleBox >> reversalEffectShips: aCollection playing: aShip [
	"Si caigo en 3 y está revertido aparezco en el casillero 10 de la vuelta anterior, si estoy en la primera vuelta vuelvo al principio."
	| destinationPlace |
	destinationPlace := destiny getPosition.

]

{ #category : 'as yet unclassified' }
WormHoleBox >> reversalEffectShips: aCollection playing: aShip withBoardSize: aBoardSize [
	"Si caigo en 3 y está revertido aparezco en el casillero 10 de la vuelta anterior, si estoy en la primera vuelta vuelvo al principio."
	| destinationPlace |
	destinationPlace := destiny getPosition.

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
