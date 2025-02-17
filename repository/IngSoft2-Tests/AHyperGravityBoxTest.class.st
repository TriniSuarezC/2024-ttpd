Class {
	#name : 'AHyperGravityBoxTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
AHyperGravityBoxTest >> test_02_AHyperGravityBoxHasANumerOfDie [

	| aHyperGravity |
	aHyperGravity := HyperGravityBox inPlace: 3.
	aHyperGravity setNumber: 5.
	self assert: aHyperGravity getNumberOfDie equals: 5.
]

{ #category : 'tests' }
AHyperGravityBoxTest >> test_03_WhenAShipLandsInAHyperGravityBoxThenItsStateChangesJailState [

	| aShip anotherShip aCollectionOfShips aHyperGravityBox |
	aShip:=Ship createWithMaxFuel: 1000.
	anotherShip :=Ship createWithMaxFuel: 1000.
	aCollectionOfShips:=OrderedCollection  new.
	aCollectionOfShips add: aShip.
	aCollectionOfShips add: anotherShip .	
	aHyperGravityBox := HyperGravityBox inPlace: 3.
	aHyperGravityBox setNumber: 5.
	aShip moves: 3.
	aHyperGravityBox effectShips: aCollectionOfShips  playing: aShip withBoardSize: 1 . 
	self assert: (aShip getState isKindOf: Jail).

]

{ #category : 'tests' }
AHyperGravityBoxTest >> test_04_WhenAShipThrowsTheCorrectNumberInTheHyperGravityBoxThenTheStateChangesToPlaying [

	| aShip anotherShip aCollectionOfShips aHyperGravityBox aCollectionOfDice aLoadedDie |
	aShip:=Ship createWithMaxFuel: 1000.
	anotherShip :=Ship createWithMaxFuel: 1000.
	aCollectionOfShips:=OrderedCollection  new.
	aCollectionOfShips add: aShip.
	aCollectionOfShips add: anotherShip .
	aCollectionOfDice := OrderedCollection new.
	aLoadedDie := LoadedDie of: 5.
	aCollectionOfDice add: aLoadedDie.	
	aHyperGravityBox := HyperGravityBox inPlace: 3.
	aHyperGravityBox setNumber: 5.
	aShip moves: 2.
	aShip throwDice: aCollectionOfDice.
	aHyperGravityBox effectShips: aCollectionOfShips  playing: aShip withBoardSize: 1 . 
	self assert: (aShip getState isKindOf: Playing).

]

{ #category : 'tests' }
AHyperGravityBoxTest >> test_05_WhenAShipThrowsTheCorrectNumberInTheHyperGravityBoxThenTheShipMoves [

	| aShip anotherShip aCollectionOfShips aHyperGravityBox aCollectionOfDice aLoadedDie |
	aShip:=Ship createWithMaxFuel: 1000.
	anotherShip :=Ship createWithMaxFuel: 1000.
	aCollectionOfShips:=OrderedCollection  new.
	aCollectionOfShips add: aShip.
	aCollectionOfShips add: anotherShip .
	aCollectionOfDice := OrderedCollection new.
	aLoadedDie := LoadedDie of: 5.
	aCollectionOfDice add: aLoadedDie.	
	aHyperGravityBox := HyperGravityBox inPlace: 3.
	aHyperGravityBox setNumber: 5.
	aShip moves: 2.
	aShip throwDice: aCollectionOfDice.
	aHyperGravityBox effectShips: aCollectionOfShips  playing: aShip withBoardSize: 1 . 
	self assert: aShip getPosition equals: 8.

]

{ #category : 'tests' }
AHyperGravityBoxTest >> test_06_WhenAShipThrowsTheCorrectNumberInTheHyperGravityBoxThenTheShipCosumnesFuel [

	| aShip anotherShip aCollectionOfShips aHyperGravityBox aCollectionOfDice aLoadedDie |
	aShip:=Ship createWithMaxFuel: 1000.
	anotherShip :=Ship createWithMaxFuel: 1000.
	aCollectionOfShips:=OrderedCollection  new.
	aCollectionOfShips add: aShip.
	aCollectionOfShips add: anotherShip .
	aCollectionOfDice := OrderedCollection new.
	aLoadedDie := LoadedDie of: 5.
	aCollectionOfDice add: aLoadedDie.	
	aHyperGravityBox := HyperGravityBox inPlace: 3.
	aHyperGravityBox setNumber: 5.
	aShip moves: 2.
	aShip consumeFuel: 2.
	aShip throwDice: aCollectionOfDice.
	aHyperGravityBox effectShips: aCollectionOfShips  playing: aShip withBoardSize: 1 . 
	self assert: aShip getFuel equals: 993.

]

{ #category : 'tests' }
AHyperGravityBoxTest >> test_08_WhenAShipThrowsAFirstTimeTheIncorrectNumberButASecondTimeTheCorrectNumberThenStateChangesToJailThenToPlaying [

	| aShip anotherShip aCollectionOfShips aHyperGravityBox aCollectionOfDice aSequenceDie |
	aShip := Ship createWithMaxFuel: 1000.
	anotherShip := Ship createWithMaxFuel: 1000.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aCollectionOfShips add: anotherShip.
	aCollectionOfDice := OrderedCollection new.
	aSequenceDie := LoadedDieWithSequence loadedWithSequence: #( 1 5 ).
	aCollectionOfDice add: aSequenceDie.
	aHyperGravityBox := HyperGravityBox inPlace: 3.
	aHyperGravityBox setNumber: 5.
	aShip moves: 2.
	aShip consumeFuel: 2.
	aShip throwDice: aCollectionOfDice.
	aHyperGravityBox effectShips: aCollectionOfShips playing: aShip withBoardSize: 1 .
	self assert: (aShip getState isKindOf: Jail).
	aShip throwDice: aCollectionOfDice.
	aHyperGravityBox effectShips: aCollectionOfShips playing: aShip withBoardSize: 1 . 
	self assert: (aShip getState isKindOf: Playing).
	self assert: aShip getFuel equals: 993.
]

{ #category : 'tests' }
AHyperGravityBoxTest >> test_09_WhenAShipThrowsTheCorrectNumberInTheRevertedHyperGravityBoxThenTheStateKeepsBeingJail [

	| aShip anotherShip aCollectionOfShips aHyperGravityBox aCollectionOfDice aLoadedDie |
	aShip:=Ship createWithMaxFuel: 1000.
	anotherShip :=Ship createWithMaxFuel: 1000.
	aCollectionOfShips:=OrderedCollection  new.
	aCollectionOfShips add: aShip.
	aCollectionOfShips add: anotherShip .
	aCollectionOfDice := OrderedCollection new.
	aLoadedDie := LoadedDie of: 5.
	aCollectionOfDice add: aLoadedDie.	
	aHyperGravityBox := HyperGravityBox inPlace: 3.
	aHyperGravityBox setNumber: 5.
	aHyperGravityBox stateAlteration.
	aShip moves: 2.
	aShip throwDice: aCollectionOfDice.
	aHyperGravityBox reversalEffectShips: aCollectionOfShips  playing: aShip. 
	self assert: (aShip getState isKindOf: Jail).

]

{ #category : 'tests' }
AHyperGravityBoxTest >> test_10_WhenAShipThrowsTheIncorrectNumberInTheRevertedHyperGravityBoxThenTheStateChangesToPlaying [

	| aShip anotherShip aCollectionOfShips aHyperGravityBox aCollectionOfDice aSequenceDie |
	aShip := Ship createWithMaxFuel: 1000.
	anotherShip := Ship createWithMaxFuel: 1000.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aCollectionOfShips add: anotherShip.
	aCollectionOfDice := OrderedCollection new.
	aSequenceDie := LoadedDie of: 10.
	aCollectionOfDice add: aSequenceDie.
	aHyperGravityBox := HyperGravityBox inPlace: 3.
	aHyperGravityBox setNumber: 5.
	aHyperGravityBox stateAlteration.
	aShip moves: 2.
	aShip consumeFuel: 2.
	aShip throwDice: aCollectionOfDice.
	aHyperGravityBox reversalEffectShips: aCollectionOfShips playing: aShip.
	self assert: (aShip getState isKindOf: Playing).

]
