Class {
	#name : 'NormalBox',
	#superclass : 'BoxState',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
NormalBox >> changeState [
	^ReversalBox new.
]
