Class {
	#name : 'AWormHoleBoxTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
AWormHoleBoxTest >> testWhenAWormHoleKnowsItsDestiny_05 [

	| aWormholeBox anotherWormholeBox |
	aWormholeBox := WormHoleBox inPlace: 2.
	anotherWormholeBox := WormHoleBox inPlace: 4.
	aWormholeBox withDestiny: anotherWormholeBox.
	anotherWormholeBox withDestiny: aWormholeBox.

	self assert: aWormholeBox getDestiny equals: anotherWormholeBox .
	self assert: anotherWormholeBox getDestiny equals: aWormholeBox .
]

{ #category : 'tests' }
AWormHoleBoxTest >> test_06_WhenAWormHoleBoxIsAskedToCHangeItsStateThenBothStatesChange [

	| aWormholeBox anotherWormholeBox |
	aWormholeBox := WormHoleBox inPlace: 2.
	anotherWormholeBox := WormHoleBox inPlace: 4.
	aWormholeBox withDestiny: anotherWormholeBox.
	anotherWormholeBox withDestiny: aWormholeBox.

	aWormholeBox stateAlteration.

	self assert: (aWormholeBox state isKindOf: ReversalBox).
	self assert: (anotherWormholeBox state isKindOf: ReversalBox).
]
