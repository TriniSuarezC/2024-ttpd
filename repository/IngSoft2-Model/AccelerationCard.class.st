Class {
	#name : 'AccelerationCard',
	#superclass : 'PermanentCard',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
AccelerationCard >> affectTo: aShip from: aShip2 playing: aBoardGame [

	| shipsPlaying |
	shipsPlaying := aBoardGame getShipsPlaying.
	shipsPlaying do: [ :ship | ship addActiveCards: AccelerationCard new ].
	^ AccelerationCard new
]

{ #category : 'as yet unclassified' }
AccelerationCard >> powerMove [

	^ 1
]
