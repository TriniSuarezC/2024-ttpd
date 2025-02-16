Class {
	#name : 'AMoonWalkBoxTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
AMoonWalkBoxTest >> testWhenAMoonWalkBoxIsCreatedThenANumberOfBoxesToMoveCanBeAssigned_02 [

	| aMoonWalkBox|
	aMoonWalkBox := MoonWalkBox inPlace: 10.
	aMoonWalkBox numberOfBoxesToMove: 5.
	self assert: aMoonWalkBox getnumberOfBoxesToMove equals: 5.
]

{ #category : 'tests' }
AMoonWalkBoxTest >> testWhenAMoonWalkBoxIsCreatedThenANumberOfPositionsToMoveIsAssignedRandomly_05 [

	| aMoonWalkBox |
	aMoonWalkBox := MoonWalkBox inPlace: 10.
	self assert: aMoonWalkBox getnumberOfBoxesToMove > 0.




















]

{ #category : 'tests' }
AMoonWalkBoxTest >> testWhenAShipLandsInAMoonWalkBoxThenItsPositionDoesNotChangeBusOtherShipsPositionDoesChange_03 [

	| aMoonWalkBox aShip anotherShip aCollectionOfShips |
	aMoonWalkBox := MoonWalkBox inPlace: 10.
	aMoonWalkBox numberOfBoxesToMove: 5.
	aShip := Ship createWithMaxFuel: 1000.
	anotherShip := Ship createWithMaxFuel: 1000.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aCollectionOfShips add: anotherShip.
	aShip moves: 10.
	aShip consumeFuel: 10.
	anotherShip moves: 20.
	anotherShip consumeFuel: 20.
	aMoonWalkBox effectShips: aCollectionOfShips playing: aShip.
	self assert: aShip getPosition equals: 11.
	self assert: aShip getFuel equals: 990.	
	self assert: anotherShip getPosition equals: 16.
	self assert: anotherShip getFuel equals: 975.	




















]

{ #category : 'tests' }
AMoonWalkBoxTest >> testWhenAShipLandsInAMoonWalkBoxThenTheOtherShipsMovesAndRunOutOfFuel_04 [

	| aMoonWalkBox aShip anotherShip aCollectionOfShips |
	aMoonWalkBox := MoonWalkBox inPlace: 10.
	aMoonWalkBox numberOfBoxesToMove: 5.
	aShip := Ship createWithMaxFuel: 1000.
	anotherShip := Ship createWithMaxFuel: 22.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aCollectionOfShips add: anotherShip.
	aShip moves: 10.
	aShip consumeFuel: 10.
	anotherShip moves: 20.
	anotherShip consumeFuel: 20.
	aMoonWalkBox effectShips: aCollectionOfShips playing: aShip.
	self assert: aShip getPosition equals: 11.
	self assert: aShip getFuel equals: 990.	
	self assert: anotherShip getPosition equals: 1.
	self assert: anotherShip getFuel equals: 22.	




















]

{ #category : 'tests' }
AMoonWalkBoxTest >> test_05_WhenAShipLandsOnAReversalMoonWalkBoxThenTheOtherShipsMoveNBoxesAhead [

	| aMoonWalkBox aShip anotherShip aCollectionOfShips |
	aMoonWalkBox := MoonWalkBox inPlace: 10.
	aMoonWalkBox numberOfBoxesToMove: 5.
	aMoonWalkBox stateAlteration.
	aShip := Ship createWithMaxFuel: 1000.
	anotherShip := Ship createWithMaxFuel: 1000.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aCollectionOfShips add: anotherShip.
	aShip moves: 10.
	aShip consumeFuel: 10.
	anotherShip moves: 20.
	anotherShip consumeFuel: 20.
	aMoonWalkBox reversalEffectShips: aCollectionOfShips playing: aShip.
	self assert: (aMoonWalkBox state isKindOf: ReversalBox).
	self assert: aShip getPosition equals: 11.
	self assert: aShip getFuel equals: 990.	
	self assert: anotherShip getPosition equals: 26.
	self assert: anotherShip getFuel equals: 975.	




















]
