Class {
	#name : 'AAtomicBombBoxTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
AAtomicBombBoxTest >> test_02_WhenAShipLandInAAtomicBombBoxThenAllShipsGoToPosition1WithActualFuelAndSameLaps [

	| aAtomicBombBox aCollectionOfShips aShip anotherShip |
	aAtomicBombBox := AtomicBombBox inPlace: 25.
	aShip := Ship createWithMaxFuel: 100.
	anotherShip := Ship createWithMaxFuel: 100.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aCollectionOfShips add: anotherShip.
	aShip moves: 24.
	aShip consumeFuel: 24.
	anotherShip moves: 10.
	anotherShip consumeFuel: 10.
	aAtomicBombBox
		effectShips: aCollectionOfShips
		playing: aShip
		withBoardSize: 1.
	self assert: aShip getPosition equals: 1.
	self assert: aShip getFuel equals: 76.
	self assert: anotherShip getPosition equals: 1.
	self assert: anotherShip getFuel equals: 90
]

{ #category : 'tests' }
AAtomicBombBoxTest >> test_03_WhenAShipIsAfectedByAReversedAtomicBombThenTheEfectDoesNotChange [

	| aAtomicBombBox aCollectionOfShips aShip anotherShip |
	aAtomicBombBox := AtomicBombBox inPlace: 25.
	aAtomicBombBox stateAlteration.
	aShip := Ship createWithMaxFuel: 100.
	anotherShip := Ship createWithMaxFuel: 100.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aCollectionOfShips add: anotherShip.
	aShip moves: 24.
	aShip consumeFuel: 24.
	anotherShip moves: 10.
	anotherShip consumeFuel: 10.
	aAtomicBombBox
		reversalEffectShips: aCollectionOfShips
		playing: aShip
		withBoardSize: 1.
	self assert: (aAtomicBombBox state isKindOf: ReversalBox).
	self assert: aShip getPosition equals: 1.
	self assert: aShip getFuel equals: 76.
	self assert: anotherShip getPosition equals: 1.
	self assert: anotherShip getFuel equals: 90
]
