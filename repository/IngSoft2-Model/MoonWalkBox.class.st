Class {
	#name : 'MoonWalkBox',
	#superclass : 'Box',
	#instVars : [
		'numberOfBoxesToMove'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
MoonWalkBox >> effectShips: aCollectionOfShips playing: aShip withBoardSize: aBoardSize [

	| index |
	index := aCollectionOfShips indexOf: aShip.
	1 to: aCollectionOfShips size do: [ :i |
		i = index ifFalse: [
			(aCollectionOfShips at: i) moves: -1 * numberOfBoxesToMove.
			(aCollectionOfShips at: i) consumeFuel: numberOfBoxesToMove ] ]
]

{ #category : 'as yet unclassified' }
MoonWalkBox >> getnumberOfBoxesToMove [

	^ numberOfBoxesToMove
]

{ #category : 'initialization' }
MoonWalkBox >> initializeInPlace: aPlace [

	place := aPlace.
	numberOfBoxesToMove := (1 to: 100) atRandom.
	state := NormalBox new
]

{ #category : 'as yet unclassified' }
MoonWalkBox >> numberOfBoxesToMove: aNumberOfBoxesToMove [

	numberOfBoxesToMove := aNumberOfBoxesToMove
]

{ #category : 'as yet unclassified' }
MoonWalkBox >> reversalEffectShips: aCollectionOfShips playing: aShip withBoardSize: aBoardSize [

	| index |
	index := aCollectionOfShips indexOf: aShip.
	1 to: aCollectionOfShips size do: [ :i |
		i = index ifFalse: [
			(aCollectionOfShips at: i) moves: numberOfBoxesToMove.
			(aCollectionOfShips at: i) consumeFuel: numberOfBoxesToMove ] ]
]
