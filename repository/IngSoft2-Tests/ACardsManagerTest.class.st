Class {
	#name : 'ACardsManagerTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
ACardsManagerTest >> test_01_ACardManagerGivesARandomCardWithUniformProbabilities [

	| aCardManager aCard |
	aCardManager:= CardsManager new.
	
	aCard:= aCardManager createACard.
	
	self assert: (aCard isKindOf: Card)
]
