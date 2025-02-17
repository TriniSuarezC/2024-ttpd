Class {
	#name : 'BoxState',
	#superclass : 'Object',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
BoxState >> affectShip: aShip playingWith: aCollection with: aBoardSize in: aBox [

	self subclassResponsibility
]

{ #category : 'as yet unclassified' }
BoxState >> changeState [

	self subclassResponsibility
]
