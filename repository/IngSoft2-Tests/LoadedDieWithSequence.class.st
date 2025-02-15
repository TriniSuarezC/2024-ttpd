Class {
	#name : 'LoadedDieWithSequence',
	#superclass : 'Object',
	#instVars : [
		'faces',
		'sequence'
	],
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'as yet unclassified' }
LoadedDieWithSequence class >> loadedWithSequence: aSequence [
    ^ self new initializeSequence: aSequence
]

{ #category : 'instance creation' }
LoadedDieWithSequence class >> of: aNumberOfFaces [ 
	aNumberOfFaces < 3 ifTrue: [
		Error signal: 'A Die cannot be createdWith less of 3 faces' ].
	^self new initializeOf: aNumberOfFaces.
]

{ #category : 'initialization' }
LoadedDieWithSequence >> initializeOf: aNumberOfFaces [ 
	faces := aNumberOfFaces.
]

{ #category : 'initialization' }
LoadedDieWithSequence >> initializeSequence: aSequence [
    sequence := aSequence
]

{ #category : 'accessing' }
LoadedDieWithSequence >> maximumValue [
	^sequence max.
]

{ #category : 'as yet unclassified' }
LoadedDieWithSequence >> throw [

	| currentFace |
	currentFace := sequence first.
	sequence:= sequence allButFirst. 
	^ currentFace
]
