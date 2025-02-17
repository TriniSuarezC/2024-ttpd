Class {
	#name : 'NoEffectBox',
	#superclass : 'Box',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
NoEffectBox >> effectShips: aCollectionOfShips playing: aShip withBoardSize: aBoardSize [

	^ true
]

{ #category : 'as yet unclassified' }
NoEffectBox >> reversalEffectShips: aCollection playing: aShip withBoardSize: aBoardSize [

	^ true
]
