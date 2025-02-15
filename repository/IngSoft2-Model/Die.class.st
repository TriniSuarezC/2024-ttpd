Class {
	#name : 'Die',
	#superclass : 'Object',
	#instVars : [
		'faces'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'instance creation' }
Die class >> of: anAmountOfFaces [

	anAmountOfFaces < 3 ifTrue: [
		Error signal: 'Faces should be more than 1' ].
	^ self new initializeOf: anAmountOfFaces
]

{ #category : 'initialization' }
Die >> initializeOf: anAmountOfFaces [ 
	faces:= anAmountOfFaces.
]

{ #category : 'accessing' }
Die >> maximumValue [
	^faces.
]

{ #category : 'as yet unclassified' }
Die >> throw [

	^ faces atRandom
]
