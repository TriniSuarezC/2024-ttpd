Class {
	#name : 'ABoardGameTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'asserting' }
ABoardGameTest >> should: anErrorBlock raise: anErrorClass withMessage: aMessage [

	self
		should: anErrorBlock
		raise: anErrorClass
		withExceptionDo: [ :error |
		self assert: error messageText equals: aMessage ]
]

{ #category : 'tests' }
ABoardGameTest >> test_05_WhenABoardGameIsCreatedThenItHasANumberOfLapsToDo [

	| aBoardGame aCollectionOfDice aLoadedDie boxesArray aBoard |
	boxesArray := OrderedCollection new.
	boxesArray add: (NoEffectBox  inPlace: 1).
	boxesArray add: (NoEffectBox inPlace: 2).
	boxesArray add: (NoEffectBox inPlace: 3).
	boxesArray add: (NoEffectBox inPlace: 4).
	boxesArray add: (NoEffectBox inPlace: 5).
	boxesArray add: (NoEffectBox inPlace: 6).
	aBoard := Board withBoxesArray: boxesArray.
	aCollectionOfDice := OrderedCollection new.
	aLoadedDie := LoadedDie of: 5.
	aCollectionOfDice add: aLoadedDie.
	aBoardGame := BoardGame
		              withShip: 1
		              withBoard: aBoard
		              WithDice: aCollectionOfDice
		              andwithNumberOfLaps: 2.
	self assert: aBoardGame getLapsToDo equals: 2
]

{ #category : 'tests' }
ABoardGameTest >> test_06_WhenTheGameIsPlayedWithMoreThanOneBoxThenTheGameHasAWinner [

	| aBoardGame aCollectionOfDice boxesArray aLoadedDie aBoard |
	boxesArray := OrderedCollection new.
	boxesArray add: (NoEffectBox inPlace: 1).
	boxesArray add: (NoEffectBox inPlace: 2).
	boxesArray add: (NoEffectBox inPlace: 3).
	boxesArray add: (NoEffectBox inPlace: 4).
	aBoard := Board withBoxesArray: boxesArray.
	aCollectionOfDice := OrderedCollection new.
	aLoadedDie := LoadedDie of: 3.
	aCollectionOfDice add: aLoadedDie.
	aBoardGame := BoardGame
		              withShip: 2
		              withBoard: aBoard
		              WithDice: aCollectionOfDice
		              andwithNumberOfLaps: 2.
	aBoardGame playTurn.
	aBoardGame playTurn.
	aBoardGame playTurn.
	aBoardGame playTurn.
	aBoardGame playTurn.
	aBoardGame playTurn.
	self assert: aBoardGame winnerIs equals: 1
]

{ #category : 'tests' }
ABoardGameTest >> test_07_WhenTheGameIsAskedToChangeTurnThenTheTurnIsIncremented [

	| turn aBoard aCollectionOfDice aLoadedDie aBoardGame nextTurn boxesArray |
	turn := 1.

	boxesArray := OrderedCollection new.
	boxesArray add: (NoEffectBox  inPlace: 1).
	boxesArray add: (NoEffectBox inPlace: 2).
	boxesArray add: (NoEffectBox inPlace: 3).
	boxesArray add: (NoEffectBox inPlace: 4).
	boxesArray add: (NoEffectBox inPlace: 5).
	boxesArray add: (NoEffectBox inPlace: 6).
	aBoard := Board withBoxesArray: boxesArray.
	aCollectionOfDice := OrderedCollection new.
	aLoadedDie := LoadedDie of: 102.
	aCollectionOfDice add: aLoadedDie.
	aBoardGame := BoardGame
		              withShip: 3
		              withBoard: aBoard
		              WithDice: aCollectionOfDice
		              andwithNumberOfLaps: 2.

	nextTurn := aBoardGame changeTurn: turn.
	self assert: nextTurn equals: 2
]

{ #category : 'tests' }
ABoardGameTest >> test_08_WhenAGameFinishesThenRankingIsShown [

	| aBoardGame aCollectionOfDice aLoadedDie expectedRanking ranking boxesArray aBoard |
	boxesArray := OrderedCollection new.
	boxesArray add: (NoEffectBox  inPlace: 1).
	boxesArray add: (NoEffectBox inPlace: 2).
	boxesArray add: (NoEffectBox inPlace: 3).
	boxesArray add: (NoEffectBox inPlace: 4).
	boxesArray add: (NoEffectBox inPlace: 5).
	boxesArray add: (NoEffectBox inPlace: 6).
	aBoard := Board withBoxesArray: boxesArray.
	aCollectionOfDice := OrderedCollection new.
	aLoadedDie := LoadedDieWithSequence loadedWithSequence: #( 3 4 5 ).
	aCollectionOfDice add: aLoadedDie.
	aBoardGame := BoardGame
		              withShip: 3
		              withBoard: aBoard
		              WithDice: aCollectionOfDice
		              andwithNumberOfLaps: 2.
	expectedRanking := OrderedCollection new.
	expectedRanking add: 2.
	expectedRanking add: 1.
	expectedRanking add: 3.
	aBoardGame playTurn.
	aBoardGame playTurn.
	ranking := aBoardGame showRanking.
	self assert: aBoardGame showRanking equals: expectedRanking
]

{ #category : 'tests' }
ABoardGameTest >> test_09_ABoardGameWillNotStartWithLessThan1Ship [

	| aCollectionOfDice aDie boxesArray|
	aCollectionOfDice := OrderedCollection new.
	aDie := Die of: 3.
	aCollectionOfDice add: aDie.
	boxesArray := OrderedCollection new.
	boxesArray add: (NoEffectBox inPlace: 1).
	boxesArray add: (NoEffectBox inPlace: 2).
	boxesArray add: (NoEffectBox inPlace: 3).
	boxesArray add: (NoEffectBox inPlace: 4).
	self
		should: [
			BoardGame
				withShip: 0
				withBoard: (Board withBoxesArray: boxesArray)
				WithDice: aCollectionOfDice
				andwithNumberOfLaps: 2 ]
		raise: Error
		withMessage: 'A Board must have at least 1 ship to be created'
]

{ #category : 'tests' }
ABoardGameTest >> test_10_ABoardGameWillNotStartWithLessThan2Laps [

	| aCollectionOfDice aDie boxesArray|
	aCollectionOfDice := OrderedCollection new.
	aDie := Die of: 3.
	aCollectionOfDice add: aDie.
	boxesArray := OrderedCollection new.
	boxesArray add: (NoEffectBox inPlace: 1).
	boxesArray add: (NoEffectBox inPlace: 2).
	boxesArray add: (NoEffectBox inPlace: 3).
	boxesArray add: (NoEffectBox inPlace: 4).
	self
		should: [
			BoardGame
				withShip: 1
				withBoard: (Board withBoxesArray: boxesArray)
				WithDice: aCollectionOfDice
				andwithNumberOfLaps: 1 ]
		raise: Error
		withMessage: 'A Board must have at least 2 laps to be created' 
]

{ #category : 'tests' }
ABoardGameTest >> test_11_WhenItIsAPlayerTurnThenPlayerChooseToPlay [

	| aCollectionOfDice aLoadedDie aBoardGame boxesArray aBoard |
	boxesArray := OrderedCollection new.
	boxesArray add: (NoEffectBox  inPlace: 1).
	boxesArray add: (NoEffectBox inPlace: 2).
	boxesArray add: (NoEffectBox inPlace: 3).
	boxesArray add: (NoEffectBox inPlace: 4).
	aBoard := Board withBoxesArray: boxesArray.
	aCollectionOfDice := OrderedCollection new.
	aLoadedDie := LoadedDie of: 4.
	aCollectionOfDice add: aLoadedDie.

	aBoardGame := BoardGame
		              withShip: 3
		              withBoard: aBoard
		              WithDice: aCollectionOfDice
		              andwithNumberOfLaps: 2.

	aBoardGame playTurn.
	self assert: aBoardGame winnerIs equals: 1
]

{ #category : 'tests' }
ABoardGameTest >> test_12_WhenItIsAPlayerTurnThenPlayerChooseToPassTurn [

	| aCollectionOfDice aLoadedDie aBoardGame boxesArray aBoard |
	boxesArray := OrderedCollection new.
	boxesArray add: (NoEffectBox  inPlace: 1).
	boxesArray add: (NoEffectBox inPlace: 2).
	boxesArray add: (NoEffectBox inPlace: 3).
	boxesArray add: (NoEffectBox inPlace: 4).
	aBoard := Board withBoxesArray: boxesArray.
	aCollectionOfDice := OrderedCollection new.
	aLoadedDie := LoadedDie of: 3.
	aCollectionOfDice add: aLoadedDie.

	aBoardGame := BoardGame
		              withShip: 2
		              withBoard: aBoard
		              WithDice: aCollectionOfDice
		              andwithNumberOfLaps: 2.

	aBoardGame playTurn.
	aBoardGame playTurn.
	aBoardGame passTurn.
	aBoardGame playTurn.
	
	self assert: aBoardGame winnerIs equals: 2.
	
]

{ #category : 'tests' }
ABoardGameTest >> test_14_WhenAnRepeatCardIsPlayedByAShipThenItsRemovedFromTheShipHand [

	| aCollectionOfDice aLoadedDie aBoardGame boxesArray aBoard aCard aShip anotherShip |
	boxesArray := OrderedCollection new.
	boxesArray add: (NoEffectBox  inPlace: 1).
	boxesArray add: (NoEffectBox inPlace: 2).
	boxesArray add: (NoEffectBox inPlace: 3).
	boxesArray add: (NoEffectBox inPlace: 4).
	aBoard := Board withBoxesArray: boxesArray.
	aCollectionOfDice := OrderedCollection new.
	aLoadedDie := LoadedDie of: 50.
	aCollectionOfDice add: aLoadedDie.
	aBoardGame := BoardGame
		              withShip: 2
		              withBoard: aBoard
		              WithDice: aCollectionOfDice
		              andwithNumberOfLaps: 2.
	aCard := RepeatCard new.
	aShip := ((aBoardGame getShipsPlaying) at: 1).
	anotherShip := ((aBoardGame getShipsPlaying) at: 2).
	aShip addCard: aCard.
	aBoardGame playCard: aCard fromShip: aShip toTarget: anotherShip.
	
	self assert: ((aShip getCards) size = 2).

	
]

{ #category : 'tests' }
ABoardGameTest >> test_15_WhenAnCancellationCardIsPlayedByAShipThenItsRemovedFromTheShipHand [ 

	| aCollectionOfDice aLoadedDie aBoardGame boxesArray aBoard aCard aPermanentCard aShip anotherShip |
	boxesArray := OrderedCollection new.
	boxesArray add: (NoEffectBox  inPlace: 1).
	boxesArray add: (NoEffectBox inPlace: 2).
	boxesArray add: (NoEffectBox inPlace: 3).
	boxesArray add: (NoEffectBox inPlace: 4).
	aBoard := Board withBoxesArray: boxesArray.
	aCollectionOfDice := OrderedCollection new.
	aLoadedDie := LoadedDie of: 50.
	aCollectionOfDice add: aLoadedDie.
	aBoardGame := BoardGame
		              withShip: 2
		              withBoard: aBoard
		              WithDice: aCollectionOfDice
		              andwithNumberOfLaps: 2.
	aCard := CancellationCard new.
	aPermanentCard := OverloadCard new.
	aShip := ((aBoardGame getShipsPlaying) at: 1).
	anotherShip := ((aBoardGame getShipsPlaying) at: 2).
	aShip addCard: aCard.
	aShip addCard: aPermanentCard.
	aBoardGame playCard: aPermanentCard fromShip: aShip toTarget: anotherShip.
	aBoardGame playCard: aCard fromShip: aShip toTarget: aPermanentCard.

	self assert: (((aBoardGame getShipsPlaying at: 1) getCards) size = 2).
	self assert: aBoardGame getCards size = 0.
]

{ #category : 'tests' }
ABoardGameTest >> test_16_ABoardGameKnowsItMaxDieResult [

	| aCollectionOfDice aLoadedDie aBoardGame boxesArray aBoard anotherLoadedDie |
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
		              withShip: 2
		              withBoard: aBoard
		              WithDice: aCollectionOfDice
		              andwithNumberOfLaps: 2.

	self assert: aBoardGame getMaxDieResult equals: 92.
	
]

{ #category : 'tests' }
ABoardGameTest >> test_17_WhenAAccelerationCardIsPlayedThenAllShipsGetTheirMovesAffected [

	| aCollectionOfDice aLoadedDie aBoardGame boxesArray aBoard anotherLoadedDie aPermanentCard aShip anotherShip shipsPlaying |
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
		              withShip: 2
		              withBoard: aBoard
		              WithDice: aCollectionOfDice
		              andwithNumberOfLaps: 2.
	aPermanentCard := AccelerationCard new.
	aShip := (aBoardGame getShipsPlaying at: 1).
	anotherShip := (aBoardGame getShipsPlaying at: 2).
	shipsPlaying := aBoardGame getShipsPlaying.
	aShip addCard: aPermanentCard.
	aBoardGame playCard: aPermanentCard fromShip: aShip toTarget: shipsPlaying.
	aShip moves: 89.
	anotherShip moves: 89.
	self assert: (aShip getPosition) equals: 91.
	self assert: (anotherShip getPosition) equals: 91.
	
]

{ #category : 'tests' }
ABoardGameTest >> test_18_WhenAOverloadCardIsPlayedThenAllShipsGetTheirMovesAffected [

	| aCollectionOfDice aLoadedDie aBoardGame boxesArray aBoard anotherLoadedDie aPermanentCard aShip anotherShip |
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
		              withShip: 2
		              withBoard: aBoard
		              WithDice: aCollectionOfDice
		              andwithNumberOfLaps: 2.
	aPermanentCard := OverloadCard new.
	aShip := (aBoardGame getShipsPlaying at: 1).
	anotherShip := (aBoardGame getShipsPlaying at: 2).
	aShip addCard: aPermanentCard.
	aBoardGame playCard: aPermanentCard fromShip: aShip toTarget: anotherShip.
	aShip moves: 89.
	(aBoardGame getShipsPlaying at: 2) moves: 89.
	self assert: ((aBoardGame getShipsPlaying at: 2) getPosition) equals: 88.
	
]

{ #category : 'tests' }
ABoardGameTest >> test_19_WhenAAllyCardIsPlayedThenAllShipsGetTheirMovesAffected [

	| aCollectionOfDice aLoadedDie aBoardGame boxesArray aBoard anotherLoadedDie aPermanentCard aShip anotherShip |
	boxesArray := OrderedCollection new.
	boxesArray add: (NoEffectBox inPlace: 1).
	boxesArray add: (NoEffectBox inPlace: 2).
	boxesArray add: (NoEffectBox inPlace: 3).
	boxesArray add: (NoEffectBox inPlace: 4).
	boxesArray add: (NoEffectBox inPlace: 5).
	boxesArray add: (NoEffectBox inPlace: 6).
	boxesArray add: (NoEffectBox inPlace: 7).
	aBoard := Board withBoxesArray: boxesArray.
	aCollectionOfDice := OrderedCollection new.
	aLoadedDie := LoadedDie of: 5.
	anotherLoadedDie := LoadedDie of: 4.
	aCollectionOfDice add: aLoadedDie.
	aCollectionOfDice add: anotherLoadedDie.
	aBoardGame := BoardGame
		              withShip: 2
		              withBoard: aBoard
		              WithDice: aCollectionOfDice
		              andwithNumberOfLaps: 2.
	aPermanentCard := AllyCard new.
	aShip := (aBoardGame getShipsPlaying at: 1).
	anotherShip := (aBoardGame getShipsPlaying at: 2).
	aShip addCard: aPermanentCard.
	aBoardGame playCard: aPermanentCard fromShip: aShip toTarget: anotherShip.
	aShip moves: 23.
	aShip consumeFuel: 23.
	self assert: (aShip getPosition) equals: 24.
	self assert: (anotherShip getFuel) equals: 21.
	
]

{ #category : 'tests' }
ABoardGameTest >> test_20_TheGameKnowsTheLastCardBeingPlayed [

	| aCollectionOfDice aLoadedDie aBoardGame boxesArray aBoard anotherLoadedDie aPermanentCard aShip anotherShip |
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
	aPermanentCard := AllyCard new.
	aShip := (aBoardGame getShipsPlaying at: 1).
	anotherShip := (aBoardGame getShipsPlaying at: 2).
	aShip addCard: aPermanentCard.
	aBoardGame playCard: aPermanentCard fromShip: aShip toTarget: anotherShip.
	self assert: ((aBoardGame getLastCard) isKindOf: AllyCard) .
	
]

{ #category : 'tests' }
ABoardGameTest >> test_21_WhenARedoCardIsPLayedAfterAPermanentCardThenTheEffectIsTheOneOnThePermanentCard [

	| aCollectionOfDice aLoadedDie aBoardGame boxesArray aBoard anotherLoadedDie aPermanentCard aRedoCard aShip anotherShip |
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
	aPermanentCard := AllyCard new.
	aRedoCard := RedoCard  new.
	aShip := (aBoardGame getShipsPlaying at: 1).
	anotherShip := (aBoardGame getShipsPlaying at: 2).
	aShip addCard: aPermanentCard.
	aShip addCard: aRedoCard.
	aBoardGame playCard: aPermanentCard fromShip: aShip toTarget: anotherShip. 
	aBoardGame playCard: aRedoCard fromShip: aShip toTarget: anotherShip.
	self assert: (anotherShip getActiveCards size = 2) .
	
]

{ #category : 'tests' }
ABoardGameTest >> test_23_WhenARedoCardIsPLayedAfterAReDoCardThenTheEffectIsTheOneOnTheReDoCard [

	| aCollectionOfDice aLoadedDie aBoardGame boxesArray aBoard anotherLoadedDie aPermanentCard aRedoCard anotherRedoCard aShip aShip2 aShip3 |
	boxesArray := OrderedCollection new.
	boxesArray add: (NoEffectBox inPlace: 1).
	boxesArray add: (NoEffectBox inPlace: 2).
	boxesArray add: (NoEffectBox inPlace: 3).
	boxesArray add: (NoEffectBox inPlace: 4).
	boxesArray add: (NoEffectBox inPlace: 5).
	boxesArray add: (NoEffectBox inPlace: 6).
	aBoard := Board withBoxesArray: boxesArray.
	aCollectionOfDice := OrderedCollection new.
	aLoadedDie := LoadedDie of: 5.
	anotherLoadedDie := LoadedDie of: 4.
	aCollectionOfDice add: aLoadedDie.
	aCollectionOfDice add: anotherLoadedDie.
	aBoardGame := BoardGame
		              withShip: 3
		              withBoard: aBoard
		              WithDice: aCollectionOfDice
		              andwithNumberOfLaps: 3.
	aBoardGame playTurn.	
	aBoardGame playTurn.
	aBoardGame playTurn.	
	aPermanentCard := RepeatCard new.
	aRedoCard := RedoCard  new.
	anotherRedoCard := RedoCard  new.
	aShip := (aBoardGame getShipsPlaying at: 1).
	aShip2 := (aBoardGame getShipsPlaying at: 2).
	aShip3 := (aBoardGame getShipsPlaying at: 1).
	aShip addCard: aPermanentCard.
	aShip addCard: aRedoCard.
	aShip addCard: anotherRedoCard.
	aBoardGame playCard: aPermanentCard fromShip: aShip toTarget: aShip2.
	aBoardGame playCard: aRedoCard fromShip: aShip toTarget: aShip2.
	aBoardGame playCard: aRedoCard fromShip: aShip toTarget: aShip2.
	self assert: ((aShip getPosition) = 4) .
	self assert: ((aShip2 getPosition) = 4) .
	self assert: ((aShip3 getPosition) = 4) .
]

{ #category : 'tests' }
ABoardGameTest >> test_24_WhenABoardGameAddsInformationtoAHyperJumpBoxThenItIsAdded [

	| aCollectionOfDice aLoadedDie aBoardGame boxesArray aBoard anotherLoadedDie aBox aParsecsList|
	boxesArray := OrderedCollection new.
	boxesArray add: (HyperJumpBox  inPlace: 1).
	boxesArray add: (HyperJumpBox inPlace: 2).
	boxesArray add: (HyperJumpBox inPlace: 3).
	boxesArray add: (HyperJumpBox inPlace: 4).
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
	aBox := aBoard boxes at: 3.
	aParsecsList := OrderedCollection new.
	aParsecsList add: (Parsec withValue: 7).
	aParsecsList add: (Parsec withValue: 5).
	aParsecsList add: (Parsec withValue: 2).
	aBoardGame addHyperJumpInformationTo: aBox withParsecList: aParsecsList withParsecLenght: 100.

	self assert: aBox getParsecList equals: aParsecsList . 
	
]

{ #category : 'tests' }
ABoardGameTest >> test_25_WhenABoardGameAddsInformationtoAHyperGravityBoxThenItIsAdded [

	| aCollectionOfDice aLoadedDie aBoardGame boxesArray aBoard anotherLoadedDie aBox aDieResult|
	boxesArray := OrderedCollection new.
	boxesArray add: (HyperGravityBox inPlace: 1).
	boxesArray add: (HyperGravityBox inPlace: 2).
	boxesArray add: (HyperGravityBox inPlace: 3).
	boxesArray add: (HyperGravityBox inPlace: 4).
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
	aBox := aBoard boxes at: 3.
	aDieResult := 4.
	aBoardGame addHyperGravityInformationTo: aBox withDieResult: aDieResult.

	self assert: aBox getNumberOfDie equals: aDieResult . 
	
]

{ #category : 'tests' }
ABoardGameTest >> test_26_WhenABoardGameAddsInformationAMoonWalkBoxThenItIsReturned [

	| aCollectionOfDice aLoadedDie aBoardGame boxesArray aBoard anotherLoadedDie aBox aBoxNumber|
	boxesArray := OrderedCollection new.
	boxesArray add: (MoonWalkBox inPlace: 1).
	boxesArray add: (MoonWalkBox inPlace: 2).
	boxesArray add: (MoonWalkBox inPlace: 3).
	boxesArray add: (MoonWalkBox inPlace: 4).
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
	aBox := aBoard boxes at: 3.
	aBoxNumber := 4.
	aBoardGame addMoonWalkInformationTo: aBox withBoxesNumber: aBoxNumber.

	self assert: aBox getnumberOfBoxesToMove equals: aBoxNumber . 
	
]

{ #category : 'tests' }
ABoardGameTest >> test_27_WhenANotHyperGravityBoxAskToAddInformationThenAErrorRaise [

	| aCollectionOfDice aLoadedDie aBoardGame boxesArray aBoard anotherLoadedDie aBox aDieResult |
	boxesArray := OrderedCollection new.
	boxesArray add: (MoonWalkBox   inPlace: 1).
	boxesArray add: (MoonWalkBox inPlace: 2).
	boxesArray add: (MoonWalkBox inPlace: 3).
	boxesArray add: (MoonWalkBox  inPlace: 4).
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
	aBox := aBoard boxes at: 3.
	aDieResult := 4.

	self
		should: [
			aBoardGame
				addHyperGravityInformationTo: aBox
				withDieResult: aDieResult ]
		raise: Error
		withMessage: 'This is not an HyperGravityBox.'
]

{ #category : 'tests' }
ABoardGameTest >> test_28_WhenANotHyperJumpBoxAskToAddInformationThenAnErrorRaise [

	| aCollectionOfDice aLoadedDie aBoardGame boxesArray aBoard anotherLoadedDie aBox aParsecsList |
	boxesArray := OrderedCollection new.
	boxesArray add: (MoonWalkBox  inPlace: 1).
	boxesArray add: (MoonWalkBox inPlace: 2).
	boxesArray add: (MoonWalkBox inPlace: 3).
	boxesArray add: (MoonWalkBox inPlace: 4).
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
	aBox := aBoard boxes at: 3.
	aParsecsList := OrderedCollection new.
	aParsecsList add: (Parsec withValue: 7).
	aParsecsList add: (Parsec withValue: 5).
	aParsecsList add: (Parsec withValue: 2).
	self
		should: [
			aBoardGame
				addHyperJumpInformationTo: aBox
				withParsecList: aParsecsList
				withParsecLenght: 100 ]
		raise: Error
		withMessage: 'This is not an HyperJumpBox.'
]

{ #category : 'tests' }
ABoardGameTest >> test_29_WhenANotMoonWalkBoxAskToAddInformationThenAnErrorRaise [

	| aCollectionOfDice aLoadedDie aBoardGame boxesArray aBoard anotherLoadedDie aBox aBoxNumber |
	boxesArray := OrderedCollection new.
	boxesArray add: (HyperGravityBox  inPlace: 1).
	boxesArray add: (HyperGravityBox inPlace: 2).
	boxesArray add: (HyperGravityBox inPlace: 3).
	boxesArray add: (HyperGravityBox  inPlace: 4).
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
	aBox := aBoard boxes at: 3.
	aBoxNumber := 4.

	self
		should: [
			aBoardGame
				addMoonWalkInformationTo: aBox
				withBoxesNumber: aBoxNumber ]
		raise: Error
		withMessage: 'This is not an MoonWalkBox.'
]

{ #category : 'tests' }
ABoardGameTest >> test_30_WhenAOverloadCardIsPlayedThenTheShipsMovesGetAffected_Refactor [

	| aCollectionOfDice aLoadedDie aBoardGame boxesArray aBoard anotherLoadedDie aOverloadCard aShip anotherShip |
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
		              withShip: 2
		              withBoard: aBoard
		              WithDice: aCollectionOfDice
		              andwithNumberOfLaps: 2.
	aOverloadCard := OverloadCard new.
	aShip := aBoardGame getShipsPlaying at: 1.
	anotherShip := aBoardGame getShipsPlaying at: 2.
	aShip addCard: aOverloadCard.
	aBoardGame playCard: aOverloadCard fromShip: aShip toTarget: anotherShip.
	aShip moves: 89.
	anotherShip moves: 89.
	self assert: (anotherShip getPosition) equals: 88.
	
]

{ #category : 'tests' }
ABoardGameTest >> test_31_WhenAAccelerationCardIsPlayedThenAllShipsGetTheirMovesAffected_Refactor [

	| aCollectionOfDice aLoadedDie aBoardGame boxesArray aBoard anotherLoadedDie anAcellerationCard aShip anotherShip shipsPlaying |
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
		              withShip: 2
		              withBoard: aBoard
		              WithDice: aCollectionOfDice
		              andwithNumberOfLaps: 2.
	anAcellerationCard := AccelerationCard new.
	aShip := aBoardGame getShipsPlaying at: 1.
	anotherShip := aBoardGame getShipsPlaying at: 2.
	aShip addCard: anAcellerationCard.
	shipsPlaying := aBoardGame getShipsPlaying.
	aBoardGame playCard: anAcellerationCard  fromShip: aShip  toTarget: shipsPlaying.
	aShip moves: 89.
	anotherShip moves: 89.
	self assert: (aShip getPosition) equals: 91.
	self assert: (anotherShip getPosition) equals: 91.
]

{ #category : 'tests' }
ABoardGameTest >> test_32_WhenAAllyCardIsPlayedThenShipsGetTheirMovesAffected_Refactor [

	| aCollectionOfDice aLoadedDie aBoardGame boxesArray aBoard anotherLoadedDie anAllyCard aShip anotherShip |
	boxesArray := OrderedCollection new.
	boxesArray add: (NoEffectBox inPlace: 1).
	boxesArray add: (NoEffectBox inPlace: 2).
	boxesArray add: (NoEffectBox inPlace: 3).
	boxesArray add: (NoEffectBox inPlace: 4).
	boxesArray add: (NoEffectBox inPlace: 5).
	boxesArray add: (NoEffectBox inPlace: 6).
	boxesArray add: (NoEffectBox inPlace: 7).
	aBoard := Board withBoxesArray: boxesArray.
	aCollectionOfDice := OrderedCollection new.
	aLoadedDie := LoadedDie of: 5.
	anotherLoadedDie := LoadedDie of: 4.
	aCollectionOfDice add: aLoadedDie.
	aCollectionOfDice add: anotherLoadedDie.
	aBoardGame := BoardGame
		              withShip: 2
		              withBoard: aBoard
		              WithDice: aCollectionOfDice
		              andwithNumberOfLaps: 2.
	anAllyCard := AllyCard new.
	aShip := (aBoardGame getShipsPlaying at: 1).
	aShip addCard: anAllyCard.
	anotherShip := (aBoardGame getShipsPlaying at: 2).
	aBoardGame playCard: anAllyCard fromShip: aShip toTarget: anotherShip.
	aShip moves: 23.
	aShip consumeFuel: 23.
	self assert: (aShip getPosition) equals: 24.
	self assert: (anotherShip getFuel) equals: 21.
]

{ #category : 'tests' }
ABoardGameTest >> test_33_TheGameKnowsTheLastCardBeingPlayed_Refactor [

	| aCollectionOfDice aLoadedDie aBoardGame boxesArray aBoard anotherLoadedDie aCard aShip anotherShip |
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
	aCard := AllyCard new.
	aShip := (aBoardGame getShipsPlaying at: 1).
	anotherShip := (aBoardGame getShipsPlaying at: 2).
	aShip addCard: aCard.
	aBoardGame playCard: aCard fromShip: aShip toTarget: anotherShip.
	self assert: ((aBoardGame getLastCard) isKindOf: AllyCard) .
]

{ #category : 'tests' }
ABoardGameTest >> test_34_WhenAShipTryesToPlayAPermanentCardAndItsNotItsTurnThenAnErrorIsRaised [

	| aCollectionOfDice aLoadedDie aBoardGame boxesArray aBoard anotherLoadedDie aCard aShip anotherShip aPermanentCard |
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
	aPermanentCard := OverloadCard new.
	aShip := (aBoardGame getShipsPlaying at: 1).
	anotherShip := (aBoardGame getShipsPlaying at: 2).
	anotherShip addCard: aPermanentCard.
	self should: [
			aBoardGame
				playCard: aPermanentCard fromShip: anotherShip toTarget: aShip ]
		raise: Error
		withMessage: 'You cant play a permanent card when its not your turn.'.

]

{ #category : 'tests' }
ABoardGameTest >> test_35_WhenATimeMachineCardIsPlayedAfterTwoTurnsHavePassedThenTheFuelIsRestarted [

	| aCollectionOfDice aLoadedDie aBoardGame boxesArray aBoard anotherLoadedDie aTimeMachineCard aShip anotherShip checkFuel |
	boxesArray := OrderedCollection new.
	boxesArray add: (NoEffectBox inPlace: 1).
	boxesArray add: (NoEffectBox inPlace: 2).
	boxesArray add: (NoEffectBox inPlace: 3).
	boxesArray add: (NoEffectBox inPlace: 4).
	boxesArray add: (NoEffectBox inPlace: 5).
	boxesArray add: (NoEffectBox inPlace: 6).
	boxesArray add: (NoEffectBox inPlace: 7).
	aBoard := Board withBoxesArray: boxesArray.
	aCollectionOfDice := OrderedCollection new.
	aLoadedDie := LoadedDie of: 5.
	anotherLoadedDie := LoadedDie of: 4.
	aCollectionOfDice add: aLoadedDie.
	aCollectionOfDice add: anotherLoadedDie.
	aBoardGame := BoardGame
		              withShip: 2
		              withBoard: aBoard
		              WithDice: aCollectionOfDice
		              andwithNumberOfLaps: 7.
	aTimeMachineCard := TimeMachineCard new.
	aShip := (aBoardGame getShipsPlaying at: 1).
	aShip addCard: aTimeMachineCard.
	anotherShip := (aBoardGame getShipsPlaying at: 2).
	aBoardGame playTurn. 
	aBoardGame playTurn. 
	checkFuel := anotherShip getFuel.
	aBoardGame playTurn. 
	aBoardGame playTurn. 
	aBoardGame playTurn.	
	aBoardGame playTurn. 
	aBoardGame playCard: aTimeMachineCard fromShip: aShip toTarget: anotherShip.
	self assert: anotherShip getFuel equals: checkFuel.
]
