Class {
	#name : 'HyperGravityBox',
	#superclass : 'Box',
	#instVars : [
		'dieResult'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
HyperGravityBox class >> inPlace: aPosition [
	^self new initializeInPlace: aPosition.
]

{ #category : 'as yet unclassified' }
HyperGravityBox >> effectShips: aCollectionOfShips playing: aShip [
	aShip getLastDieResult = dieResult ifTrue: [ aShip endCursed ] ifFalse: [ aShip isCursed. ]
	
]

{ #category : 'as yet unclassified' }
HyperGravityBox >> getNumberOfDie [
	^dieResult.
]

{ #category : 'initialization' }
HyperGravityBox >> initializeInPlace: aPosition [
	place := aPosition.
	dieResult := 3.
	state := NormalBox new.
]

{ #category : 'as yet unclassified' }
HyperGravityBox >> reversalEffectShips: aCollection playing: aShip [ 
	aShip getLastDieResult = dieResult ifTrue: [ aShip isCursed ] ifFalse: [ aShip endCursed. ]
]

{ #category : 'initialization' }
HyperGravityBox >> setNumber: aDieResult [ 
	dieResult := aDieResult.
]
