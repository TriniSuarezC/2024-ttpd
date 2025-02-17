Class {
	#name : 'Jail',
	#superclass : 'State',
	#instVars : [
		'expectedResult'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Jail class >> withExpectedDie: aDieResult [ 
	^self new initializeWithExpectedDie: aDieResult.
]

{ #category : 'as yet unclassified' }
Jail >> getExpectedDie [

	^ expectedResult
]

{ #category : 'initialization' }
Jail >> initializeWithExpectedDie: aDieResult [

	expectedResult := aDieResult
]
