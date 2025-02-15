Class {
	#name : 'ACardTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
ACardTest >> test_01_WhenACardIsCreatedItsNotPermanentNitherInstant [

	| aCard |
	aCard := Card new.
	self assert: aCard isPermanent equals: false.
	self assert: aCard isInstant equals: false.
]
