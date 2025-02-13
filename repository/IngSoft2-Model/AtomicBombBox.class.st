Class {
	#name : 'AtomicBombBox',
	#superclass : 'Box',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
AtomicBombBox >> effectShips: aCollectionOfShips playing: aShip [ 

	aCollectionOfShips  do:[:OneShip| OneShip  movesTo: 1].
]
