Class {
	#name : 'NormalBox',
	#superclass : 'BoxState',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
NormalBox >> affectShip: aShip playingWith: aCollection with: aBoardSize in: aBox [ 
	aBox effectShips: aCollection playing: aShip  withBoardSize: aBoardSize.
]

{ #category : 'as yet unclassified' }
NormalBox >> changeState [
	^ReversalBox new.
]
