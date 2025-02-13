Class {
	#name : 'AOverloadCardTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'running' }
AOverloadCardTest >> test_01_ThePoweMoveOfAOverloadCardIsMinus2 [ 
| aCard |
aCard:= OverloadCard new.
self assert:aCard powerMove equals: -2.

]

{ #category : 'running' }
AOverloadCardTest >> test_02_WhenAOverloadCardIsAplyToAShipThentheCardIsAddedToTheCollectionOfActiveCards [
| aCard aShip anotherShip aCollectionOfShips aCollectionOfDice aDie boxesArray aBoard aLoadedDie anotherLoadedDie aBoardGame |
aCard:= OverloadCard new.

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
	aShip := aBoardGame getShipsPlaying at: 1.
	anotherShip := aBoardGame getShipsPlaying at: 2.
	aCard affectTo: anotherShip from: aShip playing: aBoardGame.

	
self assert:((anotherShip getActiveCards at:1) isKindOf:OverloadCard).

]

{ #category : 'running' }
AOverloadCardTest >> test_03_AnOverloadCardMessageIsBeingRefactor [

	| anOverloadCard aShip anotherShip aBoardGame boxesArray aBoard aCollectionOfDice aLoadedDie anotherLoadedDie shipsPlaying |
	anOverloadCard := OverloadCard new.
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
	
	self assert: ((anOverloadCard affectTo: aShip from: anotherShip playing: aBoardGame) isKindOf: OverloadCard). 
]
