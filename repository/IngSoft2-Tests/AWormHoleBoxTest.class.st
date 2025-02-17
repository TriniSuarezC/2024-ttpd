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

{ #category : 'tests' }
AWormHoleBoxTest >> test_07_WhenAShipLandsOnAWormHoleThenThePositionIsTheOneOnTheOtherWormHole [

	| aWormholeBox anotherWormholeBox aShip aCollection|
	aWormholeBox := WormHoleBox inPlace: 2.
	anotherWormholeBox := WormHoleBox inPlace: 4.
	aWormholeBox withDestiny: anotherWormholeBox.
	anotherWormholeBox withDestiny: aWormholeBox.

	aShip := Ship createWithMaxFuel: 1000.
	aCollection := OrderedCollection new.
	aCollection add: aShip.
	aShip moves: 1.
	aWormholeBox effectShips: aCollection playing: aShip withBoardSize: 1 .

	self assert: (aShip getPosition) equals: 4.

]

{ #category : 'tests' }
AWormHoleBoxTest >> test_08_WhenAShipLandsOnTheOtherSideOfTheWormHoleThenThePositionIsTheOneOnTheFirstWormHole [

	| aWormholeBox anotherWormholeBox aShip aCollection|
	aWormholeBox := WormHoleBox inPlace: 2.
	anotherWormholeBox := WormHoleBox inPlace: 10.
	aWormholeBox withDestiny: anotherWormholeBox.
	anotherWormholeBox withDestiny: aWormholeBox.

	aShip := Ship createWithMaxFuel: 1000.
	aCollection := OrderedCollection new.
	aCollection add: aShip.
	aShip moves: 9.
	anotherWormholeBox effectShips: aCollection playing: aShip withBoardSize: 1 .

	self assert: (aShip getPosition) equals: 2.

]

{ #category : 'tests' }
AWormHoleBoxTest >> test_09_WhenAStartingWormHoleIsReversedThePositionAndLapsAreUpdated [

	| aWormholeBox anotherWormholeBox aShip aCollection|
	aWormholeBox := WormHoleBox inPlace: 2.
	anotherWormholeBox := WormHoleBox inPlace: 10.
	aWormholeBox withDestiny: anotherWormholeBox.
	anotherWormholeBox withDestiny: aWormholeBox.

	aShip := Ship createWithMaxFuel: 1000.
	aCollection := OrderedCollection new.
	aCollection add: aShip.
	aShip updateLaps.
	aShip moves: 2.
	aWormholeBox reversalEffectShips: aCollection playing: aShip withBoardSize: 1 .

	self assert: (aShip getPosition) equals: 10.
	self assert: (aShip getLaps) equals: 1.
]

{ #category : 'tests' }
AWormHoleBoxTest >> test_10_WhenAEndWormHoleIsReversedThePositionAndLapsAreUpdated [

	| aWormholeBox anotherWormholeBox aShip aCollection|
	aWormholeBox := WormHoleBox inPlace: 2.
	anotherWormholeBox := WormHoleBox inPlace: 10.
	aWormholeBox withDestiny: anotherWormholeBox.
	anotherWormholeBox withDestiny: aWormholeBox.

	aShip := Ship createWithMaxFuel: 1000.
	aCollection := OrderedCollection new.
	aCollection add: aShip.
	aShip updateLaps.
	aShip moves: 2.
	anotherWormholeBox reversalEffectShips: aCollection playing: aShip withBoardSize: 10 .

	self assert: (aShip getPosition) equals: 2.
	self assert: (aShip getLaps) equals: 3.
]
