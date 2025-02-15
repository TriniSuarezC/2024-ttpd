Class {
	#name : 'Lenght',
	#superclass : 'Object',
	#instVars : [
		'lenght',
		'value'
	],
	#classInstVars : [
		'value'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'initialization' }
Lenght class >> withValue: aValue [ 
	^self new initilizeWithValue: aValue.
]

{ #category : 'comparing' }
Lenght >> > aParsec [ 
	^self convertToParsec > aParsec convertToParsec.
]

{ #category : 'as yet unclassified' }
Lenght >> convertToParsec [
	^value
]

{ #category : 'as yet unclassified' }
Lenght >> initilizeWithValue: aValue [
	
	value := aValue.
]
