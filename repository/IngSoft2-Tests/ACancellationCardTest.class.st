Class {
	#name : 'ACancellationCardTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
ACancellationCardTest >> test_01_WhenACancellationCardIsApliedThenACardIsRemovedFromACollectionOfActiveCardsInGameAndShips [

	| aCancellationCard aCard aCollectionOfActiveCards anotherCard aCollectionOfShips aShip anotherShip |
	aCard := AccelerationCard new.
	anotherCard := OverloadCard  new.
	aCollectionOfShips := OrderedCollection new.
	aShip := Ship createWithMaxFuel: 1000.
	anotherShip := Ship createWithMaxFuel: 1000.
	aShip addActiveCards: aCard.
	aShip addActiveCards: anotherCard.
	anotherShip addActiveCards: aCard.
	anotherShip addActiveCards: anotherCard.
	aCollectionOfShips add: aShip.
	aCollectionOfShips add: anotherShip.
	aCollectionOfActiveCards := OrderedCollection new.
	aCollectionOfActiveCards add: aCard.
	aCollectionOfActiveCards add: anotherCard.
	aCancellationCard := CancellationCard new.
	aCancellationCard removeCard: aCard from: aCollectionOfActiveCards toShips: aCollectionOfShips.
	self assert: aCollectionOfActiveCards size equals: 1.
	self assert: aShip getActiveCards size equals: 1.
	self assert: anotherShip getActiveCards size equals: 1.
]

{ #category : 'tests' }
ACancellationCardTest >> test_02_ACancelationCardMessageIsBeingRefactor [ 

	| aCancellationCard aShip anotherShip aBoardGame boxesArray aBoard aCollectionOfDice aLoadedDie anotherLoadedDie shipsPlaying |
	aCancellationCard := CancellationCard  new.
	boxesArray := OrderedCollection new.
	boxesArray add: (NoEffectBox  inPlace: 1).
	boxesArray add: (NoEffectBox inPlace: 2).
	boxesArray add: (NoEffectBox inPlace: 3).
	boxesArray add: (NoEffectBox inPlace: 4).
	aBoard := Board withBoxesArray: boxesArray.
	aCollectionOfDice := OrderedCollection new.
	aLoadedDie := LoadedDie of: 50.
	anotherLoadedDie := LoadedDie of: 40.
	aCollectionOfDice add: aLoadedDie.
	aCollectionOfDice add: anotherLoadedDie.
	aBoardGame := BoardGame
		              withShip: 3
		              withBoard: aBoard
		              WithDice: aCollectionOfDice
		              andwithNumberOfLaps: 2.
	shipsPlaying := aBoardGame getShipsPlaying.
	aShip := shipsPlaying at: 1.
	anotherShip := shipsPlaying at: 2. 
	
	self assert: ((aCancellationCard affectTo: aShip from: anotherShip playing: aBoardGame) isKindOf: CancellationCard ).
]
