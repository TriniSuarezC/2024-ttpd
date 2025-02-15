Class {
	#name : 'AJailStateTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
AJailStateTest >> test_01_WhenAShipIsInJailStateThenTheShipHasntWonYet [ 

	| aJailState |
	aJailState := Jail new.
	self deny: aJailState checkPlay

]

{ #category : 'tests' }
AJailStateTest >> test_02_WhenAShipIsInJailStateThenItHasAnExpectedDieToThrow [ 

	| aJailState  |
	aJailState := Jail withExpectedDie: 2.
	self assert: aJailState getExpectedDie equals: 2.
]
