Class {
	#name : 'ABlackHoleBoxTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
ABlackHoleBoxTest >> testWhenAShipLandsInABlackHoleThenPositionAndFuelAreUpdated_03 [

	| aBlackHoleBox aCollectionOfShips aShip anotherShip |
	aCollectionOfShips := OrderedCollection new.
	aShip := Ship createWithMaxFuel: 1000.
	anotherShip := Ship createWithMaxFuel: 1000.
	aCollectionOfShips add: aShip.
	aCollectionOfShips add: anotherShip.
	aShip moves: 6.
	aShip consumeFuel: 6.
	aBlackHoleBox := BlackHoleBox inPlace: 7.
	aBlackHoleBox effectShips: aCollectionOfShips playing: aShip.
	self assert: aShip getPosition equals: 3.
	self assert: aShip getFuel equals: 990.
]
