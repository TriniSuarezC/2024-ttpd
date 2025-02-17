Class {
	#name : 'AShipTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
AShipTest >> testShipIsCreatedWithAPosition [

	| aShip |
	aShip := Ship createWithMaxFuel: 1000.
	self assert: (aShip moves: 1) equals: 2
]

{ #category : 'tests' }
AShipTest >> testWhen2LoadedDieOf3And4FacesAreThrownThenThePositionOfTheShipIsUpdatedTo7 [

	| aShip aCollectionOfDice aDie positionsToMove anotherDie |
	aCollectionOfDice := OrderedCollection new.
	aDie := LoadedDie of: 3.
	anotherDie := LoadedDie of: 4.
	aCollectionOfDice add: aDie.
	aCollectionOfDice add: anotherDie.
	aShip := Ship createWithMaxFuel: 1000.
	positionsToMove := aShip throwDice: aCollectionOfDice.
	aShip moves: positionsToMove.
	self assert: aShip getPosition equals: 8
]

{ #category : 'tests' }
AShipTest >> testWhenMoreThanOneLoadedDieAreThrownThenThrowDiceReturnsTheSumOfResults [

	| aShip aCollectionOfDice aDie anotherDie |
	aCollectionOfDice := OrderedCollection new.
	aDie := LoadedDie of: 3.
	anotherDie := LoadedDie of: 4.
	aCollectionOfDice add: aDie.
	aCollectionOfDice add: anotherDie.
	aShip := Ship createWithMaxFuel: 100.
	self assert: (aShip throwDice: aCollectionOfDice) equals: 7
]

{ #category : 'tests' }
AShipTest >> test_01_WhenAShipHasFuelThenGetFuelReturnsIt [
	| aShip |
	aShip := Ship createWithMaxFuel: 100.
	
	
	self assert: (aShip getFuel) equals: 100
]

{ #category : 'tests' }
AShipTest >> test_02_WhenAShipConsumesFuelThenTheFuelReduces [
	| aShip |
	aShip := Ship createWithMaxFuel: 100.
	aShip consumeFuel: 50.
	
	self assert: (aShip getFuel) equals: 50
]

{ #category : 'tests' }
AShipTest >> test_04_WhenAShipRestartsTheFuelThenFuelIsMaxFuel [

	| aShip |
	aShip := Ship createWithMaxFuel: 100.
	aShip consumeFuel: 50.
	
	self assert: aShip getFuel equals: 50.
	
	aShip restartFuel.

	self assert: aShip getFuel equals: 100
]

{ #category : 'tests' }
AShipTest >> test_05_WhenAShipHasAnAmountOfLapsThenGetLapsReturnsLaps [

	| aShip |
	aShip := Ship createWithMaxFuel: 100.
	
	self assert: aShip getLaps equals: 1
]

{ #category : 'tests' }
AShipTest >> test_11_WhenLapsIsUpdatedAndTotalLapsToDoIs2ThenStateChangesToWinner [
	| aShip |
	aShip := Ship createWithMaxFuel: 1000.
	aShip updateLaps.
	aShip checkIfWin: 2.
	self assert: (aShip getState isKindOf: Winner).
]

{ #category : 'tests' }
AShipTest >> test_12_WhenAShipIsCreatedThenNoVictory [
	| aShip |
	aShip := Ship createWithMaxFuel: 1000.
	self deny: aShip victory.
]

{ #category : 'tests' }
AShipTest >> test_13_WhenAShipFinishesLapsThenVictory [
	| aShip |
	aShip := Ship createWithMaxFuel: 1000.
	aShip updateLaps.
	aShip checkIfWin: 2.
	self assert: aShip victory.
]

{ #category : 'tests' }
AShipTest >> test_14_WhenAShipRunsOutOfFuelThenNoVictory [
	| aShip |
	aShip := Ship createWithMaxFuel: 1000.
	aShip consumeFuel: 1000.
	self deny: aShip victory.
]

{ #category : 'tests' }
AShipTest >> test_15_WhenShipRunsOutOfFuelThenTurnsToSkipIs2 [
	| aShip |
	aShip := Ship createWithMaxFuel: 1000.
	aShip consumeFuel: 1000.
	self assert: (aShip getState) getContTurns equals: 3.
]

{ #category : 'tests' }
AShipTest >> test_16_WhenAShipIsPlayingStateThenTheShipCanPlay [
	| aShip |
	aShip := Ship createWithMaxFuel: 1000.
	self assert: aShip checkTurn.
]

{ #category : 'tests' }
AShipTest >> test_17_WhenAShipRunsOutOfFuelThenCheckTurnReturnsFalse [
	| aShip |
	aShip := Ship createWithMaxFuel: 1000.
	aShip consumeFuel: 1000.
	self deny: aShip checkTurn.
]

{ #category : 'tests' }
AShipTest >> test_18_WhenAShipChangesItStateToPlayThenStateIsKindOfPlaying [
	| aShip |
	aShip := Ship createWithMaxFuel: 1000.
	aShip consumeFuel: 1000.
	self assert: (aShip getState isKindOf: CantPlayANumberOfTurns).
	aShip changeStateToPlay.
	self assert: (aShip getState isKindOf: Playing).
]

{ #category : 'tests' }
AShipTest >> test_19_WhenAShipDecidesToSkipOneTurnThenStateChangesToCantPlay [
	| aShip |
	aShip := Ship createWithMaxFuel: 1000.
	aShip skipTurn.
	self assert: (aShip getState isKindOf: CantPlayANumberOfTurns).
]

{ #category : 'tests' }
AShipTest >> test_20_WhenShipDecidesToSkipATurnThenFuelIsRestoresToMaxValue [
	| aShip |
	aShip := Ship createWithMaxFuel: 1000.
	aShip consumeFuel: 200.
	aShip skipTurn.
	self assert: aShip getFuel equals: 1000 .
]

{ #category : 'tests' }
AShipTest >> test_21_AShipKnowsItsLastDieResult [
	| aShip aCollectionOfDice aLoadedDie |
	aShip := Ship createWithMaxFuel: 1000.
	aCollectionOfDice := OrderedCollection new.
	aLoadedDie := LoadedDie of: 5.
	aCollectionOfDice add: aLoadedDie.
	aShip throwDice: aCollectionOfDice.
	self assert: aShip getLastDieResult equals: 5.
]

{ #category : 'tests' }
AShipTest >> test_22_AShipIsCursedThenStateChangesToEffectBoxState [

	| aShip |
	aShip := Ship createWithMaxFuel: 1000.
	aShip isCursed.
	self assert: (aShip getState isKindOf: Jail)
]

{ #category : 'tests' }
AShipTest >> test_23_AShipEndsTheCursedTheStateChangesToPlaying [

	| aShip |
	aShip := Ship createWithMaxFuel: 1000.
	aShip endCursed .
	self assert: (aShip getState isKindOf: Playing)
]

{ #category : 'tests' }
AShipTest >> test_24_WhenAShipDecreasedItsLapsThenLapsIs0 [
	| aShip |
	aShip := Ship createWithMaxFuel: 1000.
	aShip decreaseLaps.
	self assert: aShip getLaps equals: 0.
]

{ #category : 'tests' }
AShipTest >> test_25_WhenAShipEntersAWormHoleThenItMovesToDestiny [

	| aShip aWormholeBox anotherWormholeBox aCollectionOfShips |
	aCollectionOfShips := OrderedCollection new.
	aShip := Ship createWithMaxFuel: 1000.
	aCollectionOfShips add: aShip .
	aWormholeBox := WormHoleBox inPlace: 2.
	anotherWormholeBox := WormHoleBox inPlace: 4.
	aWormholeBox withDestiny: anotherWormholeBox.
	anotherWormholeBox withDestiny: aWormholeBox.
	aShip moves: 1.
	aShip consumeFuel: 1.
	aWormholeBox effectShips: aCollectionOfShips playing: aShip withBoardSize: 1 .
	self assert: aShip getPosition equals: 4.
]

{ #category : 'tests' }
AShipTest >> test_26_WhenAShipEntersAWormHoleThenItConsumesFuelToDestiny [

	| aShip aWormholeBox anotherWormholeBox aCollectionOfShips |
	aCollectionOfShips := OrderedCollection new.
	aShip := Ship createWithMaxFuel: 1000.
	aCollectionOfShips add: aShip .
	aWormholeBox := WormHoleBox inPlace: 2.
	anotherWormholeBox := WormHoleBox inPlace: 4.
	aWormholeBox withDestiny: anotherWormholeBox.
	anotherWormholeBox withDestiny: aWormholeBox.
	aShip moves: 1.
	aShip consumeFuel: 1.
	aWormholeBox effectShips: aCollectionOfShips playing: aShip withBoardSize: 1 .
	self assert: aShip getFuel equals: 997.
]

{ #category : 'tests' }
AShipTest >> test_27_WhenAShipHasMoreLapsThanAnotherShipThenAShipIsGreaterThanAnotherShip [

	| aShip anotherShip |
	aShip := Ship createWithMaxFuel: 1000.
	anotherShip := Ship createWithMaxFuel: 1000.
	aShip updateLaps.
	self assert: aShip > anotherShip.
]

{ #category : 'tests' }
AShipTest >> test_28_WhenAShipHasSameLapsButBiggerPositionThanAnotherShipThenAShipIsGreaterThanAnotherShip [

	| aShip anotherShip |
	aShip := Ship createWithMaxFuel: 1000.
	anotherShip := Ship createWithMaxFuel: 1000.
	aShip moves: 5.
	self assert: aShip > anotherShip.
]

{ #category : 'tests' }
AShipTest >> test_29_WhenAShipHasMoreLapsButLessPositionThenAShipIsGreaterThanAnotherShip [

	| aShip anotherShip |
	aShip := Ship createWithMaxFuel: 1000.
	anotherShip := Ship createWithMaxFuel: 1000.
	aShip moves: 5.
	aShip updateLaps.
	anotherShip moves: 10.
	self assert: aShip > anotherShip.
]

{ #category : 'tests' }
AShipTest >> test_30_WhenAshipHasActiveOverloadCardThenShipIsAffected [

	| aShip anotherShip aCard boxesArray aBoard aCollectionOfDice aLoadedDie anotherLoadedDie aBoardGame shipsPlaying |
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
	aCard:= OverloadCard new.
	aCard affectTo: anotherShip from: aShip playing: aBoardGame.
	anotherShip moves: 5.
	

	self assert: anotherShip getPosition equals: 4.
]

{ #category : 'tests' }
AShipTest >> test_31_WhenAShipHasActiveAccelerationCardThenAllShipsAffected [

	| aShip anotherShip aCard boxesArray aBoard aCollectionOfDice aLoadedDie anotherLoadedDie aBoardGame shipsPlaying |
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
	aCard:= AccelerationCard new.
	aCard affectTo: shipsPlaying from: aShip playing: aBoardGame. 
	anotherShip moves: 8.
	self assert: anotherShip getPosition equals: 10.
	self assert: aShip getPosition equals: 1.
	aShip moves: 7.
	self assert: aShip  getPosition equals:9.
]

{ #category : 'tests' }
AShipTest >> test_32_WhenAShipRunOutOfFuelAndHasAnAllyThenAllyShareFuel [

	| aShip anotherShip aCard boxesArray aBoard aCollectionOfDice aLoadedDie anotherLoadedDie aBoardGame shipsPlaying |
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
	aCard:= AllyCard new.
	aCard affectTo: anotherShip from: aShip  playing: aBoardGame.
	aShip consumeFuel: 190.
	self assert: anotherShip getFuel equals: 178.
	self assert: aShip getFuel equals: 0.


]

{ #category : 'tests' }
AShipTest >> test_33_WhenAshipRunOutOfFuelAndHisAllyToThenBothGoesToPositionOneWithMaxFuelAndWithCantPLayANumberOfTurnsState [

	| aShip anotherShip aCard aCollectionOfShips boxesArray aBoard aCollectionOfDice aLoadedDie anotherLoadedDie aBoardGame |
aCard:= AllyCard new.
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

	anotherShip consumeFuel: 15.
	aShip consumeFuel: 15.	
	self assert: aShip getPosition equals: 1.
	self assert: anotherShip getPosition equals: 1.
	self assert: anotherShip getFuel equals: 169.
	self assert: aShip getFuel equals: 169.
	


]

{ #category : 'tests' }
AShipTest >> test_34_WhenAShipCanAddACardToHisColectionOfCards [

	| aShip aCard aCollectionOfCards |
	aShip := Ship createWithMaxFuel: 5.
	aCard := AllyCard new.
	aCollectionOfCards := OrderedCollection new.
	aCollectionOfCards add: aCard.
	aShip addCard: aCard.

	self assert: aShip getCards equals: aCollectionOfCards
]

{ #category : 'tests' }
AShipTest >> test_35_WhenAShipThrowTheMaxDieResultThenShipWinReward [

	| aShip  aCollectionOfDice aLoadedDie aDieResult |
	aShip := Ship createWithMaxFuel: 5.

	aCollectionOfDice := OrderedCollection new.
	aLoadedDie := LoadedDie of: 5.
	aCollectionOfDice add: aLoadedDie.
	aDieResult:=	aShip throwDice: aCollectionOfDice.
	aShip checkReward: aDieResult withMax: 5.
	self assert: ((aShip getFuel = 4) or: (aShip getMaxFuel =6)).
]

{ #category : 'tests' }
AShipTest >> test_36_WhenAShipSelectsACardThenTheCardIsSelected [

	| aShip aCard anotherCard |
	aShip := Ship createWithMaxFuel: 5.

	aCard := OverloadCard new.
	anotherCard := AccelerationCard new.
	aShip addCard: aCard.
	aShip addCard: anotherCard.
	self assert: (aShip selectCard:  aCard) equals: aCard.
]

{ #category : 'tests' }
AShipTest >> test_37_WhenAShipWantsToRemoveACardFromItsHandThenTheCardIsRemoved [

	| aShip aCard anotherCard |
	aShip := Ship createWithMaxFuel: 5.

	aCard := OverloadCard new.
	anotherCard := AccelerationCard new.
	aShip addCard: aCard.
	aShip addCard: anotherCard.
	aShip removeCardFromHand: aCard.
	self assert: (aShip getCards size) equals: 1.
]

{ #category : 'tests' }
AShipTest >> test_38_WhenAShipPlaysItsTurnThenTheAmountOfTimesPlayedIsUpdated [
	
	| aShip boxesArray aBoard aCollectionOfDice aLoadedDie anotherLoadedDie aBoardGame |
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
		              withShip: 3
		              withBoard: aBoard
		              WithDice: aCollectionOfDice
		              andwithNumberOfLaps: 2.
	aShip := aBoardGame getShipsPlaying at: 1.
	aBoardGame playTurn. 
	self assert: (aShip getTurnsPlayed) equals: 1.
]

{ #category : 'tests' }
AShipTest >> test_39_WhenAShipIsCreatedTurnsPlayedEqualsCero [
	
	| aShip |
	aShip := Ship createWithMaxFuel: 1000.
	self assert: (aShip getTurnsPlayed) equals: 0.
]

{ #category : 'tests' }
AShipTest >> test_41_WhenAShipHasPlayedMoreThan2TurnsThenPlayTimeMachineIsTrue [
	
	| aShip boxesArray aBoard aCollectionOfDice aLoadedDie aBoardGame |
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
		              withShip: 1
		              withBoard: aBoard
		              WithDice: aCollectionOfDice
		              andwithNumberOfLaps: 2.
	aShip := aBoardGame getShipsPlaying at: 1.
	aBoardGame playTurn. 
	aBoardGame playTurn. 
	aBoardGame playTurn. 
	self assert: (aShip canPlayTimeMachine) equals: true.
]

{ #category : 'tests' }
AShipTest >> test_47_WhenAShipIsCreatedSoIsItsFuelHistoryAsACollection [
	
	| aShip|
	aShip := Ship createWithMaxFuel: 1000.
	self assert: ((aShip getFuelHistory) isKindOf: OrderedCollection).
]

{ #category : 'tests' }
AShipTest >> test_49_WhenAShipPlaysATurnTheFuelHistoryIsUpdated [
	
	| aShip boxesArray aBoard aCollectionOfDice aLoadedDie aBoardGame checkFuel |
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
		              withShip: 1
		              withBoard: aBoard
		              WithDice: aCollectionOfDice
		              andwithNumberOfLaps: 2.
	aShip := aBoardGame getShipsPlaying at: 1.
	aBoardGame playTurn. 
	checkFuel := aShip getFuel.
	self assert: ((aShip getFuelHistory) at: 1) equals: 8.
	self assert: ((aShip getFuelHistory) at: 2) equals: checkFuel.
]

{ #category : 'tests' }
AShipTest >> test_50_WhenAShipPlaysTwoTurnsTheFuelHistoryIsUpdated [
	
	| aShip boxesArray aBoard aCollectionOfDice aLoadedDie aBoardGame checkFuel checkFuel1 checkFuel2 |
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
		              withShip: 1
		              withBoard: aBoard
		              WithDice: aCollectionOfDice
		              andwithNumberOfLaps: 2.
	aShip := aBoardGame getShipsPlaying at: 1.
	checkFuel := aShip getFuel.
	aBoardGame playTurn. 
	checkFuel1 := aShip getFuel.
	aBoardGame playTurn.
	checkFuel2 := aShip getFuel.
	self assert: ((aShip getFuelHistory) at: 1) equals: checkFuel.
	self assert: ((aShip getFuelHistory) at: 2) equals: checkFuel1.
	self assert: ((aShip getFuelHistory) at: 3) equals: checkFuel2.
]

{ #category : 'tests' }
AShipTest >> test_51_WhenAShipGetsAnAllyThenTheAllyCanBeKnown [

	| aShip anotherShip aCard boxesArray aBoard aCollectionOfDice aLoadedDie anotherLoadedDie aBoardGame shipsPlaying |
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
	aCard:= AllyCard new.
	aCard affectTo: anotherShip from: aShip  playing: aBoardGame.
	self assert: aShip getAlly equals: anotherShip.
	self assert: anotherShip getAlly equals: aShip.


]

{ #category : 'tests' }
AShipTest >> test_52_WhenAShipIsAskedForARandomCardACardIsReturned [

	| aShip aCard anotherCard|
	aShip := Ship createWithMaxFuel: 1000.
	aCard := PermanentCard new.
	anotherCard := PermanentCard new.
	aShip addCard: aCard.
	aShip addCard: anotherCard.
	aShip addActiveCards: aCard.
	aShip addActiveCards: aCard.
	
	self assert: (aShip selectRandomCard isKindOf: PermanentCard ).

]

{ #category : 'tests' }
AShipTest >> test_53_WhenAShipIsAskedForToRemoveARandomCardThenACardIsRemoved [

	| aShip aCard anotherCard oneMoreCard|
	aShip := Ship createWithMaxFuel: 1000.
	aCard := Card new.
	anotherCard := Card new.
	oneMoreCard := Card new.
	aShip addCard: aCard.
	aShip addCard: anotherCard.
	aShip addCard: oneMoreCard.
	aShip removeRandomCard.
	self assert: (aShip getCards size) equals: 2.

]
