Class {
	#name : 'ReversalBox',
	#superclass : 'BoxState',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
ReversalBox >> affectShip: aShip playingWith: aCollection with: aBoardSize in: aBox [ 
	aBox reversalEffectShips: aCollection  playing: aShip withBoardSize: aBoardSize.
]

{ #category : 'as yet unclassified' }
ReversalBox >> changeState [
	^NormalBox new.
]
