Class {
	#name : 'LoadedDie',
	#superclass : 'Object',
	#instVars : [
		'faces'
	],
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'instance creation' }
LoadedDie class >> of: anAmountOfFaces [

	anAmountOfFaces < 3 ifTrue: [
		Error signal: 'Faces should be more than 1' ].
	^ self new initializeOf: anAmountOfFaces
]

{ #category : 'initialization' }
LoadedDie >> initializeOf: anAmountOfFaces [
	faces:=  anAmountOfFaces.
]

{ #category : 'accessing' }
LoadedDie >> maximumValue [
	^faces+1.
]

{ #category : 'as yet unclassified' }
LoadedDie >> throw [

	^ faces
]
