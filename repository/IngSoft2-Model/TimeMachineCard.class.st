Class {
	#name : 'TimeMachineCard',
	#superclass : 'InstantCard',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
TimeMachineCard >> affectTo: aShip from: aShip2 playing: aBoardGame [

	aShip canPlayTimeMachine.
	aShip isAffectedByTimeMachineCard.
	aShip checkAlly ifTrue: [ aShip getAlly isAffectedByTimeMachineCard ].

	^ TimeMachineCard new
]
