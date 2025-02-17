Class {
	#name : 'BoxDistribution',
	#superclass : 'Object',
	#instVars : [
		'effect',
		'distribution'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
BoxDistribution class >> of: aBoxType withDistribution: aDistribution [ 
	^self new initializeOf: aBoxType withDistribution: aDistribution.
]

{ #category : 'as yet unclassified' }
BoxDistribution >> getDistribution [

	^ distribution
]

{ #category : 'as yet unclassified' }
BoxDistribution >> getEffect [

	^ effect
]

{ #category : 'as yet unclassified' }
BoxDistribution >> initializeOf: aBoxType withDistribution: aDistribution [

	effect := aBoxType.
	distribution := aDistribution
]
