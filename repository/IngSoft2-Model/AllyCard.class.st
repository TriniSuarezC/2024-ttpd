Class {
	#name : 'AllyCard',
	#superclass : 'PermanentCard',
	#instVars : [
		'ally'
	],
	#classInstVars : [
		'aCollectionOfAlly'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'instance creation' }
AllyCard class >> with: aShip [ 
	^self new initializeWith: aShip


]

{ #category : 'as yet unclassified' }
AllyCard >> affectTo: aShipAlly from: aShip playing: aBoardGame [ 
	|card1 card2|
	card1 := AllyCard with: aShipAlly.
	card2 := AllyCard with: aShip.
	
	aShipAlly addActiveCards: card2.
	aShip addActiveCards: card1.
	
	^card1
]

{ #category : 'as yet unclassified' }
AllyCard >> getAlly [
	^ally
]

{ #category : 'initialization' }
AllyCard >> initializeWith: aShip [
	ally:=aShip.
]

{ #category : 'as yet unclassified' }
AllyCard >> powerMove [
^0.
]
