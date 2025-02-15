Class {
	#name : 'CancellationCard',
	#superclass : 'InstantCard',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
CancellationCard >> affectTo: aCard from: aShip playing: aBoardGame [ 
	| shipsPlaying |
	shipsPlaying := aBoardGame getShipsPlaying.
	shipsPlaying do: [ :ship | ship removeActiveCard: aCard ].
	^CancellationCard new.
	
]

{ #category : 'removing' }
CancellationCard >> removeCard: aCard from: activeCardsInGame toShips: collectionOfShips [

	activeCardsInGame remove: aCard.
	collectionOfShips do: [ :ship | ship removeActiveCard: aCard].
]
