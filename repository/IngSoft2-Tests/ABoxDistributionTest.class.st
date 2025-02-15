Class {
	#name : 'ABoxDistributionTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
ABoxDistributionTest >> test_01_ABoxHasAnEffectAndADistributionThenItCanBeReturned [

	| aBoxDistribution |
	aBoxDistribution := BoxDistribution of: NoEffectBox withDistribution: 1.

	self assert: aBoxDistribution getDistribution equals: 1.
	self assert: aBoxDistribution getEffect equals: NoEffectBox
]
