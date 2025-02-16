Class {
	#name : 'ATimeMachineCardTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'asserting' }
ATimeMachineCardTest >> should: anErrorBlock raise: anErrorClass withMessage: aMessage [

	self
		should: anErrorBlock
		raise: anErrorClass
		withExceptionDo: [ :error |
		self assert: error messageText equals: aMessage ]
]

{ #category : 'tests' }
ATimeMachineCardTest >> test_02_WhenATimeMachieCardIsPlayedBeforeATurnIsPlaydThenAnErrorIsRaised [

	| aTimeMachineCard aShip anotherShip aBoardGame boxesArray aBoard aCollectionOfDice aLoadedDie anotherLoadedDie shipsPlaying |
	aTimeMachineCard := TimeMachineCard new.
	boxesArray := OrderedCollection new.
	boxesArray add: (NoEffectBox inPlace: 1).
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
	self
		should: [
			aBoardGame
				playCard: aTimeMachineCard
				fromShip: aShip
				toTarget: anotherShip ]
		raise: Error
		withMessage:
		'You cant play a time machine card when less than 2 turns have passed.'
]

{ #category : 'tests' }
ATimeMachineCardTest >> test_03_WhenATimeMachieCardIsPlayedAndTheShipHasAnAllyThenBothGetTheirFuelAffected [

	| aShip anotherShip aCard boxesArray aBoard aCollectionOfDice aLoadedDie anotherLoadedDie aBoardGame shipsPlaying oneMoreShip anotherCard checkFuel1 checkFuel2 |
	boxesArray := OrderedCollection new.
	boxesArray add: (NoEffectBox inPlace: 1).
	boxesArray add: (NoEffectBox inPlace: 2).
	boxesArray add: (NoEffectBox inPlace: 3).
	boxesArray add: (NoEffectBox inPlace: 4).
	aBoard := Board withBoxesArray: boxesArray.
	aCollectionOfDice := OrderedCollection new.
	aLoadedDie := LoadedDieWithSequence loadedWithSequence:
		              #( 1 1 1 1 1 1 1 1 1 1 1 30 ).
	aCollectionOfDice add: aLoadedDie.
	aBoardGame := BoardGame
		              withShip: 3
		              withBoard: aBoard
		              WithDice: aCollectionOfDice
		              andwithNumberOfLaps: 2.
	shipsPlaying := aBoardGame getShipsPlaying.
	aShip := shipsPlaying at: 1.
	anotherShip := shipsPlaying at: 2.
	oneMoreShip := shipsPlaying at: 3.
	aCard := AllyCard new.
	anotherCard := TimeMachineCard new.
	aShip addCard: aCard.
	oneMoreShip addCard: anotherCard.
	aBoardGame playCard: aCard fromShip: aShip toTarget: anotherShip.
	aBoardGame playTurn.
	checkFuel1 := aShip getFuel.

	aBoardGame playTurn.
	checkFuel2 := anotherShip getFuel.
	aBoardGame playTurn.
	aBoardGame playTurn.

	aBoardGame playTurn.
	aBoardGame playTurn.
	aBoardGame playTurn.
	aBoardGame playTurn.
	aBoardGame playTurn.
	aBoardGame
		playCard: anotherCard
		fromShip: oneMoreShip
		toTarget: aShip.
	self assert: aShip getAlly equals: anotherShip.
	self assert: anotherShip getAlly equals: aShip.
	self assert: aShip getFuel equals: checkFuel1.
	self assert: anotherShip getFuel equals: checkFuel2
]
