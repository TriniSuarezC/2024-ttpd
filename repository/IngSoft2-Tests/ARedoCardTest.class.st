Class {
	#name : 'ARedoCardTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
ARedoCardTest >> test_01_aRedoCardIsImplementedBasedOnTheLastCardPlayed [
	
	| anOverloadCard aShip anotherShip aBoardGame boxesArray aBoard aCollectionOfDice aLoadedDie anotherLoadedDie shipsPlaying aRedoCard |
	anOverloadCard := OverloadCard new.
	aRedoCard := RedoCard new.
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
	aBoardGame playCard: anOverloadCard fromShip: aShip toTarget: anotherShip.
	
	self assert: ((aRedoCard affectTo: anotherShip from: aShip playing: aBoardGame) isKindOf: OverloadCard). 
	
]
