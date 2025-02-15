Class {
	#name : 'ARepeatCardTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
ARepeatCardTest >> test_01_WhenARepeatCardAppliesIsPlayedThenABoxEffectsOnAShip [

	| aCard aBox aShip ships |
	aCard := RepeatCard new.
	aBox := BlackHoleBox inPlace: 4.
	aShip := Ship createWithMaxFuel: 1000.
	aShip moves: 5.
	ships := OrderedCollection new.
	ships add: aShip.
	aCard applyEffect: aBox toShip: aShip withShipsPlaying: ships.
	self assert: aShip getPosition equals: 2
]

{ #category : 'tests' }
ARepeatCardTest >> test_02_ARepeatCardMessageIsBeingRefactor [

	| aRepeatCard aShip anotherShip aBoardGame boxesArray aBoard aCollectionOfDice aLoadedDie anotherLoadedDie shipsPlaying |
	aRepeatCard := RepeatCard new.
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
	
	self assert: ((aRepeatCard affectTo: aShip from: anotherShip playing: aBoardGame) isKindOf: RepeatCard ). 
]
