Class {
	#name : 'ABoxTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'asserting' }
ABoxTest >> should: aBlockError raise: aClassError withMessage: aMessage [ 
		self should: aBlockError raise: aClassError withExceptionDo: [ :error | self assert: error messageText equals: aMessage ]
]

{ #category : 'tests' }
ABoxTest >> testWhenTheBoxIsCreatedInPlaceLessThan1ThenBoxInvalid_04 [

	self
		should: [ Box inPlace: 0 ]
		raise: Error
		withMessage: 'The position of the box must be greater or equal to 1'
]

{ #category : 'tests' }
ABoxTest >> test_05_WhenABoxIsAskedToChangeItsStateThenTheStateIsChanged [

	| aBox |
	aBox := Box inPlace: 1.
	aBox stateAlteration.
	self assert: (aBox state isKindOf: ReversalBox).
	aBox stateAlteration.
	self assert: (aBox state isKindOf: NormalBox).
]

{ #category : 'tests' }
ABoxTest >> test_06_WhenABoxNeedsToAffectAShipThenItIsDoneNoMatterTheState [

	| aBox aShip aCollectionOdShips |
	aBox := NoEffectBox inPlace: 1.
	aShip := Ship createWithMaxFuel: 1000.
	aCollectionOdShips := OrderedCollection new.
	aCollectionOdShips add: aShip.
	aBox
		shipsPlaying: aCollectionOdShips
		withShip: aShip
		withBoardSize: 1.
	self assert: aShip getPosition equals: 1.
	self assert: aShip getFuel equals: 1000.
	self assert: aShip getLaps equals: 1.
	aBox stateAlteration.
	aBox
		shipsPlaying: aCollectionOdShips
		withShip: aShip
		withBoardSize: 1.
	self assert: aShip getPosition equals: 1.
	self assert: aShip getFuel equals: 1000.
	self assert: aShip getLaps equals: 1
]
