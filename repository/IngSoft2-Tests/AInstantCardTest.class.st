Class {
	#name : 'AInstantCardTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'asserting' }
AInstantCardTest >> should: anErrorBlock raise: anErrorClass withMessage: aMessage [ 
	self should: anErrorBlock raise: anErrorClass withExceptionDo: [ :error | self assert: error messageText equals: aMessage ] 
]

{ #category : 'tests' }
AInstantCardTest >> test_01_WhenAInstantCardIsAskedIfISPermanentThenTheAnswerIsFalse [

| aCard |
aCard := InstantCard new.
self deny: aCard isPermanent.
]

{ #category : 'tests' }
AInstantCardTest >> test_02_WhenAInstantCardIsAskedIfISInstantThenTheAnswerIsTrue [

| aCard |
aCard := InstantCard new.
self assert: aCard isInstant.
]
