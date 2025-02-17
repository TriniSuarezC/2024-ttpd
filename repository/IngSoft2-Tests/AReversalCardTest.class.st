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
