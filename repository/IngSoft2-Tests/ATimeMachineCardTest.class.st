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
