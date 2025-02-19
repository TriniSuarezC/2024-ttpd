Class {
	#name : 'AReversalCardTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
AReversalCardTest >> test_01_WhenAReversalCardIsPlayedTheBoxStateChanges [

	| boxesArray aBoard aCollectionOfDice aLoadedDie aBoardGame aShip aBox aCard |
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
	aBoardGame := BoardGame withShip: 3 withBoard: aBoard WithDice: aCollectionOfDice andwithNumberOfLaps: 2.
	aShip := Ship createWithMaxFuel: 1000.
	aCard := ReversalCard new.
	aShip addCard: aCard.
	aBox := boxesArray at: 1.
	self assert: (aBox state isKindOf: NormalBox).
	aCard affectTo: aBox from: aShip playing: aBoardGame.
	self assert: (aBox state isKindOf: ReversalBox). 
	aCard := ReversalCard new.
	aShip addCard: aCard.
	aCard affectTo: aBox from: aShip playing: aBoardGame.
	self assert: (aBox state isKindOf: NormalBox ).
	
]

{ #category : 'tests' }
AReversalCardTest >> test_02_WhenAReversalCardIsPlayedTheBoxStateChanges [

	| boxesArray aBoard aCollectionOfDice aLoadedDie aBoardGame aShip aBox aCard anotherShip |
	boxesArray := OrderedCollection new.
	boxesArray add: (NoEffectBox inPlace: 1).
	boxesArray add: (NoEffectBox inPlace: 2).
	boxesArray add: (NoEffectBox inPlace: 3).
	boxesArray add: (BlackHoleBox inPlace: 4).
	boxesArray add: (NoEffectBox inPlace: 5).
	boxesArray add: (NoEffectBox inPlace: 6).
	boxesArray add: (NoEffectBox inPlace: 7).
	boxesArray add: (NoEffectBox inPlace: 8).
	boxesArray add: (NoEffectBox inPlace: 9).
	boxesArray add: (NoEffectBox inPlace: 10).
	boxesArray add: (NoEffectBox inPlace: 11).
	aBoard := Board withBoxesArray: boxesArray.
	aCollectionOfDice := OrderedCollection new.
	aLoadedDie := LoadedDieWithSequence loadedWithSequence:
		              #( 1 1 1 1 1 1 1 1 1 1 1 30 ).
	aCollectionOfDice add: aLoadedDie.
	aBoardGame := BoardGame withShip: 2 withBoard: aBoard WithDice: aCollectionOfDice andwithNumberOfLaps: 2.
	aShip := (aBoardGame getShipsPlaying) at: 1.
	aCard := ReversalCard new.
	aShip addCard: aCard.
	aBox := boxesArray at: 4.
	anotherShip := (aBoardGame getShipsPlaying) at: 2.
	aBoardGame playCard: aCard fromShip: aShip toTarget: aBox. 
	aBoardGame playTurn.
	aBoardGame playTurn.
	aBoardGame playTurn.
	aBoardGame playTurn.
	aBoardGame playTurn.
	aBoardGame playTurn.
	self assert: (aShip getPosition ) equals: 8.
	self assert: (anotherShip getPosition ) equals: 8.
	
]
