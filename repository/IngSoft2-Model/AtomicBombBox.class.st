Class {
	#name : 'AtomicBombBox',
	#superclass : 'Box',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
AtomicBombBox >> effectShips: aCollectionOfShips playing: aShip withBoardSize: aBoardSize [

	aCollectionOfShips  do:[:OneShip| OneShip  movesTo: 1].
]

{ #category : 'as yet unclassified' }
AtomicBombBox >> reversalEffectShips: aCollection playing: aShip withBoardSize: aBoardSize [
	self effectShips: aCollection playing: aShip withBoardSize: 1 .
]
