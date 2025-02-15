Class {
	#name : 'ABoardTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'asserting' }
ABoardTest >> should: anErrorBlock raise: anErrorClass withMessage: aMessage [ 
	self should: anErrorBlock raise: anErrorClass withExceptionDo: [ :error | self assert: error messageText equals: aMessage ] 
]

{ #category : 'tests' }
ABoardTest >> testWhenABoardIsCreatedThenFirstPositionIsAlwaysANoEffectoBox_12 [

	| aBoard boxDistributions anEffectManager boxes |
	boxDistributions := OrderedCollection new.
	boxDistributions add:
		(BoxDistribution of: NoEffectBox withDistribution: 40).
	boxDistributions add:
		(BoxDistribution of: HyperGravityBox withDistribution: 20).
	boxDistributions add:
		(BoxDistribution of: HyperJumpBox withDistribution: 60).
	anEffectManager := EffectManager with: boxDistributions.
	boxes := anEffectManager createFor: 100.
	aBoard := Board withBoxesArray: boxes.
	self assert: ((aBoard boxes at: 1) isKindOf: NoEffectBox)
]

{ #category : 'tests' }
ABoardTest >> testWhenABoardIsCreatedWithLessThan1BoxThenBoardInvalid [

	| boxesArray |
	boxesArray := OrderedCollection new.

	self
		should: [ Board withBoxesArray: boxesArray ]
		raise: Error
		withMessage: 'A Board must have at least 3 box to be created'
]

{ #category : 'tests' }
ABoardTest >> testWhenAShipLandsInABlackHoleBoxThenItsPositionIsUpdated_17 [

	| aBoard aShip anotherShip aCollectionOfShips boxesArray |
	boxesArray := OrderedCollection new.
	boxesArray add: (BlackHoleBox inPlace: 1).
	boxesArray add: (BlackHoleBox inPlace: 2).
	boxesArray add: (BlackHoleBox inPlace: 3).
	boxesArray add: (BlackHoleBox inPlace: 4).
	aBoard := Board withBoxesArray: boxesArray.
	aShip := Ship createWithMaxFuel: 1000.
	anotherShip := Ship createWithMaxFuel: 1000.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aCollectionOfShips add: anotherShip.
	aBoard
		players: aCollectionOfShips
		playerTurn: 1
		withDiceResult: 3
		andLaps: 2.

	self assert: aShip getPosition equals: 1.
	self assert: aShip getLaps equals: 1
]

{ #category : 'tests' }
ABoardTest >> testWhenAShipPassToNextLapThenUpdateLapAndPosition_16 [

	| aBoard aShip anotherShip aCollectionOfShips boxesArray |
	boxesArray := OrderedCollection new.
	boxesArray add: (NoEffectBox inPlace: 1).
	boxesArray add: (NoEffectBox inPlace: 2).
	boxesArray add: (NoEffectBox inPlace: 3).
	boxesArray add: (NoEffectBox inPlace: 4).
	aBoard := Board withBoxesArray: boxesArray.
	aShip:=Ship createWithMaxFuel: 1000.
	anotherShip :=Ship createWithMaxFuel: 1000.
	aCollectionOfShips:=OrderedCollection  new.
	aCollectionOfShips add: aShip.
	aCollectionOfShips add: anotherShip .	
	aBoard players: aCollectionOfShips playerTurn: 1 withDiceResult: 6 andLaps: 2.
	
	self assert: aShip getPosition equals: 3.
	
	self assert:  aShip getLaps equals: 2.
		

]

{ #category : 'tests' }
ABoardTest >> test_22_ABoardKnowsTheLastBoxThatWasPlayed [

	| aBoard aShip anotherShip aCollectionOfShips boxesArray |
	boxesArray := OrderedCollection new.
	boxesArray add: (NoEffectBox inPlace: 1).
	boxesArray add: (NoEffectBox inPlace: 2).
	boxesArray add: (NoEffectBox inPlace: 3).
	boxesArray add: (NoEffectBox inPlace: 4).
	aBoard := Board withBoxesArray: boxesArray.
	aShip := Ship createWithMaxFuel: 1000.
	anotherShip := Ship createWithMaxFuel: 1000.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aCollectionOfShips add: anotherShip.
	aBoard
		players: aCollectionOfShips
		playerTurn: 1
		withDiceResult: 3
		andLaps: 2.
	self assert: ((aBoard getLastBox) isKindOf: NoEffectBox).
]
