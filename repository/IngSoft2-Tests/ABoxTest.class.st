Class {
	#name : 'ABoxTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'asserting' }
ABoxTest >> should: aBlockError raise: aClassError withMessage: aMessage [ 
		self should: aBlockError raise: aClassError withExceptionDo: [ :error | self assert: error messageText equals: aMessage ]
]

{ #category : 'tests' }
ABoxTest >> testWhenTheBoxIsCreatedInPlaceLessThan1ThenBoxInvalid_04 [

	self
		should: [ Box inPlace: 0 ]
		raise: Error
		withMessage: 'The position of the box must be greater or equal to 1'
]
