Class {
	#name : 'OverloadCard',
	#superclass : 'PermanentCard',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
OverloadCard >> affectTo: aShip from: aShip2 playing: aBoardGame [ 
	| newCard |
	newCard:= OverloadCard new.
	aShip addActiveCards: newCard.
	^newCard
	
]

{ #category : 'as yet unclassified' }
OverloadCard >> powerMove [
	^-2.
]
