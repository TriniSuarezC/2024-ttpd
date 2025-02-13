Class {
	#name : 'RepeatCard',
	#superclass : 'InstantCard',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
RepeatCard >> affectTo: aShip from: aShip2 playing: aBoardGame [ 
	| collectionOfShips board aBox |
	collectionOfShips := aBoardGame getShipsPlaying.
	board := aBoardGame getBoard.
	aBox := board getLastBox.
	self applyEffect: aBox toShip: aShip withShipsPlaying: collectionOfShips.
	^RepeatCard new. 
]

{ #category : 'as yet unclassified' }
RepeatCard >> applyEffect: aBox toShip: aShip withShipsPlaying: aCollectionOfShips [
	aBox effectShips: aCollectionOfShips playing: aShip.
]
