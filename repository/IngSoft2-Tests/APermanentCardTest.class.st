Class {
	#name : 'APermanentCardTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'asserting' }
APermanentCardTest >> should: anErrorBlock raise: anErrorClass withMessage: aMessage [ 
	self should: anErrorBlock raise: anErrorClass withExceptionDo: [ :error | self assert: error messageText equals: aMessage ] 
]

{ #category : 'running' }
APermanentCardTest >> test_03_APermamentCardHasPowerMoveThenItReturnsZero [

	| aCard |
	aCard := PermanentCard new.
	self assert: aCard powerMove equals: 0
]

{ #category : 'running' }
APermanentCardTest >> test_05_WhenAPermanentCardIsAskedIfIsPermanentThenTheAnswerIsTrue [

	| aCard |
	aCard := PermanentCard new.
	self assert: aCard isPermanent.
]

{ #category : 'running' }
APermanentCardTest >> test_06_WhenAPermanentCardIsAskedIfIsInstatThenTheAnswerIsFalse [

	| aCard |
	aCard := PermanentCard new.
	self deny: aCard isInstant.
]
