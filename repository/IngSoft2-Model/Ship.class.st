Class {
	#name : 'Ship',
	#superclass : 'Object',
	#instVars : [
		'position',
		'fuel',
		'maxFuel',
		'laps',
		'state',
		'lastDieResult',
		'aCollectionOfCards',
		'aCollectionOfActiveCards',
		'turnsPlayed',
		'fuelHistory'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Ship class >> createWithMaxFuel: maxFuel [ 
	^self new intitializeWithMaxFuel: maxFuel.
]

{ #category : 'comparing' }
Ship >> > anotherShip [

	self getLaps = anotherShip getLaps ifTrue: [
		^ self getPosition > anotherShip getPosition ].
	^ self getLaps > anotherShip getLaps
]

{ #category : 'as yet unclassified' }
Ship >> MyFirstAlly [
	aCollectionOfActiveCards do:[:aCard| aCard powerMove =0 ifTrue:[ ^(aCard getAlly)] ]
]

{ #category : 'adding' }
Ship >> addActiveCards: aCard [
	aCollectionOfActiveCards add:aCard
]

{ #category : 'adding' }
Ship >> addCard: aCard [ 
	aCollectionOfCards add: aCard.
]

{ #category : 'as yet unclassified' }
Ship >> addFuelHistory [
	fuelHistory add: fuel.
]

{ #category : 'testing' }
Ship >> canPlayTimeMachine [
	turnsPlayed <= 2 ifTrue: [ self error: 'You cant play a time machine card when less than 2 turns have passed.' ].
	^true. 
]

{ #category : 'as yet unclassified' }
Ship >> changeStateToPlay [
	state := Playing new.
]

{ #category : 'as yet unclassified' }
Ship >> checkAlly [
	(aCollectionOfActiveCards isEmpty) ifTrue: [^false ].
	aCollectionOfActiveCards do:[:aCard| ((aCard powerMove) = 0) ifTrue:  [^true]]
]

{ #category : 'as yet unclassified' }
Ship >> checkIfWin: aNumberOfLaps [ 
	laps >= aNumberOfLaps ifTrue: [state:=Winner new].
]

{ #category : 'as yet unclassified' }
Ship >> checkReward: aDieResult withMax: dieResultMax [

	| probabilidad |
	probabilidad := Random new next.
	probabilidad <= 0.8
		ifTrue: [ self increaseMaxFuel]
		ifFalse: [ self reduceFuel]
]

{ #category : 'as yet unclassified' }
Ship >> checkTurn [
	^state checkTurnState: self.
]

{ #category : 'as yet unclassified' }
Ship >> consumeFuel: amount [

	fuel - amount > 0
		ifTrue: [
			fuel := fuel - amount ]
		ifFalse: [
			self checkAlly
				ifTrue: [ self consumeFuelFromAlly: fuel - amount ]
				ifFalse: [ self runOutOfFuel ] ].

]

{ #category : 'as yet unclassified' }
Ship >> consumeFuelFromAlly: anAmount [
	| anAlly anotherFuel |
	anotherFuel:= anAmount *(-1).
	anAlly:= self MyFirstAlly.
	((anAlly getFuel) -anotherFuel > 0) ifTrue: [ anAlly consumeFuel: anotherFuel. fuel:=0] ifFalse: [ 
			self runOutOfFuel.
			anAlly runOutOfFuel.
		 ]
]

{ #category : 'as yet unclassified' }
Ship >> decreaseLaps [
	laps := laps - 1.
]

{ #category : 'as yet unclassified' }
Ship >> endCursed [
	state := Playing new.
	self moves: lastDieResult.
	self consumeFuel: lastDieResult.
]

{ #category : 'as yet unclassified' }
Ship >> getActiveCards [
	^aCollectionOfActiveCards 
]

{ #category : 'as yet unclassified' }
Ship >> getAlly [
	(aCollectionOfActiveCards isEmpty) ifTrue: [^false ].
	aCollectionOfActiveCards do:[:aCard| ((aCard powerMove) = 0) ifTrue:  [^(aCard getAlly)]]
]

{ #category : 'as yet unclassified' }
Ship >> getCards [
	^aCollectionOfCards 
]

{ #category : 'as yet unclassified' }
Ship >> getFuel [
	^fuel
]

{ #category : 'as yet unclassified' }
Ship >> getFuelHistory [
	^fuelHistory.
]

{ #category : 'as yet unclassified' }
Ship >> getLaps [
	^laps
]

{ #category : 'as yet unclassified' }
Ship >> getLastDieResult [
	^lastDieResult.
]

{ #category : 'as yet unclassified' }
Ship >> getMaxFuel [
	^maxFuel. 
]

{ #category : 'as yet unclassified' }
Ship >> getPosition [
	^position.
]

{ #category : 'as yet unclassified' }
Ship >> getState [
	^state.
]

{ #category : 'as yet unclassified' }
Ship >> getTurnsPlayed [
	^turnsPlayed.
]

{ #category : 'as yet unclassified' }
Ship >> increaseMaxFuel [
	maxFuel:=maxFuel +1.
]

{ #category : 'as yet unclassified' }
Ship >> intitializeWithMaxFuel: amountMaxFuel [ 
	position:= 1.
	fuel:= amountMaxFuel.
	maxFuel:= amountMaxFuel.
	fuelHistory := OrderedCollection new.
	fuelHistory add: amountMaxFuel.
	laps:= 1.
	state := Playing new.
	lastDieResult := 0.
	turnsPlayed := 0.
	aCollectionOfCards :=OrderedCollection new.
	aCollectionOfActiveCards:=OrderedCollection new.
]

{ #category : 'testing' }
Ship >> isAffectedByTimeMachineCard [
	fuel := fuelHistory at: ((turnsPlayed+1) -2).
]

{ #category : 'testing' }
Ship >> isCursed [
	state := Jail new.
]

{ #category : 'as yet unclassified' }
Ship >> moves: aNumber [
	| pos |
	pos := 0.
	aCollectionOfActiveCards isEmpty ifFalse: [  
	aCollectionOfActiveCards do: [ :card | pos := pos + card powerMove]].
	position := position + aNumber + pos.
	^(position).
]

{ #category : 'as yet unclassified' }
Ship >> movesTo: aPosition [ 
	position := aPosition.
]

{ #category : 'instance creation' }
Ship >> newTurnPlayed [
	turnsPlayed := turnsPlayed + 1.
]

{ #category : 'as yet unclassified' }
Ship >> reduceFuel [
	self consumeFuel: 1
]

{ #category : 'removing' }
Ship >> removeActiveCard: aCard [ 
	| cardToRemove |
	cardToRemove := aCollectionOfActiveCards detect: [ :each | each = aCard] ifNone: [nil].
	cardToRemove = nil ifFalse: [ aCollectionOfActiveCards remove: cardToRemove.]
]

{ #category : 'removing' }
Ship >> removeCardFromHand: aCard [ 
	| cardToRemove |
	cardToRemove := aCollectionOfCards detect: [ :each | each = aCard] ifNone: [nil].
	cardToRemove = nil ifFalse: [ aCollectionOfCards remove: cardToRemove.]
]

{ #category : 'as yet unclassified' }
Ship >> restartFuel [
	fuel:= maxFuel .
]

{ #category : 'as yet unclassified' }
Ship >> runOutOfFuel [
		fuel := maxFuel.
		position := 1.
		state := CantPlayANumberOfTurns skip: 2 
]

{ #category : 'as yet unclassified' }
Ship >> selectCard: aCard [ 
	^(aCollectionOfCards detect: [ :each |  each = aCard])
]

{ #category : 'as yet unclassified' }
Ship >> selectRandomActiveCard [
	| activeCardsSize randomNumber |
	activeCardsSize := aCollectionOfActiveCards size.
	randomNumber := (1 to: activeCardsSize) atRandom.
	^(aCollectionOfActiveCards at: randomNumber)
]

{ #category : 'as yet unclassified' }
Ship >> skipTurn [
	state := CantPlayANumberOfTurns skip: 1.
	fuel := maxFuel.
]

{ #category : 'as yet unclassified' }
Ship >> throwDice: aCollectionOfDice [ 
	| positionsToMove |
	positionsToMove := 0.
	aCollectionOfDice do: [ :die |
	 positionsToMove := positionsToMove + (die throw). ].
	lastDieResult := positionsToMove.	
	^positionsToMove.
]

{ #category : 'as yet unclassified' }
Ship >> updateLaps [
	laps := laps + 1.
]

{ #category : 'as yet unclassified' }
Ship >> updateStateToWinner [
	state:=Winner new.
]

{ #category : 'as yet unclassified' }
Ship >> victory [
	^state checkPlay.
]
