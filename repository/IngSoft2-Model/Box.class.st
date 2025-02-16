Class {
	#name : 'Box',
	#superclass : 'Object',
	#instVars : [
		'place',
		'state'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Box class >> inPlace: aPlace [ 
	aPlace < 1 ifTrue: [ Error signal: 'The position of the box must be greater or equal to 1' ].
	^self new initializeInPlace: aPlace.
]

{ #category : 'testing' }
Box >> addParsecsList: aParsecList withBoardLenght: aBoardLength andParsecLength: aParsecLength [ 
	Error signal: 'This is not an HyperJumpBox.'
]

{ #category : 'as yet unclassified' }
Box >> effectShips: aCollectionOfShips playing: aShip [ 
	^true
]

{ #category : 'as yet unclassified' }
Box >> getPosition [
	^place.
]

{ #category : 'initialization' }
Box >> initializeInPlace: aPlace [
	place := aPlace.
	state := NormalBox new.
	
]

{ #category : 'testing' }
Box >> numberOfBoxesToMove: aNumberOfBoxesToMove [

	Error signal: 'This is not an MoonWalkBox.'
]

{ #category : 'testing' }
Box >> setNumber: aDieResult [ 
	Error signal: 'This is not an HyperGravityBox.'
]

{ #category : 'accessing' }
Box >> state [
	^ state
]

{ #category : 'as yet unclassified' }
Box >> stateAlteration [
	state := state changeState.
]
