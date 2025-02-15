Class {
	#name : 'AnEffectManagerTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
AnEffectManagerTest >> test_01_WhenAnEffectManagerHasOnly1DistributionThenItCreatesACollectionOfBoxesWithNoEffect [

	| boxDistributions anEffectManager boxes |
	boxDistributions := OrderedCollection new.
	boxDistributions add:
		(BoxDistribution of: NoEffectBox withDistribution: 100).
	anEffectManager := EffectManager with: boxDistributions.
	boxes := anEffectManager createFor: 10.

	self assert: ((boxes at: 1) isKindOf: NoEffectBox).
	self assert: (((boxes at: 2) isKindOf: NoEffectBox) or: ((boxes at: 2) isKindOf: WormHoleBox )).
]

{ #category : 'tests' }
AnEffectManagerTest >> test_02_WhenAnEffectManagerHasOnly1DistributionThenItCreatesACollectionOfBoxesWithAtomicBobEffect [

	| boxDistributions anEffectManager boxes|
	boxDistributions := OrderedCollection new.
	boxDistributions add:
			(BoxDistribution of: AtomicBombBox withDistribution: 100).
	anEffectManager := EffectManager with: boxDistributions.
	boxes := anEffectManager createFor: 6.

	self assert: (((boxes at: 2) isKindOf: AtomicBombBox) or: ((boxes at: 2) isKindOf: WormHoleBox ))
]

{ #category : 'tests' }
AnEffectManagerTest >> test_03_WhenAEffectManagerGets2DifferentTypesOfBoxesThenTheBoxesAreCreatedWithOneOfThisTypes [

	| boxDistributions anEffectManager boxes |
	boxDistributions := OrderedCollection new.
	boxDistributions add:
		(BoxDistribution of: AtomicBombBox withDistribution: 80).
	boxDistributions add:
		(BoxDistribution of: HyperGravityBox withDistribution: 20).
	anEffectManager := EffectManager with: boxDistributions.
	boxes := anEffectManager createFor: 6.

	self assert: ((((boxes at: 2) isKindOf: AtomicBombBox) or:
			  ((boxes at: 2) isKindOf: HyperGravityBox)) or:
			 ((boxes at: 2) isKindOf: WormHoleBox))
]
